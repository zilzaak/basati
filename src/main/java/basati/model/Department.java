package basati.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity
public class Department {
	
public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getSubcode() {
		return subcode;
	}
	public void setSubcode(String subcode) {
		this.subcode = subcode;
	}
	public String getSession() {
		return session;
	}
	public void setSession(String session) {
		this.session = session;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public float getTc() {
		return tc;
	}
	public void setTc(float tc) {
		this.tc = tc;
	}
	public float getPc() {
		return pc;
	}
	public void setPc(float pc) {
		this.pc = pc;
	}
	public float getTf() {
		return tf;
	}
	public void setTf(float tf) {
		this.tf = tf;
	}
	public float getPf() {
		return pf;
	}
	public void setPf(float pf) {
		this.pf = pf;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}

	
private int did;
private String dept;
private String semester;
private String subname;
private String subcode;
private String session;
private String studentname;
private String rollno;
private float tc;
private float  pc;
private float tf;
private float pf;
private float total;
private float fullmark;
private String stringdate;
private String grade;
private float gradepoint;
private String regno;

private String duration;
private int year;
private String pub;
private String issue;
public String getRegno() {
	return regno;
}
public void setRegno(String regno) {
	this.regno = regno;
}


public Department(String dept, String semester, String subname, String subcode, String session, String studentname,
		String rollno, float tc, float pc, float tf, float pf, float total, float fullmark, String stringdate,
		String grade, float gradepoint, String regno, String duration, int year, String pub, String issue, Date date) {
	super();
	this.dept = dept;
	this.semester = semester;
	this.subname = subname;
	this.subcode = subcode;
	this.session = session;
	this.studentname = studentname;
	this.rollno = rollno;
	this.tc = tc;
	this.pc = pc;
	this.tf = tf;
	this.pf = pf;
	this.total = total;
	this.fullmark = fullmark;
	this.stringdate = stringdate;
	this.grade = grade;
	this.gradepoint = gradepoint;
	this.regno = regno;
	this.duration = duration;
	this.year = year;
	this.pub = pub;
	this.issue = issue;
	this.date = date;
}
public String getGrade() {
	return grade;
}
public void setGrade(String grade) {
	this.grade = grade;
}
public float getGradepoint() {
	return gradepoint;
}
public void setGradepoint(float gradepoint) {
	this.gradepoint = gradepoint;
}


private Date date;



public String getStringdate() {
	return stringdate;
}

public void setStringdate(String stringdate) {
	this.stringdate = stringdate;
}


public Date getDate() {
	return date;
}

public void setDate(Date date){
	this.date = date;
}

public float getFullmark() {
	return fullmark;
}

public void setFullmark(float fullmark) {
	this.fullmark = fullmark;
}
public String getDuration() {
	return duration;
}
public void setDuration(String duration) {
	this.duration = duration;
}
public int getYear() {
	return year;
}
public void setYear(int year) {
	this.year = year;
}
public String getPub() {
	return pub;
}
public void setPub(String pub) {
	this.pub = pub;
}
public String getIssue() {
	return issue;
}
public void setIssue(String issue) {
	this.issue = issue;
}



}
