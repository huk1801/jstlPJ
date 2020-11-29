package action.member;

import action.Action;
import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
  1. 로그아웃 상태 : 로그인이 필요합니다. 메세지 출력. loginForm.jsp 페이지 이동
  2. 로그인 상태
        일반사용자 : 관리자만 가능한 거래입니다. 메세지 출력. main.jsp 페이지 이동
  3. 관리자 로그인 상태
        doExecute() 메서트 호출
 */
public abstract class AdminLoginAction implements Action {
    protected String login;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        login = (String)request.getSession().getAttribute("login");
        if (login == null){
            request.setAttribute("msg","로그인이 필요합니다.");
            request.setAttribute("url","loginForm.me");
            return new ActionForward(false,"../alert.jsp");
        }else if ( !login.equals("admin")){
            request.setAttribute("msg","관리자만 가능한 거래입니다.");
            request.setAttribute("url","main.me");
            return new ActionForward(false,"../alert.jsp");
        }else {
            return doExecute(request,response);
        }
    }
    public abstract ActionForward doExecute(HttpServletRequest request,  HttpServletResponse response) throws Exception;
}
