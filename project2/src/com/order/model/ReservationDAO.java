package com.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;

public class ReservationDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = null;
	
	public ReservationDAO() {
		try {
			DBConnection db = new DBConnection();
			conn = db.con;
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private static ReservationDAO instance;
	public static ReservationDAO getInstace() {
		if(instance == null) instance = new ReservationDAO();
		return instance;
	}
	
	public int insertReservation(Reservationbean bean) {
		int result = 0;
		
		try {
			sql = "insert into reservation "
				+ " (id, leave_id, pet_number, startdate, enddate) "
				+ " values(?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getLeave_id());
			pstmt.setInt(3, bean.getPet_number());
			pstmt.setString(4, bean.getStartDate());
			pstmt.setString(5, bean.getEndDate());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
}
