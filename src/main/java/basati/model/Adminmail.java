package basati.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity
public class Adminmail {
	private int adid;
	private String email;
	private String pass;
	
	@Id
	@GeneratedValue
	public int getAdid() {
		return adid;
	}
	public void setAdid(int adid) {
		this.adid = adid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public Adminmail(String email, String pass) {
		super();
		this.email = email;
		this.pass = pass;
	}
	public Adminmail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
			
}
