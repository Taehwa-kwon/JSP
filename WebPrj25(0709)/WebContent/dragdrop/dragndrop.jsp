<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.warp{clear:both}
	.subrow{float:left; width:400px; height:600px; border : 1px solid gray; text-align: center; }
	.timerow{float:left; width:500px; height:600px; border : 1px solid gray; text-align: center; }
	.sub{display:block; width:80px; height : 60px; border:1px solid green;}
	.col{float:left; width:80px; height:66px; border:1px solid gray;}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(document).ready(
		function(){
			
			$("#subjects").sortable({ //subjects를 드래그 할수 있게 만들고
				connectWith :".col" 
				,
				receive : function(event,ui){
					var obj = ui.item; //현재 드래그한 요소
					$(obj).css("height","80px");   //
					
				}
				
			});
			
			$(".col").sortable({
				connectWith:"#subjects"
				,
				update : function(event,ui){
					var obj = ui.item;
					var qty = ui.item.data("qty");
					
					$(obj).css("height",60*qty + "px");
				}
			,
			out : function(event,ui){ //이 이벤트는 정렬 가능한 항목이 정렬 가능한 목록에서 멀어 질 때 트리거됩니다.
				alert();
				}
			});
			
			$("#subjects, .col").disableSelection();
			
		}		
	);
</script>

</head>
<body>
	<div id="wrap">
		<div id="subjects" class="subrow">
			<a href="" class="sub" data-qty="3">국어(3)</a>		
			<a href="" class="sub" data-qty="3">영어(3)</a>		
			<a href="" class="sub" data-qty="3">중국어(3)</a>		
			<a href="" class="sub" data-qty="2">일본어(2)</a>		
			<a href="" class="sub" data-qty="2">독일어(2)</a>		
			<a href="" class="sub" data-qty="2">스페인어(2)</a>		
		</div>
		
		<div id="times" class="timerow">
			<div class="row" style="line-height:50px;" >
				<div class='col'></div>
				<div class='col'>星期一</div>
				<div class='col'>星期二</div>
				<div class='col'>星期三</div>
				<div class='col'>星期四</div>
				<div class='col'>星期五</div>
			</div>
			<div class="row">
				<div class='col'>1</div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
			</div>
			<div class="row">
				<div class='col'>2</div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
			</div>
			<div class="row">
				<div class='col'>3</div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
			</div>
			<div class="row">
				<div class='col'>4</div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
			</div>
			<div class="row">
				<div class='col'>5</div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
			</div>
			<div class="row">
				<div class='col'>6</div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
			</div>
			<div class="row">
				<div class='col'>7</div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
			</div>
			<div class="row">
				<div class='col'>8</div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
				<div class='col'></div>
			</div>
			
		</div>
	</div>

</body>
</html>