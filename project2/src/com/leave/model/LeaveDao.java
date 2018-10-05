package com.leave.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;

public class LeaveDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = null;
	
	public LeaveDao() {
		try {
			DBConnection db = new DBConnection();
			conn = db.con;
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private static LeaveDao instance;
	public static LeaveDao getInstance() {
		if(instance == null) instance = new LeaveDao();
		return instance;
	}
	
	public int insertLeave(LeaveBean bean) {
		int result = 0;
		try {
			conn.setAutoCommit(false);
			sql = "insert into pet_leave "
				+ " (leave_id,leave_name,leave_birth,"
				+ " leave_tel, leave_address, leave_title,"
				+ " leave_size, leave_age, leave_option,"
				+ " leave_file) values(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getLeave_id());
			pstmt.setString(2, bean.getLeave_name());
			pstmt.setString(3, bean.getLeave_birth());
			pstmt.setString(4, bean.getLeave_tel());
			pstmt.setString(5, bean.getLeave_address());
			pstmt.setString(6, bean.getLeave_title());
			pstmt.setString(7, bean.getLeave_size());
			pstmt.setString(8, bean.getLeave_age());
			pstmt.setString(9, bean.getLeave_option());
			pstmt.setString(10, bean.getLeave_file());
			
			result = pstmt.executeUpdate();
			conn.commit();
			System.out.println("result="+result);
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e1) {
				e1.printStackTrace();
				
			}
		}finally {
			try {
				conn.setAutoCommit(true);
				conn.close();
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public List<LeaveBean> getLeaveList(){
		
		List<LeaveBean> list = new ArrayList<LeaveBean>();
		
		try {
			sql = "select * from pet_leave";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LeaveBean bean = new LeaveBean();
				
				bean.setLeave_id(rs.getString("leave_id"));
				bean.setLeave_name(rs.getString("leave_name"));
				bean.setLeave_birth(rs.getString("leave_birth"));
				bean.setLeave_tel(rs.getString("leave_tel"));
				bean.setLeave_address(rs.getString("leave_address"));
				bean.setLeave_title(rs.getString("leave_title"));
				bean.setLeave_size(rs.getString("leave_size"));
				bean.setLeave_age(rs.getString("leave_age"));
				bean.setLeave_file(rs.getString("leave_file"));
				bean.setLeave_option(rs.getString("leave_option"));
				
				list.add(bean);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public LeaveBean getleavedetail(String leave_id) {
		
		LeaveBean bean = new LeaveBean();
		
		try {
			sql = "select * from pet_leave where leave_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, leave_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setLeave_id(rs.getString("leave_id"));
				bean.setLeave_name(rs.getString("leave_name"));
				bean.setLeave_birth(rs.getString("leave_birth"));
				bean.setLeave_tel(rs.getString("leave_tel"));
				bean.setLeave_address(rs.getString("leave_address"));
				bean.setLeave_title(rs.getString("leave_title"));
				bean.setLeave_size(rs.getString("leave_size"));
				bean.setLeave_age(rs.getString("leave_age"));
				bean.setLeave_option(rs.getString("leave_option"));
				bean.setLeave_file(rs.getString("leave_file"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public int deleteLeave(String leave_id) {
		
		int result = 0;
		try {
			conn.setAutoCommit(false);
			sql = "delete from pet_leave where leave_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, leave_id);
			result = pstmt.executeUpdate();
			
			conn.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				conn.setAutoCommit(true);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int getUpdate(LeaveBean bean, String leave_id) {
		int result = 0;
		try {
			sql = "update pet_leave "
					+ " set leave_address = ?, "
					+ " leave_title = ?, "
					+ " leave_option = ?, "
					+ " leave_file = ?"
					+ " where leave_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getLeave_address());
			pstmt.setString(2, bean.getLeave_title());
			pstmt.setString(3, bean.getLeave_option());
			pstmt.setString(4, bean.getLeave_file());
			pstmt.setString(5, bean.getLeave_id());
			
			result = pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int getEditUpdate(LeaveBean bean, String leave_id) {
		int result = 0;
		try {
			sql = "update pet_leave "
				+ " set leave_address = ?, "
				+ " leave_title = ?, "
				+ " leave_option = ?  "
				+ " where leave_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getLeave_address());
			pstmt.setString(2, bean.getLeave_title());
			pstmt.setString(3, bean.getLeave_option());
			pstmt.setString(4, bean.getLeave_id());
			
			result = pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
}
