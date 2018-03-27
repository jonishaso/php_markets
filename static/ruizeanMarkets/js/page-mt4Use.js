RuiZeanTrader.prototype.mt4UseInit = function(){

	function svgLine(){
		var svgLine = $('.mt4Step');
		var loopLine = Snap('.svg-line');
		var gradient = 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674';
		var pathSpace = 40;
		var pathStrokeWidth = 8;

		var pathWidth = svgLine.width();
		var pathHeight = svgLine.height();

		var pathPoint = {
			x1 : pathStrokeWidth/2,
			x2 : (pathWidth+pathStrokeWidth/2),

			y1 : pathStrokeWidth/2,
			y2 : pathSpace+pathStrokeWidth/2,
			y3 : pathHeight+pathStrokeWidth/2-pathSpace,
			y4 : pathHeight+pathStrokeWidth/2,
		}
		var path = 'M'+ pathPoint.x1 +' '+ pathPoint.y2 +'L'+ pathPoint.x1 +' '+ pathPoint.y1 +'L'+ pathPoint.x2 +' '+ pathPoint.y1 +'L'+ pathPoint.x2 +' '+ pathPoint.y4 +'L'+ pathPoint.x1 +' '+ pathPoint.y4 +'L'+ pathPoint.x1 +' '+ pathPoint.y3;
		var gl = loopLine.gradient(gradient);
		var pathss = loopLine.path(path).attr({
			'stroke-width' : pathStrokeWidth,
			'stroke' : gl,
			'fill' : 'none'
		});

		$('.svg-line').parent().attr({
			'width' : pathWidth+pathStrokeWidth,
			'height' : pathHeight+pathStrokeWidth
		});
		$('.svg-line').attr({
			'width' : pathWidth+pathStrokeWidth,
			'height' : pathHeight+pathStrokeWidth
		});
		$('.svg-line')[0].setAttribute('viewBox', '0, 0, '+ (pathWidth+pathStrokeWidth) +', '+ (pathHeight+pathStrokeWidth));


		this.update = function(){
			pathWidth = svgLine.width();
			pathHeight = svgLine.height();
			pathPoint = {
				x1 : pathStrokeWidth/2,
				x2 : (pathWidth+pathStrokeWidth/2),

				y1 : pathStrokeWidth/2,
				y2 : pathSpace+pathStrokeWidth/2,
				y3 : pathHeight+pathStrokeWidth/2-pathSpace,
				y4 : pathHeight+pathStrokeWidth/2,
			}
			path = 'M'+ pathPoint.x1 +' '+ pathPoint.y2 +'L'+ pathPoint.x1 +' '+ pathPoint.y1 +'L'+ pathPoint.x2 +' '+ pathPoint.y1 +'L'+ pathPoint.x2 +' '+ pathPoint.y4 +'L'+ pathPoint.x1 +' '+ pathPoint.y4 +'L'+ pathPoint.x1 +' '+ pathPoint.y3;
			pathss.attr({
				'd' : path
			});
			$('.svg-line').parent().attr({
				'width' : pathWidth+pathStrokeWidth,
				'height' : pathHeight+pathStrokeWidth
			});
			$('.svg-line').attr({
				'width' : pathWidth+pathStrokeWidth,
				'height' : pathHeight+pathStrokeWidth
			});
			$('.svg-line')[0].setAttribute('viewBox', '0, 0, '+ (pathWidth+pathStrokeWidth) +', '+ (pathHeight+pathStrokeWidth));
		};
		return this;
	};
	var svgLine = new svgLine();

	var mt4Step = new Swiper('.mt4Step', {
		slidesPerView: '1',
		pagination: '.swiper-pagination2',
		paginationClickable: '.swiper-pagination2',
		nextButton: '.swiper-control2 .next',
		prevButton: '.swiper-control2 .prev',
		spaceBetween: 30,
		speed: 0,
		effect: 'fade',
		autoHeight: false,
		fade: {
			crossFade: true,
		},
		onInit: function(){
			svgLine.update();
		},
		onPaginationRendered : function(swiper, paginationContainer){
			$(paginationContainer).find('span').each(function(index){
				$(this).html(index+1);
			});
			stepFn(swiper);
			svgLine.update();
		},
		onSlidePrevEnd: function(swiper){
			stepFn(swiper);
			svgLine.update();
		},
		onSlideNextEnd: function(swiper){
			stepFn(swiper);
			svgLine.update();
		}
	});

	function stepFn(swiper){
		console.log(swiper.activeIndex);
		$('.mt4Step .nums').html(swiper.activeIndex+1);
		if(swiper.activeIndex >= 0 && swiper.activeIndex <= 4){
			$('.stepBtns .btn-2').eq(0).find('a').addClass('active');
			$('.stepBtns .btn-2').eq(0).siblings().find('a').removeClass('active');
			$('.swiper-pagination2 span').removeClass('active');
			for(var i=0; i<=4; i++){
				$('.swiper-pagination2 span').eq(i).addClass('active');
			}
		}else if(swiper.activeIndex >= 5 && swiper.activeIndex <= 8){
			$('.stepBtns .btn-2').eq(1).find('a').addClass('active');
			$('.stepBtns .btn-2').eq(1).siblings().find('a').removeClass('active');
			$('.swiper-pagination2 span').removeClass('active');
			for(var i=5; i<=8; i++){
				$('.swiper-pagination2 span').eq(i).addClass('active');
			}
		}else if(swiper.activeIndex >= 9 && swiper.activeIndex <= 11){
			$('.stepBtns .btn-2').eq(2).find('a').addClass('active');
			$('.stepBtns .btn-2').eq(2).siblings().find('a').removeClass('active');
			$('.swiper-pagination2 span').removeClass('active');
			for(var i=9; i<=11; i++){
				$('.swiper-pagination2 span').eq(i).addClass('active');
			}

		}
	}

	$('.stepBtns .btn-2').each(function(index){
		var index = index;
		$(this).bind('click', function(){
			if(index <= 0){
				mt4Step.slideTo(0, 1000, false);
			}else if(index <= 1){
				mt4Step.slideTo(5, 1000, false);
			}else{
				mt4Step.slideTo(9, 1000, false);
			}
			stepFn(mt4Step);
		})
	});
	$('.stepBtns .btn-2').eq(0).click();

};

$(function(){
	rzt.mt4UseInit();
});