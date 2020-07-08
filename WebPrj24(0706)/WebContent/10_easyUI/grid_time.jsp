<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 아니 존나 중요한게 여기서 학생 과목 년도 학기 신청날짜 모두다 값을 변경할 경우 
    어떤것을 db에 업데이트 쳐야돼? 전부다 다 다른 테이블에서 온건데 업데이트 프로시저를 만들면 from 뭐 어디다가 업데이트를 칠래? -->
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
    
<script>
		var editIndex = undefined;
		function endEditing(){   // 끝났는지 판단
		    if (editIndex == undefined){return true}
		    if ($('#dg').datagrid('validateRow', editIndex)){
		        $('#dg').datagrid('endEdit', editIndex);
		        editIndex = undefined;
		        return true;
		    } else {
		        return false;
		    }
		}
		
		function onClickCell(index, field){     		//마우스를 
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
		
		 function onEndEdit(index, row){
			 alert("onEndEdit");
			 alert("row.kwon");
	            var ed = $(this).datagrid('getEditor', {
	                index: index,
	                field: 'stu_id'
	            });
	            row.stu_name = $(ed.target).combobox('getText');
	       
		 
			 var ed2 = $(this).datagrid('getEditor', {
	             index: index,
	             field: 'sub_id'
	         });
	         row.sub_name = $(ed2.target).combobox('getText');
	         
	         if(row.kwon != "P"){
	        	 row.kwon = "U";
	         }
			
		 }    
		 
		 function append(){
			 alert("Append");
	            if (endEditing()){
	                $('#dg').datagrid('appendRow',{status:'P'}); //p는 새로 생성  u는 수정
	                editIndex = $('#dg').datagrid('getRows').length-1;
	                $('#dg').datagrid('selectRow', editIndex)
	                $('#dg').datagrid('beginEdit', editIndex);
	            }
	        }
		 
		   function removeit(){
			   alert("removeit");
	            if (editIndex == undefined){return}
	            $('#dg').datagrid('cancelEdit', editIndex)
	                    .datagrid('deleteRow', editIndex);
	            editIndex = undefined;
	        }
		   
		   function acceptit(){
			   alert("acceptit");
			   /* alert(rows.length);
			   alert(rows[0].kwon); */
			   
			  
			/*    $.each(){rows, 		같은내용
				   function(index,item){
					   alert(item.kwon);
				   }
			   } */
			   
			   var updateArr = [];
			   var appendArr = [];
			   var deleteArr = [];
			   
	            if (endEditing()){
	            	var rows = $('#dg').datagrid('getChanges');
	            	 	alert(rows.length); //여기서 삭제나 추가, 수정의 개수만큼 each가 rows에 받아서 n개 만큼 돈다.
	            		$(rows).each(
	      				   function(index,item){
	      					   alert(item.kwon);
	      					   if(item.kwon=="U"){ //수정
	      						 updateArr.push(JSON.stringify(item)); //이걸 전부다 json한다음에 updateArr에 담아둔다음에 
	      					   }
	      					   else if(item.kwon=="P"){ //추가
	      						 appendArr.push(JSON.stringify(item)); //이걸 전부다 json한다음에 appendArr에 담아둔다음에 
	      					   }
	      					   else { //삭제
	      						 deleteArr.push(JSON.stringify(item)); //이걸 전부다 json한다음에 deleteArr에 담아둔다음에 
	      						   
	      					   }
	      				   }
	      			   );
	            	
	                $('#dg').datagrid('acceptChanges');
	            }
	        }
		   
		   function getChanges(){
	            var rows = $('#dg').datagrid('getChanges');
	            alert(rows.length+' rows are changed!');
	        }


</script>


</head>
<body>
바인딩의 뜻은  데이터 전체를 가지고와서 전체로 넣는것.
매핑이라는 것은 해당 값이 다른 값을 가리키도록 하는 것이다.

  <table id="dg" class="easyui-datagrid" title="학생별 시간표 리스트" style="width:100%;height:300px"
           data-options="
                   iconCls: 'icon-edit',
                   singleSelect: true,
                   url: '../01_Students/Datas/getTimeList.jsp',
                   method: 'get',
                   onClickCell: onClickCell,
                   onEndEdit: onEndEdit,
                   toolbar: '#tb'
                   
               ">
            
        <thead>
            <tr>
                <th data-options="field:'stu_id',width:'20%',
                        formatter:function(value,row){
                           return row.stu_name;
                        },
                        editor:{
                            type:'combobox', 
                            options:{
                                valueField:'stu_id',
                                textField:'stu_name',
                                method:'get',
                                url:'../01_Students/Datas/getStuCom.jsp',
                                required:true
                            }
                        }">학생</th>
                        <!-- 여기 editor은 학생별시간표리스트에 있는 url을 가져오는게 아니라 getStuCom을 가져오는 거다.
           valueField 와 textField 여기서 프로시저 PROC_SEL_TIME 에서 JOIN을 걸어서  stu_name을 따로 받는다. -->
                        
                     <th data-options="field:'sub_id',width:'20%',
                        formatter:function(value,row){
                           return row.sub_name;
                        },
                        editor:{
                            type:'combobox', 
                            options:{
                                valueField:'sub_id',
                                textField:'sub_name',
                                method:'get',
                                url:'../01_Students/Datas/getSubCom.jsp',
                                required:true
                            }
                        }">과목</th>
                <th data-options="field:'do_year', width:100, align:'right', editor:'textbox'">년도</th>
                <th data-options="field:'semester',width:'10%',align:'right',editor:{type:'numberbox',options:{precision:2}}">학기</th>   <!-- number 타입은 숫자만 입력가능 -->
                <th data-options="field:'reg_date',width:'20%',align:'center', editor:'textbox'">신청날짜</th>
                
<!-- 여기에 하나 hidden했어 -->                
                <th data-options="field:'o_stu_id',hidden:true,align:'center', editor:'textbox'"></th> <!-- 실제로는 여기 뒷편을 hiden으로 클라이언트에게는 보여주지 않는다. -->
                <th data-options="field:'o_sub_id',width:'80px',align:'center', editor:'textbox'"></th> <!-- 이 뒷편의 4개를 가지고 db로 가져가서 수정을 한다. -->
                <th data-options="field:'o_do_year',width:'80px',align:'center', editor:'textbox'"></th>
                <th data-options="field:'o_semester',width:'80px',align:'center', editor:'textbox'"></th>
                <th data-options="field:'kwon',width:'80px',align:'center', editor:'textbox'"></th>
            </tr>
        </thead>
        
   </table>
   
	    <div id="tb" style="height:auto">
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">Append</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Remove</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="acceptit()">Save</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">Reject</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges()">GetChanges</a>
	    </div>
	    
            
</body>
</html>