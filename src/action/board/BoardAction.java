package action.board;

import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardAction {
    public ActionForward hello(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("hello","Hello World");
        return new ActionForward();
    }
}
