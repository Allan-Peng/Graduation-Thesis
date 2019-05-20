layui.config({
	base: "js/"
}).use(['form'/*, 'layer'*/], function() {
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer;
	/*	$ = layui.jquery;*/

	$('.login_btn').on('click', function(event) {
		$.ajax({
			url: serverUrl+"/register",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify({
				"username": $("#username").val(),
				"password": $("#password").val(),
                "email": $("#email").val(),
			}),
			dataType: 'json',
			success: function(data) {
				if(data.code == 100) {
                    //window.sessionStorage.setItem("userName",data.extend.username);
                    //创建一个cookie存放用户名
                    $.cookie('username', data.extend.username, { expires: 1, path: '/' });
                    layer.msg("注册成功");
                    setTimeout(function () {
                        window.location.href =zuulUrlPage+'/index.html';
                    },1000)

				} else {
                    layer.msg("注册失败");
                    window.location.href = zuulUrlPage+'/page/LoginRegister/register.html';
				}
			}

		});
		return false;
	});

});