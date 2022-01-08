package basati.model;

public class Resultst {

	private int resultid;
	private String dept;
	private String roll;
	private String semester;
	private String regno;
	private String serial;
	private String session;
	private String sms;
	private String name;
	private float gpa;	
	public int getResultid() {
		return resultid;
	}
	public void setResultid(int resultid) {
		this.resultid = resultid;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getRoll() {
		return roll;
	}
	public void setRoll(String roll) {
		this.roll = roll;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public float getGpa() {
		return gpa;
	}
	public void setGpa(float gpa) {
		this.gpa = gpa;
	}

	

	public Resultst(String dept, String roll, String semester, String regno, String serial, String session, float gpa,String sms) {
		super();
		this.dept = dept;
		this.roll = roll;
		this.semester = semester;
		this.regno = regno;
		this.serial = serial;
		this.session = session;
		this.gpa = gpa;
		this.sms=sms;
	}
	
	public Resultst() {
		super();


	}
	
	
	
	public String getSession() {
		return session;
	}
	public void setSession(String session) {
		this.session = session;
	}
	public String getRegno() {
		return regno;
	}
	public void setRegno(String regno) {
		this.regno = regno;
	}
	public String getSerial() {
		return serial;
	}
	public void setSerial(String serial) {
		this.serial = serial;
	}
	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
