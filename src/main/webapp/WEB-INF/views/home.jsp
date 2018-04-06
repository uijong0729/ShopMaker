
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Main</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/main.css">
<link rel="stylesheet" type="text/css" href="./resources/css/layout.css" media="all"/>
<script language="javascript" src="./resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<style type="text/css">
.container {
    position: relative;
    width: 100%;
}


.image {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

.container:hover .image {
  opacity: 0.3;
}

.container:hover .middle {
  opacity: 1;
}

.text {
  background-color: #608bbc;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
</style>
</head>
<body>


<!-- header Navbar (sit on top) -->
<header class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="/main1" class="w3-bar-item w3-button"><b>Shop</b> maker</a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
    <a href="loginPage" class="w3-bar-item w3-button">Login</a>
      <a href="#projects" class="w3-bar-item w3-button">Template</a>
      <a href="#about" class="w3-bar-item w3-button">About</a>
      <a href="#contact" class="w3-bar-item w3-button">Contact</a>
      <a href="AqnaPage" class="w3-bar-item w3-button">Q&A</a>
      <a href="AnoticeList" class="w3-bar-item w3-button">Notice</a>
      <a href="ApurchasePage" class="w3-bar-item w3-button">Purchase</a>
    </div>
  </div>
</header>

<!-- banner -->
<div class="w3-display-container w3-content w3-wide main" style="max-width:1500px;" id="home">
  <!-- <img class="w3-image" src="dog.jpg" alt="Architecture" width="1500" height="800"> -->
  <div class="gallery">
                     <ul>
                          <li><a href="#"><img class="w3-image" src="./resources/img/c1.jpg" alt='' width="1500" height="800"/></a></li>
                          <li><a href="#"><img class="w3-image" src="./resources/img/c2.jpg" alt='' width="1500" height="800" /></a></li>
                          <li><a href="#"><img class="w3-image" src="./resources/img/c3.jpg" alt='' width="1500" height="800"/></a></li>
                    </ul>
             </div>
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Shop Maker</b></span> <span class="w3-hide-small w3-text-light-grey">Design your shop</span></h1>
  </div>
</div>

<!-- Page content -->
<article class="w3-content w3-padding" style="max-width:1564px">

  <!-- Project Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Template</h3>
  </div>

  <div class="w3-row-padding">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="container">
        <div class="w3-display-topleft w3-black w3-padding">Woman Clothes</div>
        <img src="./resources/img/c2.jpg" alt="House" style="width:100%" class="image">
        <div class="middle">
    		<div class="text" onclick="template1()">Start now</div>
  		</div>
  		</div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Man clothes</div>
        <img src="./resources/img/c2.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Accessory</div>
        <img src="./resources/img/c2.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Hat</div>
        <img src="./resources/img/c2.jpg" alt="House" style="width:100%">
      </div>
    </div>
  </div>

  
  <!-- About Section -->
  <div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">About</h3>
    <p>About Us
    </p>
  </div>

  <div class="w3-row-padding w3-grayscale">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./resources/img/c2.jpg" alt="John" style="width:100%">
      <h3>1</h3>
      <p class="w3-opacity">hh & 1</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./resources/img/c2.jpg" alt="Jane" style="width:100%">
      <h3>2</h3>
      <p class="w3-opacity">2</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./resources/img/c2.jpg" alt="Mike" style="width:100%">
      <h3>3</h3>
      <p class="w3-opacity">3</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./resources/img/c2.jpg" alt="Dan" style="width:100%">
      <h3>4</h3>
      <p class="w3-opacity">4</p>
      <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
      <p><button class="w3-button w3-light-grey w3-block">Contact</button></p>
    </div>
  </div>

  <!-- Contact Section -->
  <div class="w3-container w3-padding-32" id="contact">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
    <p>Lets get in touch and talk about your and our next project.</p>
    <form action="/action_page.php" target="_blank">
      <input class="w3-input" type="text" placeholder="Name" required name="Name">
      <input class="w3-input w3-section" type="text" placeholder="Email" required name="Email">
      <input class="w3-input w3-section" type="text" placeholder="Subject" required name="Subject">
      <input class="w3-input w3-section" type="text" placeholder="Comment" required name="Comment">
      <button class="w3-button w3-black w3-section" type="submit">
        <i class="fa fa-paper-plane"></i> SEND MESSAGE
      </button>
    </form>
  </div>
  
<!-- End page content -->
</article>


<!-- Footer -->
<footer>
	<%@ include file="./Aviews/footer.jsp" %>
</footer>

<script type="text/javascript">
	function template1(){
		<!--로그인 안 되어있으면 로그인 페이지 -->
		<!--구매하지 않았으면 구매페이지-->
		location.href="template1";
	}
</script>


<script type="text/javascript">
$(document).ready(function() {
	  var timeonoff; //자동기능 구현
	  var imageCount=3;  //이미지 개수 *** 
	  var cnt=1;  //이미지 순서 1 2 3 4 5 4 3 2 1 2 3 4 5 ...
	  var direct=1;  //1씩 증가(+1)/감소(-1)
	  var position=0; //겔러리 무비의 left값 0 -1000 -2000 -3000 -4000
	  
	  $('.btn1').css('background','url(images/bnt_on.png)'); //1번째 버튼 불켜!! 

	 function moveg(){
	      cnt+=direct;  //카운트가 1 2 3 4 5 4 3 2 1 2 3 4 5 ......
		     //각각의 카운트에 대한 left 좌표값을 처리
//			if(cnt==1){
//			   position=0;  
//			}else if(cnt==2){
//		       position=-1000;
//			}else if(cnt==3){
//			   position=-2000;
//			}else if(cnt==4){
//			   position=-3000;
//			}else if(cnt==5){
//			   position=-4000;
//			}
	        position=-1500*(cnt-1);
	                                                
		   for(var i=1;i<=imageCount;i++){ // i=>1 2 3 4 5
			  $('.btn'+i).css('background','url(images/bnt.png)'); //모든 버튼에 불 다꺼!!
		   }
		   $('.btn'+cnt).css('background','url(images/bnt_on.png)');//자기 버튼만 불켜~
	                           
			$('.gallery').animate({left:position}, 'slow'); //겔러리 무비의 left값을 움직여라~
			if(cnt==imageCount)direct=-1;
	        if(cnt==1)direct=1;
	 }

	  timeonoff= setInterval( moveg , 1000); //4초마다 자동기능 

	  $('.mbutton').click(function(event){  //각각의 버튼을 클릭한다면...

		var $target=$(event.target); //$target == this =>실제 클릭한 버튼
		clearInterval(timeonoff);   //타이머를 중지!!

		for(var i=1;i<=imageCount;i++){
			$('.btn'+i).css('background','url(images/bnt.png)'); //모든 버튼 불끈다
		}

		if($target.is('.btn1')){  //첫번째 버튼을 클릭했다면...
	    	   $('.gallery').animate({left:0}, 'slow');
	                cnt=1;
	                direct=1;
		}else if($target.is('.btn2')){ //두번째 버튼을 클릭했다면...
	    	   $('.gallery').animate({left:-1500}, 'slow');
	                cnt=2;
		}else if($target.is('.btn3')){ //세번째 버튼을 클릭했다면...
	    	   $('.gallery').animate({left:-3000}, 'slow');
	                cnt=3;
	                direct=-1;
		}/*else if($target.is('.btn4')){  //네번째 버튼을 클릭했다면...
	    	   $('.gallery').animate({left:-4500}, 'slow');
	                cnt=4;
		}else if($target.is('.btn5')){  //다섯번째 버튼을 클릭했다면...
	    	   $('.gallery').animate({left:-4000}, 'slow');
	                cnt=5;
	                direct=-1;
		}*/
	    $('.btn'+cnt).css('background','url(images/bnt_on.png)'); //클릭한 버튼의 불켜
	    timeonoff= setInterval( moveg , 1000);  //타이머의 재 동작
	  });
	  //겔러리에 오버/아웃시 타이머의 동작/중지 기능 구현
	     $('.gallery').hover(function(){
		      clearInterval(timeonoff);   //타이머를 중지!!
		  },function(){
			  timeonoff= setInterval( moveg , 1000);  //타이머의 재 동작
		  });
	  
	});

</script>
</body>
</html>
