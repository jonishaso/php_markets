var topNavIsShow = false; // 汉堡菜单导航是否显示
function RuiZeanTrader(){};
// 节点
RuiZeanTrader.prototype.ele = {
	win : $(window),
	html : $('body, html'),
	topBar : $('.top-bar'),
	header : $('.header'),
	banner : $('.banner'),
	hamburger : $('.hamburger'),
	nav : $('.nav'),
	topNav : $('.top-nav-list'),
	floatNav : $('.float-nav'),
	headerNav : $('.header-nav-list')
};
// 求节点
RuiZeanTrader.prototype.getEle = function(){
	this.ele = {
		win : $(window),
		html : $('body, html'),
		topBar : $('.top-bar'),
		header : $('.header'),
		floatNav : $('.float-nav'),
		topNav : $('.top-nav-list'),
		banner : $('.banner'),
		hamburger : $('.hamburger')
	}
};
// 返回顶部
RuiZeanTrader.prototype.backTop = function(){
	this.ele.html.animate({ 'scrollTop' : '0' }, 300);
};
// 下拉滚动
RuiZeanTrader.prototype.scrollDown = function(){
	this.ele.html.animate({ 'scrollTop' : $(window).height() }, 300);
};
// banner高度
RuiZeanTrader.prototype.bannerSize = function(){
	this.ele.banner.css({ 'height' : $(window).height() });
};
// 打开汉堡菜单
RuiZeanTrader.prototype.openTopNav = function(){
	topNavIsShow = true;
	this.ele.hamburger.addClass('active');
	this.ele.topNav.css({visibility: 'visible'});
	this.ele.topNav.fadeIn();
	if(deviceName != 'computer') {
		$('body, html').css({
			'overflow': 'hidden'
		});
	}
};
// 关闭汉堡菜单
RuiZeanTrader.prototype.closeTopNav = function(){
	topNavIsShow = false;
	this.ele.hamburger.removeClass('active');
	this.ele.topNav.fadeOut();
	if(deviceName != 'computer') {
		$('body, html').css({
			'overflow': 'auto'
		});
	}
};
// 手机导航菜单选项
RuiZeanTrader.prototype.mobileNav = function(){
	if($('.nav5').length){
		$('.nav5').each(function(){
			$nav = $(this);
			$nav.on('click', '.li1 .tp1 .arrow', function(){
				var $this = $(this).parent().parent().parent();
				if($this.hasClass('active')){
					$this.removeClass('active');
					$this.find('.bt1').slideUp('fast');
				}else{
					$this.addClass('active');
					$this.find('.bt1').slideDown('fast');
				}
				return false;
			})
		});
	}
};
// select下拉框
RuiZeanTrader.prototype.select = function(){
	$('.form-select1-select2').select2({
		theme : 'form-select1',
		minimumResultsForSearch: Infinity
	});
};
// 右侧菜单滚动定位
RuiZeanTrader.prototype.floatNavAni = function(){
	var win = this.ele.win,
		floatNav = this.ele.floatNav,
		scrollTop = win.scrollTop(),
		winHeight = win.height();
	/*
	if( scrollTop >= winHeight){
		floatNav.addClass('show').removeClass('hide');
	}else{
		floatNav.addClass('hide').removeClass('show');
	}
	*/
};
// 头部滚动定位
RuiZeanTrader.prototype.headerFixed = function(){
	var self = this;
	var win = this.ele.win,
		topBar = this.ele.topBar,
		header = this.ele.header,
		topNav = this.ele.topNav,
		hamburger = this.ele.hamburger,
		scrollTop = win.scrollTop(),
		topBarHeight = topBar.outerHeight(true),
		topNavHeight = topNav.outerHeight(true),
		headerHeight = header.outerHeight(true),
		headerOffsetTop = header.offset().top;

	if( scrollTop > 0){
		header.css({
			'-webkit-transform' : 'translate(0, '+ (-scrollTop) +'px)',
			'-moz-transform' : 'translate(0, '+ (-scrollTop) +'px)',
			'-ms-transform' : 'translate(0, '+ (-scrollTop) +'px)',
			'-o-transform' : 'translate(0, '+ (-scrollTop) +'px)',
			'transform' : 'translate(0, '+ (-scrollTop) +'px)'
		});
	}else{
		header.css({
			'-webkit-transform' : 'translate(0, 0)',
			'-moz-transform' : 'translate(0, 0)',
			'-ms-transform' : 'translate(0, 0)',
			'-o-transform' : 'translate(0, 0)',
			'transform' : 'translate(0, 0)'
		});
	}
	if(scrollTop >= headerHeight){
		topBar.addClass('active');
	}else{
		topBar.removeClass('active');
	}
};
// 打开申请观看表单
RuiZeanTrader.prototype.openApplyForm = function(){
	var mask = $('<div class="form-mask" style="display:none;"></div>');
	$('body').append(mask);
	mask.fadeIn('300');
	$('.form-apply').fadeIn('300');
};
// 关闭申请观看表单
RuiZeanTrader.prototype.closeApplyForm = function(){
	$('.form-mask').fadeOut(300, function(){
		$('.form-mask').remove();
	});
	$('.form-apply').fadeOut('300');
};
RuiZeanTrader.prototype.pdfInit = function(){
	if($('.pdf-content').length){
		$('.pdf-content').each(function(){
			var $this = $(this);
			var pdf_src = $this.attr('data-pdf-src');
			console.log(pdf_src);
			if(browserName == "internet explorer" || browserName == "opera") {
				$this.html('<p>您的浏览器不支持 pdf预览，<a href="'+ pdf_src +'">点击下载PDF</a></p>');
			}else{
				$this.media({
					width: '100%',
					height: 400,
					autoplay: true,
					src: pdf_src
				});
			}
		});
	}
};
RuiZeanTrader.prototype.quickMenuScroll = function(){
	var self = this;
	if($('.scrollFixed').length){
		var scrollFixed = $('.scrollFixed');
		scrollFixed.each(function(){
			var scrollFixed = $(this);
			var scrollFixedHeight = scrollFixed.outerHeight(true);
			var offsetTop = scrollFixed.parent().offset().top;
			var wapperHeight = scrollFixed.parent().outerHeight(true);
			var topBarHeight = self.ele.topBar.outerHeight(true);
			var winScrollTop = $(window).scrollTop();
			if(winScrollTop >= (offsetTop - topBarHeight)){
				scrollFixed.addClass('scrolling');
				if(scrollFixed.hasClass('quick-menu-style2')){
					scrollFixed.removeClass('direction-horizontal');
					scrollFixed.addClass('direction-vertical');
				}
				if((wapperHeight + offsetTop) > (scrollFixedHeight + winScrollTop + topBarHeight)){
					scrollFixed.css({
						top : (winScrollTop - offsetTop + topBarHeight)
					});
				}else{
					scrollFixed.css({
						top : (wapperHeight - scrollFixedHeight)
					});
				}
			}else{
				scrollFixed.removeClass('scrolling');
				if(scrollFixed.hasClass('quick-menu-style2')){
					scrollFixed.addClass('direction-horizontal');
					scrollFixed.removeClass('direction-vertical');
				}
				scrollFixed.css({
					top : '0'
				});
			}
		})
	}

	if($('.quick-menu').length){
		var $quickMenu = $('.quick-menu');
		$quickMenu.each(function(){
			var $quickMenu = $(this),
				curValue = $quickMenu.find('.curValue'),
				horizontalHeight = $quickMenu.hasClass('quick-menu-horizontal') ? $quickMenu.outerHeight(true) : 0;

			var id = '';
			for(var i=0; i<=$('body').find('.qm-id').length-1; i++){
				var $this = $('body').find('.qm-id').eq(i);
				var nextId = $('body').find('.qm-id').eq(i+1);
				if(nextId != undefined){
					if($this.offset().top - self.ele.win.scrollTop()  <= (self.ele.topBar.outerHeight(true) + 10 + horizontalHeight) && nextId.offset().top - self.ele.win.scrollTop() >= (self.ele.topBar.outerHeight(true) + 10 + horizontalHeight)){
						id = $this.attr('id');
						break;
					}
				}else{
					if($this.offset().top - self.ele.win.scrollTop()  <= (self.ele.topBar.outerHeight(true) + 10 + horizontalHeight)){
						id = $this.attr('id');
						break;
					}
				}
			}
			for(var j=0; j<=$quickMenu.find('li').length-1; j++){
				var $this = $quickMenu.find('li').eq(j);
				var id2 = $this.attr('data-id');
				if(id == id2){
					$this.addClass('active').siblings().removeClass('active');
					curValue.html($this.html());
					break;
				}
			}
		});
	}
};
RuiZeanTrader.prototype.quickMenuInit = function(){
	var self = this;
	if($('.quick-menu').length){
		var $quickMenu = $('.quick-menu'),
			curValue = $quickMenu.find('.curValue'),
			horizontalHeight = $quickMenu.hasClass('quick-menu-horizontal') ? $quickMenu.outerHeight(true) : 0;
		$quickMenu.each(function(){
			var $quickMenu = $(this);
			$quickMenu.find('li').each(function(){
				$(this).bind('click', function(){
					curValue.html($(this).html());
					$(this).addClass('active').siblings().removeClass('active');
					var id = $(this).attr('data-id');
					if(id != undefined){
						$('#'+id).click();
						self.ele.html.stop().animate({
							'scrollTop' : $('#'+id).offset().top - self.ele.topBar.outerHeight(true) - horizontalHeight
						}, 100);
					}
				});
			});
		});
	}
	if($('.quick-menu-mobile').length){
		var $quickMenu = $('.quick-menu-mobile'),
			horizontalHeight = $quickMenu.hasClass('quick-menu-horizontal') ? $quickMenu.outerHeight(true) : 0;
		$quickMenu.each(function(){
			var $quickMenu = $(this);
			$quickMenu.find('li').each(function(){
				$(this).bind('mouseover', function(){
					$(this).addClass('active').siblings().removeClass('active');
					var id = $(this).attr('data-id');
					if(id != undefined){
						$('#'+id).click();
						self.ele.html.stop().animate({
							'scrollTop' : $('#'+id).offset().top - self.ele.topBar.outerHeight(true) - horizontalHeight
						}, 0);
					}
				});
			});
		});
	}
};
RuiZeanTrader.prototype.diagramList = function(){
	var self = this;
	if($('.diagram-list').length){
		var $quickMenu = $('.diagram-list');
		$quickMenu.each(function(){
			var $this = $(this),
				$hd = $this.find('.dl-hd1 .dh-item'),
				$bd = $this.find('.dl-bd .db-item');
			$hd.eq(0).parent().addClass('active');
			$bd.hide().eq(0).show();
			$hd.each(function(index){
				$(this).bind('click', function(){
					$(this).parent().addClass('active').siblings().removeClass('active');
					$bd.hide();
					$bd.eq(index).show();
				});
			});
		});
	}
};
RuiZeanTrader.prototype.mainBdTab = function(){
	var self = this;
	if($('.mainBd-tab').length){
		$('.mainBd-tab').each(function(){
			$(this).find('> .mainBd').eq(0).find('> .com-hd').addClass('active');
			$(this).find('> .mainBd').eq(0).find('> .com-bd').show();
			$(this).find('> .mainBd').each(function(){
				var $this = $(this),
					hd = $this.find('> .com-hd'),
					bd = $this.find('> .com-bd');
				hd.bind('click', function(){
					/*
					if(hd.hasClass('active')){
						bd.slideUp('fast');
						hd.removeClass('active');
						hd.removeClass('active');
					}else{
						bd.slideDown('fast');
						hd.addClass('active');
					}
					*/
					bd.slideDown('fast');
					hd.addClass('active');
					$this.siblings().find('> .com-hd').removeClass('active');
					$this.siblings().find('> .com-bd').hide();

					var horizontalHeight = $('quick-menu-horizontal').length ? $('quick-menu-horizontal').outerHeight(true) : 0;
					self.ele.html.animate({
						'scrollTop' : hd.offset().top - self.ele.topBar.outerHeight(true) - horizontalHeight
					}, 100);
				});
			});
		});
	}
	if($('.mainBd-tab2').length){
		$('.mainBd-tab2').each(function(){
			$(this).find('> .mainBd').eq(0).find('> .com-hd').addClass('active');
			$(this).find('> .mainBd').eq(0).find('> .com-bd').show();
			$(this).find('> .mainBd').each(function(){
				var $this = $(this),
					hd = $this.find('> .com-hd'),
					bd = $this.find('> .com-bd');
				hd.bind('click', function(){
					/*
					if(hd.hasClass('active')){
						bd.slideUp('fast');
						hd.removeClass('active');
						hd.removeClass('active');
					}else{
						bd.slideDown('fast');
						hd.addClass('active');
					}
					*/
					bd.slideDown('fast');
					hd.addClass('active');
					$this.siblings().find('> .com-hd').removeClass('active');
					$this.siblings().find('> .com-bd').slideUp('fast');
				});
			});
		});
	}
}


function LoopScroll(ele, option){
	var option = (option != undefined) ? option : {};
	this.$ele = $(ele);
	this.$eleWrapper = $(ele).find('ul');
	this.$eleItem = $(ele).find('li');
	this.len = 1;
	this.maxHeight = 470;
	this.stopRender = false;
	this.initHeight = 0;
	this.speed = (option.speed != undefined) ? option.speed : 0.5;
	this.init();
	return this;
}
LoopScroll.prototype.init = function(){
	this.$eleHeight = this.$ele.outerHeight(true);
	if(this.$eleHeight > this.maxHeight){
		this.$ele.css({
			height: this.maxHeight,
			overflow: 'hidden'
		});
		this.$eleWrapperHeight = this.$eleWrapper.outerHeight(true);
		this.$eleWrapper.css({
			transform: 'translate(0, '+ this.initHeight +')'
		});
		if(this.$eleItem.length >= this.len){
			this.len = this.$eleItem.length;
			this.$eleWrapper.append(this.$eleItem.clone());
		}
		this.render();
		this.event();
	}else{
		this.$ele.css({
			height: this.$eleHeight,
			overflow: 'hidden'
		});
	}
};
LoopScroll.prototype.render = function(){
	var self = this;
	if(!self.stopRender){
		self.initHeight += self.speed;
		if(self.initHeight < self.$eleWrapperHeight){
			console.log(self.initHeight);
			self.$eleWrapper.css({
				transform: 'translate(0, '+ (-self.initHeight) +'px)'
			});
		}else{
			self.initHeight = 0;
			self.$eleWrapper.css({
				transform: 'translate(0, 0)'
			});
		}
	}
	requestAnimationFrame(function(){
		self.render();
	});
};
LoopScroll.prototype.event = function(){
	var self = this;
	self.$ele.bind('mouseenter', function(){
		self.stopRender = true;
	})
	self.$ele.bind('mouseleave', function(){
		self.stopRender = false;
	})
}