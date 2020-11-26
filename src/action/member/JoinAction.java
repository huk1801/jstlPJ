package action.member;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
  1. 파라미터 정보를 Member 객체에 저장 => useBean 액션태그
        model.Member
  2. Member 객체 정보를 db에 추가. member 테이블 데이터 저장
  3. 가입성공 : loginForm.me 페이지 이동
     가입실패 : joinForm.me 페이지 이동
 */
public class JoinAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member mem = new Member();
        mem.setId(request.getParameter("id"));
        mem.setPass(request.getParameter("pass"));
        mem.setName(request.getParameter("name"));
        mem.setGender(Integer.parseInt(request.getParameter("gender")));
        mem.setTel(request.getParameter("tel"));
        mem.setEmail(request.getParameter("email"));
        mem.setPicture(request.getParameter("picture"));

        String msg = "회원가입 실패";
        String url = "joinForm.me";
        if (new MemberDAO().insert(mem)>0){
            msg=mem.getName()+"님 회원가입 완료";
            url = "loginForm.me";
        }
        request.setAttribute("msg",msg);
        request.setAttribute("url",url);
        return new ActionForward(false, "../alert.jsp");
    }
}
