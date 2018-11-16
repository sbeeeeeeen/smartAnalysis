package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.industry.model.IndustryVo;
import kr.or.ddit.member.model.MemberVo;

public interface MemberDaoInf {
	

	/**
	* Method : selectAllMembers
	* 최초작성일 : 2018. 8. 29.
	* 작성자 : PC13
	* 변경이력 :
	* @return
	* Method 설명 : 전체 회원 조회
	*/
	List<MemberVo> selectAllMembers();
	
	


	/**
	* Method : getOneMember
	* 최초작성일 : 2018. 8. 29.
	* 작성자 : PC13
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 회원아이디로 해당 회원정보 조회
	*/
	MemberVo getOneMember(String mem_id);
	
	

	/**
	* Method : getOneMember
	* 최초작성일 : 2018. 8. 29.
	* 작성자 : PC13
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 특정 회원 정보를 조회
	*/
	MemberVo getOneMember(MemberVo memberVo);
	
	
	/**
	* Method : insertMember
	* 최초작성일 : 2018. 8. 30.
	* 작성자 : PC13
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 회원 추가
	*/
	int insertMember(MemberVo memberVo);
	
	
	/**
	* Method : idcheck
	* 최초작성일 : 2018. 9. 10.
	* 작성자 : PC13
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 아이디 중복체크
	*/
	int idcheck(String mem_id);
	
	
	/**
	* Method : emailCheck
	* 최초작성일 : 2018. 9. 10.
	* 작성자 : PC13
	* 변경이력 :
	* @param mem_email
	* @return
	* Method 설명 : 이메일 중복체크
	*/
	int emailCheck(String mem_email);
	
	


	/**
	* Method : findId
	* 최초작성일 : 2018. 9. 11.
	* 작성자 : PC13
	* 변경이력 :
	* @param mem_email
	* @param name
	* @return
	* Method 설명 : 이메일로 아이디 찾기
	*/
	MemberVo findId (String mem_email); 
	
	
	
	/**
	* Method : updateMem
	* 최초작성일 : 2018. 9. 11.
	* 작성자 : PC13
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 회원정보수정
	*/
	int updateMem (MemberVo memberVo);
	
	
	/**
	* Method : memberList
	* 최초작성일 : 2018. 10. 2.
	* 작성자 : PC13
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 회원 페이지 리스트 조회
	*/
	List<MemberVo> memberPageList (Map<String, Object> map); 
	
	/**
	* Method : getMemberCnt
	* 최초작성일 : 2018. 10. 2.
	* 작성자 : PC13
	* 변경이력 :
	* @return
	* Method 설명 : 회원 전체 건수 조회
	*/
	int getMemberCnt();
	
	
	
	
	
}
