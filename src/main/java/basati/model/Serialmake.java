package basati.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Table
@Entity
public class Serialmake {
	
private int sid;
private String serial;
private String rollno;
private String regno;
private String semester;
private String dept;

@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public int getSid() {
	return sid;
}
public void setSid(int sid) {
	this.sid = sid;
}
public String getSerial() {
	return serial;
}
public void setSerial(String serial) {
	this.serial = serial;
}



public Serialmake(String serial, String rollno, String regno, String semester,String dept) {
	super();
	this.serial = serial;
	this.rollno = rollno;
	this.regno = regno;
	this.semester = semester;
	this.dept=dept;
}

public Serialmake() {
	super();	
}
public String getRollno() {
	return rollno;
}
public void setRollno(String rollno) {
	this.rollno = rollno;
}
public String getRegno() {
	return regno;
}
public void setRegno(String regno) {
	this.regno = regno;
}
public String getSemester() {
	return semester;
}
public void setSemester(String semester) {
	this.semester = semester;
}
public String getDept() {
	return dept;
}
public void setDept(String dept) {
	this.dept = dept;
}



}
