<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<title>marksheet</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css
" rel="stylesheet">
<script src="<c:url value="/static/theme/jquery340.js" />" > </script> 
<script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/angular1.8.2.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>
<link href="<c:url value="/static/theme/pregnant.css" /> " rel="stylesheet">
<!--  
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>  -->

<style>
*{
box-sizing:border-box;
}




.html-content{
width:1000px; 
font-weight:700;
 

}

table td{
text-align:center;
}

table th{
text-align:center;
padding:5px;
}
</style>

</head>
<body>

<%
if(session.getAttribute("user")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	}
	  %>
	  

<div  class="html-content" style="margin-left:2%;background-color:floaralwhite;border:2px solid black;" id="hc">

<div style="border:3px solid black;padding:4px;">
<div style="border:6px solid blue;">


<div style="color:black;font-size:1.1em;word-wrap:break-word;">
<ul  style="list-style:none;margin-top:34px;text-align:center;margin-right:5%;" >
<li>

<div class="row">
<div class="col-md-1" style="text-align:left;">
<img id="im"  src="<c:url value="/static/theme/basati.jpg" />"  style="width:100px;height:100px;" /> 
</div>
<div class="col-md-11" style="text-align:left;"> 
<b style="font-size:1.8em;margin-left:22px;color:darkblue;font-family:monotype corsiva;">BADIUL ALAM SCIENCE AND TECHNOLOGY INSTITUTE</b> <br/>
<b style="font-size:1.6em;margin-left:255px;color:darkblue;font-weight:200px;font-family:monotype corsiva;">Kasba , Brahmanbaria</b> <br/>
 <b style="font-size:1.6em;margin-left:300px;color:darkblue;font-weight:200px;font-family:monotype corsiva;">Estd. : 2010</b>
</div>
</div>
</li>

<li>
<br/>
<h3 style="line-height:0.5;font-size:1.6em;padding-top:4px;">ACADEMIC TRANSCRIPT</h3></li>
<li ><h3 style="line-height:0.5;font-size:1.3em;padding-top:4px;">DIPLOMA-IN-ENGINEERING (Duration: 4- Year)</h3></li>
<li style="padding-top:3px;"><b style="font-size:1.3em;">${hp.dps[0].semester} SEMESTER EXAMINATION, ${hp.dps[0].year}</b></li>
<li><b style="line-height:0.5;font-size:1.3em;">(Held in The Month of ${hp.dps[0].duration} )</b></li>
</ul>
</div>


<br/> 
<br/>

<span style="margin-left:48px;font-size:1.3em;">Serial No : <b style="padding-left:3px;">${hp.rst.serial}</b></span>

<br/>
<div class="row" >
<div class="col-md-8">
<ul style="list-style:none;">
<li style="padding:8px;font-size:1.3em;">Technology :<b style="padding-left:3px;">${hp.rst.dept}</b></li>
<li style="padding:8px;font-size:1.3em;">Name :<b style="padding-left:3px;">${hp.dps[0].studentname}</b></li>
<li style="padding:8px;font-size:1.3em;">Roll No. :<b style="padding-left:3px;">${hp.rst.roll}</b></li>
<li style="padding:8px;font-size:1.3em;">Registration No. :<b style="padding-left:3px;">${hp.rst.regno}</b></li> 
<li style="padding:8px;font-size:1.3em;">Session :<b style="padding-left:3px;">${hp.rst.session}</b></li>
<li style="padding:8px;font-size:1.3em;font-weight:400;"><b>64041 -</b> <b>Badiul Alam Science And Technology Institute</b></li>
</ul>
</div>


<div  class="col-md-4">
<table border="1" style="font-size:1em;margin-right:32px;">
<tr>
<th>Range of Marks(Percentage)</th>
<th>Letter Grade</th>
<th>Grade Point</th>
</tr>

<tr>
<td>80 or above</td>
<td>A+</td>
<td>4.00</td>
</tr>

<tr>
<td>75 - below 80</td>
<td>A</td>
<td>3.75</td>
</tr>

<tr>
<td>70 - below 75</td>
<td>A-</td>
<td>3.50</td>
</tr>

<tr>
<td>65 - below 70</td>
<td>B+</td>
<td>3.25</td>
</tr>
<tr>
<td>60 - below 65</td>
<td>B</td>
<td>3.00</td>
</tr>
<tr>
<td>55 - below 60</td>
<td>B-</td>
<td>2.75</td>
</tr>

<tr>
<td>50 - below 55</td>
<td>C+</td>
<td>2.50</td>
</tr>
<tr>
<td>45 - below 50</td>
<td>C</td>
<td>2.25</td>
</tr>

<tr>
<td>40 - below 45</td>
<td>D</td>
<td>2.00</td>
</tr>
<tr>
<td>Below 40</td>
<td>F</td>
<td>0.00</td>
</tr>
</table>
</div>
</div>


<br/>
<br/>

<div style="height:400px;margin-left:5%;margin-right:4%;font-size:1.2em;">
<table  align="center" border="1" style="width:100%;" >
<tr>
<th>Subjects</th>
<th>Full Marks</th>
<th>Marks Obtained</th>
<th>Letter Grade</th>
<th>Grade Point</th>
</tr>

<c:forEach var="x" items="${hp.dps}">
<tr>

<td style="text-align:left;">${x.subcode} ${x.subname}</td>
<td>${x.fullmark}</td>
<td>${x.total}</td>
<td>${x.grade}</td>
<td>${x.gradepoint}</td>
</tr>
 </c:forEach> 
    </table>
        <br/>
<span style="margin-left:73%;">Semester GPA :<b style="border:1px solid black;padding:4px;margin-left:5px;">${hp.rst.gpa}</b></span>
</div>

<br/>



 <div class="row" style="margin-top:100px;padding-left:30px;">
      <div class="col-md-4">
        <b>....................</b><br/>
    <b>Dept. Head</b>
    </div>
    <div class="col-md-4" align="right" style="padding-right:90px;">
    <b>........................</b><br/>
    <b style="padding-right:10px;">Compared By</b>
    </div>
       <div class="col-md-4" align="right" style="padding-right:65px;">
    <b>...............</b><br/>
    <b>Principal</b>
    </div>
  </div>
  

     
     <div  style="font-size:0.85em; margin-left:30px;margin-bottom:20px;margin-top:4px;">
    <b>Date of issue:-${hp.dps[0].issue}</b> <br/>
    <b>Date of Publication of Result:-${hp.dps[0].pub}</b>
    </div>
    <br/>
   
  </div>
  </div>

  <div style="font-size:1em;border:1px white;text-align:center;margin-bottom:3px;">
   <b >This Academic Transcript issued without any alteration or erasure</b> 
  </div>


    
</div>

</body>
</html>
