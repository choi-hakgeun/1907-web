package bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberVo {
	String mId;
	String mName;
	Date   rDate;
	int    grade;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String pattern = "{'mId' : '%s' , 'mName' : '%s' , "
					   + " 'rDate' : '%s' , 'grade' : '%s'}";
		
		
		public MemberVo() {}
		public MemberVo(String id, String name, Date d, int g) {
			this.mId = id;
			this.mName = name;
			this.rDate = d;
			this.grade = g;
		}
		
		public String toString() {
			String d = sdf.format(rDate);
			String str = String.format("%10s\t%15s\t%15s\t%4d\n", mId, mName, d, grade );
			
			return str;			
		}
		
		public String toJSON() {
			String d = sdf.format(rDate);
			String json = 
					String.format(pattern, mId, mName, d, grade );
			json = json.replaceAll("\'","\"");
			return json;
		}
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public void setrDate(String rDate) {
		try {
			this.rDate = sdf.parse(rDate);			
		}catch(ParseException e) {
			e.printStackTrace();
		}
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	

}
