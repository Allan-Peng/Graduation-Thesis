function initHeader(highMenu){
    //给header添加当前页面样式
    $('.menu').find('li').removeClass("active");
    $('#'+highMenu).addClass("active");
    //判断cookie根据不同的cookie显示不同的块
    var username=$.cookie('username');
    //若cookie中有用户名则显示登陆后的
    if(username!=""){
        $('#menuLoginAfter').show();
        $('#menuLoginBefore').hide();
        //用户名的显示
        $('#menuUsername').text(username);
    }
    //若没有则显示登陆前的
    else{
        $('#menuLoginAfter').hide();
        $('#menuLoginBefore').show();
    }
    //登出功能的绑定
    $('#logout').click(function () {
        $.cookie('username', '');
        window.location.href=zuulUrlPage+"/index.html"
    });
}
function addHeaderAndFooter() {
    //加载header
    $('.header_top').load(zuulUrlPage+"/page/component/header.html");
    //加载footer
    $('.footer').load(zuulUrlPage+"/page/component/footer.html");
    $('.copy').load(zuulUrlPage+"/page/component/link.html");

   /* var msgSuccess = {};
    msgSuccess.dialog1 = jqueryAlert({
        'content': '处理成功',
        'closeTime': 2000,
    });
    var msgFail={};
    msgFail.dialog1 = jqueryAlert({
        'content': '处理失败',
        'closeTime': 2000,
    });*/
}
//前端时间戳格式化
function timestampToTime(timestamp) {
    var date = new Date(timestamp); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
    var Y = date.getFullYear() + '-';
    var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
    var D = date.getDate() + ' ';
    var h = date.getHours() + ':';
    var m = date.getMinutes() + ':';
    var s = date.getSeconds();
    return Y + M + D+h+m+s;
}
//?后的参数获取
function getPara(key) {
    //获取到连接后面的参数比如id=1&name=fff
    var urlParaStr=window.location.href.split("?")[1];
    //将上述字符串分割得到[id=1,name=fff]
    var paraArr=urlParaStr.split("&");
    //遍历该数组
    var result="";
    $.each(paraArr,function (i,item) {
        //按照“=”号分割变成[id,1]
        var arr=item.split("=");
        if(arr[0]==key){
            result=arr[1];
        }
    });
    return result;
}
