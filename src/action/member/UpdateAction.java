package action.member;

import action.ActionForward;
import model.Member;
import model.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
    /web/model1/member/update.jsp
    1. 모든 파라미터 정보를 Member 객체에 저장 => useBean 태그
    2. 입력된 비밀번호와, db에 저장된 비밀번호 비교
        관리자인 경우 관리자비밀번호로 비교하기.
        - 같지 않은 경우 : "비밀번호 오류" 메세지 출력 updateForm.jsp 페이지 이동
    3. 파라미터를 저장하고 있는 Member 객체를 이용하여 db 정보 수정.
        int MemberDAO.update(Member)
    결과가 0 이하면 수정실패 메세지 출력후, updateForm.jsp 페이지 이동
        1 이상이면 수정 성공    info.jsp 페이지 이동
 */

public class UpdateAction extends UserLoginAction{
    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member mem = new Member();

        mem.setId(request.getParameter("id"));
        mem.setPass(request.getParameter("pass"));
        mem.setName(request.getParameter("name"));
        mem.setGender(Integer.parseInt(request.getParameter("gender")));
        mem.setTel(request.getParameter("tel"));
        mem.setEmail(request.getParameter("email"));
        mem.setPicture(request.getParameter("picture"));

        String msg = "비밀번호가 틀렸습니다.";
        String url = "updateForm.me?id="+mem.getId();

        MemberDAO dao = new MemberDAO();
        Member dbmember = dao.selectOne(login);

        if(mem.getPass().equals(dbmember.getPass())) {
            int result = dao.update(mem); //입력된 내용을 db에 수정
            if (result > 0) {
                return new ActionForward(true, "info.me?id="+mem.getId());
            } else {
                msg = "수정실패";
            }
        }
        request.setAttribute("msg",msg);
        request.setAttribute("url",url);
        return new ActionForward(false,"../alert.jsp");

    }
}
