/*
$("#parent_pro_id ").val(article.parentProId);//父级目录id 所属栏目id
$("#pro_id").val(article.proId);//自己栏目id 二级栏目id
$("#title").val(article.title);//标题
$("#author").val(article.author);//作者
$("#uploadImg").attr("src", article.icon);//上传图片图片链接../../upload/
$('.upload_imgname').text(getFileName2(article.icon));
$("#way").val(article.grapType); //文章输入的方式
$("#articleUrl").val(article.url);//文章链接
$("#save").attr("grap_id",article.grapId);//文章id
ueditor.ready(function () {
    ueditor.setContent(article.content);
});*/
layui.config({
    base: "js/"
}).use(['form', 'element', 'layer', 'laypage', 'jquery'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        element = layui.element,
        laypage = layui.laypage,
        $ = layui.jquery;
    var article = JSON.parse(window.sessionStorage.getItem("article"));
    console.log(article);
    $("#title").text(article.title);//标题
    $("#author").text(article.author);//作者
    $("#data").text(article.chinaDateCreateTime);//作者

  /*  $("#txt").html(article.content);

    article.content=$('#txt').html();
    ueditor.setContent(article.content);
    $("#txt").empty();*/


    $("#content").html(article.content);
    $.each($("#content").find('img'),function () {
        //数据库中的地址
        var imgsrc=$(this).attr('src');
        //拼串后回显的地址
        $(this).attr('src', serverUrl+serverFile+imgsrc);
    });

});