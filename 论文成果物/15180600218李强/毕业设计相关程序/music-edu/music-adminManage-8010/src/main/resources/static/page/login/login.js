layui.config({
	base: "js/"
}).use(['form', 'layer'], function() {
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		$ = layui.jquery;

	$('.login_btn').on('click', function(event) {
		//前端登陆
		if($("#username").val()=="admin"&&$("#password").val()=="admin"){
            window.sessionStorage.setItem("userName",$("#username").val());
            layer.msg("登陆成功");
            setTimeout(function () {
                window.location.href = '../../index.html';
            },1000);
		}else{
            layer.msg("登陆失败");
		}

        //发送请求后台实现登陆逻辑
		/*$.ajax({
			url: serverUrl+"/PoliceChangPing/login",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify({
				"username": $("#username").val(),
				"password": $("#password").val(),
			}),
			dataType: 'json',
			success: function(data) {
				if(data.code == 100) {
                    window.sessionStorage.setItem("userName",data.extend.username);
                    layer.msg("登陆成功");
                    setTimeout(function () {
                        window.location.href = '../../index.html';
                    },1000)


				} else {
                    layer.msg("登陆失败");
				}
			}

		});*/
		return false;
	});

})