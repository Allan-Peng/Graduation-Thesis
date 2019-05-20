layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate','laypage'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
		
//新增二级栏目动态添加输入框
$(document).on("click", "#addImg", function() {
	$(".childrenBox").append('<div class="layui-row"><div class="layui-col-md8"><div class="layui-form-item"><div class="layui-input-block"><input type="text" placeholder="请输入" required lay-verify="required" autocomplete="off" class="layui-input" id="childrenName"></div></div></div><div class="layui-col-md2"><div class="layui-input-block deleteImgbox"><img id="deleteImg" src="../../images/删除.png"/><img id="addImg" src="../../images/添加.png"/></div></div></div>')
});

//动态删除二级栏目输入框
$(document).on("click", "#deleteImg", function() {
	$(this).parents('.layui-row').remove();
});



});