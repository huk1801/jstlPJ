package action.member;

import action.ActionForward;
import model.Member;
import model.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
    1.id 파라미터 값을 조회
    2. login 상태 검증
        로그아웃 상태 : '로그인 하세요" 메세지 출력후 loginForm.me
    3. login 상태 검증2
        id 파라미터 값과 login id 가 다른경우 : 내정보 조회만 가능합니다. 메세지 출력
                                                main.me 페이지 이동

    InfoAction
    4. d b에서 id 값으로 데이터 조회. : selectOne(id)
    5. 조회된 내용을 화면에 출력하기
 */
public class InfoAction extends UserLoginAction{
    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member mem = new MemberDAO().selectOne(id);
        request.setAttribute("mem", mem);
        return new ActionForward();
    }
}
