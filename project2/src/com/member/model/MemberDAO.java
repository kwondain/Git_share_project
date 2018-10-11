package com.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.mail.SimpleEmail;

import db.DBConnection;

// DAO 클래스 = 디비 연동 클래스
public class MemberDAO {
	// 디비 연동과 쿼리문 수행을 위한 클래스의 참조변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;

	public MemberDAO() { // 생성자
		/* 커넥션 풀 설정 */
		try {
			DBConnection db = new DBConnection();
			con = db.con;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
/*	Connection conn = null;
	DataSource ds = null;
	Statement stmt = null;
	private Connection getConnection() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");		
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}*/
	
	
	private static MemberDAO instance;
	public static MemberDAO getInstance() {
		if(instance==null) instance = new MemberDAO();
		return instance;
	}
	
/*	@Override
	public MemberBean selectMember(String memberId) {
        MemberBean member = new MemberBean();
        try {
        	  String sql = "select * from pet_Member where id=?";
        	  pstmt = getConnection().prepareStatement(sql);
        	  pstmt.setString(1, memberId);
        	  rs = pstmt.executeQuery();
        	  if(rs.next()){
        		  int i=0;
        		  member.setId(rs.getString(++i));
        		  member.setPassword(rs.getString(++i));
        		  member.setName(rs.getString(++i));
        		  member.setBirth(rs.getDate(++i));
        		  member.setZipno(rs.getString(++i));
        		  member.setAddress1(rs.getString(++i));
        		  member.setAddress2(rs.getString(++i));
        		  member.setTel1(rs.getString(++i));
        		  member.setTel2(rs.getString(++i));
        		  member.setTel3(rs.getString(++i));
        		  member.setEmail(rs.getString(++i));
        		  member.setRegdate(rs.getDate(++i));
        		  member.setUse_flag(rs.getString(++i).charAt(0));
        	  }

        }catch(Exception e) {
        	e.printStackTrace();
        }finally {
        	close(conn, pstmt, rs);
        }
		return member;
	}*/
	
	
	


	/* 디비 작업은 메소드 단위로 작성한다. */
	/* 아이디 중복 체크 */
	public int checkMemberId(String id){
		int re=-1; // 아이디 중복 여부 결정
		try{
			//con=dbs.getConnection();
			sql="select member_id from pet_Member "
				+ " where member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			
			if(rs.next()){
				re=1;  // 검색된 id가 있는 경우
			}
			System.out.println(re);
			con.close(); pstmt.close(); rs.close();			
		}catch(Exception e){
			e.printStackTrace();
		}
		return re;  // re값을 리턴한다.
		
	}
	/* 우편번호 검색 메소드 */
/*	public List searchZipcode(String dong) {
		
	}*/
	/* 비번 찾기 */
	public MemberBean findpwd(String pwd_id, String pwd_name) {
		// 사용자의 id와 name으로 비번 조회 메서드
		MemberBean member=null;
		try{
			sql="select member_pass from pet_Member "
			 +  " where member_id=? and member_name=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pwd_id);
			pstmt.setString(2, pwd_name);
			rs = pstmt.executeQuery();
			if(rs.next()){
				member = new MemberBean(); // 빈 객체
				// pass 값을 빈에 저장 
				member.setMember_pass
				   (rs.getString("member_pass"));				
			}
			rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return member;// 빈 객체 리턴(사용자 비번저장)
	}
	/* 회원가입 정보 저장 메서드*/
	public int insertMember(MemberBean bean) {
		int result=0;
		// TODO Auto-generated method stub
		try{
			sql="insert into pet_Member "
		+ " (member_id,member_pass,member_name, "
		+ " member_nickname,member_gender,member_email, "
		+ "	member_zip, "
		+ " member_addr1,member_addr2 "
		+ " ) "
		+ " values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			// 빈의 Getter()로 물음표 값 배정
			pstmt.setString(1,bean.getMember_id());
			pstmt.setString(2,bean.getMember_pass());
			pstmt.setString(3,bean.getMember_name());
			pstmt.setString(4,bean.getMember_nickname());
			pstmt.setString(5,bean.getMember_gender());
			pstmt.setString(6,bean.getMember_email());
			pstmt.setString(7,bean.getMember_zip());
			pstmt.setString(8,bean.getMember_addr1());
			pstmt.setString(9,bean.getMember_addr2());
			result=pstmt.executeUpdate(); // insert문 실행
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	/* 회원 체크 메서드 */
	public int userCheck(String id, String pass) {
		int result=-1;
		try{
			// 일치되는 id가 있는 조회
			sql="select member_pass from pet_Member"
			   + " where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // select문 실행

			if(rs.next()){ // id가 있는 경우
				if(rs.getString("member_pass").equals(pass)){
					// db의 pass와 일치한 경우
					result = 1; //id/pass 모두 일치
				}else{
					result = 0; // pass가 틀린 경우
				}				
			}
			System.out.println("result="+result);
			pstmt.close(); rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result; // 검색 결과 리턴
	}
	/* 해당 사용자 디비 내용 가져오기 */
	public MemberBean getMember(String id) {		
		MemberBean bean = null;
		try{
			//con=ds.getConnection(); // 커넥션 풀로 디비 연동
			sql = "select * from pet_Member where "
				  + " member_id =? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // id를 물음표에 배정한다.
			rs = pstmt.executeQuery(); // sql문 실행
			if(rs.next()){ // 검색된 레코드가 있는
				bean = new MemberBean();  // DTO 객체 생성
				// 디비 테이블에서 값을 가져와 빈 클래스에 저장
				bean.setMember_id(rs.getString("member_id"));
				bean.setMember_pass(rs.getString("member_pass"));
				bean.setMember_name(rs.getString("member_name"));
				bean.setMember_nickname(rs.getString("member_nickname"));
				bean.setMember_gender(rs.getString("member_gender"));
				bean.setMember_email(rs.getString("member_email"));
				bean.setMember_zip(rs.getString("member_zip"));
				bean.setMember_addr1(rs.getString("member_addr1"));
				bean.setMember_addr2(rs.getString("member_addr2"));		
			}
			rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return bean;  // 빈 객체(레코드) 리턴
	}
	/* 회원 정보 수정 */
	public int updateMember(MemberBean bean) {
		int re = -1; // 리턴 변수
		try{
			sql="update pet_Member set member_pass=?,"
			   +" member_name=?,member_nickname=?,"
			   +" member_gender=?,member_email=?, "
			   + " member_zip=?, "		
			   + " member_addr1=?,member_addr2=?"
			   + " where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bean.getMember_pass());
			pstmt.setString(2,bean.getMember_name());
			pstmt.setString(3,bean.getMember_nickname());
			pstmt.setString(4,bean.getMember_gender());
			pstmt.setString(5,bean.getMember_name());
			pstmt.setString(6,bean.getMember_zip());
			pstmt.setString(7,bean.getMember_addr1());
			pstmt.setString(8,bean.getMember_addr2());
			pstmt.setString(9,bean.getMember_id());
			re=pstmt.executeUpdate(); // update문 실행
			// 성공적으로 update가 된 경우 1리턴
			pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}		
		return re; // 쿼리문 실행결과 리턴
	}
	/* 회원 탈퇴 메서드*/
	public int deleteMember(String id, String pass) {
		int re = -1;
		try{
			// id 사용자 검색
			sql="select member_pass from "
				+ " pet_Member where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); //select문 실행
			if(rs.next()){ // id가 있는 경우
				// 비번을 비교한다.
				if(rs.getString("member_pass").equals(pass)){
					// 비번이 일치한 경우
					sql=" delete from pet_Member "
					 + " where member_id=? ";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1,id);
					re = pstmt.executeUpdate(); //update실행
					// 성공시 re=1
				}else{ // 비번 틀린 경우
					re = 0; 
				}
			}
			rs.close(); pstmt.close();con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return re;
	}

	public int idfindMember(String id_name, String email) {
		int result = -1;
		try {
			sql = "select member_id from "
				+ " pet_Member where member_name = ? and member_email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id_name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String context = rs.getString("member_id");
				sendMail("아이디찾기",context,"tlstjdtn321@naver.com","관리자");
				result = 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int passwordfind(String id, String name, String email) {
		int result = -1;
		
		try {
			sql = "select member_pass "
				+ " from pet_Member where member_id =? and member_name= ? and member_email =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				while(rs.next()) {
					String context = rs.getString(1);
					sendMail("비밀번호 찾기",context,"tlstjdtn321","관리자");
					result = 1;
				}
				result = 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void sendMail(String subject, String content,String emailId, String receiver) throws Exception{
		final String HOST_NAME = "smtp.naver.com";
		final int PORT_NUMBER = 465;
		final String CONTENT_TYPE="text/plain;charset=utf-8";
		
		SimpleEmail email = new SimpleEmail(); 
		email.setCharset("utf-8");	//문자셋 설정
		email.setHostName(HOST_NAME);	//SMTP 서버 설정
		email.setSmtpPort(PORT_NUMBER);		//포트번호설정
		email.setSSL(true);			//보안설정
		email.setTLS(true);			//보안설정
		//보내는 사람의 이메일 id와 비밀번호를 저장
		email.setAuthentication("tlstjdtn321", "k2244406!");
		
		email.setSubject(subject);	
		email.setContent(content,CONTENT_TYPE);
		
		email.addTo(emailId,receiver);	//수신자 이메일 주소
		email.setFrom("tlstjdtn321@naver.com","신성수");	//발신자 이메일 주소
		//메일 발송
		email.send();
	}
	
}




