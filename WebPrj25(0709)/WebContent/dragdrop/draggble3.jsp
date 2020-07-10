<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.rec1{width:150px; height:30px; border:3px solid black;}
	.rec2{width:150px; height:30px; border:5px solid red;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	   $(document).ready(
	      function (){
	    	  $(".rec1").draggable({
	    		  connectToSortable : "#b" //이게 있으면 #b에도 리스트를 합칠수 있게 만듬
	    	  });
	    	  
	    	  
	    	  $("#b").sortable({		 //sortable 드래그해서 순서를 바꿀수 있게 만드는 리스트
	    		  
	    		  activate : function(event,ui){
	    			  //alert("activate")
	    		  }
	    	  	 ,
	    		 /*  	
	    	 	beforeStop : function(event,ui){
	    	  		 //alert("beforeStop")
	    	  	 }
	    	  	 ,
	    	  	 change : function(event,ui){
	    	  		 //alert("change")
	    	  	 }
	    	  	 ,
	    	  	 deactivate : function(event,ui){
	         		//alert("deactivate"); //마우스를 놓을때
	         	 }
	    	  	 ,
	    	  	 out : function(event,ui){
	    	  		// alert("out")
	    	  	 }
	    	  	 ,
	    	  	 over:function(event,ui){ //넘어가지말라는 over
	    	  		 alert("over");
	    	  	 } 
	    	  	 ,
	    	  	 receive : function(event,ui){
	    	  		 
	    	  	 }
	    	  	 ,remove : function(event,ui){
	    	  		 
	    	  	 }
	    	  	 ,sort : function(event,ui) { //정렬하니깐 총 3번이 뜨겠찌?
	    	  		 
	    	  	 }
	    	  	 
	    	  	 ///receive , start , stop , update 이 4개가 빈도수가 굉장히 높다.
	    	  	 
	    	  	 ,start : function(event,ui){
	    	  		 
	    	  	 }
	    	  	 ,stop : function(event,ui){
	    	  		 
	    	  	 }
	    	  	 ,update : function(event,ui){
	    	  		 
	    	  	 }
	    	  	 */
	    		  
	    	  });
	      }      
	   );
</script>
</head>
<body>
	<div id="a" style="width:150px; height:100px;border:1px solid blue;">
		<div class="rec1">1</div>
		<div class="rec1">2</div>
	</div> 
	<div id="b" style="width:150px; height:100px;border:1px solid yellow;">
		<div class="rec2">1</div>
		<div class="rec2">2</div>
	</div> 
  
  
</body>
</html>