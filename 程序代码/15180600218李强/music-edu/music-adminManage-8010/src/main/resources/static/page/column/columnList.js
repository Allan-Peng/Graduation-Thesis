layui.config({
    base: "js/"
}).use(['form', 'layer', 'jquery', 'layedit', 'laydate', 'laypage'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        laypage = layui.laypage,
        layedit = layui.layedit,
        laydate = layui.laydate,
        $ = layui.jquery;

    //加载页面数据
    var newsData = '';
    $.get(serverUrl + "/PoliceChangPing/program/getProgramList", function (data) {
        var newArray = [];
        newsData = data.extend.programList;
        /*	if(window.sessionStorage.getItem("addNews")) {
                var addNews = window.sessionStorage.getItem("addNews");
                newsData = JSON.parse(addNews).concat(newsData);
            }*/
        //执行加载数据的方法
        newsList();
        $(".page_message").text("共" + newsData.length + "条数据");
    })

    //新建栏目
    $(".btnAdd").click(function () {
        layui.layer.open({
            title: ['新建栏目', 'font-family: PingFangSC-Medium;font-size: 18px;color: #333333;text-align: center;'],
            type: 2,
            content: "columnAdd.html",
            area: ['1000px', '540px'],
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                var iframeid=$(layero).children(".layui-layer-content").children("iframe").attr("id");
                var iframedoc=window.frames[iframeid].document;
                var programName=iframedoc.getElementById("title");
                var ifIcon=iframedoc.getElementById("ifIcon");
                var programDesc=iframedoc.getElementById("programDesc");
                var childrenName=iframedoc.getElementById("childrenName");
                var childrenNameList = [];
                 $.each($(childrenName).find('input'), function(i,item) {
                 	childrenNameList.push($(this).val());
                 });
                
                $.ajax({
                    url:serverUrl + "/PoliceChangPing/program/addProgramList",
                    type:"POST",
                    contentType: "application/json;charset=UTF-8",
                    data: JSON.stringify({
                        "programName": $(programName).val(),
                        "ifIcon": $(ifIcon).val(),
                        "programDesc": $(programDesc).val(),
                        "childrenNameList": childrenNameList,
                    }),
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == 100) {
                            layer.msg(data.msg);
                            
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
                layui.layer.close(index);
            },
            btnAlign: 'c',
            move: false,
        })

    })

    //编辑栏目
    $(".btnEdit").click(function () {
        var $tr = $(".news_content :checked").parents("tr");
        var programId = $tr.find("td:eq(1)").text();
        var parentId = $tr.find("td:eq(5)").text();
        var program='';
        //获取被编辑的栏目数据
        $.ajax({
            url:serverUrl + "/PoliceChangPing/program/getProgram/"+programId+"/"+parentId,
            type:"GET",
            dataType: 'json',
            success: function (data) {
                if (data.code == 100) {
                    program=data.extend.program;
                    window.sessionStorage.setItem("program",JSON.stringify(program));
                }else{
                    layer.msg(data.msg);
                }
            }
        });
        layui.layer.open({
            title: ['修改栏目', 'font-family: PingFangSC-Medium;font-size: 18px;color: #333333;text-align: center;'],
            type: 2,
            content: "columnEdit.html",
            area: ['1000px', '540px'],
            btn: ['确定', '取消'],
            yes: function (index, layero) {
            	//一级栏目修改接口数据
                var iframeid=$(layero).children(".layui-layer-content").children("iframe").attr("id");
                var iframedoc=window.frames[iframeid].document
                var programName=iframedoc.getElementById("title");
                var ifIcon=iframedoc.getElementById("ifIcon");
                var programDesc=iframedoc.getElementById("programDesc");
                var parentId=iframedoc.getElementById("parentId");
                var programId=iframedoc.getElementById("programId");
                $.ajax({
                    url:serverUrl + "/PoliceChangPing/program/updateProgram",
                    type:"PUT",
                    contentType: "application/json;charset=UTF-8",
                    data: JSON.stringify({
                        "programName": $(programName).val(),
                        "ifIcon": $(ifIcon).val(),
                        "programDesc": $(programDesc).val(),
                        "parentId": $(parentId).val(),
                        "programId": $(programId).val(),
                    }),
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == 100) {
                            layer.msg(data.msg);
                            $(".refresh").click();
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
                //二级子栏目接口数据
                var child =  layui.layer.getChildFrame('body',index);
                var childProgramId = [];
                var childProgramName = [];           
                $.each(child.find('.childBoxList'), function(i, item) {
					id = $(item).find('.childProId').val();
					childProgramId.push(id);
					name = $(item).find('.childrenProName').val();
					childProgramName.push(name);
				});
				$.ajax({
                    url:serverUrl + "/PoliceChangPing/program/childUpdateProgram",
                    type:"POST",
                    contentType: "application/json;charset=UTF-8",
                    data: JSON.stringify({
                        "programId":childProgramId,
						"programName":childProgramName,
						"parentId":$(programId).val()
                    }),
                    dataType: 'json',
                    success: function (data) {
                        if (data.code == 100) {
                            layer.msg(data.msg);
                            $(".refresh").click();
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
                layui.layer.close(index);
            },
            btnAlign: 'c',
            move: false,
        })

    })
    //删除按钮
    $('.btnDelete').click(function () {
        var programId = [];
        var parentId = [];
        var tr = $(".news_content :checked").parents("tr");
        $.each(tr, function () {
            var id = $(this).find("td:eq(1)").text();
            programId.push(id);
            var parent = $(this).find("td:eq(5)").text();
            parentId.push(parent);
        });
        $.ajax({
            url: serverUrl + "/PoliceChangPing/program/delete",
            type: "delete",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "programId": programId,
                "parentId": parentId
            }),
            dataType: 'json',
            success: function (data) {
                if (data.code == "100") {
                    layer.msg(data.msg);
                } else {
                    layer.msg(data.msg);
                }
            }

        });
        $(".refresh").click();
    });
    //发布按钮
    $('.btnIntroduce').click(function () {
        var programId = [];
        var parentId = [];
        var tr = $(".news_content :checked").parents("tr");
        $.each(tr, function () {
            var id = $(this).find("td:eq(1)").text();
            programId.push(id);
            var parent = $(this).find("td:eq(5)").text();
            parentId.push(parent);
        });
        $.ajax({
            url: serverUrl + "/PoliceChangPing/program/public",
            type: "PUT",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "programId": programId,
                "parentId": parentId
            }),
            dataType: 'json',
            success: function (data) {
                if (data.code == "100") {
                    layer.msg(data.msg);
                } else {
                    layer.msg(data.msg);
                }
            }

        });
        $(".refresh").click();
    });
    //撤销发布
    $('.btnCancel').click(function () {
        var programId = [];
        var parentId = [];
        var tr = $(".news_content :checked").parents("tr");
        $.each(tr, function () {
            var id = $(this).find("td:eq(1)").text();
            programId.push(id);
            var parent = $(this).find("td:eq(5)").text();
            parentId.push(parent);
        });
        $.ajax({
            url: serverUrl + "/PoliceChangPing/program/unpublic",
            type: "PUT",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "programId": programId,
                "parentId": parentId
            }),
            dataType: 'json',
            success: function (data) {
                if (data.code == "100") {
                    layer.msg(data.msg);
                } else {
                    layer.msg(data.msg);
                }
            }

        });
        $(".refresh").click();
    });

    //监听状态下拉菜单
    form.on('select(status)', function (data) {
        var status = data.value;
        $.get(serverUrl + "/PoliceChangPing/program/getProgramByStatus/" + status, function (data) {
            newsData = '';
            newsData = data.extend.programList;
            //分页栏 数据总数赋值
            $(".page_message").text("共" + newsData.length + "条")
            newsList();
        });
    });
    //上移适配
    $(".btnUpRemove").click(function() {
    	var state = "1";
    	var programId ;
    	var tr = $(".news_content :checked").parents("tr");
    	$.each(tr, function() {
 					var id = $(this).find("td:eq(1)").text();
 					programId = id;
 				});
		moving(state,programId);
	 	$(".refresh").click();
 	});
 	
 	//下移适配
    $(".btnDownRemove").click(function() {
    	var state = "0";
    	var programId ;
    	var tr = $(".news_content :checked").parents("tr");
    	$.each(tr, function() {
 					var id = $(this).find("td:eq(1)").text();
 					programId = id;
 				});
		moving(state,programId);
	 	$(".refresh").click();
 	});
    
    function moving(state,programId){
    	$.ajax({
	 		url: serverUrl + "/PoliceChangPing/program/programUpAndDownMoving",
	 		type: "POST",
	 		contentType: "application/json;charset=UTF-8",
	 		data: JSON.stringify({
	 			"programId": programId,
	 			"state":state
	 		}),
	 		dataType: 'json',
	 		success: function(data) {
	 			if(data.code == "100") {
	 				layer.msg(data.msg);
	 			} else {
	 				layer.msg(data.msg);
	 			}
	 		}
	
	 	});
    }
    
    //搜索功能
    $(".search-icon").click(function () {
        var search = $("#searchInput").val();
        $.get(serverUrl + "/PoliceChangPing/program/getProgramBySearch/" + search, function (data) {
            newsData = '';
            newsData = data.extend.programList;
            //分页栏 数据总数赋值
            $(".page_message").text("共" + newsData.length + "条")
            newsList();
        });

    });
    //刷新按钮
    $(".refresh").click(function () {
        window.location.reload(true);
    });


    //全选
    form.on('checkbox(allChoose)', function (data) {
        var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
        child.each(function (index, item) {
            item.checked = data.elem.checked;
        });
        form.render('checkbox');
    });

    //通过判断文章是否全部选中来确定全选按钮是否选中
    form.on("checkbox(choose)", function (data) {
        var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
        var childChecked = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"]):checked')
        data.elem.checked;
        if (childChecked.length == child.length) {
            $(data.elem).parents('table').find('thead input#allChoose').get(0).checked = true;
        } else {
            $(data.elem).parents('table').find('thead input#allChoose').get(0).checked = false;
        }
        form.render('checkbox');
    })

    function newsList() {
 	//渲染数据
 	function renderDate(data, curr, nums) {
 		/*console.log("11111" + JSON.stringify(data));*/
 		var dataHtml = '';
 		var currData = data.concat().slice(curr * nums - nums, curr * nums);
 		if(currData.length != 0) {
 			for(var i = 0; i < currData.length; i++) {
 				if(currData[i].parentId == 0) { //过滤二级栏目
 					var statue = '';
 					if(currData[i].status == "1") {
 						statue = '<td>' + '<sapn class="pub">已发布</sapn>' + '</td>';
 					} else {
 						statue = '<td>' + '<sapn class="state_unpub">未发布</sapn>' + '</td>';
 					}
 					var ificon = '';
 					if(currData[i].ifIcon == "0") {
 						ificon = '<td>否</td>';
 					} else {
 						ificon = '<td>是</td>';
 					}
 					dataHtml += '<tr>' +
 						'<td><input type="checkbox" name="checked" lay-skin="primary" lay-filter="choose"></td>' +
 						'<td align="center">' + currData[i].programId + '</td>' +
 						'<td >' + currData[i].programName + '</td>' +
 						ificon +
 						'<td>' + currData[i].programDesc + '</td>' +
 						'<td>' + currData[i].parentId + '</td>' +
 						statue +
 						'<td>' + currData[i].chinaDateCreateTime + '</td>' +
 						'</td>' +
 						'</tr>';
 				}
 			}
 		} else {
 			dataHtml = '<tr><td colspan="8">暂无数据</td></tr>';
 		}
 		return dataHtml;
 	}

 	//分页
 	var nums = 13; //每页出现的数据量

 	laypage.render({
 		elem: "page",
 		prev: '<img src="../../images/左翻.png"/>',
 		next: '<img src="../../images/右翻.png"/>',
 		pages: Math.ceil(newsData.length / nums),
 		count: newsData.length,
 		jump: function(obj) {
 			$(".news_content").html(renderDate(newsData, obj.curr, nums));
 			$('.news_list thead input[type="checkbox"]').prop("checked", false);
 			form.render();
 		}
 	})
 }

})