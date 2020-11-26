package action.member;

import action.Action;
import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class UserLoginAction implements Action {
    protected String login;
    protected String id;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        login = (String)request.getSession().getAttribute("login");
        id = request.getParameter("id");
        if (login == null){
            request.setAttribute("msg","로그인 후 거래하세요");
            request.setAttribute("url","loginForm.me");
            return new ActionForward(false,"../alert.jsp");
        }
        if (id != null && !id.equals(login) && !login.equals("admin")){
            request.setAttribute("msg","본인만 거래 가능합니다.");
            request.setAttribute("url","main.me");
            return new ActionForward(false,"../alert.jsp");
        }
        return doExecute(request,response);
    }

    public abstract ActionForward doExecute(HttpServletRequest request,  HttpServletResponse response) throws Exception;
}
