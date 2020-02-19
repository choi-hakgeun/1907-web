<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani_html</title>
<script src='../lib/jquery-3.4.1.js'></script>
<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
  integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
  <style>
  *{ margin:0px; padding : 0px; }
  
  /*Animation Canvas */
  .animation_canvas	{
  	overflow : hidden;
  	position: relative;
  	width:600px;
  	height:400px;
  }
  
  /* Slider Panel */
  .slider_panel { width:3000px; position: relative; }
  .slider_image { float : left; width:600px; height:400px; }
  
  /*Slider Text Panel */
  .slider_text_panel {position:absolute; top: 200px; left:50px;}
  .slider_text {position : absolute; width: 250px; height: 150px; }
  
  /*Control Panel */
  .control_panel {
  	position : absolute; top:380px;
  	left: 270px; height:13px;
  	overflow:hidden;  	
  }
  .control_button {
  	width : 12px; height:46px;
  	position:relative;
  	float:left; cursor : pointer;
  	background : url(../images/point_button.png);
  }
  .control_button:hover {top:-16px;}
  .control_button.active{top:-31px;}
  
  </style>
  
</head>
<body>
	<h1>Test Header</h1>
	<div class="animation_canvas">
		<div class="slider_panel">
			<img class="slider_image" />
			<img class="slider_image" />
			<img class="slider_image" />
			<img class="slider_image" />
			<img class="slider_image" />
		
		</div>
		<div class="slider_text_panel">
			<div class="slider_text" style="left:-300px;" data-index="0">
				<h1>Lorem ipsum</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
			</div>
			<div class="slider_text" style="left:-300px;" data-index="1">
				<h1>Nulla cact</h1>
				<p>Nulla eget sapien mauris, ornare elementum elit</p>
			</div>
			<div class="slider_text" style="left:-300px;" data-index="2">
				<h1>Quisque eleifend</h1>
				<p>Quisque eleifend augue nec lacus lodortis porta</p>
			<div class="slider_text"  style="left:-300px;" data-index="3">
				<h1>Donec</h1>
				<p>Donec a ligula lectus, eu iaculis justo.</p>
			</div>
			</div>
			<div class="slider_text" style="left:-300px;" data-index="4">
				<h1>Vivamus scelerisque</h1>
				<p>Vivamus scelerisque mauris id nunc dictum sit amet</p>
			</div>
		
		</div>
		<div class="control_panel">
			<div class="control_button"></div>
			<div class="control_button"></div>
			<div class="control_button"></div>
			<div class="control_button"></div>
			<div class="control_button"></div>
		
		</div>		
	</div>
	<h1>Test Header</h1>
	<script>
		$(document).ready(function(){
			//초기 텍스트 위치를 지정합니다.
			$('.slider_text').css('left', -300).each(function(index){
				$(this).attr('data-index', index);
			});
			
			//컨트롤 버튼의 클릭 리스너 지정 및 data-index 할당
			$('.control_button').each(function(index){
				$(this).attr('data-index', index);
			});
			
			//컨트롤 버튼의 클릭 리스너 지정 및 data-index 할당
			$('.control_button').each(function (index){
				$(this).attr('data-index', index);
			}).click(function(){
				var index = $(this).attr('data-index');
				moveSlider
			});
			
			//초기 슬라이더 위치 지정
			var randomNumber = Math.round(Math.random()*4);
			moveSlider(randomNumber);			
		});
		//슬러이더를 움직여주는 함수
		function moveSlider(index){
			// 슬라이더를 이동합니다.
			var willMoveLeft =-(index * 600);
			$('.slider_panel').animate({ left: willMoveLeft }, 'slow');
			
			// control_button에 active 클래스를 부여/제거합니다.
			$('.control_button[data-index='+ index+']').addClass('active');			
			$('.control_button[data-index!=' + index + ']').removeClass('active');
			
			//글자를 이동합니다.
			$('.slider_text[data-index='+']').show().animate({
				left:0
			}, 'slow');
			
			$('.slider_text[data-index!=' + index + ']').hide('slow', function(){
				$(this).css('left',-300);
			});
		}
		//책 코드에 빠진부분
		let img=['semple1.gif', 'semple2.gif', 'semple3.gif', 'semple4.gif', 'semple5.gif']
		$('.image').each(function(index){
			$(this).attr({
				'src':'../images/' + img[index]
			})
		})
		//--------------------------------
		$('.text').css('left', -300).each(function(index){
			$(this).attr('data-index', index);
		});
		
	</script>
	
</body>
</html>