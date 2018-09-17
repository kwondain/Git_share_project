package com.admin.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.gongji.model.GongjiBean;

public class AdminGongjiDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource ds = null;
	private String sql = null;
	
	public AdminGongjiDAO(){
		/* 커넥션 풀 설정 */
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
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

	public List<GongjiBean> getGongjiList(int page, int limit) {
		sql="select * from (select gongji.*, rownum as rnum "
				+ " from (select * from gongji order by gongji_no desc)" 
				+ " gongji) where rnum>=? and rnum<=?";
				
				List<GongjiBean> list = new ArrayList<GongjiBean>();
				// 페이지 당 보여주는 게시물을 7개로 지정한다.
				int startrow=(page-1)*7+1; //읽기 시작할 row 번호.
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

	public GongjiBean getGongjiCont(int gongji_no) {
		GongjiBean g = null;
		try{
			con = ds.getConnection();
			sql="select * from gongji where gongji_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gongji_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				g = new GongjiBean();
				g.setGongji_no(rs.getInt("gongji_no"));
				g.setGongji_cont(rs.getString("gongji_cont"));	
				g.setGongji_title(rs.getString("gongji_title"));
				
			}			
			rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return g;
	}

	public GongjiBean getGongji(int gongji_no) {
		GongjiBean g = null;
		try{
			con = ds.getConnection();
			sql="select * from gongji where gongji_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gongji_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				g = new GongjiBean();
				g.setGongji_no(rs.getInt("gongji_no"));
				g.setGongji_name(rs.getString("gongji_name"));
				g.setGongji_title(rs.getString("gongji_title"));
				g.setGongji_cont(rs.getString("gongji_cont"));	
				g.setGongji_pwd(rs.getString("gongji_pwd"));	
				g.setGongji_regdate(rs.getString("gongji_regdate"));
				
			}			
			rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return g;
	}

	public int updateMember(GongjiBean bean) {
		
		int re = -1;	// 리턴 변수 초기값 -1
		try{
			con = ds.getConnection();
			sql = "update gongji set gongji_name=?,"+
				     "gongji_title=?,gongji_cont=?," +
				     "gongji_pwd=? where gongji_no=?";
			pstmt = con.prepareStatement(sql);
			/* 각 물음표에 값 배정 */
			pstmt.setString(1, bean.getGongji_name());
			pstmt.setString(2, bean.getGongji_title());
			pstmt.setString(3, bean.getGongji_cont());
			pstmt.setString(4, bean.getGongji_pwd());
			pstmt.setInt(5, bean.getGongji_no());
			re = pstmt.executeUpdate();	// sql문 실행
			// 쿼리가 성공적으로 실행되면 re에 1이 리턴된다.
			 pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return re;	// re값을 호출한 곳으로 리턴
	}

	public void deleteGongji(int gongji_no) {
		try{
			con=ds.getConnection();
			sql="delete from gongji where gongji_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,gongji_no);
			pstmt.executeUpdate();//삭제문 실행
		
			pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	public int insertGongji(GongjiBean g) {
		int re = -1;
		try{
			con=ds.getConnection();
			sql="insert into gongji (gongji_no,gongji_name,gongji_title,"+
	 "gongji_cont,gongji_pwd,gongji_regdate)"+ 
	 "values(gongji_seq.nextval,?,"+
	 "?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, g.getGongji_name());
			pstmt.setString(2, g.getGongji_title());
			pstmt.setString(3, g.getGongji_cont());
			pstmt.setString(4, g.getGongji_pwd());
			re = pstmt.executeUpdate();
		
			pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return re;
	}
	/* 관리자 공지사항 검색 결과 레코드 수*/
	public int getListCount3(String find_name, String find_field) {
		int count=0;
		if(find_field.equals("gongji_title")){//검색어가 공지 제목 인경우
			//count=(int)SqlMapLocator.getMapper().queryForObject("agongjifind_cnt1",find_name);
			try{
				con=ds.getConnection();
				sql=" select count(gongji_no) from gongji where gongji_title like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, find_name);
				rs = pstmt.executeQuery();
				if(rs.next()){
					count = rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return count;
		}else if(find_field.equals("gongji_cont")){//검색어가 공지 내용인 경우
			//count=(int)SqlMapLocator.getMapper().queryForObject("agongjifind_cnt2",find_name);	
			try{
				con=ds.getConnection();
				sql=" select count(gongji_no) from gongji where gongji_cont like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, find_name);
				rs = pstmt.executeQuery();
				if(rs.next()){
					count = rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return count;
		}
		return count;
	}

	/*관리자 공지사항 검색 결과 목록 보기 */
	public List<GongjiBean> getGongjiSerch(int page, int limit,
			String find_name, String find_field) {
		List<GongjiBean> list = new ArrayList<GongjiBean>();
		try{
			con = ds.getConnection();
			sql="select * from"+"(select rownum r, gongji_no,gongji_name,"
		     +"gongji_title,gongji_cont,gongji_hit,gongji_regdate "+
			" from (select * from gongji order by gongji_no " +
			" desc) where "+find_field+" like ? and"
			+" rownum <= ?) where r >= ?";
		    pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+find_name+"%");
			pstmt.setInt(2, page*limit);
			pstmt.setInt(3, ((page-1)*limit)+1);
			rs = pstmt.executeQuery();

			while(rs.next()){
				GongjiBean g= new GongjiBean();
				g.setGongji_no(rs.getInt("gongji_no"));
				g.setGongji_name(rs.getString("gongji_name"));
				g.setGongji_title(rs.getString("gongji_title"));
				g.setGongji_cont(rs.getString("gongji_cont"));
				g.setGongji_hit(rs.getInt("gongji_hit"));
		        g.setGongji_regdate(rs.getString("gongji_regdate"));
				
		        list.add(g); //컬렉션에 요소값 추가		
			}	
			rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	
}
