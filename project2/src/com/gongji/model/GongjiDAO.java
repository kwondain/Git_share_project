package com.gongji.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GongjiDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;	
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public GongjiDAO(){
		 try{
			 Context init=new InitialContext();
             ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	}	
	
	// 공지사항 목록 개수
	public int getListCount() {
		int count=0;
        try{
        	con=ds.getConnection();
        	sql="select count(*) from gongji";
        	pstmt=con.prepareStatement(sql);
        	rs=pstmt.executeQuery(); //쿼리문 실행
        	if(rs.next()){ //레코드가 있다면
        		count=rs.getInt(1); //총 레코드 수를 저장
        	}
        	rs.close(); pstmt.close(); con.close();
        }catch(Exception e){
        	e.printStackTrace();
        }
		return count;
	}
	
	// 공지사항 목록 보기
	public List<GongjiBean> getGongjiList(int page, int limit) {
		sql="select * from (select gongji.*, rownum as rnum "
				+ " from (select * from gongji order by gongji_no desc)" 
				+ " gongji) where rnum>=? and rnum<=?";
				
				List<GongjiBean> list = new ArrayList<GongjiBean>();
				
				int startrow=(page-1)*10+1; //읽기 시작할 row 번호.
				int endrow=page*limit;	
			
			try{
					con = ds.getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, startrow);
					pstmt.setInt(2, endrow);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						GongjiBean g = new GongjiBean();
						g.setGongji_no(rs.getInt("gongji_no"));
						g.setGongji_name(rs.getString("gongji_name"));
						g.setGongji_title(rs.getString("gongji_title"));
						g.setGongji_cont(rs.getString("gongji_cont"));						
						g.setGongji_hit(rs.getInt("gongji_hit"));
						g.setGongji_regdate(rs.getString("gongji_regdate"));						
						list.add(g);
					}			
					rs.close(); pstmt.close(); con.close();
			}catch(Exception e){
					e.printStackTrace();
			}		
				return list;
	}

	/* 조회수 증가 */
	public void updateGongjgHit(int gongji_no) {
		try{
			con = ds.getConnection();  // 디비 연동
			// 조회수 증가
			sql = "update gongji set gongji_hit=gongji_hit+1 "
				 + " where gongji_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gongji_no);
			pstmt.executeUpdate();  // sql문 실행
			//executeUpdate()는 update, insert, delete문 실행
			pstmt.close(); con.close(); // 열린 객체 닫기
		}catch(Exception e){
			e.printStackTrace();
		}	
	}

	/* 내용 보기 */
	public GongjiBean getGongjiCont(int gongji_no) {
		GongjiBean gongjibean = null;
		
		try{
			con = ds.getConnection(); // 디비 연동
			sql = "select * from gongji where gongji_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gongji_no);
			rs = pstmt.executeQuery();  // sql 실행
			if(rs.next()){ // 검색된 레코드가 존재하면 true
				gongjibean = new GongjiBean();
				// 형식)  Setter(db 테이블에서 필드 가져오기)
				gongjibean.setGongji_no(rs.getInt("gongji_no"));
				gongjibean.setGongji_cont(rs.getString("gongji_cont"));
				gongjibean.setGongji_title(rs.getString("gongji_title"));
				gongjibean.setGongji_hit(rs.getInt("gongji_hit"));
			}
			// 열린 객체 닫기
			rs.close(); pstmt.close();  con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return gongjibean; // DTO 클래스에 저장된 값을 리턴
	}

}
