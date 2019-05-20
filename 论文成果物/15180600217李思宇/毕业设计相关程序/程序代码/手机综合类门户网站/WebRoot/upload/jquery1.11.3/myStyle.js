function jiaohuan() {
	document.getElementById('icon1').src = "images/giftHover.png";
}
function huanyuan() {
	document.getElementById('icon1').src = "images/giftNoTouch.png";
}
function jiaohuan2() {
	document.getElementById('icon2').src = "images/giftHover.png";
}
function huanyuan2() {
	document.getElementById('icon2').src = "images/giftNoTouch.png";
}
function jiaohuan3() {
	document.getElementById('icon3').src = "images/capTouch.png";
}
function huanyuan3() {
	document.getElementById('icon3').src = "images/cap.png";
}
function jiaohuan4() {
	document.getElementById('icon4').src = "images/capTouch.png";
}
function huanyuan4() {
	document.getElementById('icon4').src = "images/cap.png";
}
function myFunction1() {
	/*// alert("ss");
	var pe = [ {
		"typeId" : 1,
		"typeName" : "javaee",
		"brief" : "关于javaEE前后端的知识"
	}, {
		"typeId" : 2,
		"typeName" : "test",
		"brief" : "关于javaEE前后端的知识"
	} ];
alert(pe[0].typeName);
	var txt = null;
	for ( var key in pe) {
		//console.log(key + "--" );
		
		for (colName in pe[key])
			{
			console.log(pe[key][colName]);
			}

	
	}*/
	var fso, ts, s ;
	var ForReading = 1;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	ts = fso.OpenTextFile("title.json", ForReading);
	s = ts.ReadLine();
	
}

var mt = 0;
window.onload = function() {
	var mydiv = document.getElementById("navv");
	var mt = mydiv.offsetTop;
	window.onscroll = function() {
		var t = document.documentElement.scrollTop || document.body.scrollTop;
		if (t > mt) {
			mydiv.style.position = "fixed";
			mydiv.style.top = "0";
		} else {
			mydiv.style.position = "static";
		}
	}
}

function myFunction(){
	var jsondata={};
	$.getJSON("title.json", function (data,status){
	//console.log("是是不是成功读到数据"+status);
	if( status=='success'){
	jsondata = data;
	//在这里可以调用函数
	alert("成功")
	var txt = null;
	for ( var key in jsondata) {
		console.log(key + "--" );
		
		for (colName in jsondata[1])
			{
			console.log(colName);
			console.log(jsondata[1][colName]);
			}
		}
	return jsondata;
	}else{
	console.log("没有读取到本地文件："+status);
	return false;
	}
	})
	}
