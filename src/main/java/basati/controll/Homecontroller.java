package basati.controll;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import basati.model.Admin;
import basati.model.Adminmail;
import basati.model.Department;
import basati.model.Helperr;
import basati.model.Resultst;
import basati.model.Serialmake;
import basati.repo.Adminmailrepo;
import basati.repo.Adminrepo;
import basati.repo.Departmentrepo;
import basati.repo.Serialmakerepo;

@Controller
public class Homecontroller {

	@Autowired
	private Adminrepo amr;
	@Autowired
	private Departmentrepo drr;
	@Autowired
	private Serialmakerepo srr;
	@Autowired
	private Adminmailrepo mrr;
	
	@RequestMapping("/user")
	
	public String index() {
		
		return "index";
	}
	
	
	@RequestMapping("/admin")
	
	public String  admin() {
		
		return "adminset";
	}
	
	@PostMapping("/setting")
	
	public String  setting(@RequestParam String adminpass) {
		if(adminpass.contentEquals("aslamhex66")) {
			return "setting";
		}
		return "adminset";
	}
	
	
	@PostMapping("/addmail")
	
	public ModelAndView addmail(@RequestParam String email,@RequestParam String pass) {
		ModelAndView mv = new ModelAndView("setting");
		if(mrr.count()<1) {
		Adminmail a=new Adminmail();
		a.setEmail(email);
		a.setPass(pass);
		mrr.save(a);
		mv.addObject("sms","added successfully");
		return mv;
		}
		

	mv.addObject("sms","only one email can be add");
		


		return mv;
	}
	
	@PostMapping("/update")
	
	public ModelAndView updatemail(@RequestParam String email,@RequestParam String pass) {
		ModelAndView mv = new ModelAndView("setting");
Adminmail ad=mrr.findAll().get(0);
ad.setEmail(email);ad.setPass(pass);
            mv.addObject("up","successfully updated");
		return mv;
	}
	

	@PostMapping("/recover")
	public ResponseEntity<Admin> recover(@RequestBody Admin forgot,HttpSession session){
		
	
	if(!amr.existsByEmail(forgot.getEmail()) ) {
		forgot.setCode("not registered yet");

	}
	
	else if(amr.existsByEmail(forgot.getEmail())) {
				String code = getrandom();
		session.setAttribute("rechujuw",code);
			if(new Sendotp().sendotp(code, forgot.getEmail(),"password recover code",mrr.findAll().get(0).getEmail(),
					
			mrr.findAll().get(0).getPass())) {
				forgot.setCode("ok");
			           }
			                   else {
				    forgot.setCode("sorry ,wrong email address");
			                         }
	
		
	}
	
else {
		
		forgot.setCode("this is not your email");
	}
		
	return new ResponseEntity<Admin>(forgot,HttpStatus.OK);
	
	}	
	
	
	@PostMapping("/finalrec")
	public ResponseEntity<Admin> finalrec(@RequestBody Admin forgot,HttpSession session){
String rec = (String) session.getAttribute("rechujuw");

if(forgot.getPassword().length()<4) {
	forgot.setCode("minimum password length is 4");	
	return new ResponseEntity<Admin>(forgot,HttpStatus.OK);
}

if(!rec.contentEquals(forgot.getCode())) {
	forgot.setCode("the code is not matched try again");	
	return new ResponseEntity<Admin>(forgot,HttpStatus.OK);
}

if(rec.contentEquals(forgot.getCode())) {
	Admin fa =amr.findAll().get(0);
	fa.setPassword(forgot.getPassword());
	amr.save(fa);	
	String sms="you recovered password, email:"+fa.getEmail();
    new Sendotp().sendotp(sms, fa.getEmail(),"pasword recovery",mrr.findAll().get(0).getEmail(),
    		mrr.findAll().get(0).getPass());
 	forgot.setCode("successfull");
 	return new ResponseEntity<Admin>(forgot,HttpStatus.OK);
}

return new ResponseEntity<Admin>(forgot,HttpStatus.OK);
	
	}		
		
	
	
	@PostMapping("/change")
	public ResponseEntity<Admin> changepass(@RequestBody Admin f){
		System.out.println(f.getEmail()+"    "+f.getPassword()+"   "+f.getCode());
              Admin a=amr.findAll().get(0);
              
              if(a.getPassword().contentEquals(f.getEmail())) {
                a.setPassword(f.getPassword());
          		amr.save(a);	
          		f.setCode("successfully changed passwprd");
        		return new ResponseEntity<Admin>(f,HttpStatus.OK);  
              }

              f.setCode("old password is wrong , sorry , try again"); 
		return new ResponseEntity<Admin>(f,HttpStatus.OK);
	
	}	
	
	
	
	@RequestMapping("/")
	
	public String homepage() {
		
		return "adminlogin";
	}
	
	@PostMapping("/login")
	
	public ModelAndView  indexpage(@RequestParam String user,@RequestParam String  password,HttpSession session) {
		ModelAndView mv = new ModelAndView("adminlogin");
		if(amr.count()<1) {
			mv.addObject("sms","please register as admin");
			return mv;
		}
		
		
		if(amr.count()==1) { 

	   Admin ad = amr.findAll().get(0);                 
			if(ad.getEmail().contentEquals(user) && ad.getPassword().contentEquals(password)) {
				
				session.setAttribute("user",user);
				session.setAttribute("password",password);
				mv.setViewName("admin");
				return mv;
			}
			
			if(!ad.getEmail().contentEquals(user) || !ad.getPassword().contentEquals(password)) {
				mv.addObject("sms","user name or password is wrong,try again");
				return mv;
			}
			
		                }
		
		return mv;
	}
	
	

	

	
	@RequestMapping("/adminmark")
	
	public String adminmark() {
	
		return "adminmark";
	}	
	
	
	@RequestMapping("/allresult")
	
	public String allresult() {
	
		return "allresult";
		
	}	
	
	
	
	
	public List<Department> dlst2=new ArrayList<Department>();
	
	@PostMapping("/getallresult")
	public ResponseEntity<List<Resultst>> getallresult(@RequestBody Department dp,HttpSession session) {
		session.setAttribute("s",dp.getSession());	session.setAttribute("d",dp.getDept());	session.setAttribute("sm",dp.getSemester());
		 List<Department> dl2=new ArrayList<Department>();
		 dlst2=dl2;
		List<Resultst> lst=new ArrayList<>();
		List<Department> dlst=drr.findBySessionAndDeptAndSemester(dp.getSession(),dp.getDept(),dp.getSemester());

		
		for(Department d : dlst) {
			
			if(checkdp(d.getRollno())) {
				dlst2.add(d);
			}
		}
		
		for(Department d : dlst2) {
			
			lst.add(findresult(d));
		}
		
		
		return new ResponseEntity<List<Resultst>>(lst,HttpStatus.OK)  ;
		
	}	
		
	
	public boolean checkdp(String roll) {
		int count=0;
		for(Department dp : dlst2) {
		if(dp.getRollno().contentEquals(roll))	{
			
			count++;
		}
		}
		if(count==0) {
			return true;
		}
		
		return false;
		
	}
	
	

public Resultst findresult( Department dp){

List<Department> lst = drr.findByDeptAndSemesterAndRollno(dp.getDept(),dp.getSemester(),dp.getRollno());
float size=lst.size();
float sum=0;
float gpa=0; 
DecimalFormat dfrmt = new DecimalFormat();
dfrmt.setMaximumFractionDigits(2);
boolean p=false;
Resultst rs = new Resultst();

  for(Department d: lst) {
	  String sd=d.getGrade();
   if(sd==null) {
	   rs.setName(d.getStudentname());rs.setDept(dp.getDept());
	   rs.setSemester(dp.getSemester());
			rs.setRoll(d.getRollno());
		    rs.setRegno(d.getRegno());	rs.setSession(d.getSession());
		    rs.setSerial("not found");rs.setSms("student mark not inserted, insert to get result");	    
rs.setGpa((float) 0.00);
		    return rs;
    }
	
}
  
  
  
if(!lst.isEmpty()) {
    for(Department d: lst) {
        
if(d.getGrade().contentEquals("F")) {
	p=true;
}
    	sum=sum+d.getGradepoint();
    	
    }
    
    
    
if(p) {
rs.setGpa(gpa);rs.setRoll(dp.getRollno());
rs.setSemester(dp.getSemester());
rs.setDept(dp.getDept());
rs.setSession(dp.getSession());
rs.setRegno(dp.getRegno());    rs.setName(dp.getStudentname());
rs.setSms("the student failed");
}
      
if(!p) {
gpa=sum/size; 
gpa=Float.parseFloat(dfrmt.format(gpa));
String serial="12345678";

if(srr.existsByDeptAndRollnoAndSemester(dp.getDept(),dp.getRollno(),dp.getSemester())) {
Serialmake ms =srr.findByDeptAndRollnoAndSemester(dp.getDept(),dp.getRollno(),dp.getSemester()).get(0);
rs.setSerial(ms.getSerial());
rs.setSession(lst.get(0).getSession());
rs.setRegno(lst.get(0).getRegno());	
rs.setGpa(gpa);rs.setRoll(dp.getRollno());
rs.setSemester(dp.getSemester());rs.setSms("successfully found result");
rs.setDept(dp.getDept());   rs.setName(dp.getStudentname());
}

if(!srr.existsByDeptAndRollnoAndSemester(dp.getDept(),dp.getRollno(),dp.getSemester())) {
    do {
        serial=makeserial();
      }while(srr.existsBySerialAndDeptAndRollnoAndSemester(serial,dp.getDept(),dp.getRollno(),dp.getSemester()));	
    Serialmake ms = new Serialmake();
    ms.setDept(dp.getDept());ms.setRollno(dp.getRollno());ms.setSerial(serial); 
    ms.setRegno(dp.getRegno());ms.setSemester(dp.getSemester());
    srr.save(ms);
    rs.setSerial(serial);
    rs.setSession(lst.get(0).getSession());
    rs.setRegno(lst.get(0).getRegno());	
    rs.setGpa(gpa);rs.setRoll(dp.getRollno());
    rs.setSemester(dp.getSemester());rs.setSms("successfully found result");
    rs.setDept(dp.getDept());     rs.setName(dp.getStudentname());       
    
}

}
}

if(lst.isEmpty()) {
	rs.setRoll("student not found");
    rs.setRegno("student not found");	
    rs.setSerial("not found");   rs.setName(dp.getStudentname());
    rs.setSms("student not exist of this roll");
}



  return rs;
		
	}	
	
public String makeserial() {
	String chars="0123456789";
			Random rnd = new Random();
			StringBuilder sb = new StringBuilder(8);
			for (int i = 0; i < 8; i++)
				sb.append(chars.charAt(rnd.nextInt(chars.length())));
			return sb.toString();
}


@PostMapping("/register")
public ResponseEntity<Admin> admnlogin(@RequestBody Admin user,HttpSession session){

	if(amr.count()<1) {
String adminmail=mrr.findAll().get(0).getEmail();
String adminpass=mrr.findAll().get(0).getPass();
System.out.println("the user name is as "+adminmail+"    "+adminpass);
String codertu = getrandom();
if(new Sendotp().sendotp(codertu, user.getEmail(),"email verification code",adminmail,adminpass)) {
	session.setAttribute("codertu",codertu);
	user.setCode("ok");
}

}
	
else {

user.setCode("wrong email, or email already exists, or user number exceded");
}

return new ResponseEntity<Admin>(user,HttpStatus.OK);

}



@PostMapping("/regfinal")
public ResponseEntity<Admin> finalreg(@RequestBody Admin user,HttpSession session){
	Adminmail adm = mrr.findAll().get(0);
String rancode = (String) session.getAttribute("codertu");
if(user.getCode().contentEquals(rancode)) {
amr.save(user);
String sms="successfully registered , your email:"+user.getEmail()+"login password: "+user.getPassword();
new Sendotp().sendotp(sms, user.getEmail(),"registration successfull", adm.getEmail(), adm.getPass());
user.setCode("ok");

}

else {
user.setCode("no");	

}

return new ResponseEntity<Admin>(user,HttpStatus.OK);

}

public  String getrandom() {
	String chars = "123456789abcdefgh"
      +"ijkmnpqrstuvwxyz#";
	Random rnd = new Random();
	StringBuilder sb = new StringBuilder(4);
	for (int i = 0; i < 4; i++)
		sb.append(chars.charAt(rnd.nextInt(chars.length())));
	return sb.toString();
}



@RequestMapping("/logout")

public String  logout(HttpSession session) {

session.removeAttribute("user");
session.removeAttribute("password");

return "adminlogin";
}


@RequestMapping("/studentresult")

public String  logout() {

return "index";
}

@PostMapping("/getcode")

public ResponseEntity<Admin>  getcode(@RequestBody Admin ad,HttpSession session) {

session.removeAttribute("user");
session.removeAttribute("password");

String code = getrandom();
session.setAttribute("emcode",code);
if(new Sendotp().sendotp(code, ad.getEmail(),"password recover code",mrr.findAll().get(0).getEmail(),
	mrr.findAll().get(0).getPass())) {
ad.setCode("ok");
       }
               else {
    ad.setCode("sorry ,wrong email address");
                     }

return new ResponseEntity<Admin>(ad,HttpStatus.OK);
}


@PutMapping("/updatede")

public ResponseEntity<Department> updatede(@RequestBody Department fdept) {
	List<Department> lst = drr.findBySessionAndDeptAndSemester(fdept.getSession(), fdept.getDept(), fdept.getSemester());

for(Department d : lst) {
	d.setYear(fdept.getYear());
	d.setDuration(fdept.getDuration());
	d.setPub(fdept.getPub());
	d.setIssue(fdept.getIssue());
	
}
drr.saveAll(lst);

return new ResponseEntity<Department>(fdept,HttpStatus.OK);
}

@PutMapping("/updatede2")

public ResponseEntity<Department> updatede2(@RequestBody List<Department> fdept) {
drr.saveAll(fdept);
return new ResponseEntity<Department>(fdept.get(0),HttpStatus.OK);
}

@PostMapping("/subcode")

public ResponseEntity<Admin> subcode(@RequestBody Admin ad,HttpSession session) {

String ec=(String) session.getAttribute("emcode");
if(ad.getCode().contentEquals(ec)) {
	ad.setCode("successfully changed email");
	Admin d =amr.findAll().get(0);
	d.setEmail(ad.getEmail());
	amr.save(d);
	return new ResponseEntity<Admin>(ad,HttpStatus.OK);
}

ad.setCode("sorry code is wrong , try again");
return new ResponseEntity<Admin>(ad,HttpStatus.OK);

}



}