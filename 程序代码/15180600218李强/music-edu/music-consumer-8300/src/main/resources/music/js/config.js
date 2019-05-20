'use strict';

var config = {

    //前端接口地址
    serverUrl: window.location.protocol + "//" + window.location.host+"/consumer/degradeApi",
    //路由接口地址
    zuulUrl: window.location.protocol + "//" + window.location.host,
    //接口应用
    serverApp: 'pasture-api'

};

// 接口地址
var serverUrl = config.serverUrl;
var zuulUrl=config.zuulUrl;
//前端路由页面地址
var zuulUrlPage=zuulUrl+"/consumer";
var zuulUrlFile=zuulUrlPage+"/music/download/";

// 接口地址
var serverApp = config.serverApp;


