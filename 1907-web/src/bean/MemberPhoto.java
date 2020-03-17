package bean;

import java.util.Date;

public class MemberPhoto {
	int serial;
	String mId;
	Date rDate;
	String oriFile;
	String sysFile;
	
	public MemberPhoto() {}
	public MemberPhoto(int s, String id, Date d, String ori, String sys) {
		this.serial = s;
		this.mId = id;
		this.rDate = d;
		this.oriFile = ori;
		this.sysFile = sys;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getOriFile() {
		return oriFile;
	}
	public void setOriFile(String oriFile) {
		this.oriFile = oriFile;
	}
	public String getSysFile() {
		return sysFile;
	}
	public void setSysFile(String sysFile) {
		this.sysFile = sysFile;
	}
	
}
