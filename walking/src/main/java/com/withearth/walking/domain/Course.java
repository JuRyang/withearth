package com.withearth.walking.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Course {
	
	// DB
	private int course_idx; // 코스 idx
	private Timestamp course_date; // 코스 생성 일자
	private float loc_km; // 코스 총 거리
	private long walking_time;// 소요 시간
	private String start_point;// 출발지
	private String end_point;// 목적지
	
	// getter/setter
	public int getCourse_idx() {
		return course_idx;
	}
	public void setCourse_idx(int course_idx) {
		this.course_idx = course_idx;
	}
	public Timestamp getCourse_date() {
		return course_date;
	}
	public void setCourse_date(Timestamp course_date) {
		this.course_date = course_date;
	}
	public float getLoc_km() {
		return loc_km;
	}
	public void setLoc_km(float loc_km) {
		this.loc_km = loc_km;
	}
	public long getWalking_time() {
		return walking_time;
	}
	public void setWalking_time(long walking_time) {
		this.walking_time = walking_time;
	}
	public String getStart_point() {
		return start_point;
	}
	public void setStart_point(String start_point) {
		this.start_point = start_point;
	}
	public String getEnd_point() {
		return end_point;
	}
	public void setEnd_point(String end_point) {
		this.end_point = end_point;
	}
	
	// tostring
	@Override
	public String toString() {
		return "Course [course_idx=" + course_idx + ", course_date=" + course_date + ", loc_km=" + loc_km
				+ ", walking_time=" + walking_time + ", start_point=" + start_point + ", end_point=" + end_point + "]";
	}
	
	
	
	

}
