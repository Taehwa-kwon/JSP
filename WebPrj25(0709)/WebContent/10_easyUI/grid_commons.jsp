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
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script type="text/javascript" src="../easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="../easyUI/jquery.easyui.min.js"></script>
    
    
    
    

<style>
	body{margin:0px; padding:0px;} /* body 이걸 지우면 wrap는 기본 default값을 가지고 있어서 이렇게 지워야 한다. */ 
	#wrap{width:100%; height:625px; border:1px solid red; clear:both;}
	.grpcommon{width:40%; height:625px; border:1px solid blue; float:left; background-color:#81ecec; padding:10px;}
	#common{width:60%; height:625px; border:1px solid green; float:left; background-color:#ffeaa7;padding:10px;}
</style>

<script>
	$(document).ready(
		function() {
			
			}
		
		);
	
			var editIndex = undefined;
	        function endEditing(){		//수정이 끝났는지 안끝났는지 체크하는데
	        	alert("endEditing") //clickCell 에 endEditing의 커서가 들어가 있는듯.. 
	            if (editIndex == undefined){return true}
	            if ($('#dg').datagrid('validateRow', editIndex)){
	                $('#dg').datagrid('endEdit', editIndex);
	                editIndex = undefined;
	                return true;    //수정이 끝나고 -> 커서가 수정하는 row에서 빠져나옴
	            } else {
	                return false;   
	            }
	        }
	        
  			function onEndEdit(index, row){
	            	alert(JSON.stringify(row)); //call by value 와 call by reference 가 있는데 여기서 call by reference를 여기서 사용한다. 참고 -> json.jsp파일
	            								//이유는 현재 row가 [] 객체이고 각각은 {} 배열이 된다
	            
	            if(row.status != "P"){
	            	row.status= "U";
	            }
	            if(row.status =="P"){ //이걸 안하면 만약에 추가할떄 grp_id 를 입력안하면 grp_id 값이 없다.
	            	row.grp_id="";   //이 공백은 					
	            }
	            
	        }
	        
	        function onClickCell(index, field){
	            if (editIndex != index){
	                if (endEditing()){
	                    $('#dg').datagrid('selectRow', index)
	                            .datagrid('beginEdit', index);
	                    var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
	                    if (ed){
	                        ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
	                    }
	                    editIndex = index;
	                } else {
	                    setTimeout(function(){
	                        $('#dg').datagrid('selectRow', editIndex);
	                    },0);
	                }
	            }
	        }
	      
	         function append(){
	            if (endEditing()){		
	                $('#dg').datagrid('appendRow',{status:'P'}); //append는 p 로 표시하겠다. //appendRow에는 맽끝에다가 값을 넣어준다.
	                editIndex = $('#dg').datagrid('getRows').length-1; //getRows는 전체의개수 전체의 개수는 5개, index는 6 개   이렇게 된다 이유는 추가를 눌렀으니깐 총 전체개수+1이 되니깐. 
	                $('#dg').datagrid('selectRow', editIndex)  // 커서는 가고
	                        .datagrid('beginEdit', editIndex); // 수정도 같이 간다.
	            }		//그러니깐 selectRow, beginEdit는 추가를 누르는 순간 그 해당셀이 선택되고 수정되게 만들어진다. 
	        }
	         
	        function reject(){ //이게 취소
	            $('#dg').datagrid('rejectChanges');
	            editIndex = undefined;
	        }
	        
	        function removeit(){
	            if (editIndex == undefined){return}
	            $('#dg').datagrid('cancelEdit', editIndex)
	                    .datagrid('deleteRow', editIndex);
	            editIndex = undefined;
	        }
	        
	        function save(){
	            if (endEditing()){ //니가 고친게 마무리 됐냐 ?true 면 시작 
	            	
	            	var rows = $('#dg').datagrid('getChanges');
	            	/* 난 이게 바로 JSON인줄 알았는데 이유는 GRP_ID앞뒤로 사실 " "가 있어야 한다.이건 String 형식으로 오는거지  
	            	[
            		{grp_id : "" , grp_name : "" , status:"P"}, 추가한값 
            		{grp_id : "" , grp_name : "" , status:"U"}, 업데이트
            		{grp_id : "" , grp_name : "" , status:""}   삭제
            		] */
            		
	            	var appendJsons = [];
	            	var updateJsons = [];
	            	var deleteJsons = [];
	            	
	            
	            	for (var i = 0; i < rows.length; i++) {
						alert(JSON.stringify(rows[i]));
						//이렇게 해서 json 형태로 값을 확인한다. grp_id, grp_name, status를 확인한다. 그래서 그 값들을 db에 전달해야 하는데 어쩔떄는 status가 있고 어쩔떄는 grp_id 가 없다.
						
						//1.추가
						if(rows[i].status=="P"){
							//추가된 데이터의 ROW들의 JSON배열로 만듬.
							//appendJsons.push(JSON.stringify(rows[i])); //뒤에서부터 이해해봐라. rows의 index는 1개이지만 item은 3개다 grp_id, grp_name, status 그래서 json형태로 만들어준다.
							
							//아님 json배열로 안만들어도 되고 아래에서 appendJsons = JSON.stringify(appendJsons); 여기서 한번에 json 시켜야 한다.
							appendJsons.push(rows[i]);
						}
						//2.수정
						else if(rows[i].status=="U"){
							updateJsons.push(rows[i]);
						}
						//3.삭제
						else {
							deleteJsons.push(rows[i]);
						}
						
						
					}
	            	
	                $('#dg').datagrid('acceptChanges');
	                appendJsons = JSON.stringify(appendJsons); //1.추가의 json배열을 다시 json화 시킨다.
	                updateJsons = JSON.stringify(updateJsons); //1.추가의 json배열을 다시 json화 시킨다.
	                deleteJsons = JSON.stringify(deleteJsons); //1.추가의 json배열을 다시 json화 시킨다.
	                //JSON.stringify 는 객체타입을 string으로 바꾸는거지 json으로 바꾸는거는 아님 
	                alert("appendJsons"+ appendJsons);
	                grpSaveAjax(appendJsons,updateJsons,deleteJsons);
	            }
	        }
	        
	        function grpSaveAjax(appendJsons,updateJsons,deleteJsons){ //save의 3개를 받아와서 서버로 넘겨준다. 이유는 db로 보낼려고
	        	$.ajax({
	        		url : "../ABC/Datas/saveGrpCom.jsp",
	        		type : "post",
	        		data : "append="+appendJsons+"&update="+updateJsons+"&delete="+deleteJsons, //보내는 값
	        		
	        		datatype: "json",//서버 갔다가 받아오는 데이터형식
	        		success : function(){
	        			$('#dg').datagrid();
	        		}
	        		,
	        		error : function(){
	        			alert("grpSaveAjax error")
	        		}
	        		
	        		
	        		
	        	})
	        	
	        }
	         
	        function getChanges(){
	            var rows = $('#dg').datagrid('getChanges');
	            alert(rows.length+' rows are changed!');
	        } 
	        
	        function onSelect(index,row){ //EasyUi에 보면 매개변수로 이거 두개 받음.
	        	alert("onSelect"+ row.grp_id);
	        	
	        	var selectedGrpID = row.grp_id;
	        	
	        	$("#dg2").datagrid({
	        			url:'../ABC/Datas/getCommons.jsp?grp_id='+selectedGrpID,
	                    method:'get'
	        		});
	        }
	        
	        //////////////////////////////////////////////////////
	        var editIndex2 = undefined;
	        
			 function onClickCell2(index, field){
	            if (editIndex2 != index){
	                if (endEditing2()){
	                    $('#dg2').datagrid('selectRow', index)
	                            .datagrid('beginEdit', index);
	                    var ed = $('#dg2').datagrid('getEditor', {index:index,field:field});
	                    if (ed){
	                        ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
	                    }
	                    editIndex2 = index;
	                } else {
	                    setTimeout(function(){
	                        $('#dg2').datagrid('selectRow', editIndex2);
	                    },0);
	                }
	            }
	        }
	        
			 
		        function endEditing2(){		
		        	alert("endEditing")  
		         
		        	if (editIndex2 == undefined){return true}
		            if ($('#dg2').datagrid('validateRow', editIndex2)){
		                $('#dg2').datagrid('endEdit', editIndex2);
		                editIndex2 = undefined;
		                return true;    
		            } else {
		                return false;   
		            }
		        }
		        
		        function onEndEdit2(index, row){
	            	alert(JSON.stringify(row)); 
	            								
	            
	            if(row.status != "P"){
	            	row.status= "U";
	            }
	            if(row.status =="P"){
	            	row.com_id="None";
	            }
	            
	        }
		        
		        function append2(){
		            if (endEditing2()){
		               // $('#dg2').datagrid('appendRow',{status:'P'});
		               editIndex2=  selectedRow.index; //여기서 선택된것을 index를 
		              	alert(editIndex2);
		               
		               //var selectedRow =  $('#dg2').datagrid('insertRow');
		               
		               
		              	
		                $('#dg2').datagrid('insertRow', {
		            	 index :editIndex2+1,			//index start with 0
		            	 row:{
		            		 grp_id : selectedRow.grp_id,
		            		 com_id : '',
		            		 com_val : '',
		            		 com_lvl : selectedRow.com_lvl+1,
		            		 parent_id : selectedRow.com_id,
		            		 status : 'P'
		            	 }
		               })  
		               
		               
		               
		                /* editIndex2 = $('#dg').datagrid('getRows').length-1;
		                $('#dg2').datagrid('selectRow', editIndex2)
		                        .datagrid('beginEdit', editIndex2); */
		                        
		                
		                        $('#dg2').datagrid('selectRow', editIndex2+1) 
		                        		 .datagrid('beginEdit', editIndex2+1);
		            }
		        }
		       
		        var selectedIndex=0;    //이 전역변수를 아래에서 값을 받아서 다시 editIndex2여기에 넘겨준다.
		        
		        var selectedRow={};
		        function onSelect2(index,row){ 
		        	//selectedIndex = index;   //선택된 index를 받아와서  selectedIndex여기 전역변수로 던져준다.
		        	selectedRow.index = index;    // selectedRow{ index:1 , com_lvl : }
		        	selectedRow.com_lvl = Number(row.com_lvl);
		        	selectedRow.grp_id = row.grp_id;
		        	selectedRow.com_id = row.com_id;
		        }
		        
		        function reject2(){
		            $('#dg2').datagrid('rejectChanges');
		            editIndex2 = undefined;
		        }
		        
		        function removeit2(){
		            if (editIndex2 == undefined){return}
		            $('#dg2').datagrid('cancelEdit', editIndex2)
		                    .datagrid('deleteRow', editIndex2);
		            editIndex2 = undefined;
		        }
		        
		        function save2(){
		           
		        	var appendRows = [];
		        	var updateRows = [];
		        	var deleteRows = [];
		        	
		        	var jsonDatas = {};
		        	
		        	if (endEditing()){ //니가 고친게 마무리 됐냐 ?true 면 시작 
		            	
		            	var rows = $('#dg2').datagrid('getChanges');
		            	
		        	//item이 현재는 객체이다. 구조는 { grp_id : "", com_id : "", com_val:"", com_lvl:2 , parent_id : "", status:"U"} 
		            	$.each(rows,
		            		function(index,item){
		            			if(rows.status=="P"){
		            				appendRows.push(item);
		            				//[ {}, {} ]
								}
								else if(rows.status=="U"){
									updateRows.push(item);
								}
								else {
									deleteRows.push(item);
								}	
		            		}		
		            	);//each
		            	
		            	jsonDatas.appendRows = appendRows; 
		            	jsonDatas.updateRows = updateRows;
		            	jsonDatas.deleteRows = deleteRows;
		            	
		            	var strJSON = JSON.stringify(jsonDatas);
		            	alert(strJSON);
		            	grpSaveAjax2(strJSON);
		            	
		            	  
		            	  
		            	/*
		            	strJSON 형식이 json 
		            	{ 
		            		appendRows : [ {},{} ],
		            		updateRows : [ {},{} ],
		            		deleteRows : [ {},{} ]
		            	}
		            	
		            	{ appendRows : [{},{}], updateRows : [{},{}], deleteRows:[{},{}]  }
		            	
		            	{"appendRows":[],"updateRows":[],"deleteRows":[{"grp_id":"GRP001","grp_name":"지역코드","status":"U"}]}
		            	그럼 이거는 JSONObject로 넘어가는거고 
		            	
		            	여기는 
		            	*/
		            }//if
		        }//function 
		        
		        function grpSaveAjax2(jsonDatas){ //save의 3개를 받아와서 서버로 넘겨준다. 이유는 db로 보낼려고
		        	$.ajax({
		        		url : "../ABC/Datas/saveCommon.jsp",
		        		type : "post",
		        		data : "jsonDatas="+jsonDatas,
		        		
		        		datatype: "json",//서버 갔다가 받아오는 데이터형식
		        		success : function(jsonDatas){
		        			$('#dg2').datagrid();
		        		}
		        		,
		        		error : function(){
		        			alert("grpSaveAjax error")
		        		}
		        		
		        		
		        		
		        		
		        		
		        	});
		        	
		        }
		       
	      
</script>

</head>
<body>

<!-- 바인딩의 뜻은  데이터 전체를 가지고와서 전체로 넣는것.
매핑이라는 것은 해당 값이 다른 값을 가리키도록 하는 것이다.
파싱은 바꿔주는것  -->

	<div id="wrap">
		<div id="grpcommon" class="grpcommon">
		<!--Easy Ui에서 Basic DataGrid 시작 -->
	<table id="dg" class="easyui-datagrid" title="공통코드 관리" style="width:100%;height:600px"
            data-options="singleSelect:true,collapsible:true,
            url:'../ABC/Datas/getGrpCode.jsp',
            method:'get',
            onClickCell : onClickCell,
            onEndEdit:onEndEdit,
            onSelect : onSelect, 
            toolbar : '#toolbar01'  
            
            
            ">
            <!-- onClickCell : onClickCell,
            onEndEdit:onEndEdit   이거 두개를 사용하려면 위에서 메소드가 필요하다.
                        뒤에것이 함수명임-->
            
        <thead>
            <tr>
                <th data-options="field:'grp_id',width:'40%'">GRP 공통 코드</th>    <!-- 필드명이 getGrpCode의 json의 값을 받아온다.  -->
                <th data-options="field:'grp_name',width:'40%', editor:'textbox'">GRP 공통 코드 이름</th> <!-- 필드명이 getGrpCode의 json의 값을 받아온다.  -->
                <th data-options="field:'status',width:'10%', editor:'textbox'"></th> 
            </tr>
        </thead>
    </table>
   	 <!--Easy Ui에서 Basic DataGrid 끝-->
		 		
		</div>
		
		
		
		<div id="common" class="grpcommon">
			<table id="dg2" class="easyui-datagrid" title="공통코드 관리" style="width:100%;height:600px"
		            data-options="singleSelect:true,collapsible:true,
		            onClickCell : onClickCell2,
		            onEndEdit:onEndEdit2,
		            onSelect : onSelect2,  
		            toolbar : '#toolbar02'
		      
		            "> 
		            <!-- onSelect가 매개변수가 index랑 row  -->
		            
		        <thead>
		            <tr>
		                <th data-options="field:'grp_id',width:'20%'">GRP 공통 코드</th>    
		                <th data-options="field:'com_id',width:'20%'">COM 공통 코드 </th> 
		                <th data-options="field:'com_val',width:'20%', editor:'textbox'">COM 공통 코드 이름</th> 
		                <th data-options="field:'com_lvl',width:'10%', editor:'textbox'">단계</th> 
		                <th data-options="field:'parent_id',width:'20%'">Parent Code</th> 
		                <th data-options="field:'status',width:'10%'"></th> 
		            </tr>
		        </thead>
		    </table>
    
		
		</div>
	
	</div>
	
	 <!--Easy Ui에서 Row Editing in DataGrid 시작-->
		<div id="toolbar01" style="height:auto">
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">Append</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Remove</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="save()">Save</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">Reject</a>
	    </div>
	    
	<!--Easy Ui에서 Row Editing in DataGrid 끝-->

		<div id="toolbar02" style="height:auto">
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append2()">Append</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit2()">Remove</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="save2()">Save</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject2()">Reject</a>
	    </div>
</body>
</html>