// 页面初始化
RuiZeanTrader.prototype.snapInit = function(){
	$('.svg-hdTitle').each(function(){
		var hdTitle = new SnapTxt('#'+$(this).attr('id'), {
			fontSize : '18px',
			fontFamily : "'Microsoft Yahei','STHeiti Light'",
			gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
			fontWeight : 'bold'
		});
	});
	$('.svg-hdTitle2').each(function(){
		var hdTitle = new SnapTxt('#'+$(this).attr('id'), {
			fontSize : '20px',
			fontFamily : "'Microsoft Yahei','STHeiti Light'",
			gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
			fontWeight : 'bold'
		});
	});
	$('.svg-hdTitle3').each(function(){
		var hdTitle = new SnapTxt('#'+$(this).attr('id'), {
			fontSize : '12px',
			fontFamily : "'Microsoft Yahei','STHeiti Light'",
			gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
			fontWeight : 'bold'
		});
	});
	$('.svg-hdTitle4').each(function(){
		var hdTitle = new SnapTxt('#'+$(this).attr('id'), {
			fontSize : '16px',
			fontFamily : "'Microsoft Yahei','STHeiti Light'",
			gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
			fontWeight : 'bold'
		});
	});
	$('.svg-hdTitle5').each(function(){
		var hdTitle = new SnapTxt('#'+$(this).attr('id'), {
			fontSize : '18px',
			fontFamily : "'Microsoft Yahei','STHeiti Light'",
			gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674'
		});
	});
	$('.svg-hdTitle6').each(function(){
		var hdTitle = new SnapTxt('#'+$(this).attr('id'), {
			fontSize : '22px',
			fontFamily : "'Microsoft Yahei','STHeiti Light'",
			gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
			fontWeight : 'bold'
		});
	});
	$('.svg-hdTitle7').each(function(){
		var hdTitle = new SnapTxt('#'+$(this).attr('id'), {
			fontSize : '14px',
			fontFamily : "'Microsoft Yahei','STHeiti Light'",
			gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
			fontWeight : 'bold'
		});
	});
	$('.svg-pic1').each(function(){
		var hdTitle = new SnapPic('#'+$(this).attr('id'), {
			imgSrc : $(this).attr('data-src'),
			imgWidth : $(this).attr('data-width'),
			imgHeight : $(this).attr('data-height'),
			offset : $(this).attr('data-offset')
		});
	});

	$('.svg-btnBg').each(function(){
		var hdTitle = new SnapBtnBg('#'+$(this).attr('id'), {});
	});
	$('.svg-btnBd').each(function(){
		var hdTitle = new SnapBtnBorder('#'+$(this).attr('id'), {});
	});
	$('.svg-num').each(function(){
		var svgNum = new SnapNumChange('#'+$(this).attr('id'), {});
	});
};
RuiZeanTrader.prototype.init = function(){
	var self = this;
	self.bannerSize();
	self.headerFixed();
	self.floatNavAni();
	self.select();
	self.pdfInit();
	self.quickMenuInit();
	self.quickMenuScroll();
	self.diagramList();
	self.mainBdTab();
	self.mobileNav();



	if($('.loopScroll').length){
		var loopScroll = new LoopScroll('.loopScroll');
	}
	if($('.loopScroll2').length){
		var loopScroll2 = new LoopScroll('.loopScroll2', {
			speed : 0.1
		});
	}

	$('.notice .b').flexslider({
		animation : 'slide',
		direction : 'vertical',
		animationLoop: true,
		pauseOnHover : true,
		controlNav: false
	});

	$('.news-list3 .item').eq(0).addClass('active');
	$('.news-list3 .item').eq(0).find('.b').slideDown('fade');
	$('.news-list3 .item').each(function(){
		var $item = $(this);
		$item.find('.h').bind('click', function(){
			$item.addClass('active');
			$item.find('.b').slideDown('fade');

			$item.siblings().removeClass('active');
			$item.siblings().find('.b').slideUp('fade');
		});
	});

	$('.bannerScrollBtn').bind('click', function(){
		self.scrollDown();
	});
	$('.backTop').bind('click', function(){
		self.backTop();
	});
	$('.hamburger').bind('click', function(){
		if(topNavIsShow){
			self.closeTopNav();
		}else{
			self.openTopNav();
		}
	});
	$('.svg-ele').each(function(index){
		$(this).attr('id', 'svg-ele'+index);
	});
	self.snapInit();

	$('.onlineform').on('click', function(){
		$('#livechat-compact-container').css({
			'transform' : 'translate(0, 100%)'
		});
	});

	$('body').on('click', function(){
		self.closeTopNav();
	});
	$('.top-nav-list, .hamburger').on('click', function(e){
		e.stopPropagation();
	});

	$('.top-nav-list, .header-nav-list').hide();
	$('.nav li').each(function(){
		var $this = $(this),
			dataNav3Id = $this.find('a').attr('data-nav3');
		if(dataNav3Id != undefined){
			$this.bind('mouseover', function(){
				$('.header-nav-list').css({
					visibility: 'visible',
					top : $('.header').offset().top + $('.header').outerHeight(true) - $(window).scrollTop()
				});
				$('.header-nav-list').stop(true,true).fadeIn(100);
				$('#'+dataNav3Id).show().siblings().hide();
			});
		}else{
			$this.bind('mouseover', function(){
				$('.header-nav-list').stop(true,true).fadeOut(100);
			});
		}
	});
	$('.header-nav-list').bind('mouseleave', function(){
		$('.header-nav-list').stop(true,true).fadeOut(100);
	});

	$('.account-changebtn .chb-item').eq(0).find('a').addClass('active');
	$('.account-changeinfo ul').eq(0).siblings().hide();
	$('.account-changebtn .chb-item').each(function(index){
		var self = $(this),
			index = index,
			self_bd = $('.account-changeinfo ul');
		self.bind('mouseover', function(){
			self.find('a').addClass('active');
			self.siblings().find('a').removeClass('active');
			self_bd.eq(index).show();
			self_bd.eq(index).siblings().hide();
		});
	});

};
var rzt = new RuiZeanTrader();

// 页面加载完
$(function(){
	rzt.init();
});

// 窗口滚动
$(window).scroll(function(){
	rzt.headerFixed();
	rzt.floatNavAni();
	rzt.quickMenuScroll();
	$('.header-nav-list').hide();
});

// 窗口改变 
$(window).resize(function(){
	rzt.bannerSize();
	rzt.quickMenuScroll();
});