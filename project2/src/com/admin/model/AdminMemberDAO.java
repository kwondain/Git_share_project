package com.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.member.model.MemberBean;

import db.DBConnection;

public class AdminMemberDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private String sql=null;
	public AdminMemberDAO(){ // 생성자
		try{
			DBConnection db = new DBConnection();
			con = db.con; // 커넥션 가져오기
		}catch(Exception e){
			e.printStackTrace();
		}	
	} // 생성자 end

	/* 총 레코드 수 */
	public int getListCount() {
		int count=0; // 레코드 수 
		try{
			// member_member 테이블의 전체 레코드 수
			sql="select count(*) from pet_Member";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery(); //select문 실행
			if(rs.next()){ // 검색 레코드가 있는 경우
				count=rs.getInt(1); // 총레코드수 저장			
			}
			rs.close(); pstmt.close();//con.close();			
		}catch(Exception e){
			e.printStackTrace();
		}
		return count; // 전체 회원수 리턴
	}
	/* 회원 목록 보기 */
	public List<MemberBean> getMemberList(int page, int limit) {
	 
		sql="select * from "
	  	 + " (select pet_Member.*, rownum as rnum "
		 + " from pet_Member) "
	  	 + " where rnum>=? and rnum<=?";
		List<MemberBean> list = 
				   new ArrayList<MemberBean>();
		int startrow=(page-1)*limit+1; // 시작행 수식
		int endrow = page*limit;
		try{
			DBConnection db = new DBConnection();
			con = db.con;
		    pstmt=con.prepareStatement(sql);
		    pstmt.setInt(1, startrow);
		    pstmt.setInt(2, endrow);
		    rs=pstmt.executeQuery();//select문 실행
		    while(rs.next()){ // 레코드 수 만큼 반복
		    	MemberBean bean = new MemberBean();
		    	// 테이블에서 회원정보를 가져와서
		    	// 빈에 저장한다.
		    	bean.setMember_id
		    	    (rs.getString("member_id"));
		    	bean.setMember_name
		    	   (rs.getString("member_name"));
		    	bean.setMember_nickname
		    	   (rs.getString("member_nickname"));
		    	list.add(bean); // 빈 객체를 list 추가		    	
		    }
		    rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list; // 회원 정보 리턴
	}
	/* 회원의 정보 보기 */
	public MemberBean getmemCont(String mem_id) {
		MemberBean bean=null;
		try{			
			// 해당 id의 사용자 정보 검색
			sql="select * from pet_Member "
				+ " where member_id=? ";	
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery(); //select문 실행
			if(rs.next()){
				bean = new MemberBean();
				bean.setMember_id
				      (rs.getString("member_id"));
				bean.setMember_name
			      (rs.getString("member_name"));
				bean.setMember_pass
			      (rs.getString("member_pass"));
				bean.setMember_nickname
			      (rs.getString("member_nickname"));
				bean.setMember_gender
			      (rs.getString("member_gender"));
				bean.setMember_email
			      (rs.getString("member_email"));
				bean.setMember_addr1
			      (rs.getString("member_addr1"));
				bean.setMember_addr2
			      (rs.getString("member_addr2"));
				bean.setMember_zip
			      (rs.getString("member_zip"));
			}
			rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return bean; // 빈 객체 리턴
	}
	/* 회원 정보 수정 */	
	public int updateMember(MemberBean bean) {
		int re=-1;
		try{
			sql="update pet_Member set "
		   	   + " member_pass=?, member_name=?, "
		   	   + " member_nickname=?, member_gender=?, "
		   	   + " member_email=?, member_zip=?, member_addr1=?, "
		   	   + " member_addr2=? where member_id=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,bean.getMember_pass());
			pstmt.setString(2,bean.getMember_name());
			pstmt.setString(3,bean.getMember_nickname());
			pstmt.setString(4,bean.getMember_gender());
			pstmt.setString(5,bean.getMember_email());
			pstmt.setString(6,bean.getMember_zip());
			pstmt.setString(7,bean.getMember_addr1());
			pstmt.setString(8,bean.getMember_addr2());
			pstmt.setString(9,bean.getMember_id());
			System.out.print(pstmt);
			re = pstmt.executeUpdate(); //update문 실행
			System.out.println(re);
			// 쿼리문이 성공하면 1리턴			
			pstmt.close(); //con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return re; // 실행결과 리턴
	}
	/* 회원 삭제 */
	public void deleteMember(String mem_id) {
		try{
			sql="delete from pet_Member "
				+ " where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.executeUpdate(); // delete문 실행
			pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/*  회원 검색 레코드 수 */
	public int getListCount3(String find_name, String find_field) {
	    int count=0; // 레코드 수
	    if(find_field.equals("member_id")){// id 검색
	    	try{
	    		sql="select count(*) from pet_Member"
	    		+ " where member_id like ?";
	    	    pstmt = con.prepareStatement(sql);
	    	    pstmt.setString(1,find_name);
	    	    rs = pstmt.executeQuery(); //select문 실행
	    	    if(rs.next()){
	    	    	count = rs.getInt(1);//첫번째 컬럼정보
	    	    }
	    	    pstmt.close(); rs.close();//con.close();
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}	    	
	    }else{  // member_name (회원 이름 검색)
	    	try{
	    		sql="select count(*) from pet_Member"
	    		+ " where member_name like ?";
	    	    pstmt = con.prepareStatement(sql);
	    	    pstmt.setString(1,find_name);
	    	    rs = pstmt.executeQuery(); //select문 실행
	    	    if(rs.next()){
	    	    	count = rs.getInt(1);//첫번째 컬럼정보
	    	    }
	    	    pstmt.close(); rs.close(); //con.close();
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
	    }
		return count;  // 검색된 회원수 리턴
	}
	/* 회원 검색 */
	public List<MemberBean> getMemList3(int page, int limit, String find_name,
			String find_field) {
		List<MemberBean> list = new ArrayList<MemberBean>();
		try{					
			sql="select * from"
			+"(select rownum as rnum,member_id,member_name,"
			+" member_nickname,"
            +" from (select * from pet_Member" 
            +" order by member_id desc)"
            +" where "+find_field+" like ? and rownum <= ?)"
            +" where rnum >= ?";
		    // 총 행수 50
			// page = 2, limit = 7
			// 2: 14 ~  3: 8
			// 8 ~ 14행
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+find_name+"%");
			pstmt.setInt(2, page*limit);
			pstmt.setInt(3, ((page-1)*limit)+1);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean mb = new MemberBean();
				mb.setMember_id(rs.getString("member_id"));
				mb.setMember_name(rs.getString("member_name"));
				mb.setMember_nickname(rs.getString("member_nickname"));						
				
		        list.add(mb); //컬렉션에 요소값 추가		
			}	
			rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}				
		return list;
	}

}

