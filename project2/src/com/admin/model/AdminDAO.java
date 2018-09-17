package com.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;

public class AdminDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;	
	private String sql=null;
	public AdminDAO(){ // 생성자
		try{
			DBConnection db = new DBConnection();
			con = db.con; // 커넥션 가져오기
		}catch(Exception e){
			e.printStackTrace();
		}		
	}// 생성자 end
	
   /* 관리자를 체크하는 메서드 */
	public int admincheck(String admin_id, String admin_pwd){
		int re=-1; // 체크 결과값 저장
		try{
			// 관리자 id로 관리자 조회
			sql="select admin_pwd from admin "
			 + " where admin_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			rs = pstmt.executeQuery(); // select문 실행
			if(rs.next()){ // 해당 id가 있는 경우
				if(rs.getString("admin_pwd").equals(admin_pwd)){
					// db 비번과 입력한 비번이 일치한 경우
					re = 1; // re를 1로 지정
				}else{
					re = 0; // 비번이 틀린 경우 re=0
				}
			}
			pstmt.close(); rs.close(); con.close();			
		}catch(Exception e){
			e.printStackTrace();
		}
	   return re;  // 호출한 곳으로 리턴	
	}

}







