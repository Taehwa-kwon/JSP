<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src ="https://code.jquery.com/jquery-3.5.0.js"></script>

<script>
	var obj={bid : "B01" , bname: "권태화"}; //이건 json형태로 사용가능
	alert(obj);
	alert(obj.bid); //객체.속성값
	alert(obj.bname);
	

 /*   var students = [
      {sid : "s001", sname : "aaa"},
      {sid : "s002", sname : "bbb"},
      {sid : "s003", sname : "ccc"},
      {sid : "s004", sname : "ddd"},
      {sid : "s005", sname : "eee"},
      {sid : "s006", sname : "fff"}
   ]; */
   
   var students = [];
   
   var numbers = ["a","b","c"];
   
   $(document).ready(
      function(){
    	  
    	  $("#btnAjax").click(
    		  function(){
					$.ajax({//object만 받을수 있다.
						url:"./students_json.jsp", 
						type : "get",
						datatype: "json",
						/* data : */ 
						success : function(datas){
							students = datas;
							alert("데이터를 가져왔습니다.")
						},
						
						error : function(){
							alert("오류")
						}
							
					})    				  
    			  }
    			  
    		)
    	  
         $("#btnSearch").click(
            function(){
            	var strHTML ="";
               $.each(students, function(index, item){   //students 만큼 돔 ㅋㅋㅋㅋ
            	   alert(index);
            	   alert(item);
            	   alert(item.sid);
            	   alert(item.sname);
            	   strHTML += "<div>번호 : "+item.sid+"- 이름 : "+item.sname+"</div>"
            	   
                  
               	}
               )
               $("#list").html(strHTML);
            }      
         );
      }      
   );
</script>
<body>
   <div id = "wrap">
      <div>
      	 <input type = "button" id="btnAjax" value="데이터를 가져온나 "/>
         <input type = "button" id = "btnSearch" value = "조회"/>
      </div>
      
      <div id = "list">
      </div>
   </div>

</body>
</html>