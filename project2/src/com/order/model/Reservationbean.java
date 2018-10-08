package com.order.model;

import java.util.Date;

public class Reservationbean {
	private String leave_id;
	private String id;
	private int pet_number;
	private String startDate;
	private String endDate;
	private Date regDate;
	
	public String getLeave_id() {
		return leave_id;
	}
	public void setLeave_id(String leave_id) {
		this.leave_id = leave_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPet_number() {
		return pet_number;
	}
	public void setPet_number(int pet_number) {
		this.pet_number = pet_number;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
}
