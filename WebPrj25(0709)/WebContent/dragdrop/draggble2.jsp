<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .rec{ width:200px; height:200px; border:1px solid blue; background-color:red; }
   .drop{ width:500px; height:500px; border:1px solid blue; background-color:#dedede; }
   .drop1{ width:500px; height:500px; border:1px solid blue; background-color:#dedede; }
   .at{background-color: pink;}
   .ht{background-color: black;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 라이브러리 -->
<script type="text/javascript">
   $(document).ready(
      function () {
         
    	  $("#rect").draggable({ // 드래그 기능 적용
           // helper : "original"  //자신을 가지고 이동할지 , 혹은 clone을 만들어서 움직일지 
           						   // clone : 복사, original:디폴트 값으로, 옮겨다님
         });
         
         $("#ddd").droppable({ //마우스를 땔때 
            
            activeClass : "at",
            hoverClass:"ht",
            activate : function(event,ui){
            	//alert("activate"); //움직일때 
            }
      
         /*
         ,
         	create : function(event,ui){
         		alert("create"); //
         	}
        
         	,
         	deactivate : function(event,ui){
         		alert("deactivate"); //마우스를 놓을때
         	}
         	
         	,
         	drop : function(event, ui){
         		 //내가 원하는 포지션 안으로 놓으면 drop의 alert이 호출된다
         		 alert("drop");
         	}
         	 
         	,
         	out : function(event,ui){
         		alert("out");//해당하는 지점 들어갔다가 밖으로 나갈때 
         	}
         	,
         	over : function(event,ui){
         		alert("over");
         	} 
         	*/
         })
      }
   );    
     
   
</script>
</head>
<body>
   <div class ="rec" id ="rect">
   </div>
   
   <div style="height:100px" ></div>
   
   <div class="drop" id ="ddd">
   </div>
   
   <div class="drop1" id ="ddd1">
   </div>
   
</body>
</html>