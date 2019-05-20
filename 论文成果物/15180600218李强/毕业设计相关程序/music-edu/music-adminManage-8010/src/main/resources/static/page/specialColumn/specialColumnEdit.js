layui.config({
	base: "js/"
}).use(['form', 'layer', 'jquery', 'layedit', 'laydate', 'laypage'], function() {
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
	var program = JSON.parse(sessionStorage.getItem('program'));
	if(program) {
		adapter();
	}
	//获取父页面数据
	function adapter() {
		$('#programId').val(program.programId);
		$('#parentId').val(program.parentId);
		$('#title').val(program.programName);
		$('#ifIcon').val(program.ifIcon);
		$('#programDesc').val(program.programDesc);
		$(".childrenBox").empty();
		form.render('select');
		$.ajax({
			url: serverUrl + "/PoliceChangPing/program/getChildProName",
			type: 'POST',
			data: JSON.stringify({
				"programId": program.programId
			}),
			contentType: "application/json",
			dataType: 'json',
			success: function(data) {
				if(data.code == "100") {
					var childProName = data.extend.childNameList;
					var moveImg;
					if(childProName.length != 0) {
						for(var i = 0; i < childProName.length; i++) {
							if(childProName[i].sort == 0) {
								moveImg = '<img class="moveImg" id="downImg" data="' + childProName[i].programId + '"  src="../../images/向下一行.png"/>';
							} else if(childProName[i].sort < childProName.length - 1) {
								moveImg = '<img class="moveImg" id="upImg" data="' + childProName[i].programId + '"  src="../../images/向上一行.png"/><img class="moveImg" id="downImg" data="' + childProName[i].programId + '"  src="../../images/向下一行.png"/>';
							} else {
								moveImg = '<img class="moveImg" id="downImg" data="' + childProName[i].programId + '"  src="../../images/向上一行.png"/>';
							}
							var html = '<div class="layui-row"><div class="layui-col-md8"><div class="layui-form-item"><div class="layui-input-block childBoxList">';
							html += '<input type="text" name="childProId" class="childProId" value="' + childProName[i].programId + '" style="display:none"/>';
							html += '<input type="text" placeholder="请输入" required lay-verify="required" autocomplete="off" class="layui-input childrenProName" id="' + childProName[i].programId + '"></div></div></div><div class="layui-col-md2">';
							html += '<div class="layui-input-block deleteImgbox">' + moveImg + '<img id="deleteImg" data="' + childProName[i].programId + '" src="../../images/删除.png"/><img id="addImg" src="../../images/添加.png"/></div></div></div>';
							$(".childrenBox").append(html);
							$('#' + childProName[i].programId).val(childProName[i].programName);
							form.render();
						}
					}
					form.render('select');
				} else {
					layer.msg(data.msg);
				}
			}
		});
	}

	//动态删除二级栏目输入框
	$(document).on("click", "#deleteImg", function() {
		$(this).parents('.layui-row').remove();
		var programId = [];
		var parentId = [];
		programId.push($(this).attr("data"));
		parentId.push(program.programId);
		$.ajax({
			url: serverUrl + "/PoliceChangPing/program/delete",
			type: "delete",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify({
				"programId": programId,
				"parentId": parentId
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
	});

	//新增二级栏目动态添加输入框
	$(document).on("click", "#addImg", function() {
		$(".childrenBox").append('<div class="layui-row"><div class="layui-col-md8"><div class="layui-form-item"><div class="layui-input-block childBoxList"><input type="text" name="childProId" class="childProId" value="newChild" style="display:none"/><input type="text" placeholder="请输入" required lay-verify="required" autocomplete="off" class="layui-input childrenProName" id="childrenName"></div></div></div><div class="layui-col-md2"><div class="layui-input-block deleteImgbox"><img id="deleteImg" src="../../images/删除.png"/><img id="addImg" src="../../images/添加.png"/></div></div></div>');
	});

	//上移适配
	$(document).on("click", "#upImg", function() {
		var state = "1";
		var programId = $(this).attr("data");
		moving(state, programId);
	});

	//下移适配
	$(document).on("click", "#downImg", function() {
		var state = "0";
		var programId = $(this).attr("data");
		moving(state, programId);
	});

	function moving(state, programId) {
		$.ajax({
			url: serverUrl + "/PoliceChangPing/program/programUpAndDownMoving",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify({
				"programId": programId,
				"state": state
			}),
			dataType: 'json',
			success: function(data) {
				if(data.code == "100") {
					layer.msg(data.msg);
					adapter();
				} else {
					layer.msg(data.msg);
				}
			}

		});
	}

});