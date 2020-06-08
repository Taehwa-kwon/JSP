<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel = "stylesheet" href = "css/div.css" />
	<script>
		
		//생성자 함수 : 중요 
		function makeStudent(name, kor, eng, mat){
			var obj = {
				//속성
				name :name ,kor :kor ,eng :eng , mat :mat,
				//메소드
				getSum : function () {
					return this.kor + this.eng + this.mat
				},
				getAvg : function () {
					return this.getSum()/3;
				},
				
				getGrade : function () {
					var msg = '';
					switch (this.getAvg()/10) {
					case 10:
						msg+= 'A'						
						break;
					case 9:
						msg+= 'B'
						break;
					case 8:
						msg+= 'C'
						break;
					case 7:
						msg+= 'D'
						break;
					case 6:
						msg+= 'E'
						break;
						
					default: break;
					}
					return msg;
					
				},
					
//					if( this.getAvg()>=90 )
	//					msg += 'A'
		//				else msg += 'B'
			//			return msg;
				//},
					
					
				
				toString : function() {
					var msg = '';
					 msg += '<ul>';
					 msg += '<li>' + this.name + '</li>';
					 msg += '<li>' + this.kor + '</li>';
					 msg += '<li>' + this.eng + '</li>';
					 msg += '<li>' + this.mat + '</li>';
					 msg += '<li>' + this.getSum() + '</li>';
					 msg += '<li>' + this.getAvg().toFixed(2) + '</li>';
					 msg += '<li>' + this.getGrade() + '</li>';
					 msg += '</ul>';
					
					return msg;
				}
			};
			return obj
		}
	
	window.onload = function() {
		
		var students = [];   //배열과 객체는 분명히 다르다.
			students.push(makeStudent('태화1',1,100,100) ); //makeStudent를 호출해서   
			students.push(makeStudent('태화2',2,100,100) );   
			students.push(makeStudent('태화3',3,100,100) );   
			students.push(makeStudent('태화4',4,100,100) );   
			students.push(makeStudent('태화5',5,100,100) );   
			
			var msg = ' ';
			students.forEach(function(value,index,array){
				var student = value;
			msg += '<div>';
			msg += student.toString();
			msg += '</div>';
			
	});
	
			
			/*
			for (var i in students){ //i가 students 만큼들어간다. 
				msg += '<div>';
				msg += students[i].toString();
				msg += '</div>';
			}
			*/
		document.body.innerHTML += msg;
	}
	</script>
	
</head>
<body>
	<h1> 생성자 함수 </h1>


</body>
</html>