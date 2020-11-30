package action.member;

import action.Action;
import action.ActionForward;
import model.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PasswordAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        MemberDAO dao = new MemberDAO();
        String msg = null;
        String url = null;
        String pass = dao.pwSearch(id, email, tel);
        request.setAttribute("pass", pass);
        if (pass == null) {
            msg = "정보에 맞는 password를 찾을수 없습니다.";
            url = "pwForm.me";
            request.setAttribute("msg", msg);
            request.setAttribute("url", url);
            request.setAttribute("pass",pass.substring(0,pass.length()-2));
            return new ActionForward(false, "../alert.jsp");
        }
        return new ActionForward();
    }
}