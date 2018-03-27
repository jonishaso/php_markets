RuiZeanTrader.prototype.videosInit = function(){
	var player = polyvObject('#video-id').videoPlayer({
		'width':'100%',
		'height':'100%',
		'vid' : 'ee439689f8662ae2f4a3c2640481bf33_e'
	});
	var mt4Step = new Swiper('.pictxt-slider-01', {
		slidesPerView: '3',
		pagination: false,
		nextButton: '.swiper-control3 .next',
		prevButton: '.swiper-control3 .prev',
		spaceBetween: 7,
	});

	var fn = function($ele){
		$ele.bind('click', function(){
			$(this).addClass('active').siblings().removeClass('active');
			var vid = $(this).attr('data-vid');
			var txt = $(this).attr('data-txt');
			if(vid) {
				player.changeVid(vid);
				$('.video-wrap .h').html(txt);
			}else{
				player.j2s_pauseVideo();
				rzt.openApplyForm();
			}
		})
	}
	$('.pictxt-slider-01 .item').each(function(){
		fn($(this));
	});
	$('.video-list li').each(function(){
		fn($(this));
	});


	$('#video-id').next('.video-mask').bind('click', function(){
		$(this).remove();
		player.j2s_resumeVideo();
	});
};
RuiZeanTrader.prototype.videosSide3Size = function(option){
	var m = $('.videos .main3'),
		v = $('.videos .side3 .video-list'),
		vh = $('.videos .side3 .video-list .h'),
		vb = $('.videos .side3 .video-list .b'),
		vtip = $('.videos .side3 .video-list .tip');

	vb.height(m.outerHeight(true) - vh.outerHeight(true) - vtip.outerHeight(true) - parseInt(v.css('padding-top')) - parseInt(v.css('padding-bottom')) - parseInt(vb.css('margin-bottom')));
	vb.perfectScrollbar(option || '');
};
$(function(){
	rzt.videosInit();
	rzt.videosSide3Size();
});
$(window).resize(function(){
	rzt.videosSide3Size('update');
});
$(window).load(function(){
	rzt.videosSide3Size('update');
});