package basati.controll;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import basati.model.Department;
import basati.model.Helperr;
import basati.model.Resultst;
import basati.repo.Departmentrepo;

@Controller
public class Tabulation {

	@Autowired
	private Departmentrepo drr;


	public List<Department> dlst2=new ArrayList<Department>();
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
	Resultst rs = new Resultst();
List<Department> lst = drr.findBySessionAndDeptAndSemesterAndRollno(dp.getSession(),dp.getDept(),dp.getSemester(),dp.getRollno());
float totalcredit=0;float sum=0;float gpa=0; 
DecimalFormat dfrmt = new DecimalFormat();
dfrmt.setMaximumFractionDigits(2);

boolean p=false;
for(Department d: lst) {
        String gd=d.getGrade();

if(gd==null || gd.contentEquals("F") || d.getGradepoint()<2) {
p=true;
}
sum=sum+d.getGradepoint()*d.getCredit();
    	totalcredit=totalcredit+d.getCredit();
    }
    

  if(p) {
rs.setGpa(gpa);rs.setRoll(dp.getRollno());
rs.setSemester(dp.getSemester());
rs.setDept(dp.getDept());
rs.setSession(dp.getSession());
rs.setRegno(dp.getRegno());    rs.setName(dp.getStudentname());
rs.setSms("F");
}
      
if(!p) {
gpa=sum/totalcredit; 
gpa=Float.parseFloat(dfrmt.format(gpa));
rs.setSession(lst.get(0).getSession());
rs.setRegno(lst.get(0).getRegno());	
rs.setGpa(gpa);rs.setRoll(dp.getRollno());
rs.setSemester(dp.getSemester());
rs.setSms(getletter(rs.getGpa()));
rs.setDept(dp.getDept()); rs.setName(dp.getStudentname());
}
  return rs;
		
	}	

	






	@PostMapping("/tabresult")
	public ResponseEntity<List<Helperr>> getallresult(@RequestBody Department dp) {
	
		 List<Department> dl2=new ArrayList<Department>();
		 dlst2=dl2;
		List<Helperr> helplst=new ArrayList<Helperr>();
		List<Department> dlst=drr.findBySessionAndDeptAndSemesterOrderByRollnoAsc(dp.getSession(),dp.getDept(),dp.getSemester());

		
		for(Department d : dlst) {
			
			if(checkdp(d.getRollno())) {
				dlst2.add(d);
				
			}
		}
		
	
		
	for(Department d : dlst2) {
			Helperr h = new Helperr();
			h.setRst(findresult(d));
			h.setDps(drr.findBySessionAndDeptAndSemesterAndRollno(d.getSession(),d.getDept(),d.getSemester(),d.getRollno()));		
			helplst.add(h);
		}
		
		
		return new ResponseEntity<List<Helperr>>(helplst,HttpStatus.OK)  ;
		
	}	
		

	
	public String getletter(float mark) {
		
	
	if(mark>=4) {
		
	return "A+";

	}
	
	if(3.75<=mark && mark<4) {
		
	return "A";
	}
	
	if(3.50<=mark && mark<3.75) {
		return "A-";

	}
	if(3.25<=mark && mark<3.50) {
		return "B+";


	}
	
	if(3.00<=mark && mark<3.25) {
return "B";
	}
	
	if(2.75<=mark && mark<3.00) {
	return "B-";

	}
	if(2.50<=mark && mark<2.75) {
		
	
		return "C+";
	}
	if(2.25<=mark && mark<2.50) {
return "C";
	}
	
	if(2.00<=mark && mark<2.25) {
		

		return "D";
	}
	
	if(mark<2.00) {
		
		return "F";
	}
	
	return "und";

	}
	


}
