<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" type="text/css" href="../easyUI/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyUI/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyUI/demo.css">
    <script type="text/javascript" src="../easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="../easyUI/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="./js/students.js"></script>

<script>
	$(document).ready(
		function(){
			
			getAddr("","1","sido");//COM_ID/COM_LVL/<span id=sido>
			
			/* $("#addr1").change( 			//이 페이지가 로딩될때 id 값이 없으니깐 안된대.
				function(){
					getAddr($("#addr1").val(),"2","gugun") //students.js 에 getAddr의 strHTML
				}		
			) */
			
			/*		학생 주소 		*/
			$("#sido").change(
				function(){
				 	$("#gugun").html("");
					$("#dong").html("");
					$("#dong2").html(""); 
					getAddr($("#addr1").val() ,2, "gugun");
					//COM_ID0001, COM_LVL, <span id=gugun>
				}		
			);
			
			$("#gugun").change(
					function(){
						$("#dong").html("");
						$("#dong2").html("");
						getAddr($("#addr2").val(),3,"dong");
					
					}		
				);
			$("#dong").change(
					function(){
						$("#dong2").html("");
						getAddr($("#addr3").val(),4,"dong2");
					
					}		
				);
			/*		학생 주소  끝		*/
			
			
			/*		학생 학과 시작 		*/
			
			getDept("","1","college");
			
			$("#college").change(
					function(){
						$("#dept").html("");
						//getDept($("#dept1").val(),2,"dept")
						getDept($("#college").val(),2,"dept")
						
					})
			
			/*		학생 학과 끝 		*/
			
			
			
		}//function
		
	);//ready()
	
			
	
</script>

</head>
<body>
<h2>Basic TextBox</h2>
    <p>The textbox allows a user to enter information.</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" title="Register" style="width:100%;max-width:400px;padding:30px 60px;">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="stu_name" label="학생이름 : " labelPosition="top" data-options="prompt:'학생이름을 입력하시오',validType:'email'" style="width:100%;">
        </div>
        
         <div style="margin-bottom:20px">
         	<select class="easyui-combobox" name="state" label="State:" labelPosition="top" style="width:100%;"></select>
        </div> 
        
        <div style="margin-bottom:20px">
              		<span id="sido"> </span>
					<span id="gugun"></span>
					<span id="dong"></span>
					<span id="dong2"></span> 
        </div>
        
         <div style="margin-bottom:20px">
					<span id="college"></span>
					<span id="dept"></span>
		</div> 
        
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="tel" label="학생 연락처" labelPosition="top" data-options="prompt:'010-1234-5678' " style="width:100%;">
        </div>
        
        <div>
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" style="width:100%;height:32px">Register</a>
        </div>
    </div>
</body>
</html>