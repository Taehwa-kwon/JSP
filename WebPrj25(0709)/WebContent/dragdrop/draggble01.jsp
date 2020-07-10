<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Draggable + Sortable</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
	  ul { list-style-type: none; margin: 0; padding: 0; margin-bottom: 10px; }
	  li { margin: 5px; padding: 5px; width: 150px; }
  </style>
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
		  $( function() {
		    $( "#sortable" ).sortable({ //sortable 드래그해서 순서를 바꿀수 있게 만드는 리스트 
		      revert: true
		    });
		    
		    $( "#draggable" ).draggable({ 
		      connectToSortable: "#sortable",
		      helper: "clone",   // clone : 복사, original:디폴트 값으로, 옮겨다님
		      revert: "invalid"	//기존의 위치로 돌아가다. 
		    });
		    
		    $( "ul, li" ).disableSelection(); //아이템 내부의 글자를 드래그 해서 선택하지 못하도록 하는 기능 입니다.
		 	
		  });
		  
		  
  </script>
</head>
<body>
 JQUERY홈페이지의  sortable   API documentation.
		<ul>
		  <li id="draggable" class="ui-state-highlight">Drag me down</li>
		</ul>
		 
		<ul id="sortable">
		  <li class="ui-state-default">Item 1</li>
		  <li class="ui-state-default">Item 2</li>
		  <li class="ui-state-default">Item 3</li>
		  <li class="ui-state-default">Item 4</li>
		  <li class="ui-state-default">Item 5</li>
		</ul>
		 
 
</body>
</html>