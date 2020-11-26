package action.member;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
  1. 파라미터값 저장.
  2. db의 정보를 읽어서(MemberDAO.selectOne(id)),
     아이디와 비밀번호를 비교.
  3. 아이디가 없는 경우
     아이디가 없습니다. 메세지 출력 후 loginForm.me 페이지 이동.
     비밀번호가 틀린 경우
     비밀번호가 틀립니다. 메세지 출력 후 loginForm.me 페이지 이동.
     아이디, 비밀번호 일치.
        - session 객체에 로그인 정보 저장
        - 이름님이 로그인 했습니다. 메세지 출력 후, main.jsp 페이지 이동
 */
public class LoginAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");

        Member mem = new MemberDAO().selectOne(id);
        if (mem == null){
            request.setAttribute("msg", "아이디를 확인하세요");
            request.setAttribute("url", "loginForm.me");
        }else {
            if (pass.equals(mem.getPass())){
                request.getSession().setAttribute("login", id);
                request.setAttribute("msg",mem.getName()+"님이 로그인 했습니다.");
                request.setAttribute("url", "main.me");
            }else {
                request.setAttribute("msg", "비밀번호가 틀립니다. 확인하세요");
                request.setAttribute("url", "loginForm.me");
            }
        }
        return new ActionForward(false,"../alert.jsp");
    }
}
