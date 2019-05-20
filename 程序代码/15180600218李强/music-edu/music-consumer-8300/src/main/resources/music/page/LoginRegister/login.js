layui.config({
	base: "js/"
}).use(['form', 'layer'], function() {
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		$ = layui.jquery;

	$('.login_btn').on('click', function(event) {

		$.ajax({
			url: serverUrl+"/login",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify({
				"username": $("#username").val(),
				"password": $("#password").val(),
			}),
			dataType: 'json',
			success: function(data) {
				if(data.code == 100) {
                    //window.sessionStorage.setItem("userName",data.extend.username);
                    //创建一个cookie存放用户名
                    $.cookie('username', data.extend.username, { expires: 1, path: '/consumer' });
                    layer.msg(data.extend.info);
                    setTimeout(function () {
                        window.location.href = zuulUrlPage+'/index.html';
                    },1000)
				} else {
                    layer.msg(data.extend.info);

				}
			}

		});
		return false;
	});

});