package com.weis.startfun.member.model;

import java.sql.SQLException;

public interface MemberDAO {

		// 개인 회원가입
		public int insert_member(MemberVO member) throws ClassNotFoundException, SQLException;
		// 개인 회원가입 권한주기
		public int insert_member_auth(MemberVO member);
		// 법인 회원가입
		public int company_insert_member(MemberVO member) throws ClassNotFoundException, SQLException;
		// 법인 회원가입 권한주기
		public int insert_company_auth(MemberVO member);
		// 이메일 중복체크
		public int idCheck(String email);
		// 법인이메일 중복체크
		public int companyIdCheck(String email);
		// 아이디찾기 가입정보확인
		public int searchUserInfo(String member_name, String member_phone);
		// 아이디찾기
		public MemberVO searchId(MemberVO member);
		// 인증키 업데이트
		public int updateAuthKey(MemberVO member) throws ClassNotFoundException, SQLException;
		// 인증키 확인
		public MemberVO confirmAuthKey(String member_email) throws ClassNotFoundException, SQLException;
		// 비밀번호 변경
		public int updatePassword(MemberVO member) throws ClassNotFoundException, SQLException;
}
