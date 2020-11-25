package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int num1 = Integer.parseInt(request.getParameter("num1"));
        int num2 = Integer.parseInt(request.getParameter("num2"));
        String cal = request.getParameter("op");

        if (cal.equals("+")){
            request.setAttribute("result", num1 + num2);
        }else if (cal.equals("-")){
            request.setAttribute("result", num1 - num2);
        }else if (cal.equals("*")){
            request.setAttribute("result", num1 * num2);
        }else if (cal.equals("/")){
            request.setAttribute("result", num1 / num2);
        }

        return new ActionForward(false,"calc.jsp");
    }
}
