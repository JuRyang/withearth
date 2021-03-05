package com.withearth.community.domain;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MatAddRequest {
	
	private int mIdx;
	private String mTitle;
	private String mAddr;
	private String mTime;
	private String mNum;
	private String mCont;
	private List<MultipartFile> mImg;
	
	
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}

	public String getmTitle() {
		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}
	public String getmTime() {
		return mTime;
	}
	public void setmTime(String mTime) {
		this.mTime = mTime;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getmCont() {
		return mCont;
	}
	public void setmCont(String mCont) {
		this.mCont = mCont;
	}
	public List<MultipartFile> getmImg() {
		return mImg;
	}
	
	public void setmImg(List<MultipartFile> mImg) {
		this.mImg = mImg;
	}
	
	public MatzipVo toMatzip() {
		
		MatzipVo matzip = new MatzipVo();
		
		matzip.setMatTitle(mTitle);
		matzip.setMatAddr(mAddr);
		matzip.setMatTime(mTime);
		matzip.setMatNum(mNum);
		matzip.setMatCont(mCont);
		
		return matzip;
	}
	
	@Override
	public String toString() {
		return "MatAddRequest [mIdx=" + mIdx + ", mTitle=" + mTitle + ", mAddr=" + mAddr + ", mTime="
				+ mTime + ", mNum=" + mNum + ", mCont=" + mCont + ", mImg=" + mImg + "]";
	}
	
	
	
	
	
}
