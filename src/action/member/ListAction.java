package action.member;

import action.ActionForward;
import model.Member;
import model.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/*
  1. db에서 모든 회원 정보를 조회하여 List<Member> 객체로 리턴.
     List<Member> MemberDAO().list()
  2. List 객체를 request.setAttribute() 메서드로 등록하여 view 로 전달
 */
public class ListAction extends AdminLoginAction{
    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Member> memberList = new MemberDAO().list();
        request.setAttribute("list",memberList);
        return new ActionForward();
    }
}
