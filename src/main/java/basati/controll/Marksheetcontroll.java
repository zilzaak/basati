package basati.controll;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import basati.model.Department;
import basati.model.Helperr;

@Controller
public class Marksheetcontroll {

	@RequestMapping("/download")
	public ModelAndView downloadsheet(HttpSession session) {
		
		Helperr hp=(Helperr) session.getAttribute("helper");
		ModelAndView mv = new ModelAndView("msheet");
	
		for(Department d : hp.getDps()) {
			 String sd=d.getGrade();
			if(d.getTotal()==0 || d.getGradepoint()==0 || sd==null) {
				
			}
		}
		

		mv.addObject("hp",hp);
		return mv;	
	
	}
	
	
}
