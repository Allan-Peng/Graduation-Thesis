layui.config({
	base: "js/"
}).use(['form', 'element', 'layer', 'laypage', 'jquery', 'carousel'], function() {
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		element = layui.element,
		laypage = layui.laypage,
		$ = layui.jquery,
		carousel = layui.carousel;



	//获取导航栏和二级栏目  一级一级栏目的文章
	function getHomeData() {
		$.ajax({
			url: serverUrl + "/PoliceChangPing/home/getHomeData",
			type: "GET",
			success: function(res) {
				if(res.code == "100") {
					adapterHome(res.extend.data)
				} else {
					layer.msg(res.msg);
				}
			}
		});
	}
	//根据文章id获取文章详情
	var getGraphicById = function(id) {
		$.ajax({
			url: serverUrl + "/PoliceChangPing/home/getGraphicById/" + id,
			type: "GET",
			success: function(res) {
				if(res.code == "100") {
					var article = JSON.stringify(res.extend.article);
					console.log(article);
					window.sessionStorage.setItem("article", article);
					window.parent.location.href = "../../details.html"
				} else {
					layer.msg(res.msg);
				}
			}
		});
	}
	//构造带-图片-日期-标题-的文章
	function adapterGraphic(graphics, $target) {
        if(graphics.length<=5){
            $target.next().hide();
        }else{
            $target.next().show();
        }
		$.each(graphics, function(i, item) {
			if(i > 4) {
				return false;
			}
			var $img = $('<img alt="暂无图片" width="100%" height="100%"/>').attr("src", serverUrl + serverFile + item.icon);
			var $imgDiv = $('<div class="ms_img"></div>').append($img);
			var $articleTitle = $('<span></span>').text(item.title);
			$articleTitle.click(function() {
				getGraphicById(item.grapId);
			});
			var $articleAuthor = $('<span></span>').text(item.author);
			var $articleDate = $('<span></span>').text(item.chinaDateCreateTime);
			var $msText = $('<div class="ms_text"></div>').append($articleTitle).append($articleAuthor).append($articleDate);
			var $msContent = $('<div class="ms_content" ></div>').append($imgDiv).append($msText);
			$target.append($msContent);
		})
	}

	//构造带-日期-标题-的文章
	function adapterGraphic2(graphics, $target) {
		if(graphics.length<=10){
            $target.next().hide();
		}else{
            $target.next().show();
		}
		var $msLink = $('<div class="ms_link"></div>');
		var $msUl = $('<ul></ul>');
		$.each(graphics, function(i, item) {
            if(i > 9) {
                return false;
            }
			var $msA = $('<a></a>').text(item.title);
			$msA.click(function() {
				getGraphicById(item.grapId);
			});
			var $msSpan = $('<span></span>').text(timestampToTime(item.createTime));
			var $msLi = $('<li></li>').append($msA).append($msSpan);
			$msUl.append($msLi);
		});
		$msLink.append($msUl);
		$target.append($msLink);
	}

	//前端时间戳格式化
	function timestampToTime(timestamp) {
		var date = new Date(timestamp); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
		var Y = date.getFullYear() + '-';
		var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
		var D = date.getDate();
		return Y + M + D;
	}

	//构造标题栏和二级标题栏以及初始化文章
	function adapterHome(homeData) {
		$.each(homeData, function(i, item) {
			/*全都有版本*/
			//一级标题构造
			var $title1 = $('<span></span>').text(item.programName);
			//二级标题构造
			var $title2Ul = $('<ul class="layui-nav"></ul>');
			$.each(item.childrens, function(i2, item2) {
				var $tetle2A = $('<a></a>').text(item2.programName);
				var $tetle2Li = $('<li class="layui-nav-item" lay-filter="ms-nav"></li>').append($tetle2A).attr("id", item2.programId).attr("ifIcon", item2.ifIcon);
				$title2Ul.append($tetle2Li);
			});
			var $title2 = $('<div class="ms_nav"></div>').append($title2Ul)
			//分割线构造
			var $dp = $('<div class="ms_dipline"></div>');
			//内容构造
			var $msContents = $('<div class="ms_contents" style="height: 355px"></div>').attr("id", item.programId);
            //更多通知构造
            var $more = $('<div class="more" style="display:none"><a>更多通知 ></a></div>');
			//若该一级栏目存在文章 即该一级栏目无二级栏目 若不存在则再之后点击事件时适配
			if(item.graphics && item.ifIcon == 1) {
				if(item.graphics.length>4){
                    $more = $('<div class="more"><a>更多通知 ></a></div>');
				}
				adapterGraphic(item.graphics, $msContents);
			} else if(item.graphics && item.ifIcon == 0) {
                if(item.graphics.length>9){
                    $more = $('<div class="more"><a>更多通知 ></a></div>');
                }
				adapterGraphic2(item.graphics, $msContents);
			}
			var $msBlock = $('<div class="ms_block"></div>')
				//插入一级标题
				.append($title1)
				//插入二级标题
				.append($title2)
				//插入分割线
				.append($dp)
				//插入内容
				.append($msContents)
				//插入更多通知
				.append($more);

			var $ms = $('<div class="layui-col-md6" style="height: 500px"></div>').append($msBlock);
			$('#mss').append($ms);

		});

		//给二级栏目适配数据-二级栏目导航栏绑定点击事件
		$('.layui-nav-item').click(function() {
			var $msBlock=$(this).parents('.ms_block')
            $msBlock.find('.ms_contents').empty();
			var ifIcon = $(this).attr("ifIcon");
			$.ajax({
				url: serverUrl + "/PoliceChangPing/home/getGraphicByProgram/" + $(this).attr('id'),
				type: "GET",
				success: function(res) {
					if(res.code == "100") {
						if(res.extend.data.length != 0) {
							if(ifIcon == 1) {
								adapterGraphic(res.extend.data, $('#' + res.extend.data[0].parentProId));
							} else if(ifIcon == 0) {
								adapterGraphic2(res.extend.data, $('#' + res.extend.data[0].parentProId));
							}
						}else{
                            $msBlock.find('.more').hide();
						}

					} else {
						layer.msg(res.msg);
					}
				}
			});
		});
		//刷新layui使其渲染导航栏
		element.render('nav');
		//给二级栏目初始化数据
		$.each($('.layui-nav').find('li:first-child'), function() {
			$(this).addClass('layui-this');
			$(this).click();
		});

	}
	//给底栏第一个图片绑定事件
	$('.link_block:nth-of-type(1)').click(function () {
        layer.open({
            title: ['全国导航', 'font-family: PingFangSC-Medium;font-size: 18px;color: #333333;text-align: center;'],
            type: 2,
            content: '../homeLink.html',//这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            area: ['300px', '540px'],
        });
    })

	function init() {
		//渲染轮播图
        carousel.render({
            elem: '#test1',
            width: '100%', //设置容器宽度
            arrow: 'always', //始终显示箭头
        });
        //获取导航数据
		getHomeData();
		//刷新layui使其渲染导航栏
		//element.render('nav');
	}
	init();

});