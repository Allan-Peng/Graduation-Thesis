layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate','laypage'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;

	//绑定上传图片按钮
    $("#uploadbtn").click(function () {
        $("#upload").click();
    })

    //icon图片上传
    $("#upload").change(function () {
        var fileName = getFileName($("#upload").val());
        $(".upload_imgname").text(fileName);
        $("#form2").ajaxSubmit({
            url: serverUrl + "/PoliceChangPing/programInfo/fileUpload",
            success: function (data) {
                if (data.code == "100") {
                    $("#uploadImg").attr("src", serverUrl+serverFile+data.extend.imgSrc);
                    layer.msg(data.msg);
                } else {
                    console.log("失败");
                    layer.msg(data.msg);
                }
            }
        });

    });
    
    function getFileName(file) { //通过第一种方式获取文件名
        var pos = file.lastIndexOf("\\"); //查找最后一个\的位置
        return file.substring(pos + 1); //截取最后一个\位置到字符长度，也就是截取文件名
    }

    function getFileName2(file) {
        var pos = file.lastIndexOf("/");
        return file.substring(pos + 1);
    }
    
    
    
    
});