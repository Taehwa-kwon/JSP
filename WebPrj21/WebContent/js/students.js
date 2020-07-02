/**
 * 
 */

//AJON으로 불러온다.

var getSido = function(){
	
	var strHTML = ""; 
	
	
	$.ajax({
		
		url : "./Datas/getSido.jsp", 
		type : "post",
		//data : "",
		datatype :"json",
		success : function(datas){ //getSido.jsp의 결과값을 가져오는거고 {[ : ]} <이런게 오는거고 
			$.each(datas,
					function(index,item){
					strHTML += "<option value='"+item.com_id+"'>"+ item.com_val +"</option>" //getSido에 있는 item.com_id
				}
			);
			
			$("#sido").html(strHTML) //register.jsp안에 sido 안에 들어간다.
		}
		,
		error : function(){
			
		}
		
		
	})
	
}

var getGugun = function(){
	
	var strHTML = ""; 
	
	
	$.ajax({
		
		url : "./Datas/getGugun.jsp",
		type : "post",
		data : "in_Sido=" + $("#sido").val(), //데이터를 받는다 . register의  이유는 getSido()의  PROC_SEL_GUGUN 프로시저를 실행하고 그 값을 받아서 부산에 관한 내용을 받아얗 하니깐
		//in_Sido="COM0002" 이것이고 다시 이것을 getGugun으로 전달한다. 얘가 getGugun의  String strSido = request.getParameter("in_Sido");  이것이 되는거고 
		//in_Sido 글자와 getParameter("in_Sido") 글자는 같아야 한다.
		
		datatype :"json",
		success : function(datas){
			strHTML += "<select id='sGugun'>";
			$.each(datas,
					function(index,item){
					strHTML += "<option value='"+item.com_id+"'>"+ item.com_val +"</option>" //getSido에 있는 item.com_id
					           //<option value=COM0002>부산</option>이 되고 
				}
			);
			strHTML +="</select>"
			
			$("#gugun").html(strHTML) //register.jsp안에 sido 안에 들어간다.
		}
		,
		error : function(){
			
		}
		
		
	})
	
}

var getDong = function(){
	
	var strHTML = ""; 
	
	
	$.ajax({
		
		url : "./Datas/getDong.jsp",
		type : "post",
		data : "in_Dong=" + $("#dong").val(), //데이터를 받는다 . register의  이유는 getSido()의  PROC_SEL_GUGUN 프로시저를 실행하고 그 값을 받아서 부산에 관한 내용을 받아얗 하니깐
		//in_Sido="COM0002" 이것이고 다시 이것을 getGugun으로 전달한다. 얘가 getGugun의  String strSido = request.getParameter("in_Sido");  이것이 되는거고 
		//in_Sido 글자와 getParameter("in_Sido") 글자는 같아야 한다.
		
		datatype :"json",
		success : function(datas){
			strHTML += "<select id='sDong'>";
			$.each(datas,
					function(index,item){
					strHTML += "<option value='"+item.com_id+"'>"+ item.com_val +"</option>" //getSido에 있는 item.com_id
					           //<option value=COM0002>부산</option>이 되고 
				}
			);
			strHTML +="</select>"
			
			$("#dong").html(strHTML) //register.jsp안에 sido 안에 들어간다.
		}
		,
		error : function(){
			
		}
		
		
	})
	
}