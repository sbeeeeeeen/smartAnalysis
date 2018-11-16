package kr.or.ddit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.model.MemberVo;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


//로그인 처리를 담당하는 인터셉터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//session 객체를 가져옴
		HttpSession session = request.getSession();
		
		//로그인처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		MemberVo memVo = (MemberVo) session.getAttribute("memberVo");
		
		if( memVo == null){
			// 로그인이 안되어 있는 상태면 로그인 폼으로 다시 돌려보냄(redirect)
			response.sendRedirect("/member/login");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}
	
	
}
