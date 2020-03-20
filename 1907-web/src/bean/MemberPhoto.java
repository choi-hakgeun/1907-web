package bean;

public class MemberPhoto {
	int	   serial;
	String oriFile;
	String sysFile;
	
	public MemberPhoto() {}
	public MemberPhoto(int ser, String ori, String sys) {
		this.serial = ser;
		this.oriFile = ori;
		this.sysFile = sys;
	}
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
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
