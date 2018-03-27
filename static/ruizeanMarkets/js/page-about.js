RuiZeanTrader.prototype.aboutInit = function(){
	FontFaceOnload( "ADAM_CGPRO", {
		success: function() {
			$('.svgLogoTxt').each(function(){
				var logoTxt = new SnapTxt('#'+$(this).attr('id'), {
					fontSize : '61px',
					fontFamily : "'ADAM_CGPRO','Microsoft Yahei','STHeiti Light'",
					gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
				});
			});
			svgLoopLine();
		},
		error: function(){
			$('.svgLogoTxt').each(function(){
				var logoTxt = new SnapTxt('#'+$(this).attr('id'), {
					fontSize : '61px',
					fontFamily : "'Microsoft Yahei','STHeiti Light'",
					gradient : 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674',
				});
			});
			svgLoopLine();
		}
	});
	// banner 切换
	var bannerBtn1 = new SnapBtn1('.svg-btn1', {
		font1 : 'none',
		font2 : '注册真实账户',
		height : 60,
		font2Size : 16,
		font2Width : 210,
		lineY : 7
	});
	var bannerBtn2 = new SnapBtn1('.svg-btn2', {
		font1 : 'none',
		font2 : '体验模拟账户',
		height : 60,
		font2Size : 16,
		font2Width : 210,
		lineY : 7
	});
	var bannerBtn3 = new SnapBtn1('.svg-btn3', {
		font1 : 'none',
		font2 : '申请IB经纪商',
		height : 60,
		font2Size : 16,
		font2Width : 210,
		lineY : 7
	});
	var bannerBtn4 = new SnapBtn1('.svg-btn4', {
		font1 : 'none',
		font2 : 'Live Account',
		height : 60,
		font2Size : 16,
		font2Width : 230,
		lineY : 7
	});
	var bannerBtn5 = new SnapBtn1('.svg-btn5', {
		font1 : 'none',
		font2 : 'Demo Account',
		height : 60,
		font2Size : 16,
		font2Width : 230,
		lineY : 7
	});
	var bannerBtn6 = new SnapBtn1('.svg-btn6', {
		font1 : 'none',
		font2 : 'Introducing Broker',
		height : 60,
		font2Size : 16,
		font2Width : 230,
		lineY : 7
	});
	
	function svgLoopLine(){
		var svgLogo = $('.side-logo');
		var loopLine = Snap('.svgLoopLine');
		var gradient = 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674';
		var pathSpace = 40;
		var pathStrokeWidth = 8;
		var pathWidth = svgLogo.height() + pathSpace * 2;
		var pathPoint = {
			x1 : pathStrokeWidth/2,
			x2 : (pathWidth+pathStrokeWidth/2),

			y1 : pathStrokeWidth/2,
			y2 : pathSpace+pathStrokeWidth/2,
			y3 : pathWidth+pathStrokeWidth/2-pathSpace,
			y4 : pathWidth+pathStrokeWidth/2,
		}
		var path = 'M'+ pathPoint.x2 +' '+ pathPoint.y2 +'L'+ pathPoint.x2 +' '+ pathPoint.y1 +'L'+ pathPoint.x1 +' '+ pathPoint.y1 +'L'+ pathPoint.x1 +' '+ pathPoint.y4 +'L'+ pathPoint.x2 +' '+ pathPoint.y4 +'L'+ pathPoint.x2 +' '+ pathPoint.y3;
		var line = loopLine.path(path).attr({
			'stroke-width' : pathStrokeWidth,
			'stroke' : loopLine.gradient(gradient),
			'fill' : 'none'
		});
		line.attr({
			'stroke-dasharray' : line.getTotalLength() / 4,
			'stroke-dashoffset' : line.getTotalLength()
		});
		$('.side-logo .hd').css({
			'width' : pathWidth+pathStrokeWidth,
			'height' : pathWidth+pathStrokeWidth
		});
		$('.svgLoopLine').attr({
			'width' : pathWidth+pathStrokeWidth,
			'height' : pathWidth+pathStrokeWidth
		});
		$('.svgLoopLine')[0].setAttribute('viewBox', '0, 0, '+ (pathWidth+pathStrokeWidth) +', '+ (pathWidth+pathStrokeWidth));
		var ani = function(){
			line.animate({
				'stroke-dashoffset' : line.getTotalLength() * 4
			}, 12000, mina.linear, function(){
				line.attr({
					'stroke-dashoffset' : line.getTotalLength() * 1
				});
				line.animate({
					'stroke-dashoffset' : line.getTotalLength() * -3
				}, 12000, mina.linear, function(){
					line.attr({
						'stroke-dashoffset' : line.getTotalLength() * 1
					});
					ani();
				});
			});
		}
		ani();
	}
};

$(function(){
	rzt.aboutInit();
});