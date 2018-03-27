// 文字标题
function SnapTxt(ele, options){
	var options = options || {};

	this.ele = ele;
	this.$ele = $(ele);
	this.fontSize = options.fontSize || '100px';
	this.fontFamily = options.fontFamily || "'ADAM_CGPRO','Microsoft Yahei','STHeiti Light'";
	this.gradient = options.gradient || 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674';
	this.textAchor = options.textAchor || 'start';
	this.fontWeight = options.fontWeight || 'normal';

	if($(this.ele).length) {
		this.init();
	}

	return this;
};
SnapTxt.prototype = {
	init : function(){
		this.snapTxt = Snap(this.ele);
		this.gl = this.snapTxt.gradient(this.gradient);
		this.txtArray = this.$ele.attr('data-txt').split(',');
		this.draw();
	},
	draw : function(){
		var textW = 0;
		var textH = 0;
		var textHPrev = 0;
		for(var i=0; i<=this.txtArray.length-1; i++){
			var txt = this.snapTxt.text(0, 0, this.txtArray[i]).attr({
				fill : this.gl,
				textAnchor : this.textAchor,
				fontSize : this.fontSize,
				fontFamily : this.fontFamily,
				fontWeight : this.fontWeight
			});
			if(textW < txt.getBBox().w){
				textW = txt.getBBox().w;
			}
			textH += txt.getBBox().h;
			txt.attr({
				y : textH - txt.getBBox().y2
			})
		}
		this.$ele.attr({
			'width' : textW,
			'height' : parseInt(textH)
		});
		this.$ele[0].setAttribute('viewBox', '0, 0, '+ textW +', '+ (parseInt(textH)))
	}
};
// 图片
function SnapPic(ele, options){
	var options = options || {};

	this.ele = ele;
	this.$ele = $(ele);
	this.$parent = options.parentEle ? $(options.parentEle) : $(ele).parent();
	this.imgSrc = options.imgSrc || 'none';
	this.imgWidth = options.imgWidth || 150;
	this.imgHeight = options.imgHeight || 100;
	this.offset = options.offset || 20;
	this.shadowOffset = 10;

	console.log(this.$parent);

	if($(this.ele).length) {
		this.init();
	}
	return this;
};
SnapPic.prototype = {
	init : function(){
		this.snapPic = Snap(this.ele);
		this.draw();
	},
	draw : function(){
		var shadow = this.snapPic.paper.filter(Snap.filter.shadow(-2, 2, 6, '#aaa'));
		var mask = this.snapPic.paper.path('M'+ this.offset + ' 0L'+ this.imgWidth +' 0L'+ (this.imgWidth-this.offset) +' '+ this.imgHeight +'L0 '+ this.imgHeight +'Z').attr({
			fill : '#fff'
		});
		var mask2 = this.snapPic.paper.polygon(this.offset, 0, this.imgWidth, 0, (this.imgWidth-this.offset), this.imgHeight, 0, this.imgHeight).attr({
			fill : '#fff',
			filter : shadow
		});
		var img = this.snapPic.paper.image(this.imgSrc, 0, 0, this.imgWidth, this.imgHeight).attr({
			mask : mask
		})
		
		this.$ele.attr({
			'width' : parseInt(this.imgWidth) + this.shadowOffset*2,
			'height' : parseInt(this.imgHeight) + this.shadowOffset*2
		});
		this.$ele[0].setAttribute('viewBox', (-this.shadowOffset) +', '+ (-this.shadowOffset) +', '+ (parseInt(this.imgWidth)+this.shadowOffset*2) +', '+ (parseInt(this.imgHeight) + this.shadowOffset*2));

	}
};
// 按钮背景
function SnapBtnBg(ele, options){
	var options = options || {};

	this.ele = ele;
	this.$ele = $(ele);
	this.offset = parseInt(this.$ele.parent().css('padding-right'));
	this.gradient = options.gradient || 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674';
	this.gradient2 = options.gradient2 || 'l(0, 0, 1, 0)#6FCBE0-#70B8DF';

	if($(this.ele).length) {
		this.init();
	}
	return this;
};
SnapBtnBg.prototype = {
	init : function(){
		this.snapBtnBg = Snap(this.ele);
		this.gl = this.snapBtnBg.gradient(this.gradient);
		this.gl2 = this.snapBtnBg.gradient(this.gradient2);
		this.points = {
			x1 : 0,
			x2 : this.offset,
			x3 : this.$ele.parent().outerWidth(true),
			x4 : this.$ele.parent().outerWidth(true) + this.offset*2,
			
			y1 : 0,
			y2 : this.$ele.parent().outerHeight(true)
		};
		this.draw();
	},
	path : function(points){
		var path = 'M'+ points.x2 +' '+ points.y1 +'L'+ points.x4 +' '+ points.y1 +' '+ points.x4 +' '+ points.y2 +' '+ points.x1 +' '+ points.y2 +'Z';
		return path;
	},
	draw : function(){
		var svgPath = this.snapBtnBg.paper.path(this.path(this.points)).attr({
			'fill' : this.gl,
			'display' : 'block'
		});
		var svgPath2 = this.snapBtnBg.paper.path(this.path(this.points)).attr({
			'fill' : this.gl2,
			'display' : 'none'
		});
		this.$ele.css({
			'width' : this.points.x4,
			'height' : this.points.y2
		});
		if(this.$ele.parent().hasClass('hoverBg')){
			svgPath.attr({
				'display' : 'none'
			});
			svgPath2.attr({
				'display' : 'block'
			});
			this.$ele.parent().bind('mouseover', function(){
				svgPath.attr({
					'display' : 'block'
				});
				svgPath2.attr({
					'display' : 'none'
				});
			});
			this.$ele.parent().bind('mouseleave', function(){
				svgPath.attr({
					'display' : 'none'
				});
				svgPath2.attr({
					'display' : 'block'
				});
			});
		}
		this.$ele[0].setAttribute('viewBox', '0, 0, '+ this.points.x4 +','+ this.points.y2);
	}
};
// 按钮
function SnapBtn1(ele, options){
	var options = options || {};

	this.ele = ele;
	this.$ele = $(ele);
	this.height = options.height || 70;
	this.space = options.space || 40;

	this.font1 = options.font1 || '1';
	this.font1Color= options.font1Color || '#fff';
	this.font1ColorOver= options.font1ColorOver || '#fff';
	this.font1Size = options.font1Size || 30;
	this.font1Width = options.font1Width || 40;

	this.font2 = options.font2 || '按钮';
	this.font2Color= options.font2Color || '#dab76c';
	this.font2ColorOver= options.font2ColorOver || '#fff';
	this.font2Size = options.font2Size || 20;
	this.font2Width = options.font2Width || 270;
	
	this.lineY = options.lineY || 10;

	this.gradientOver = options.gradient || 'l(0, 1, 1, 0)#E4C674-#F4E3A0-#E4C674';
	this.gradientOut = options.gradient || 'l(0, 1, 1, 0)#fff-#fff-#fff';
	this.textAchor = options.textAchor || 'middle';

	if($(this.ele).length) {
		this.init();
	}

	return this;
}
SnapBtn1.prototype = {
	init : function(){
		this.snapBtn = Snap(this.ele);
		this.gl1 = this.snapBtn.gradient(this.gradientOver);
		this.gl2 = this.snapBtn.gradient(this.gradientOut);
		this.draw();
	},
	draw : function(){
		var self = this,
			pathValue,
			pathValue2,
			pathValue3;
		
		var linePoint1,
			linePoint2;
		
		if(this.font1 != 'none'){
			pathValue = 'M'+ this.space +' 0'+'L'+ (this.space+this.font1Width) +' 0'+'L'+ this.font1Width + ' '+ this.height +'L0 '+ this.height +'Z';
			pathValue2 = 'M'+ (this.space + this.font1Width) +' 0'+'L'+ (this.space+this.font1Width+this.font2Width) +' 0'+'L'+ (this.font1Width+this.font2Width) + ' '+ this.height +'L'+ this.font1Width +' '+ this.height +'Z';
			pathValue3 = 'M'+ (this.space + this.font1Width) +' 0'+'L'+ this.font1Width +' '+ this.height +'L'+ (this.font1Width+this.font2Width) + ' '+ this.height +'L'+ this.font1Width +' '+ this.height +'Z';
		}else{
			pathValue2 = 'M'+ this.space +' 0'+'L'+ (this.space+this.font2Width) +' 0'+'L'+ this.font2Width + ' '+ this.height +'L0 '+ this.height +'Z';
			pathValue3 = 'M'+ this.space +' 0'+'L0 '+ this.height +'L'+ this.font2Width + ' '+ this.height +'L0 '+ this.height +'Z';
		}
		
		linePoint1 = {
			x1 : 0,
			y1 : this.height/2-this.lineY,
			x2 : this.lineY,
			y2 : this.height/2,
		}
		linePoint2 = {
			x1 : 0,
			y1 : this.height/2+this.lineY,
			x2 : this.lineY,
			y2 : this.height/2,
		}
		
		var btn1,
			btn2,
			btn2Over,
			btnG;
		btn2 = this.snapBtn.path(pathValue2).attr({
			fill : this.gl2
		});
		btn2Over = this.snapBtn.path(pathValue3).attr({
			fill : this.gl1
		});
		if(this.font1 != 'none'){
			btn1 = this.snapBtn.path(pathValue).attr({
				fill : this.gl1
			});
			btnG = this.snapBtn.g(btn1, btn2, btn2Over);
		}else{
			btnG = this.snapBtn.g(btn2, btn2Over);
		}

		var txt1,
			txt1Matrix,
			txt2,
			txt2Matrix,
			txtG;
		if(this.font1 != 'none'){
			txt1 = this.snapBtn.text(
				(this.font1Width + this.space) / 2 ,
				this.height / 2,
				this.font1
			).attr({
				fill : this.font1Color,
				'font-size' : this.font1Size + 'px',
				'text-anchor' : this.textAchor
			});
			txt1Matrix = new Snap.Matrix();
			txt1Matrix.translate(0, this.height/2+txt1.getBBox().h/2- txt1.getBBox().y2);
			txt1.transform(txt1Matrix);
			
			txt2 = this.snapBtn.text(
				this.font1Width + (this.font2Width + this.space) / 2,
				0,
				this.font2
			).attr({
				fill : this.font2Color,
				'font-size' : this.font2Size + 'px',
				'text-anchor' : this.textAchor
			});
			txt2Matrix = new Snap.Matrix();
			txt2Matrix.translate(0, this.height/2+txt2.getBBox().h/2- txt2.getBBox().y2);
			txt2.transform(txt2Matrix);
			txtG = this.snapBtn.g(txt1, txt2);
		}else{
			txt2 = this.snapBtn.text(
				(this.font2Width + this.space) / 2,
				0,
				this.font2
			).attr({
				fill : this.font2Color,
				'font-size' : this.font2Size + 'px',
				'text-anchor' : this.textAchor
			});
			txt2Matrix = new Snap.Matrix();
			txt2Matrix.translate(0, this.height/2+txt2.getBBox().h/2- txt2.getBBox().y2);
			txt2.transform(txt2Matrix);
		}
		
		var angleRight1,
			angleRight2,
			angleRight3,
			angleRight4,
			angleG,
			angleMatrix;

		angleRight1 = this.snapBtn.line(linePoint1.x1, linePoint1.y1, linePoint1.x2, linePoint1.y2).attr({
			stroke: this.font2Color,
			strokeWidth: 2
		});
		angleRight2 = this.snapBtn.line(linePoint2.x1, linePoint2.y1, linePoint2.x2, linePoint2.y2).attr({
			stroke: this.font2Color,
			strokeWidth: 2
		});
		angleRight3 = this.snapBtn.line(linePoint1.x1, linePoint1.y1, linePoint1.x1, linePoint1.y1).attr({
			stroke: this.font2ColorOver,
			strokeWidth: 2
		});
		angleRight4 = this.snapBtn.line(linePoint2.x1, linePoint2.y1, linePoint2.x1, linePoint2.y1).attr({
			stroke: this.font2ColorOver,
			strokeWidth: 2
		});
		angleG = this.snapBtn.g(angleRight1, angleRight2, angleRight3, angleRight4);
		angleMatrix = new Snap.Matrix();
		
		if(this.font1 != 'none'){
			angleMatrix.translate(this.font1Width+this.font2Width-this.space/2, 0);
		}else{
			angleMatrix.translate(this.font2Width-this.space/2, 0);
		}
		angleG.transform(angleMatrix);
		

		/* 设置 svg 大小和viewBox */
		if(this.font1 != 'none'){
			this.$ele.attr({
				'width' : (this.font1Width + this.font2Width + this.space),
				'height' : this.height
			});
			this.$ele[0].setAttribute('viewBox', '0, 0, '+ (this.font1Width + this.font2Width + this.space) +', '+ this.height);
		}else{
			this.$ele.attr({
				'width' : (this.font2Width + this.space),
				'height' : this.height
			});
			this.$ele[0].setAttribute('viewBox', '0, 0, '+ (this.font2Width + this.space) +', '+ this.height);
		}

		/* 设置 svg 交互 */
		this.$ele.bind('mouseover', function(){
			btn2Over.stop();
			btn2Over.animate({path: pathValue2}, 500, mina.bounce);

			txt2.stop();
			txt2.animate({fill: self.font2ColorOver }, 500, mina.bounce);

			angleRight3.stop();
			angleRight3.animate({x2 : linePoint1.x2, y2: linePoint1.y2}, 500, mina.bounce);

			angleRight4.stop();
			angleRight4.animate({x2 : linePoint2.x2, y2: linePoint2.y2}, 500, mina.bounce);
		});
		this.$ele.bind('mouseout', function(){
			btn2Over.stop();
			btn2Over.animate({path: pathValue3}, 100, mina.linear);

			txt2.stop();
			txt2.animate({fill : self.font2Color }, 100, mina.linear);

			angleRight3.stop();
			angleRight3.animate({x2 : linePoint1.x1, y2: linePoint1.y1}, 100, mina.linear);

			angleRight4.stop();
			angleRight4.animate({x2 : linePoint2.x1, y2: linePoint2.y1}, 100, mina.linear);
		});
	}
}
// 滚动按钮
function SnapScrollBtn(ele, options) {
	var options = options || {};

	this.ele = ele;
	this.$ele = $(ele);
	this.width = options.width || 32;
	this.height = options.height || 46;
	this.strokeStyle = options.strokeStyle || '#fff';
	this.strokeWidth = options.strokeWidth || 2;
	this.lineSpace = options.linSpace || 4;
	this.lineHeight = options.lineHeight || 10;
	this.arcHeight = options.strokeArcHeight || 10;

	if($(this.ele).length) {
		this.init();
	}

	return this;
}
SnapScrollBtn.prototype = {
	init : function(){
		this.snapScrollBtn = Snap(this.ele);
		this.draw();
	},
	draw : function(){
		var points = {
			x1 : 0+this.strokeWidth, // 左侧点
			x2 : this.width/2, // 中点
			x3 : this.width, // 右侧点
			x4 : this.width/9, // 弧度控制点1
			x5 : this.width-this.width/9, // 弧度控制点2 

			y1 : -this.arcHeight+this.strokeWidth, // 上点
			y2 : this.arcHeight+this.strokeWidth, // 下点
			y3 : this.height/2+this.strokeWidth, // 弧度起点
			y4 : (this.height - this.arcHeight)+this.strokeWidth, // 弧度终点
			y8 : -this.arcHeight/3+this.strokeWidth, // 弧度控制点1
			y9 : this.height+this.arcHeight/3+this.strokeWidth, // 弧度控制点2
			y12 : -this.arcHeight/10+this.strokeWidth, // 弧度控制点1
			y13 : this.height+this.arcHeight/10+this.strokeWidth, // 弧度控制点2

			y6 : this.lineSpace+this.strokeWidth, // 线条点1
			y7 : this.lineSpace+this.lineHeight+this.strokeWidth, // 线条点2
			y10 : this.height-this.lineHeight-this.lineSpace+this.strokeWidth,
			y11 : this.height-this.lineSpace+this.strokeWidth
		}
		var path = {
			out : {
				path1 : "M"+ points.x1 +" "+ points.y4 +"L"+ points.x1 +" "+ points.y2 +"C"+ points.x4 +" "+ points.y8 +" "+ points.x5 +" "+ points.y8 +" "+ points.x3 +" "+ points.y2 +"L"+ points.x3 +" "+ points.y4 +"C"+ points.x5 +" "+ points.y9 +" "+ points.x4 +" "+ points.y9 +" "+ points.x1 +" "+ points.y4 +"Z",
				path2 : "M"+ points.x2 +" "+ points.y6 +"L"+ points.x2 +" "+ points.y7
			},
			over : {
				path1 : "M"+ points.x1 +" "+ points.y4 +"L"+ points.x1 +" "+ points.y2 +"C"+ points.x4 +" "+ points.y8 +" "+ points.x5 +" "+ points.y8 +" "+ points.x3 +" "+ points.y2 +"L"+ points.x3 +" "+ points.y4 +"C"+ points.x5 +" "+ points.y9 +" "+ points.x4 +" "+ points.y9 +" "+ points.x1 +" "+ points.y4 +"Z",
				path2 : "M"+ points.x2 +" "+ points.y11 +"L"+ points.x2 +" "+ points.y10
			}
		}
		var outPath1 = this.snapScrollBtn.path(path.out.path1).attr({
			'fill' : 'none',
			'stroke' : this.strokeStyle,
			'stroke-width' : this.strokeWidth
		});
		var outPath2 = this.snapScrollBtn.path(path.out.path2).attr({
			'fill' : 'none',
			'stroke' : this.strokeStyle,
			'stroke-width' : this.strokeWidth
		});


		this.$ele.bind('mouseover', function(){
			outPath1.stop();
			outPath1.animate({path: path.over.path1}, 2000, mina.bounce);
			outPath2.stop();
			outPath2.animate({path: path.over.path2}, 500, mina.bounce);
		});
		this.$ele.bind('mouseout', function(){
			outPath1.stop();
			outPath1.animate({path: path.out.path1}, 500, mina.bounce);
			outPath2.stop();
			outPath2.animate({path: path.out.path2}, 500, mina.bounce);
		});


		/* 设置 svg 大小和viewBox */
		this.$ele.attr({
			'width' : (this.width+this.strokeWidth/2),
			'height' : (this.height+this.strokeWidth/2)
		});
		this.$ele[0].setAttribute('viewBox', '0, 0, '+ (this.width+this.strokeWidth/2+this.strokeWidth) +', '+ (this.height+this.strokeWidth/2+this.strokeWidth));
	}
}
// 三角渐变
function SnapArrowBtn(ele, options) {
	var options = options || {};

	this.ele = ele;
	this.$ele = $(ele);
	this.width = options.width || 32;
	this.height = options.height || 46;
	this.num = options.num || 3;
	this.arrowDirection = options.arrowDirection || 'prev';
	this.gradient = options.gradient || 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674';
	this.gradient2 = options.gradient2 || 'l(0, 0, 1, 0)#F4E3A0-#E4C674-#F4E3A0';

	if($(this.ele).length) {
		this.init();
	}

	return this;
}
SnapArrowBtn.prototype = {
	init : function(){
		this.snapArrowBtn = Snap(this.ele);
		this.gl = this.snapArrowBtn.gradient(this.gradient);
		this.gl2 = this.snapArrowBtn.gradient(this.gradient2);
		this.draw();
	},
	draw : function(){
		var self = this,
			point = [];

		if (this.arrowDirection == 'prev'){
			point = [0, this.height/2, this.width, 0, this.width, this.height, 0, this.height/2];
		}else{
			point = [this.width, this.height/2, 0, 0, 0, this.height, this.width, this.height/2];
		}
		var polygon = this.snapArrowBtn.polygon(point).attr({
			'fill' : this.gl
		});

		/* 设置 svg 大小和viewBox */
		this.$ele.attr({
			'width' : this.width,
			'height' : this.height
		});
		this.$ele[0].setAttribute('viewBox', '0, 0, '+ this.width +', '+ this.height);
	}
};
// 按钮边框
function SnapBtnBorder(ele, options) {
	var options = options || {};

	this.ele = ele;
	this.$ele = $(ele);
	this.$parentEle = $(ele).parent();
	this.gradient = options.gradient || 'l(0, 0, 1, 0)#E4C674-#F4E3A0-#E4C674';
	this.gradient2 = options.gradient2 || 'l(0, 0, 1, 0)#F4E3A0-#E4C674-#F4E3A0';
	this.strokeWidth = options.strokeWidth * 2 || 6;

	if($(this.ele).length) {
		this.init();
	}

	return this;
}
SnapBtnBorder.prototype = {
	init : function(){
		this.SnapBtnBorder = Snap(this.ele);
		this.gl = this.SnapBtnBorder.gradient(this.gradient);
		this.gl2 = this.SnapBtnBorder.gradient(this.gradient2);
		this.draw();
	},
	draw : function(){
		var self = this;
		self.w = self.$parentEle.outerWidth(true),
		self.h = self.$parentEle.outerHeight(true);

		var path = 'M0 0L'+ self.w +' 0L'+ self.w +' '+ self.h +'L0 ' + self.h +'L0 0 Z';
		var border = self.SnapBtnBorder.path(path).attr({
			'stroke' : self.gl,
			'fill' : 'none',
			'stroke-width' : self.strokeWidth
		});
		border.attr({
			'stroke-dasharray' : border.getTotalLength(),
			'stroke-dashoffset' : border.getTotalLength()
		});

		self.$ele.attr({
			'width' : self.w,
			'height' : self.h
		});
		self.$ele[0].setAttribute('viewBox', '0, 0, '+ self.w +', '+ self.h);
	}
};