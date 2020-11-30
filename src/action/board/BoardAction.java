package action.board;

import action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import model.Board;
import model.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BoardAction {
    BoardDAO dao = new BoardDAO();
    public ActionForward hello(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("hello","Hello World");
        return new ActionForward();
    }
    /*
        1. 파라미터 값을 model.Board 객체 저장. MultipartRequest 객체 사용.
        2. 게시물 번호 num 현재 등록된 num 의 최대 값을 조회. 최대값 + 1 등록된 게시물의 번호.
           db 에서 maxNum 을 구해서 +1 값으로 num 설정하기
        3. board 내용을 db에 등록하기.
           등록성공 : list.do 페이지 이동
           등록실패 : 메세지 출력. writeForm.do 페이지 이동
     */
    public ActionForward write(HttpServletRequest request, HttpServletResponse response){

        //JSP Application 객체 = request.getServletContext()
        String path = request.getServletContext().getRealPath("/")+"model2/board/file/";

        File f = new File(path);
        if (!f.exists()) f.mkdirs();
        MultipartRequest multi;
        try {
            multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
            Board board = new Board();
            board.setName(multi.getParameter("name"));
            board.setPass(multi.getParameter("pass"));
            board.setSubject(multi.getParameter("subject"));
            board.setContent(multi.getParameter("content"));
            board.setFile1(multi.getFilesystemName("file1"));
            BoardDAO dao = new BoardDAO();

            //board table 에서 num 컬럼의 최대값 리턴. 최대값이 없는 경우 0으로 리턴
            int num = dao.maxnum();
            board.setNum(++num);
            board.setGrp(num);
            if (dao.insert(board)) {
                return new ActionForward(true, "list.do");
            }
        }catch (IOException e) {
            e.printStackTrace();
        }
        request.setAttribute("msg", "게시물 등록 실패");
        request.setAttribute("url", "writeForm.do");
        return new ActionForward(false,"../alert.jsp");
    }

    /*
        1. 한페이지당 10건의 게시물을 출력하기.
            pageNum 파라미터 값을 저장 => 없는 경우는 1로 설정하기.
        2. 최근 등록된 게시물이 ㅈ가장 위에 배치함
        3. db 에서 해당 페이지에 풀력될 내용을 조회하여 화면에 출력.
           게시물을 출력 부분.
           페이지 구분 출력 부분.
        4. 페이지별 조회번호가 출력되도록 수정하기
     */
    public ActionForward list(HttpServletRequest request, HttpServletResponse response){
        int pageNum = 1;
        try{
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }catch (NumberFormatException e){}
            int limit = 10;

            int boardCount = dao.boardCount();
            List<Board> list = dao.list(pageNum, limit);
            int maxPage = (int)((double)boardCount/limit + 0.95);
            int startPage = ((int)(pageNum/10.0 +0.9) -1)*10+1;
            int endPage = startPage +9 ;
            if(endPage > maxPage) endPage = maxPage;
            int boardNum = boardCount - (pageNum - 1) *limit;
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
            String today = sf.format(new Date());
            request.setAttribute("boardCount", boardCount);
            request.setAttribute("list", list);
            request.setAttribute("pageNum", pageNum);
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("startPage", startPage);
            request.setAttribute("endPage", endPage);
            request.setAttribute("boardNum", boardNum);
            request.setAttribute("today", today);
            return new ActionForward();
    }

    public ActionForward info(HttpServletRequest request, HttpServletResponse response){
        int num = Integer.parseInt(request.getParameter("num"));

        Board board = dao.selectOne(num);   //num에 해당하는 게시물 조회
        dao.readcntAdd(num);    //조회수 증가

        request.setAttribute("board", board);
        return new ActionForward();
    }

    public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response){
        int num = Integer.parseInt(request.getParameter("num"));

        Board board = dao.selectOne(num);   //num에 해당하는 게시물 조회
        request.setAttribute("board", board);
        return new ActionForward();
    }

    public ActionForward reply(HttpServletRequest request, HttpServletResponse response) {

        Board board = new Board();
        board.setNum(Integer.parseInt(request.getParameter("num")));
        board.setName(request.getParameter("name"));
        board.setPass(request.getParameter("pass"));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setGrp(Integer.parseInt(request.getParameter("grp")));
        board.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
        board.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));

        dao.grpStepAdd(board.getGrp(), board.getGrpstep());
        int grplevel = board.getGrplevel();
        int grpstep = board.getGrpstep();
        int num = dao.maxnum(); //최대 num 값 조회

        request.setAttribute("msg","답변 등록시 오류 발생");
        request.setAttribute("url","replyForm.do?num=" + board.getNum());

        board.setNum(++num);    //답변글의 num 값. grp 값은 원글과 동일
        board.setGrplevel(grplevel + 1); //원글 +1
        board.setGrpstep(grpstep + 1); //원글 +1
        if (dao.insert(board)) {
            request.setAttribute("msg","답변등록 완료");
            request.setAttribute("url","list.do");
        }
        return new ActionForward(false, "../alert.jsp");
    }

    public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
        Board board = new Board();
        String path = request.getServletContext().getRealPath("/")+"model2/board/file/";

        String msg = null;
        String url = null;
        try {
            MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"UTF-8");

            board.setNum(Integer.parseInt(multi.getParameter("num")));
            board.setName(multi.getParameter("name"));
            board.setPass(multi.getParameter("pass"));
            board.setSubject(multi.getParameter("subject"));
            board.setContent(multi.getParameter("content"));
            board.setFile1(multi.getFilesystemName("file1"));

            //파일부분의 수정이 없는경우
            if (board.getFile1()==null || board.getFile1().equals("")){
                board.setFile1(multi.getParameter("file2"));
            }

            Board dbBoard = dao.selectOne(board.getNum());
            msg = "비밀번호가 틀렸습니다.";
            url = "updateForm.do?num=" + board.getNum();

            //board.getPass() : 입력된 비밀번호
            //dbBoard.getPass() : bd에 저장된 비밀번호
            if (board.getPass().equals(dbBoard.getPass())){
                if (dao.update(board)) {
                    msg = "게시물 수정 완료";
                    url = "info.do?num=" + board.getNum();
                } else {
                    msg = "게시물 수정 실패";
                }
            }
        }catch (IOException e) {
            e.printStackTrace();
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);

        return new ActionForward(false,"../alert.jsp");
    }

    public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
        int num=Integer.parseInt(request.getParameter("num"));
        String pass= request.getParameter("pass");

        String msg="게시글의 비밀번호가 틀렸습니다";
        String url="deleteForm.do?num="+num;
        BoardDAO dao=new BoardDAO();
        Board board=dao.selectOne(num);
        if(board==null){
            msg="없는 게시글 입니다.";
            url="list.do";
        }else{
            //pass: 입력된 비밀번호
            //board.getPass(): db에 등록된 비밀번호
            if(pass.equals(board.getPass())){
                if(dao.delete(num)){
                    msg="게시글 삭제성공";
                    url="list.do";
                }else{
                    msg="게시글 삭제 실패";
                    url="info.do?num="+num;
                }
            }
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return new ActionForward(false, "../alert.jsp");
    }

}
