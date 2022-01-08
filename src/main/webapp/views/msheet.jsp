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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<style>
*{
box-sizing:border-box;
}

.html-content{
width:840px; 

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

<script type="text/javascript">
function createit() {
  var HTML_Width = $(".html-content").width();
    var HTML_Height = $(".html-content").height();
    var top_left_margin =3;
    var PDF_Width = HTML_Width+(top_left_margin *2);
    
    var PDF_Height =(PDF_Width * 1.5) + (top_left_margin * 2);
    var canvas_image_width = HTML_Width;
    var canvas_image_height = HTML_Height;
    var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;
    html2canvas($(".html-content")[0]).then(function (canvas) {
        var imgData = canvas.toDataURL("image/jpeg", 1.0);
        var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
        pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);
        for (var i = 1; i <= totalPDFPages; i++) { 
            pdf.addPage(PDF_Width, PDF_Height);
            pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
        }
      
        var r=$("#prid").val()+$("#presname").val()+".pdf"; 
        
       pdf.save(r);
       // $(".html-content").hide();
    });
}
</script>
</head>
<body>

<%
if(session.getAttribute("user")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	}
	  %>
	  
<button class="btn btn-success" onclick="createit();" style="margin-left:20%;">download</button>
<input type="text" style="display:none;"  id="presname" value="${hp.rst.dept}"/>
<input type="text" style="display:none;"  id="prid" value="${hp.rst.roll}"/>

<div  class="html-content" style="margin-left:20%;margin-right:20%;background-color:floaralwhite;border:2px solid black;">

<!-- <div style="border:3px solid blue;margin:23px;pading:5px;"> -->
<div style="border:3px solid black;padding:4px;">
<div style="border:6px solid blue;">



<div style="color:black;font-size:1.1em;word-wrap:break-word;">
<ul  style="list-style:none;margin-top:26px;" >
<li style="margin-left:-20px;">

<div class="row">

<div class="col-md-1" style="text-align:left;">
<img id="im"  src="<c:url value="/static/theme/basati.jpg" />"  style="width:60px;height:60px;" /> 
</div>
<div class="col-md-11" style="text-align:left;"> 
<b style="font-size:1.3em;">BADIUL ALAM SCIENCE AND TECHNOLOGY INSTITUTE</b> <br/>
<b style="font-size:1.3em;margin-left:150px;font-weight:200px;">Kasba , Brahmanbaria</b>
</div>
</div>
</li>

<li>
<br/>
<h3 style="margin-left:32%;line-height:0.5;font-size:1.3em;padding-top:4px;">ACADEMIC TRANSCRIPT</h3></li>
<li><h3 style="margin-left:20%;line-height:0.5;font-size:1.0em;padding-top:4px;">DIPLOMA-IN-ENGINEERING (Duration: 4- Year)</h3></li>
<li><b style="margin-left:25%;font-size:1em;">${hp.dps[0].semester} SEMESTER EXAMINATION, ${hp.dps[0].year}</b></li>
<li style="text-align:center;"><b style="margin-left:-4%;line-height:0.5;">(Held in The Month  ${hp.dps[0].duration} )</b></li>
</ul>
</div>


<br/>

<span style="margin-left:48px;">Serial No : <b style="padding-left:3px;">${hp.rst.serial}</b></span>

<br/>
<div class="row" >
<div class="col-md-8">
<ul style="list-style:none;">
<li style="padding:8px;">Technology :<b style="padding-left:3px;">${hp.rst.dept}</b></li>
<li style="padding:8px;">Name :<b style="padding-left:3px;">${hp.dps[0].studentname}</b></li>
<li style="padding:8px;">Roll No. :<b style="padding-left:3px;">${hp.rst.roll}</b></li>
<li style="padding:8px;">Registration No. :<b style="padding-left:3px;">${hp.rst.regno}</b></li> 
<li style="padding:8px;">Session :<b style="padding-left:3px;">${hp.rst.session}</b></li>
<li style="padding:8px;font-size:1em;font-weight:400;">64041 - <b>Badiul Alam Science And Technology Institute</b></li>
</ul>
</div>


<div  class="col-md-4" >
<table border="1" style="font-size:0.60em;">
<tr>
<th>Range of Marks(Percentage)</th>
<th>Grade</th>
<th>Point</th>
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




<div style="height:370px;">
<table border="1" align="center">
<tr>
<th>Subjects</th>
<th>Full Mark</th>
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
<span style="margin-left:67%;">Semester GPA :<b style="border:1px solid black;padding:4px;">${hp.rst.gpa}</b></span>
</div>

<br/>



 <div class="row" style="margin-top:150px;padding-left:30px;">
      <div class="col-md-4">
        <b>....................</b><br/>
    <b>Dept. Head</b>
    </div>
    <div class="col-md-4" align="right" style="padding-right:90px;">
    <b>........................</b><br/>
    <b>Compared By</b>
    </div>
       <div class="col-md-4" align="right" style="padding-right:65px;">
    <b>...............</b><br/>
    <b>Principal</b>
    </div>
  </div>
  

     
     <div  style="font-size:0.70em; margin-left:30px;margin-bottom:20px;margin-top:4px;">
    <b>Date of issue:${hp.dps[0].issue}</b> <br/>
    <b>Date of Publication of Result::${hp.dps[0].pub}</b>
    </div>
    
   
  </div>
  </div>
<!--   </div>--->

  <div style="font-size:1em;border:1px white;text-align:center;margin-bottom:3px;">
   <b >This Academic Transcript issued without any alteration or erasure</b> 
  </div>


    
</div>

</body>
</html>