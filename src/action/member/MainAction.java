package action.member;

import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
    1. 로그인 여부 검증
        로그인 상태 : 현재 화면
            로그인이 admin인 경우 회원목록 보기 추가하기
        로그아웃 상태 : 로그인하세요. 메세지 출력 후 loginForm.jsp 로 페이지 이동.
 */
public class MainAction extends UserLoginAction{
    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ActionForward();
    }
}
