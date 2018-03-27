RuiZeanTrader.prototype.defaultInit = function(){
	var bannerTxt;
	FontFaceOnload( "ADAM_CGPRO", {
		success: function() {
			bannerTxt = new SnapTxt('.svgBannerTxt', {
				fontSize : '100px',
				fontFamily : "'ADAM_CGPRO','Microsoft Yahei','STHeiti Light'",
				gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
			});
		},
		error: function(){
			bannerTxt = new SnapTxt('.svgBannerTxt', {
				fontSize : '100px',
				fontFamily : "'Microsoft Yahei','STHeiti Light'",
				gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
			});
		}
	});
	// banner 切换
	var bannerSwiper = new Swiper('.banner', {
		pagination: '.swiper-pagination1',
		paginationClickable: true
	});
	// partner-list 切换
	var partnerSwiper = new Swiper('.partner-list', {
		pagination: false,
		paginationClickable: false,
		slidesPerView: 'auto',
		nextButton: '.swiper-control1 .next',
		prevButton: '.swiper-control1 .prev',
		loop : true,
		autoplay : 3000
	});
	// partner-list 切换按钮
	$('.svg-arrow-prev').each(function(){
		var arrowPrev = new SnapArrowBtn('#'+$(this).attr('id'), {
			width : 15,
			height : 26,
			arrowDirection : 'prev',
			gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674'
		});
	});
	$('.svg-arrow-next').each(function(){
		var arrowNext = new SnapArrowBtn('#'+$(this).attr('id'), {
			width : 15,
			height : 26,
			arrowDirection : 'next',
			gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674'
		});
	});


	// platform-list 切换
	/* var platformSwiper = new Swiper('.platform-list', {
		pagination: false,
		paginationClickable: false,
		slidesPerView: '6'
	});
	*/
	// banner 切换
	var bannerBtn1 = new SnapBtn1('.svg-btn1', {
		font1 : '1',
		font2 : '注册真实账户'
	});
	var bannerBtn2 = new SnapBtn1('.svg-btn2', {
		font1 : '2',
		font2 : '体验模拟账户'
	});
	var bannerBtn3 = new SnapBtn1('.svg-btn3', {
		font1 : '3',
		font2 : '申请IB经纪商'
	});
	var bannerBtn4 = new SnapBtn1('.svg-btn4', {
		font1 : '1',
		font2 : 'Live Account'
	});
	var bannerBtn5 = new SnapBtn1('.svg-btn5', {
		font1 : '2',
		font2 : 'Demo Account'
	});
	var bannerBtn6 = new SnapBtn1('.svg-btn6', {
		font1 : '3',
		font2 : 'Introducing Broker'
	});

	// banner svg 滚动按钮
	var scrollBtn = new SnapScrollBtn('.svgScrollBtn', {
		strokeStyle : 'rgba(255,255,255,0.5)'
	});


	var player = polyvObject('#video-id').videoPlayer({
		'width':'100%',
		'height':'100%',
		'vid' : 'ee439689f8662ae2f4a3c2640481bf33_e'
	});
	$('#video-id').next('.video-mask').bind('click', function(){
		$(this).remove();
		player.j2s_resumeVideo();
	});
};
RuiZeanTrader.prototype.defaultScrollEle = {
	intro1 : $('.introduce-01'),
	intro2 : $('.introduce-02'),
	intro3 : $('.introduce-03'),
	intro4 : $('.introduce-04')
};
RuiZeanTrader.prototype.defaultScrollAni = function(){
	var win = this.ele.win,
		intro1 = this.defaultScrollEle.intro1,
		intro2 = this.defaultScrollEle.intro2,
		intro3 = this.defaultScrollEle.intro3,
		intro4 = this.defaultScrollEle.intro4,
		winScrollTop = this.ele.win.scrollTop(),
		intro1EleTop = this.defaultScrollEle.intro1.offset().top,
		intro2EleTop = this.defaultScrollEle.intro2.offset().top,
		intro3EleTop = this.defaultScrollEle.intro3.offset().top,
		intro4EleTop = this.defaultScrollEle.intro4.offset().top;
	if(intro1EleTop <= winScrollTop+win.height()/2 && intro1.not('.viewIn')){
		intro1.addClass('viewIn');
	}
	if(intro2EleTop <= winScrollTop+win.height()/2 && intro2.not('.viewIn')){
		intro2.addClass('viewIn');
	}
	if(intro3EleTop <= winScrollTop+win.height()/2 && intro3.not('.viewIn')){
		intro3.addClass('viewIn');
	}
	if(intro4EleTop <= winScrollTop+win.height()/2 && intro4.not('.viewIn')){
		intro4.addClass('viewIn');
	}
};

$(function(){
	rzt.defaultInit();
	rzt.defaultScrollAni();
});

// 窗口滚动
$(window).scroll(function(){
	rzt.defaultScrollAni();
});