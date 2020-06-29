<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	
	var members = [];
	var getList = function(){
		
		$.ajax({
			url: "./memberList.jsp",
			type: "post",
			datatype: "json",
			success : function(datas){
				members = datas;
				setList(datas); //가져온 데이터로 리스트를 만들어라
				
			}
			,
			error:function(){
				alert("error")
			}
		})
	}
	
	var setList = function(members){
		var strHTML = "";
		$.each(members,
			function(index,item){
	         strHTML += "<div><input type='checkbox' name='chkDel' value='"+item.userid+"'>"+ item.username +"("+ item.userid +")</div>";
		}		//value에 키 값을 주고 delete를 시작한다.userid << 이기법 많이 쓴다.
		
		);
		$("#list").html(strHTML);
	}
	
	//저장함수
	
	var saveData = function(){
		
		var userID = $("#userID").val();
		var userPass = $("#userPass").val();
		var userName = $("#userName").val();
		
		var sendData = "userID=" + userID + "&userPass=" + userPass + "&userName=" + userName;
		$.ajax({
			url : "./student_save.jsp",
			type : "post",
			datatype : "json", //text/html 로 하고  
			data : sendData,
			success : function(datas){
				var result = datas[0].suc;
				alert(result);
				if(result=="1"){
					getList();
				}
				else {
				 	alert("Error1")
				}
			}
			,
			error:function(){
				alert("Error2");
				
			}
		});
	}
	
	//삭제함수
	var delData = function(){
		var checkedValues =[];
		var chkObjs = $("input[name='chkDel']");
		$(chkObjs).each(
				function(index,item){
					if(item.checked){
						checkedValues.push(item.value);
						
					}
				}
				)
				
				var str="";
				$(checkedValues).each(
						function (index,item){
							str += "'" +item+"'"+","; //데이터베이스에서 받을려면 ' ' ' ' 이게 필요하잖아
							
						})
				str = "("+str.substr(0, str.lastIndexOf(",")) + ")";				
				
				//ajax
				$.ajax({
					
					url : "students_del.jsp",
					type: "get",
					datatype: "json",
					data : "params="+str,
					success:function (){
						getList();
						
					},
					error : function(){
						
					}
					
					
					
				});
	}
	
	   $(document).ready(function(){
		      getList();   // ajax 호출로 데이터 가져와라
		            
		      // 1.btnSave CLICK 이벤트
		      $("#btnSave").click(function(){
		         saveData();
		      });
		      
		      $("#btnDel").click(
		    	function(){
		    		delData();
		    	}	  
		      )
		      
		      
		   });
		   

</script>


</head>
<body>
	<div id="wrap">
	
		
		
		<div id="write">
			<div>
				회원 아이디 : <input type="text" id="userID" >
			</div>
			<div>
				패스워드 : <input type="text" id="userPass" >
			</div>
			<div>
				회원 이름 : <input type="text" id="userName" >
			</div>
			<div>
				<input type="button" value="저장" id="btnSave">
				<input type="button" value="삭제" id="btnDel">
			</div>
		</div>
		
		<div id="list"></div>
	
	</div>
</body>
</html>