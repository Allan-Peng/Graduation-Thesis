layui.config({
    base: "js/"
}).use(['form', 'element', 'layer', 'laypage', 'jquery'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        element = layui.element,
        laypage = layui.laypage,
        $ = layui.jquery;
    //实例化Ueditor
    var ueditor = UM.getEditor('myEditor');
    //加载页面数据
    var newsData = '';
    $.get(serverUrl + "/api/article/getAllArticle", function (data) {
        newsData = data.extend.graphicsList;
        //分页栏 数据总数赋值
        $(".page_message").text("共" + newsData.length + "条")
        newsList();
    });
    //加载新增或编辑时  栏目下拉选框
    //获取一级栏目信息
    /*$.ajax({
        url: serverUrl + "/PoliceChangPing/program/getParentProName",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify({}),
        dataType: 'json',
        success: function (data) {
            if (data.code == "100") {
                var parentProName = data.extend.parentNameList;
                if (parentProName.length != 0) {
                    for (var i = 0; i < parentProName.length; i++) {

                        var html = '<option value="' + parentProName[i].programId + '">' + parentProName[i].programName + '</option>';
                        $("#parent_pro_id").append(html);
                    }
                }
                form.render('select');
            } else {
                layer.msg(data.msg);
            }
        }

    });*/
    //监听一级栏目，联动下拉选择二级栏目
    form.on('select(parentProName)', function (data) {
        $("#pro_id").empty();
        //获得省份ID
        var programId = data.value;
        $.ajax({
            url: serverUrl + "/PoliceChangPing/program/getChildProName",
            type: 'POST',
            data: JSON.stringify({
                "programId": programId
            }),
            contentType: "application/json",
            dataType: 'json',
            success: function (data) {
                if (data.code == "100") {
                    var childProName = data.extend.childNameList;
                    if (childProName.length != 0) {
                        for (var i = 0; i < childProName.length; i++) {
                            var html = '<option value="' + childProName[i].programId + '">' + childProName[i].programName + '</option>';
                            $("#pro_id").append(html);
                        }
                    }
                    form.render('select');
                } else {
                    $("#pro_id").empty();
                    layer.msg("暂无子栏目");
                    form.render('select');
                }
            }
        });

    });

    //适配页面数据
    function newsList() {
        function renderDate(data, curr, nums) {
            var currData = data.concat().slice(curr * nums - nums, curr * nums);
            if (currData.length != 0) {
                $("#tableBody").empty();
                for (var i = 0; i < currData.length; i++) {
                    //判断发布状态
                    var statue = '';
                    if (currData[i].status == "0") {
                        statue = "<td><sapn class='state_unpub pub'>" + "未发布" + "</sapn></td>";
                    } else {
                        statue = "<td><sapn class='state_unpub'>" + "已发布" + "</sapn></td>";
                    }
                    var tr = $("<tr>" +
                        "<td><div class='layui-form'><input type='checkbox' lay-skin='primary' lay-filter='checkChild' value=" + currData[i].grapId + "></div></td>" +
                        "<td>" + currData[i].id + "</td>" +
                        "<td><p>" + currData[i].title + "</p></td>" +
                        "<td>" + currData[i].author + "</td>" +
                        "<td>" + currData[i].brief + "</td>" +
                        statue +
                        "<td>" + timestampToTime(currData[i].createTime) + "</td>" +
                        "<td>" + timestampToTime(currData[i].updateTime)+ "</td>" +
                        "</tr>");
                    $("#tableBody").append(tr);

                }

            }
        }

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

    }
    //时间格式转化
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
    //清空新增页面的值
    function clearAdd() {
        $("#parent_pro_id").val("");//父级目录id 所属栏目id
        $("#pro_id").val("");//自己栏目id 二级栏目id
        $("#title").val("");//标题
        $("#author").val("");//作者
        $(".upload_imgname").text("");//上传图片图片链接   /图片名
        $("#way").val(""); //文章输入的方式
        $("#articleUrl").val("");//文章链接
        ueditor.ready(function () {
            UM.getEditor('myEditor').setContent("");
        });
        //文章内容获取Ueditor中的内容
    }

    //绑定导航栏新增文章按钮点击事件
    $("#addArticle").click(function () {
        $("#articleList").hide();
        $("#articleAdd").show();
        //清空新增页面的值
        clearAdd();
        $("#link").hide();
        $("#type").hide();
        //保存和更新按钮逻辑
        $("#save").show();
        $("#save2").hide();
        form.render();
    });
    //全选
    form.on('checkbox(checkAll)', function (data) {
        $(":checkbox").prop("checked", data.elem.checked);
        form.render('checkbox');

    });
    //通过判断文章是否全部选中来确定全选按钮是否选中
    form.on('checkbox(checkChild)', function (data) {
        var flag = true;
        $.each($("#tableBody :checkbox"), function () {
            if ($(this).prop("checked")) {
            } else {
                flag = false;
            }
        });
        $("thead :checkbox").prop("checked", flag);
        form.render('checkbox');
    });

    //监听新增文章输入方式  0是输入  1是链接
    form.on('select(way)', function (data) {
        if (data.value == 1) {
            $("#type").hide();
            $("#link").show();
        } else if (data.value == 0) {
            $("#type").show();
            $("#link").hide();
        } else if (data.value == -1) {
            $("#link").hide();
            $("#type").hide();
        }
    });
    //新增文章页面返回事件绑定
    $('#back').click(function () {
        $("#articleList").toggle();
        $("#articleAdd").toggle();
    });
    //发布按钮绑定
    $("#publish").click(function () {
        var ids = [];
        var tr = $("#tableBody :checked").parents("tr");
        $.each(tr, function () {
            var id = $(this).find("td:eq(1)").text();
            ids.push(id);
        });
        $.ajax({
            url: serverUrl + "/api/article/public",
            type: "PUT",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "articleIds": ids,
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
        $("#refresh").click();
    });
    //未发布按钮绑定
    $("#unpublish").click(function () {
        var ids = [];
        var tr = $("#tableBody :checked").parents("tr");
        $.each(tr, function () {
            var id = $(this).find("td:eq(1)").text();
            ids.push(id);
        });
        $.ajax({
            url: serverUrl + "/api/article/unpublic",
            type: "PUT",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "articleIds": ids,
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
        $("#refresh").click();
    })
    //删除按钮绑定
    $("#delete").click(function () {
        var ids = [];
        var tr = $("#tableBody :checked").parents("tr");
        $.each(tr, function () {
            var id = $(this).find("td:eq(1)").text();
            ids.push(id);
        });

        $.ajax({
            url: serverUrl + "/api/article/delete",
            type: "DELETE",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "articleIds": ids,
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
        $("#refresh").click();
    });
    //监听状态下拉菜单
    form.on('select(status)', function (data) {
        var status = data.value;
        $.get(serverUrl + "/api/article/getArticleByStatus/" + status, function (data) {
            newsData = '';
            newsData = data.extend.graphicsList;
            //分页栏 数据总数赋值
            $(".page_message").text("共" + newsData.length + "条")
            newsList();
        });
    });
    //搜索功能
    $("#searchBtn").click(function () {
        var search = $("#searchInput").val();
        $.get(serverUrl + "/api/article/getArticleBySearch/" + search, function (data) {
            newsData = '';
            newsData = data.extend.graphicsList;
            //分页栏 数据总数赋值
            $(".page_message").text("共" + newsData.length + "条")
            newsList();
        });

    });
    //刷新按钮
    $("#refresh").click(function () {
        window.location.reload(true);
    });
    //绑定上传图片按钮
    $("#uploadbtn").click(function () {
        $("#upload").click();
    })

    //icon图片上传
    $("#upload").change(function () {
        var fileName = getFileName($("#upload").val());
        $(".upload_imgname").text(fileName);
        $("#form2").ajaxSubmit({
            url: serverUrl + "/api/article/pngUpload",
            contentType: "charset=UTF-8",
            data:{
              "fileName":fileName
            },
            success: function (data) {
                if (data.code == "100") {
                    $("#uploadImg").attr("src", serverUrl + serverFile + data.extend.imgSrc);
                    $("#realPngName").text(data.extend.imgSrc);
                    layer.msg(data.msg);
                } else {
                    console.log("失败");
                    layer.msg(data.msg);
                }
            }
        });

    });
    //um视频上传
    $('#type').on('change', "#umeditorUploadId", function () {
        /* $('#eduiVideoUrl').val('http://localhost:8080/bss-manager/download/file/editor/movie.mp4');
         $("#eduiVideoUrl").trigger('change');*/
        $('#umeditorUploadId').parent().attr("action", serverUrl + "/api/article/uploadVideo").attr("enctype", "multipart/form-data").attr("method", "POST");
        $('#umeditorUploadId').parent().ajaxSubmit({
            success: function (data) {
                console.log(data);
                $('#eduiVideoUrl').val(serverUrl + serverFile + data);
                $("#eduiVideoUrl").trigger('change');
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
    //替换ueditor默认的路径 将路径只换成文件名字
    function replaceSrc(lable) {
        $.each($("#txt").find(lable), function () {
            //真实图片访问地址
            var lableSrc = $(this).attr('src');
            //存入数据库中的地址
            $(this).attr('src', getFileName2(lableSrc));
        });
    }

    //新增文章
    $("#save").click(function () {
        var txt = "";
        ueditor.ready(function () {
            txt = UM.getEditor('myEditor').getContent();
            $("#txt").html(txt);

           /* $.each($("#txt").find('img'), function () {
                //真实图片访问地址
                var imgsrc = $(this).attr('src');
                //存入数据库中的地址
                $(this).attr('src', getFileName2(imgsrc));
            });*/
            replaceSrc('img');
            replaceSrc('video');

            txt = $('#txt').html();
            $("#txt").empty();
        });


        $.ajax({
            url: serverUrl + "/api/article/insertArticle",
            type: "POST",
            //请求体内容的方式
            contentType: "application/json;charset=UTF-8",
            //请求体
            data: JSON.stringify({
                "title": $("#title").val(),//标题
                "author": $("#author").val(),//作者
                "brief":$('#brief').val(),
                "icon": $("#realPngName").text(),//上传图片图片链接   /图片名
                "grapType": $("#way").val(), //文章输入的方式
                "url": $("#articleUrl").val(),//文章链接
                "content": txt  //文章内容获取Ueditor中的内容
            }),
            //服务器相应的内容格式
            dataType: 'json',
            //请求成功后的回调函数
            success: function (data) {
                if (data.code == 100) {
                    layer.msg(data.msg);
                    $("#refresh").click();
                } else {
                    layer.msg(data.msg);
                }
            }
        });
    });
    //编辑文章  文章详情获取
    $("#update").click(function () {
        //获取要编辑的文章数据
        var tr = $("#tableBody :checked").parents("tr");
        var id = tr.find("td:eq(1)").text();
        var title = tr.find("td:eq(2)").children("p").text();
        $.ajax({
            url: serverUrl + "/api/article/getArticle/" + id ,
            type: "GET",
            dataType: 'json',
            success: function (data) {
                if (data.code == 100) {
                    $("#addArticle").click();
                    $("#save").hide();
                    $("#save2").show();
                    var article = data.extend.article;
                    $("#title").val(article.title);//标题
                    $("#author").val(article.author);//作者
                    $("#brief").val(article.brief);
                    $("#uploadImg").attr("src", serverUrl + serverFile + article.icon);//上传图片图片链接../../upload/
                    $('.upload_imgname').text(getFileName2(article.icon));
                    $("#way").val(article.grapType); //文章输入的方式
                    $("#articleUrl").val(article.url);//文章链接
                    $("#save").attr("grap_id", article.id);//文章id
                    ueditor.ready(function () {
                        $("#txt").html(article.content);
                        $.each($("#txt").find('img'), function () {
                            //数据库中的地址
                            var imgsrc = $(this).attr('src');
                            //拼串后回显的地址
                            $(this).attr('src', serverUrl + serverFile + "/" + imgsrc);
                        });
                        article.content = $('#txt').html();
                        ueditor.setContent(article.content);
                        $("#txt").empty();
                    });
                    if (article.grapType == "1") {
                        $("#type").hide();
                        $("#link").show();
                    } else if (article.grapType == "0") {
                        $("#type").show();
                        $("#link").hide();
                    } else {
                        $("#link").hide();
                        $("#type").hide();
                    }
                    form.render();
                } else {
                    layer.msg(data.msg);
                }
            }

        });

    });
    //预览文章  文章详情获取
    $("#preview").click(function () {
        //获取要编辑的文章数据
        var tr = $("#tableBody :checked").parents("tr");
        var id = tr.find("td:eq(1)").text();
        $.ajax({
            url: serverUrl + "/api/article/getArticle/" + id ,
            type: "GET",
            dataType: 'json',
            success: function (data) {
                if (data.code == 100) {
                    var article = JSON.stringify(data.extend.article);

                    window.sessionStorage.setItem("article", article);
                    window.parent.location.href = "../../details.html"
                } else {
                    layer.msg(data.msg);
                }
            }

        });
    });
    //编辑文章  文章更新提交
    $("#save2").click(function () {
        var txt = "";
        ueditor.ready(function () {
            //获取纯文本内容，返回: hello
            txt = UM.getEditor('myEditor').getContent();
            $("#txt").html(txt);
            $.each($("#txt").find('img'), function () {
                //真实图片访问地址
                var imgsrc = $(this).attr('src');
                //存入数据库中的地址
                $(this).attr('src', getFileName2(imgsrc));
            });
            txt = $('#txt').html();
            $("#txt").empty();
        });
        $.ajax({
            url: serverUrl + "/api/article/updateArticle",
            type: "PUT",
            //请求体内容的方式
            contentType: "application/json",
            //请求体
            data: JSON.stringify({
                "title": $("#title").val(),//标题
                "author": $("#author").val(),//作者
                "icon": "/" + $(".upload_imgname").text(),//上传图片图片链接   /图片名
                "grapType": $("#way").val(), //文章输入的方式
                "url": $("#articleUrl").val(),//文章链接
                "content": txt, //文章内容获取Ueditor中的内容
                "id": $("#save").attr("grap_id")//文章id
            }),
            //服务器相应的内容格式
            dataType: 'json',
            //请求成功后的回调函数
            success: function (data) {
                if (data.code == 100) {
                    layer.msg(data.msg);
                    $('#back').click();
                } else {
                    layer.msg(data.msg);
                }
            }
        });
        $("#refresh").click();
    });

});