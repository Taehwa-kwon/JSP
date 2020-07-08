/**
 * 
 */


	var getCollege = function(vID){
		$.ajax({
			url :"./Datas/college_list.jsp", //registe.jsp에서 경로를 찾아야 한다. 왜냐하면 호출되어지는곳이 register.jsp니깐 
			type : "get",
			data : "",
			datatype : "json",
			success : function(datas){
				
				var strHTML = "<option value=''>선택하시오</option>";
				$.each(datas,
						function(index,item){
						strHTML +="<option value='"+item.com_id+"'>"+item.com_val+"</option>";
				});
				$("#"+vID).html(strHTML);
			}
			,
			error : function(){
				alert("getCollege error발생")
			}
		})
	}
	
	var getDept =function(selectedValue,vID){
		//alert(selectedValue +"-"+vID);
		
		$.ajax({
			url : "./Datas/dept_list.jsp",
			type : "get",
			data : "selectedValue="+selectedValue,
			datatype : "json",
			success : function(datas){
				var strHTML ="<option value=''>선택하시오</option>"
				$.each(datas,
						function(index,item){
						strHTML +="<option value='"+item.com_id+"'>"+item.com_val+"</option>";
					
					}
				);
				$("#"+vID).html(strHTML);
			}
			,
			error : function(){
				alert("getDept error")
			}
		});
	}
	
	var getStudents = function(selectedValue,vID){
		//alert(selectedValue +"--"+vID);
		
		$.ajax({
			url : "./Datas/getStudent_list.jsp",
			type : "get",
			data : "selectedValue="+selectedValue,
			datatype : "json",
			
			success : function(datas){
				var strHTML ="<option value=''>선택하시오</option>";
					$.each(datas,
						function(index,item){
						strHTML +="<option value='"+item.stu_id+"'>"+item.stu_name+"</option>";
						}
					);
				$("#"+vID).html(strHTML);
				
			}
			,
			error : function(){
				alert("getStudents error")
			}
		})
	}
	
	var getYear = function(vID){
		
		$.ajax({
			url : "./Datas/getYears.jsp",
			data : "",
			type : "get",
			datatype : "json",
			success : function(datas){
				
				var strHTML = "";
				
				$.each(datas,
					function(index,item){
						strHTML += "<option value='"+item.syear+"'>"+item.syear+"</option>"
					});
				$("#"+vID).html(strHTML);
				
				$("#"+vID).val(datas[0].tyear);
			}
			,
			error : function(){
				alert("getYear error")
			}
		});
		
	}
	
	var getSubjects = function(stu_id,syear,semester,vID){
		$.ajax({
			url : "./Datas/getSubjects.jsp",
			data : "stu_id=" + stu_id + "&syear="+syear+"&semester="+semester,
			type : "get",
			datatype : "json",// 우리가 받을 데이터 타입
			success : function(datas){
				
				var strHTML ="";
				
				 strHTML += "<option value=''>선택하시오</option>";
				
				$.each(
						datas,
						function(index,item){
							strHTML += "<option value='"+item.sub_id+"'>" + item.sub_name + "</option>";
						});
				
				$("#"+vID).html(strHTML);
						
				
			}
			,
			error : function(){
				alert("getSubjects error")
			}
		});
	}
	
	
	