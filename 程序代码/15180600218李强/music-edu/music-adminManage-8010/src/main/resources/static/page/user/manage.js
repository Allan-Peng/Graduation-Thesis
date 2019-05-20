layui.use(['layer', 'form','laypage', 'jquery'], function(){
    var layer = layui.layer,
        form = layui.form,
        laypage = layui.laypage,
        $ = layui.jquery;
    showTable();
    function showTable(){
        $.get(serverUrl + "/api/user/getAllUser", function (data) {
            var newsData = data.extend.users;
            //分页栏 数据总数赋值
            $(".page_message").text("共" + newsData.length + "条")
            newsList(newsData);
        });
    }
    //适配页面数据
    function newsList(newsData) {

        //分页
        laypage.render({
            elem: 'pageNumber', //注意，这里的 test1 是 ID，不用加 # 号
            prev: '<img src="../../images/左翻.png"/>',
            next: '<img src="../../images/右翻.png"/>',
            pages: Math.ceil(newsData.length / 10),
            count: newsData.length, //数据总数，从服务端得到
            jump: function (obj) {
                $("#tableBody").append(renderDate(newsData, obj.curr, obj.limit));
                form.render();
            }
        });
        function renderDate(data, curr, nums) {
            var currData = data.concat().slice(curr * nums - nums, curr * nums);
            if (currData.length != 0) {
                $("#tableBody").empty();
                for (var i = 0; i < currData.length; i++) {
                    //判断是否禁用
                    var statue = '';
                    //判断是否是管理员
                    var checkBox='';
                    if (currData[i].state == 2||currData[i].state == 4) {
                        statue = "<td><sapn class='state_unpub pub'>" + "禁用" + "</sapn></td>";
                        checkBox= "<td><div class='layui-form'><input type='checkbox' lay-skin='primary' lay-filter='checkChild' value=" + currData[i].grapId + "></div></td>"
                    } else if(currData[i].state == 1||currData[i].state == 3){
                        statue = "<td><sapn class='state_unpub'>" + "启用" + "</sapn></td>";
                        checkBox= "<td><div class='layui-form'><input type='checkbox' lay-skin='primary' lay-filter='checkChild' value=" + currData[i].grapId + "></div></td>"
                    }else{
                        statue = "<td><sapn >" + "启用" + "</sapn></td>";
                        checkBox= "<td></td>"
                    }

                    var tr = $("<tr>" +
                        "<td>" + currData[i].username + "</td>" +
                        statue +
                        checkBox +
                        "</tr>");
                    $("#tableBody").append(tr);

                }

            }
        }
    }
    function refresh(){
        window.location.reload(true);
    }

    $('#enableUser').click(function () {
        var users = [];
        var tr = $("#tableBody :checked").parents("tr");
        $.each(tr, function () {
            var username= $(this).find("td:eq(0)").text();
            users.push(username);
        });
        $.ajax({
            url: serverUrl + "/api/user/enableUser",
            type: "PUT",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "users": users,
            }),
            dataType: 'json',
            success: function (data) {
                if (data.code == "100") {
                    layer.msg(data.msg);
                    showTable();
                } else {
                    layer.msg(data.msg);
                }
            }

        });

        //refresh();
    });
    $('#disableUser').click(function () {
        var users = [];
        var tr = $("#tableBody :checked").parents("tr");
        $.each(tr, function () {
            var username= $(this).find("td:eq(0)").text();
            users.push(username);
        });
        $.ajax({
            url: serverUrl + "/api/user/disableUser",
            type: "PUT",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "users": users,
            }),
            dataType: 'json',
            success: function (data) {
                if (data.code == "100") {
                    layer.msg(data.msg);
                    showTable();
                } else {
                    layer.msg(data.msg);
                }
            }

        });
        //refresh();

    });
});