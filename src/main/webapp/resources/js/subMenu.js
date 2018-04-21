$('#header_outer').mouseenter(function() {
	$('.sub_Outer').css('display', 'inline-block');
	$('.sub_Top').css('display', 'none');
	$('.sub_Bottom').css('display', 'none');
	$('.sub_Shoes').css('display', 'none');
	$('#header_outer').css('border-bottom','8px solid black');
	$('#header_top').css('border-bottom','8px solid #d1d1d1');
	$('#header_bottom').css('border-bottom','8px solid #d1d1d1');
	$('#header_shoes').css('border-bottom','8px solid #d1d1d1');
});

$('#header_top').mouseenter(function() {
	$('.sub_Outer').css('display', 'none');
	$('.sub_Top').css('display', 'inline-block');
	$('.sub_Bottom').css('display', 'none');
	$('.sub_Shoes').css('display', 'none');
	$('#header_outer').css('border-bottom','8px solid #d1d1d1');
	$('#header_top').css('border-bottom','8px solid black');
	$('#header_bottom').css('border-bottom','8px solid #d1d1d1');
	$('#header_shoes').css('border-bottom','8px solid #d1d1d1');
});

$('#header_bottom').mouseenter(function() {
	$('.sub_Outer').css('display', 'none');
	$('.sub_Top').css('display', 'none');
	$('.sub_Bottom').css('display', 'inline-block');
	$('.sub_Shoes').css('display', 'none');
	$('#header_outer').css('border-bottom','8px solid #d1d1d1');
	$('#header_top').css('border-bottom','8px solid #d1d1d1');
	$('#header_bottom').css('border-bottom','8px solid black');
	$('#header_shoes').css('border-bottom','8px solid #d1d1d1');
});

$('#header_shoes').mouseenter(function() {
	$('.sub_Outer').css('display', 'none');
	$('.sub_Top').css('display', 'none');
	$('.sub_Bottom').css('display', 'none');
	$('.sub_Shoes').css('display', 'inline-block');
	$('#header_outer').css('border-bottom','8px solid d1d1d1');
	$('#header_top').css('border-bottom','8px solid #d1d1d1');
	$('#header_bottom').css('border-bottom','8px solid #d1d1d1');
	$('#header_shoes').css('border-bottom','8px solid black');
});

$('.submenu ul').mouseleave(function() {
	$('li.sub_Outer').css('display', 'none');
	$('#header_outer').css('border-bottom','8px solid #d1d1d1');
	$('#header_top').css('border-bottom','8px solid #d1d1d1');
	$('#header_bottom').css('border-bottom','8px solid #d1d1d1');
	$('#header_shoes').css('border-bottom','8px solid #d1d1d1');
});

$('.submenu ul').mouseleave(function() {
	$('li.sub_Top').css('display', 'none');
	$('#header_outer').css('border-bottom','8px solid #d1d1d1');
	$('#header_top').css('border-bottom','8px solid #d1d1d1');
	$('#header_bottom').css('border-bottom','8px solid #d1d1d1');
	$('#header_shoes').css('border-bottom','8px solid #d1d1d1');
});

$('.submenu ul').mouseleave(function() {
	$('li.sub_Bottom').css('display', 'none');
	$('#header_outer').css('border-bottom','8px solid #d1d1d1');
	$('#header_top').css('border-bottom','8px solid #d1d1d1');
	$('#header_bottom').css('border-bottom','8px solid #d1d1d1');
	$('#header_shoes').css('border-bottom','8px solid #d1d1d1');
});

$('.submenu ul').mouseleave(function() {
	$('li.sub_Shoes').css('display', 'none');
	$('#header_outer').css('border-bottom','8px solid #d1d1d1');
	$('#header_top').css('border-bottom','8px solid #d1d1d1');
	$('#header_bottom').css('border-bottom','8px solid #d1d1d1');
	$('#header_shoes').css('border-bottom','8px solid #d1d1d1');
});
