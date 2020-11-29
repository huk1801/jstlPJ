package action.member;

import action.Action;
import action.ActionForward;
import model.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email=request.getParameter("email");
        String tel=request.getParameter("tel");
        MemberDAO dao = new MemberDAO();
        String id = dao.idSearch(email,tel);
        request.setAttribute("id", id);
        String msg=null;
        String url=null;
        if(id==null) {
            msg = "정보에 맞는 id를 찾을수 없습니다.";
            url = "idForm.me";
            request.setAttribute("msg", msg);
            request.setAttribute("url", url);
            return new ActionForward(false,"../alert.jsp");
        }
        return new ActionForward();
    }
}
