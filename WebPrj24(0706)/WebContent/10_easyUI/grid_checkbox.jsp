<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>CheckBox Selection on DataGrid - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="../easyUI/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyUI/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyUI/demo.css">
    <script type="text/javascript" src="../easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="../easyUI/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/students.js"></script>
    <script>
    	$(document).ready(
    		function(){
    			$("#btnSearch").click(
    					function(){
    						$("#dg").datagrid({
    							url:"../01_Students/Datas/getSelStudent.jsp?stu_id="+$("#stu_id").val(),
    							//url : './Datas/getSelStudent.jsp?stu_id=' + $("#stu_id").val(),
    	                         rowStyler : function(index,row){
    							if(row.stu_name.indexOf('홍길동89')==-1){
    			            		return 'background-color:pink;'
    			            		}
    	                         },
    			            
    			            
    							singleSelect : true,
    							 checkOnSelect : true,
    					         selectOnCheck:false,
    					         toolbar:toolbar
    						});
    						
    					}
    				);
    		}	
    	);
    	
    	 var toolbar = [{
    	        text:'Add',
    	        iconCls:'icon-add',
    	        handler:function(){alert('add')}
    	    },{
    	        text:'Cut',
    	        iconCls:'icon-cut',
    	        handler:function(){alert('cut')}
    	    },'-',{
    	        text:'Save',
    	        iconCls:'icon-save',
    	        handler:function(){alert('save')}
    	    }];
    	 
    	 
    </script>
    
</head>
<body>
    <h2>CheckBox Selection on DataGrid</h2>
    <p>Click the checkbox on header to select or unselect all selections.</p>
    <div style="margin:20px 0;"></div>
    <!-- <div style="text-align:right"> -->
    <div>
    	<input class="easyui-textbox" name="stu_id" id="stu_id">
    	<input type="button" id="btnSearch" value="검색">	
  	</div>
   <table id="dg" class="easyui-datagrid" title="Basic DataGrid" style="width:700px;height:250px"
            data-options=
            "singleSelect:false,   
            collapsible:true,
            url:'../01_Students/Datas/getSelStudent.jsp',
            method:'get',
            rownumbers : 'true',
          
           
            rowStyler : function(index,row){
            	if(row.stu_name.indexOf('홍')==-1){
            		return 'background-color:pink;'
            	}
            }
            ,
            checkOnSelect : true,
            selectOnCheck:false
            
            
            ">
            <!-- singleSelect:false,
            	  rownumbers : true
            	  
            	   ,sortorder : 'desc'
             -->
        <thead>
        <tr>
        		<th data-options="field:'ck',checkbox:true"></th>
                <th data-options="field:'stu_id',width:80,align:'center'">아이디</th>
                <th data-options="field:'stu_name',width:100,align:'center'">이름</th>
                <th data-options="field:'stu_tel',width:110,align:'center'">연락처</th>
                <th data-options="field:'addr1',width:80,align:'center'">시도</th>
                <th data-options="field:'addr2',width:80,align:'center'">구군</th>
                <th data-options="field:'addr3',width:80,align:'center'">동면</th>
                <th data-options="field:'addr4',width:80,align:'center'">기타</th>
                <th data-options="field:'dept1',width:80,align:'center'">단과대학</th>
                <th data-options="field:'dept2',width:80,align:'center'">학과</th>
            </tr>
           
        </thead>
    </table>
    
     <table class="easyui-datagrid" title="Basic DataGrid" style="width:700px;height:250px"
            data-options=
            "singleSelect:true,
            collapsible:true,
            url:'../01_Students/Datas/getStudent.jsp',
            method:'get'
            ">
        <thead>
            <tr>
            	<th data-options="field:'ck',checkbox:true"></th>
                <th data-options="field:'stu_id',width:80,align:'center'">아이디</th>
                <th data-options="field:'stu_name',width:100,align:'center'">이름</th>
                <th data-options="field:'stu_tel',width:110,align:'center'">연락처</th>
                <th data-options="field:'stu_dept',width:250,align:'center'">단과대학</th>
                <th data-options="field:'stu_addr',width:250,align:'center'">주소</th>
            </tr>
        </thead>
    </table>
    <div style="margin:10px 0;">
        <span>Selection Mode: </span>
        <select onchange="$('#dg').datagrid({singleSelect:(this.value==0)})">  
        <!-- 여기서 말하는 this는 select를 말한다. 아래 option value의 값이 0이랑 1이 있는데 선택되면 0을 말하고   -->
            <option value="0">Single Row</option>
            <option value="1">Multiple Rows</option>
        </select><br/>
        SelectOnCheck: <input type="checkbox" checked onchange="$('#dg').datagrid({selectOnCheck:$(this).is(':checked')})"><br/>
        CheckOnSelect: <input type="checkbox" checked onchange="$('#dg').datagrid({checkOnSelect:$(this).is(':checked')})">
    </div>
 
</body>
</html>