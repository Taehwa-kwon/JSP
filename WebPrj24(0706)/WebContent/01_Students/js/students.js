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

//주소 가져오기 (일반화를 한것=추상화)
	var getAddr = function(selectedVal, lvl,objID){ //COM_ID / COM_LVL / <span id=sido> 
		
		var strHTML = "";
	
	$.ajax({
		//GET은 주소줄에 값이 ?뒤에 쌍으로 이어붙고 POST는 숨겨져서(body안에) 보내진다
		
		url : "./Datas/getAddr.jsp",
		type : "post",
		data : "addr="+ selectedVal+"&lvl="+lvl,  
		//addr=COMID0001
		//getAddr.jsp로 보내고     selectedVal = com_id 를 말한다.
		datatype : "json",  //getAddr.jsp로 받아온다.
		
		
		success : function(datas){
			strHTML += "<select id='addr"+lvl+"' name='addr"+lvl+">";
			strHTML += "<option value='-'>선택하시오</option>" //이렇게 해야 처음에 서울을 선택해도 값이 나옴
															//여기 -가 중요한 역할을 한다. 맨마지막의 add4의 value가 - 이면 register_ok.jsp로 ㄱ  
			
			$.each(datas,
					function(index,item){
						strHTML += "<option value='"+item.val+"'>"+item.txt+"</option>"; //getAddr.jsp에서 val과 txt로 던져줬으니깐 이렇게 받아야함.
		//option value 의 해당 옵션이 선택될 때 서버로 제출되는 값을 명시함. -- COM_ID과 COM_VAL을 받아온다 com0001~ 이런값고 과 서울광주대구를 받아온다. 
				
			})
			strHTML +="</slect>";
			
			$("#"+objID).html(strHTML);
			
			$("#"+objID).addClass("easyui-combobox");
			
			
		}
		,
		error : function(){
			alert("err");
		}
	})
}

//학생 학과 가져오기
var getDept = function(selectedVal, lvl,objID){
	var strHTML = "";
	$.ajax({
	
		url : "./Datas/getDept.jsp",
		type : "get",
		data : "dept=" + selectedVal + "&lvl="+lvl, //getAddr.jsp로 보내고     selectedVal = com_id 를 말한다.
		datatype : "json",  
		success : function(datas){
			strHTML += "<select id='dept"+lvl+"' name='dept"+lvl+"'>";
			strHTML += "<option value='-'>선택하시오</option>" 
			
			$.each(datas,
					function(index,item){
						strHTML += "<option value='"+item.val+"'>"+item.txt+"</option>"; 
			})
			strHTML +="</slect>";
			
			$("#"+objID).html(strHTML);
		}
		,
		error : function(){
			alert("err");
		}
	})
}




var getStudentList = function(selSearch,txtSearch,objid){
	var strHTML = "";
	$.ajax({
		url :"./Datas/getStudent.jsp",
		type : "get",
		data : "selSearch="+selSearch+ "&txtSearch="+txtSearch, //"selSearch" 를 기준으로 getStudent.jsp getParameter을 한다.
		datatype : "json",
		
		success : function(datas){
			$.each(
					datas,
					function(index,item){
						
						var str = item.comid1 + "-" + item.comid2 + "-" + item.comid3 + "-" + item.comid4; //경남		창원시 	성산구 	중앙동
						//alert("str: "+str);   // COM0000 -COM0005-COM0045 - COM0046
						var obj = {comid1 : "", comid2 : "", comid3: "", comid4: ""};
						//alert("obj : "+obj); //객체 [object Object]
						
						obj.comid1 = item.comid1;
						obj.comid2 = item.comid2;
						obj.comid3 = item.comid3;
						obj.comid4 = item.comid4;
						//alert("item.comid1 = "+item.comid1);  //COM0000
						//alert("obj.comid1 = "+obj.comid1);    //COM0000
						
							strHTML +="<div class = 'list'>";
					strHTML += "<div><input type='checkbox' id='chk'"+index+" name='true' value='"+item.stu_id+"' class='cchk'/> </div>"  //?
							strHTML +="<div class ='cId'>"+item.stu_id+"</div>";
							
							strHTML +=   "<div class = 'cName'>"+item.stu_name+"</div>";
							//strHTML += "<div class='cName'><input type='text' id='sName' value='"+item.stu_name+"'/></div>";
							strHTML +=  " <div class = 'cTel'>"+item.stu_tel+"</div>";
							
					strHTML +=  " <div class = 'cAddr' ondblclick='popup(\"" + str + "\")'>"+item.stu_addr+"</div>";  //?
					
							
							strHTML +=  "<div class = 'cDept'>"+item.stu_dept+"</div>";
							strHTML +=  " </div>";
							
								
			}
					)
					$("#"+objid).html(strHTML);
		
			
		}
		,
		error : function(){
			alert("왜시발..ㅡ")
		}
	
	})
	
}

	var popup = function(comIDs){
		
		//var arrComID = comIDs.split("-");
		//alert(arrComID);
		
		window.open("../students_addr_update.jsp?comIDs="+comIDs,"updateWin","width=400,height=200, top=200, left=200")
	}

	
	//checkbox 전체 체크 및 해제
	var checkedFunc = function(num){
		//전체체크를 할려면 그 만큼 반복문을 돌려야 하는데, 위에 strHTML에 value를 주고 
		
		//alert($(".cchk").length);
		//var objChks = $(".cchk").length
		
		//이것도 반복문이 도는데...
		$(".cchk").each(
				function(index,item){
					
					if(num==1){
						$(".cchk").prop("checked",true);
						
						
					}
					else {
						$(".cchk").prop("checked",false)
					}
				}
			);
		
	/*	
	 *  if(num==1){
			$(".cchk").prop("checked",true)
		}
		else {
			$(".cchk").prop("checked",false)
		}
	*/
		
		
	}
	
	//1방법
/*	var delStudent = function(){
		//var checkedObj = $("input[checked='checked']"); 이건 또 왜 안되는거야
		//var checkedObj = $("input[type='checkbox']:checked"); //인풋타입의 체크박스를 다 가져오고,    :checked 
		//var checkedObj = $("input[type='checkbox']:checked").val(); //이렇게 하면 객체로 온대.
		
		
		var checkedObj = $("input[type='checkbox']:checked");
		
		var results="";
		
		for (var i = 0; i < checkedObj.length; i++) {
			results += "'"+$(checkedObj[i]).val() +"'"+ ","; //이렇게하면 맨 마지막에 콤마가 상기니깐 lastIndexOf를 사용해서 제거한다. //또한 for문을 돌렸으니깐 배열로 나왔으니 배열로 처리한다.
			
		}
		
		results = results.substr( 0, results.lastIndexOf(","));
		
		//results = "(" + results+ ")";
		
		var studentIDs = {};
		studentIDs.stu_ids = results;
		var sendData = JSON.stringify(studentIDs); //json형태로 변환시켜주고 
		
		alert(sendData);
		
		$.ajax({
			url : "./Datas/delStudents.jsp",
			type : "stu_ids=" + results, //getparameter에서 가져오는 값. 받는값. 
			type : "jsonData="+sendData,  //"{name:'홍길동' }" 이게 json형태. || 
										  // json형태로 주고 받는다. 이렇게 보내면 값을 받아야 하는데 그럼 jsp 을 만들어서 <% String strJSON = request.getParameter("") %>
			data : "post",
			datatype: "json",
			success : function(){
				location.reload(); //현재 페이지를 새로고침 리로드 하는 method
			}
			,
			error : function(){
				
			}
			
			
		});
		
		
	}
*/	
	var delStudent = function(){
		
		var checkedObj = $("input[type='checkbox']:checked"); 
		
		var stuIDArr = [];
		
		for (var i = 0; i < checkedObj.length; i++) {
			
			var obj = {};
			obj.stu_id = checkedObj[i].value; 
			stuIDArr[i] = obj;
		}
		
	var sendData =JSON.stringify(stuIDArr);
	alert(sendData + "1123")	;
	
		$.ajax({
			url : "./Datas/delStudents.jsp",
			data : "jsonData="+sendData,  //"{name:'홍길동' }" 이게 json형태. || 
										  // json형태로 주고 받는다. 이렇게 보내면 값을 받아야 하는데 그럼 jsp 을 만들어서 <% String strJSON = request.getParameter("") %>
			type : "post",
			datatype: "json",
			success : function(datas){
				alert(datas + "aaa");
				location.reload(); //현재 페이지를 새로고침 리로드 하는 method
			}
			,
			error : function(){
				
			}
		});
	}
	
	var UpdateStudent = function(chkVal){
		location.href="UpdateStudent.jsp?chkVal="+chkVal;
	}
	
	var getSelStudent = function(stu_id){
		var returnData = null;
		
		$.ajax({
			url : "./Datas/getSelStudent.jsp",
			data : "stu_id="+stu_id,
			type : "get",
			datatype: "json", //받아올 데이터 타입!!
			async : false, //비동기로 해야지 리턴값을 받아서 보낼수 있다.
			success :function(datas){
				returnData = datas[0]; 
				
			}	
			,
			error : function (){
				alert("error");
			}
		});
		
		return returnData;
		
	}
	
	
var getAddr2 = function(selectedVal, lvl, objID, sVal){
		
		var strHTML = "";
		
		$.ajax({
			url : "./Datas/getAddr.jsp",
			type : "get",
			data : "addr=" + selectedVal + "&lvl=" + lvl,
			datatype : "json",
			success : function(datas){
				
				strHTML += "<select id='addr" + lvl + "' name='addr" + lvl + "'>";
				strHTML += "<option value='-'>선택하세요</option>"
				$.each(
						datas,
						function(index, item){
							strHTML += "<option value='" + item.val + "'>" + item.txt + "</option>";
						}
				);
				strHTML += "</select>";
					
				$("#" + objID).html(strHTML);
				
				$("#addr" +  lvl.toString()).val(sVal);
				
				
			}
			,
			error : function(){
				alert("err");
			}
		});
		
	}
	
	
var getDept2 = function(selectedVal,lvl,objID,sVal){
	alert(sVal);
	var strHTML = "";
	
	$.ajax({
	
		url : "./Datas/getDept.jsp",
		type : "get",
		data : "dept=" + selectedVal + "&lvl="+lvl, //getAddr.jsp로 보내고     selectedVal = com_id 를 말한다.
		datatype : "json",  
		success : function(datas){
			strHTML += "<select id='dept"+lvl+"' name='dept"+lvl+"'>";
			strHTML += "<option value='-'>선택하시오</option>" 
			
			$.each(datas,
					function(index,item){
						strHTML += "<option value='"+item.val+"'>"+item.txt+"</option>"; 
			})
			strHTML +="</slect>";
			
			$("#"+objID).html(strHTML);
			
			$("#dept"+lvl.toString()).val(sVal);
		}
		,
		error : function(){
			alert("err");
		}
	})
}



