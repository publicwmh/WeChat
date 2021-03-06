﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyDeclareList.aspx.cs" Inherits="WeChat.Page.MyBusiness.MyDeclareList" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>--%>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1" />
    <title>我的报关单</title>
    <link href="/css/iconfont/iconfont.css?t=<%=ConfigurationManager.AppSettings["Version"]%>" rel="stylesheet" />
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css" />
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css" />
    <script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <link rel="stylesheet" href="/css/extraSearch.css?t=<%=ConfigurationManager.AppSettings["Version"]%>" />
    <link rel="stylesheet" href="/css/SubscribeInfo.css?t=<%=ConfigurationManager.AppSettings["Version"]%>" />    
    <script type="text/javascript" src="/js/extraSearch.js?t=<%=ConfigurationManager.AppSettings["Version"]%>" ></script>
    <script type="text/javascript" src="/js/SubscribeInfo.js?t=<%=ConfigurationManager.AppSettings["Version"]%>"></script>
    <script type="text/javascript" src="/js/BusiInfoDetail.js?t=<%=ConfigurationManager.AppSettings["Version"]%>"></script>

    <style>
        #page-infinite-scroll-bottom .bar input[type=search]{
             margin:.2rem 0;
        }
        #page-infinite-scroll-bottom .bar .button {
            top:0;
        }
        #page-infinite-scroll-bottom .bar-nav ~ .content {
            top: 6.2rem;
        }
        #page-infinite-scroll-bottom .search-input input{
            border-radius:0;font-size:13px;
        }
        #div_list .list-block{
            font-size:13px;
            margin:.2rem 0;
        }
        #div_list .list-block .item-content{
            height:1.3rem;
            min-height:1.3rem;
        }
        #div_list .list-block .item-inner{
            height:1.3rem;
            min-height:1.3rem;
            PADDING-RIGHT: 0;
        }
        .picker-items-col.picker-items-col-center{
             width: 100%;
        }
        .picker-items-col-wrapper
        {
           width: 100%;
        }
         /************************************************ *********************************/
        .filediv .modal-inner{
             padding:0;
         }
        .filediv .modal-title{
            text-align:right;
        }
        .filediv .modal-title+.modal-text{
            margin-top:0;
        }
         /************************************************ 查询列表名称*********************************/
        .girdnamediv {
            width: 98%;
            left: 1%;
            right: 1%;
            margin-left: 0px;
            text-align: left;
            top: 3.1rem;
        } 
        .girdnamediv .modal-inner{
           padding:0px;
        }  
        /************************************************ 报关订阅*********************************/
        #pop_sub_decl
        {
            background-color:#1D2E3C;
            color:white;
            margin-top:1rem;
        }
        #pop_sub_decl .row
        {
            background-color:#456581;
            border-top:solid 1px white;
            margin:0rem;
            font-size:initial;
            vertical-align:middle;
            height:2rem;
            line-height:2rem;
        }
        #pop_sub_decl .col-33
        {
            padding-top:0.2rem;
        }
       
        #pop_sub_decl .myrow
        {
            line-height:2rem;
            padding-left:4%;
        }
        #pop_sub_decl input
        {
            font-family:"微软雅黑";
            width:6rem;
            height: 1.5rem;
            border: none;
            border-radius: .15rem;
            font-size: .8rem;
        }
        .float-button {
            position: fixed;
            bottom: 120px;
            right: 0px;
            z-index: 300;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            //---------------------------------------------------------------------------------------------------------------列表名称
            function showGridName() {
                var strname = '<div class="list-block" style="margin:0;font-size:small;">'
                            + '<ul>'
                                + '<li class="item-content" style="min-height:1.3rem;height:1.3rem;">'
                                    + '<div class="item-inner row" style="min-height:1.3rem;height:1.3rem;">'//border-top:2px solid #0894EC;border-left:2px solid #0894EC;border-right:2px solid #0894EC;
                                        + '<div class="item-title col-50">报关单号</div>'
                                        + '<div class="item-title col-33">业务类型</div>'
                                        + '<div class="item-title col-20">监管方式</div>'
                                    + '</div>'
                                + '</li>'
                                + '<li class="item-content" style="min-height:1.3rem;height:1.3rem;">'
                                    + '<div class="item-inner row" style="min-height:1.3rem;height:1.3rem;">'//border-top:2px solid #0894EC;border-left:2px solid #0894EC;border-right:2px solid #0894EC;
                                        + '<div class="item-title col-50">收发货人</div>'
                                        + '<div class="item-title col-33">合同号</div>'
                                        + '<div class="item-title col-20">申报日期</div>'
                                    + '</div>'
                                + '</li>'
                                + '<li class="item-content" style="min-height:1.3rem;height:1.3rem;">'
                                    + '<div class="item-inner row" style="min-height:1.3rem;height:1.3rem;">'//border-top:2px solid #0894EC;border-left:2px solid #0894EC;border-right:2px solid #0894EC;
                                        + '<div class="item-title col-50">运输工具</div>'
                                        + '<div class="item-title col-33">删改单</div>'
                                        + '<div class="item-title col-20">海关状态</div>'
                                    + '</div>'
                                + '</li>'
                                + '<li class="item-content" style="min-height:1.3rem;height:1.3rem;">'
                                    + '<div class="item-inner row" style="min-height:1.3rem;height:1.3rem;">'//border:2px solid #0894EC;
                                        + '<div class="item-title col-50">提运单号</div>'
                                        + '<div class="item-title col-33">企业编号</div>'
                                    + '</div>'
                                + '</li>'
                            + '</ul>'
                        + '</div>';
                $.modal({
                    //title: '<b>更多查询</b>',
                    text: strname,
                    //buttons: [{ text: '取消', bold: true, onClick: function () { } }],
                    extraClass: 'girdnamediv'//避免直接设置.modal的样式，从而影响其他toast的提示
                });

                $(document).on('click', '.girdnamediv', function () {
                    $.closeModal(".girdnamediv");
                });

            }

            //----------------------------------------------------------------------------------------------------------------查询条件
            initsearch_condition();
            initSerach_Declare();

            //---------------------------------------------------------------------------------------------------------------------
            var loading = false;
            var itemsPerLoad = 10;// 每次加载添加多少条目                
            var maxItems = 100;// 最多可加载的条目
            var lastIndex = 0;//$('.list-block').length;//.list-container li       

            $("#btn_gridname_m").click(function () {
                showGridName();
            });

            $("#btn_search_m").click(function () {
                select(); 
            });

            $("#btn_reset_m").click(function () {
                $("#txt_reptime_s").val(""); $("#txt_reptime_e").val("");
                $("#txt_reptime_s").calendar({}); $("#txt_reptime_e").calendar({});//否则之前选的那天  不能再次选中

                $("#txt_declcode").val("");
                $("#picker_CUSTOMSSTATUS").picker("setValue", ["全部"]); $("#picker_MODIFYFLAG").picker("setValue", ["全部"]);

                $("#txt_busitype").val("");
                $("#txt_ischeck").val("");
                $("#txt_ispass").val("");

                $("#txt_busiunit").val(""); 
                $("#txt_ordercode").val("");
                $("#txt_cusno").val("");
                $("#txt_tradeway").val(""); 
                $("#txt_contractno").val(""); 
                $("#txt_blno").val(""); 
                $("#txt_submittime_s").val("");
                $("#txt_submittime_e").val(""); 
                $("#txt_sitepasstime_s").val(""); 
                $("#txt_sitepasstime_e").val(""); 
            });

            function select() {
                $.showPreloader('加载中...');
                setTimeout(function () {
                    $.closeModal();
                    //首次查询需要置为初始值
                    $('#div_list').html(""); $("#span_curchose").text(0);
                    loading = false; itemsPerLoad = 10; lastIndex = 0;
                    var scroller = $('.native-scroll');

                    //首次查询，需要加载监听事件及加载符号
                    $('.infinite-scroll-preloader').show();
                    $.attachInfiniteScroll($('.infinite-scroll'));

                    loaddata(itemsPerLoad, lastIndex);
                    lastIndex = $('#div_list .list-block').length;// 更新最后加载的序号
                    $.refreshScroller();
                    scroller.scrollTop(0); //首次查询后，滚动条需要置为初始值0

                    if (lastIndex < itemsPerLoad) {
                        $.detachInfiniteScroll($('.infinite-scroll'));// 加载完毕，则注销无限加载事件，以防不必要的加载     
                        $('.infinite-scroll-preloader').hide();

                        if (lastIndex == 0) { $.toast("没有符合的数据！"); }
                        else { $.toast("已经加载到最后"); }
                    }

                    $.hidePreloader();
                }, 500);
            }

            //无限滚动
            $(document).on("pageInit", "#page-infinite-scroll-bottom", function (e, id, page) {
                $('.infinite-scroll-preloader').hide();

                $(page).on('infinite', function () {
                    if (loading) return;// 如果正在加载，则退出                    
                    loading = true;// 设置flag

                    $('.infinite-scroll-preloader').show();
                    $.attachInfiniteScroll($('.infinite-scroll'));

                    setTimeout(function () {
                        loading = false;// 重置加载flag
                        if (lastIndex >= maxItems || lastIndex % itemsPerLoad != 0) {
                            $.detachInfiniteScroll($('.infinite-scroll'));// 加载完毕，则注销无限加载事件，以防不必要的加载     
                            $('.infinite-scroll-preloader').hide();

                            $.toast("已经加载到最后");
                            return;
                        }

                        loaddata(itemsPerLoad, lastIndex);

                        if (lastIndex == $('#div_list .list-block').length) {
                            $.detachInfiniteScroll($('.infinite-scroll'));// 加载完毕，则注销无限加载事件，以防不必要的加载     
                            $('.infinite-scroll-preloader').hide();

                            $.toast("已经加载到最后");
                            return;
                        }
                        lastIndex = $('#div_list .list-block').length;// 更新最后加载的序号
                        $.refreshScroller();

                    }, 500);
                });
            });

            //$("#div_list").on('click', '.list-block', function (e) {// $("#div_list")也可以换成$(document)，是基于父容器的概念   
            //    if ($(this).children("ul").css('background-color') == "rgb(193, 221, 241)") {
            //        $(this).children("ul").css('background-color', '#fff');
            //    } else {
            //        $("#div_list .list-block ul").css('background-color', '#fff');
            //        $(this).children("ul").css('background-color', '#C1DDF1');
            //    }
            //});

            $("#div_list").on('click', '.list-block', function (e) {// $("#div_list")也可以换成$(document)，是基于父容器的概念   
                var curcount = parseInt($("#span_curchose").text());
                if ($(this).children("ul").css('background-color') == "rgb(193, 221, 241)") {
                    $(this).children("ul").css('background-color', '#fff');
                    curcount = curcount - 1;
                } else {
                    $(this).children("ul").css('background-color', '#C1DDF1');
                    curcount++;
                }
                $("#span_curchose").text(curcount);
            });

            //条码扫描
            $("#btn_barcode").click(function () {
                wx.ready(function () {
                    wx.scanQRCode({
                        needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
                        scanType: ["qrCode", "barCode"], // 可以指定扫二维码还是一维码，默认二者都有
                        success: function (res) {
                            var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
                            var serial = result.split(",");
                            var serialNumber = serial[serial.length - 1];
                            $("#txt_declcode").val(serialNumber);
                        }
                    });

                });
                //初始化jsapi接口 状态
                wx.error(function (res) {
                    alert("调用微信jsapi返回的状态:" + res.errMsg);
                });
            });

            
            //关联报关单查询
            $("#Ass_a").click(function () {
                var curcount = parseInt($("#span_curchose").text());
                if (curcount != 1) {
                    $.toast("请选择一笔关联报关单记录");
                    return;
                }

                var predelcode = "";
                $("#div_list .list-block").each(function () {
                    if ($(this).children("ul").css('background-color') == "rgb(193, 221, 241)") {
                        predelcode = $(this)[0].id;
                    }
                });
                //if (predelcode == "") {
                //    $.toast("请选择需要关联的记录");
                //    return;
                //}

                var busitypename_con = $("#div_list #" + predelcode).children("ul").children().eq(0).children("div").children().eq(1).text();
                if (busitypename_con != "国内出口" && busitypename_con != "国内进口") {
                    $.toast("请选择国内业务");
                    return;
                }

                $.ajax({
                    type: "post", //要用post方式                 
                    url: "MyDeclareList.aspx/AssCon",//方法所在页面和方法名
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'predelcode':'" + predelcode + "'}",
                    cache: false,
                    async: false,
                    success: function (data) {
                        var obj = eval("(" + data.d + ")");//将字符串转为json

                        if (obj.length <= 0) {
                            $.toast("没有关联报关单");
                            return;
                        }

                        /*var tb_con = "";
                        tb_con = '<div class="list-block">'
                                + '<ul>'
                                    + '<li class="item-content">'
                                         + '<div class="item-inner row">'
                                            + '<div class="item-title col-50">' + obj[0]["DECLARATIONCODE"] + '</div>'
                                            + '<div class="item-title col-33">' + getname("BUSITYPE", obj[0]["BUSITYPE"]) + '</div>'
                                            + '<div class="item-title col-15">' + obj[0]["TRADEMETHOD"] + '</div>'
                                        + '</div>'
                                    + '</li>'
                                    + '<li class="item-content">'
                                        + '<div class="item-inner row">'
                                            + '<div class="item-title col-50">' + obj[0]["CONSIGNEESHIPPERNAME"] + '</div>'
                                            + '<div class="item-title col-33">' + obj[0]["CONTRACTNO"] + '</div>'
                                            + '<div class="item-title col-15">' + (obj[0]["REPTIME"] == null ? "" : obj[0]["REPTIME"]) + '</div>'
                                        + '</div>'
                                    + '</li>'
                                    + '<li class="item-content">'
                                        + '<div class="item-inner row">'
                                            + '<div class="item-title col-50">' + obj[0]["TRANSNAME"] + '</div>'
                                            + '<div class="item-title col-33">' + obj[0]["GOODSNUM"] + '/' + obj[0]["GOODSGW"] + '</div>'
                                            + '<div class="item-title col-15">' + getname("MODIFYFLAG", obj[0]["MODIFYFLAG"]) + '</div>'
                                        + '</div>'
                                    + '</li>'
                                    + '<li class="item-content">'
                                        + '<div class="item-inner row">'
                                            + '<div class="item-title col-50">' + obj[0]["BLNO"] + '</div>'
                                            + '<div class="item-title col-33">' + obj[0]["CUSNO"] + '</div>'
                                            + '<div class="item-title col-15">' + obj[0]["CUSTOMSSTATUS"] + '</div>'
                                        + '</div>'
                                    + '</li>'
                                + '</ul>'
                         + '</div>';
                         */

                        var buttons1 = [
                            {
                                text: '<font style="font-weight:800">关联报关单信息</font>',
                                label: true
                            },
                            {
                                text: '<div class="list-block" style="margin:0;font-size:13px;color:black;">'
                                        + '<ul>'
                                           + '<li class="item-content" style="min-height:1.3rem;height:1.3rem;">' +
                                                  '<div class="item-inner row" style="min-height:1.3rem;height:1.3rem;">'
                                                    + '<div class="item-title col-50">' + (obj[0]["DECLARATIONCODE"] == null ? "" : obj[0]["DECLARATIONCODE"]) + '</div>'
                                                    + '<div class="item-title col-33">' + getname("BUSITYPE", obj[0]["BUSITYPE"]) + '</div>'
                                                    + '<div class="item-title col-33">' + (obj[0]["TRADEMETHOD"] == null ? "" : obj[0]["TRADEMETHOD"]) + '</div>'
                                                + '</div>'
                                           + '</li>'
                                    + '</ul>'
                                + '</div>'
                            },
                            {
                                text: '<div class="list-block" style="margin:0;font-size:13px;color:black;">'
                                        + '<ul>'
                                            + '<li class="item-content" style="min-height:1.3rem;height:1.3rem;">'
                                                + '<div class="item-inner row" style="min-height:1.3rem;height:1.3rem;">'
                                                    + '<div class="item-title col-50">' + (obj[0]["CONSIGNEESHIPPERNAME"] == null ? "" : obj[0]["CONSIGNEESHIPPERNAME"]) + '</div>'
                                                    + '<div class="item-title col-33">' + (obj[0]["CONTRACTNO"] == null ? "" : obj[0]["CONTRACTNO"]) + '</div>'
                                                    + '<div class="item-title col-33">' + (obj[0]["REPTIME"] == null ? "" : obj[0]["REPTIME"]) + '</div>'
                                                + '</div>'
                                            + '</li>'
                                    + '</ul>'
                                + '</div>'
                            },
                            {
                                text: '<div class="list-block" style="margin:0;font-size:13px;color:black;">'
                                        + '<ul>'
                                            + '<li class="item-content" style="min-height:1.3rem;height:1.3rem;">'
                                                + '<div class="item-inner row" style="min-height:1.3rem;height:1.3rem;">'
                                                    + '<div class="item-title col-50">' + (obj[0]["TRANSNAME"] == null ? "" : obj[0]["TRANSNAME"]) + '</div>'
                                                    + '<div class="item-title col-33">' + getname("MODIFYFLAG", obj[0]["MODIFYFLAG"]) + '</div>'
                                                    + '<div class="item-title col-33">' + (obj[0]["CUSTOMSSTATUS"] == null ? "" : obj[0]["CUSTOMSSTATUS"]) + '</div>'
                                                + '</div>'
                                            + '</li>'
                                    + '</ul>'
                                + '</div>'
                            },
                            {
                                text: '<div class="list-block" style="margin:0;font-size:13px;color:black;">'
                                        + '<ul>'
                                            + '<li class="item-content" style="min-height:1.3rem;height:1.3rem;">'
                                                + '<div class="item-inner row" style="min-height:1.3rem;height:1.3rem;">'
                                                    + '<div class="item-title col-60">' + (obj[0]["BLNO"] == null ? "" : obj[0]["BLNO"]) + '</div>'
                                                    + '<div class="item-title col-33">' + (obj[0]["CUSNO"] == null ? "" : obj[0]["CUSNO"]) + '</div>'
                                                + '</div>'
                                            + '</li>'
                                    + '</ul>'
                                + '</div>'
                            }
                        ];
                        //var buttons2 = [
                        //            {
                        //                text: '返回', bg: 'danger'
                        //            }
                        //];
                        var groups = [buttons1];//, buttons2
                        $.actions(groups);


                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {//请求失败处理函数
                        //alert(XMLHttpRequest.status);
                        //alert(XMLHttpRequest.readyState);
                        //alert(textStatus);
                        alert('error...状态文本值：' + textStatus + " 异常信息：" + errorThrown);
                    }
                });

            });

            //文件调阅
            $("#FileConsult_a").click(function () {
                var curcount = parseInt($("#span_curchose").text());
                if (curcount != 1) {
                    $.toast("请选择一笔文件调阅记录");
                    return;
                }

                var predelcode = "";
                $("#div_list .list-block").each(function () {
                    if ($(this).children("ul").css('background-color') == "rgb(193, 221, 241)") {
                        predelcode = $(this)[0].id;
                    }
                });
                //if (predelcode == "") {
                //    $.toast("请选择需要调阅的记录");
                //    return;
                //}

                $.modal({
                    title: '<i id="filecancel" class="iconfont" style="font-size:1.3rem;">&#xea4f;</i>',
                    text: '<span style="font-weight:800;">文件调阅</span>' +
                            '<div class="content-block row" style="margin:0;padding:.75rem;">' +
                                '<div class="col-50"><a href="#" id="filedecl" class="button" style="background-color: #3d4145;color:white;border-radius:0;border:0;vertical-align:middle;">报关文件</a></div>' +
                                '<div class="col-50"><a href="#" id="filecheck" class="button" style="background-color: gray;color:white;border-radius:0;border:0;vertical-align:middle;">查验文件</a></div>' +
                            '</div>',
                    //title: '文件调阅',
                    //text: '<div class="content-block row" style="margin:1rem 0;">' +
                    //            '<div class="col-25"><a href="#" id="filecancel" class="button" style="background-color: gray;color:white;border-radius:0;border:0;vertical-align:middle;">返回</div>' +
                    //            '<div class="col-40" style="margin-left:0;"><a href="#" id="filedecl" class="button" style="background-color: #3d4145;color:white;border-radius:0;border:0;vertical-align:middle;">报关文件</a></div>' +
                    //            '<div class="col-40" style="margin-left:0;"><a href="#" id="filecheck" class="button" style="background-color: gray;color:white;border-radius:0;border:0;vertical-align:middle;">查验文件</a></div>' +
                    //        '</div>',
                    extraClass: 'filediv'//避免直接设置.modal的样式，从而影响其他toast的提示
                });

                $("#filecancel").click(function () {
                    $.closeModal(".filediv");
                });

                $("#filedecl").click(function () {
                    $.closeModal(".filediv");

                    $.ajax({
                        type: "post", //要用post方式                 
                        url: "MyDeclareList.aspx/FileConsult",//方法所在页面和方法名
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: "{'predelcode':'" + predelcode + "'}",
                        cache: false,
                        async: false,
                        success: function (data) {
                            if (data.d == "") {
                                $.toast("报关单文件不存在");
                                return;
                            }

                            var picstr = data.d;
                            var picarr = picstr.split(',');

                            var imgs = "[";
                            for (var i = 0; i < picarr.length; i++) {
                                if (picarr[i] != "") { imgs += "'/TempFile/tempPic/" + picarr[i] + "',"; }
                            }
                            imgs += "]";

                            var myPhotoBrowserStandalone = $.photoBrowser({
                                photos: eval(imgs)
                            });
                            myPhotoBrowserStandalone.open();
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {//请求失败处理函数
                            //alert(XMLHttpRequest.status);
                            //alert(XMLHttpRequest.readyState);
                            //alert(textStatus);
                            alert('error...状态文本值：' + textStatus + " 异常信息：" + errorThrown);
                        }
                    });

                });

                $("#filecheck").click(function () {
                    $.closeModal(".filediv");

                    $.ajax({
                        type: "post", //要用post方式                 
                        url: "MyDeclareList.aspx/picfileconsult",//方法所在页面和方法名
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: "{'predelcode':'" + predelcode + "'}",
                        cache: false,
                        async: false,//默认是true，异步；false为同步，此方法执行完在执行下面代码
                        success: function (data) {
                            var obj = eval("(" + data.d + ")");//将字符串转为json

                            if (obj.length <= 0) {
                                $.toast("没有查验图片");
                                return;
                            }

                            var imgs = "[";
                            for (var i = 0; i < obj.length; i++) {
                                imgs += "'" + $("#hd_AdminUrl").val() + "file/" + obj[i]["FILENAME"] + "',";
                            }
                            imgs += "]";

                            var myPhotoBrowserStandalone = $.photoBrowser({
                                photos: eval(imgs)
                            });
                            myPhotoBrowserStandalone.open();
                        }
                    });
                });

            });

            //报关订阅
            $("#Subs_decl_a").click(function () {
                var curcount = parseInt($("#span_curchose").text());
                if (curcount != 1) {
                    $.toast("请选择一笔报关订阅记录");
                    return;
                }

                var predeclcode = ""; var div_ordercode = ""; var declcode = ""; var cusno = "";
                $("#div_list .list-block").each(function () {
                    if ($(this).children("ul").css('background-color') == "rgb(193, 221, 241)") {

                        predeclcode = $(this)[0].id; div_ordercode = $(this).children("ul")[0].id;

                        declcode = $(this).children("ul").children().eq(0).children("div").children().eq(0).text();
                        cusno = $(this).children("ul").children().eq(3).children("div").children().eq(1).text();
                    }
                });
                //if (predeclcode == "") {
                //    $.toast("请选择需要订阅的记录");
                //    return;
                //}
                $.popup("#popup-subscribe-decl");

                $(document).on('open', '#popup-subscribe-decl', function () {
                    $("input[name='chk_status']").prop('checked', false);
                });
                $(document).on('opened', '#popup-subscribe-decl', function () {
                    $("#Pop_hd_predeclcode").val(predeclcode);
                    $("#Pop_hd_ordercode").val(div_ordercode.substring(6));

                    $("#Pop_hd_declcode").val(declcode);
                    $("#Pop_hd_cusno").val(cusno);
                });
            });

            $("#Pop_Subscribe").click(function () {
                var predeclcode = $("#Pop_hd_predeclcode").val(); var ordercode = $("#Pop_hd_ordercode").val();

                var declcode = $("#Pop_hd_declcode").val();
                var cusno = $("#Pop_hd_cusno").val();

                var status = "";
                $("input[name='chk_status']:checked").each(function (index, item) {
                    status += $(this).val() + ",";
                });

                if (status == "") {
                    $.toast("请选择需要订阅的状态");
                    return;
                }

                $.ajax({
                    type: 'post',
                    url: '/Page/MyBusiness/MyBusiness.aspx/SubscribeStatus',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'type':'报关状态','status':'" + status + "','cusno':'" + cusno + "','declarationcode':'" + declcode + "','ordercode':'" + ordercode + "'}",
                    cache: false,
                    async: false,//默认是true，异步；false为同步，此方法执行完在执行下面代码
                    success: function (data) {
                        $.toast(data.d);
                    }
                });
            });

            
            ////打开订阅清单弹出框
            //$(document).on('click', '.open-subinfo_decl', function () {
            //    subinfoload_decl();
            //});

            $.init();
            //----------------------------------------------------------------------------------------------------------------------------------------
            function loaddata(itemsPerLoad, lastIndex) {
                $.ajax({
                    type: "post", //要用post方式                 
                    url: "MyDeclareList.aspx/BindList",//方法所在页面和方法名
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'reptime_s':'" + $("#txt_reptime_s").val() + "','reptime_e':'" + $("#txt_reptime_e").val() + "','declcode':'" + $("#txt_declcode").val() 
                        + "','customsstatus':'" + $("#picker_CUSTOMSSTATUS").val() + "','modifyflag':'" + $("#picker_MODIFYFLAG").val() + "','busitype':\"" + $("#txt_busitype").val()
                        + "\",'ischeck':'" + $("#txt_ischeck").val() + "','ispass':'" + $("#txt_ispass").val() + "','busiunit':'" + $("#txt_busiunit").val()
                        + "','ordercode':'" + $("#txt_ordercode").val() + "','cusno':'" + $("#txt_cusno").val() + "','tradeway':'" + $("#txt_tradeway").val()
                        + "','contractno':'" + $("#txt_contractno").val() + "','blno':'" + $("#txt_blno").val() + "','submittime_s':'" + $("#txt_submittime_s").val()
                        + "','submittime_e':'" + $("#txt_submittime_e").val() + "','sitepasstime_s':'" + $("#txt_sitepasstime_s").val() + "','sitepasstime_e':'" + $("#txt_sitepasstime_e").val()
                        + "','start':" + lastIndex + ",'itemsPerLoad':" + itemsPerLoad + "}",
                    cache: false,
                    async: false,//默认是true，异步；false为同步，此方法执行完在执行下面代码
                    success: function (data) {
                        if (data.d == null || data.d == "" || data.d == "[]") {
                            $("#span_sum").text(0);
                            $("#div_list").append("");
                            return;
                        }
                        var objdata = eval("(" + data.d + ")");//将字符串转为json       
                        var obj = objdata[0]["data"];
                        $("#span_sum").text(objdata[0]["sum"]); 

                        var tb = ""; 
                        for (var i = 0; i < obj.length; i++) {
                            tb = '<div class="list-block" id="' + (obj[i]["CODE"] == null ? "" : obj[i]["CODE"]) + '">'
                                    + '<ul id="order_' + (obj[i]["ORDERCODE"] == null ? "" : obj[i]["ORDERCODE"]) + '">'
                                        + '<li class="item-content">'
                                             + '<div class="item-inner row">'
                                                + '<div class="item-title col-50">' + (obj[i]["DECLARATIONCODE"] == null ? "" : obj[i]["DECLARATIONCODE"]) + '</div>'
                                                + '<div class="item-title col-33">' + getname("BUSITYPE", obj[i]["BUSITYPE"]) + '</div>'
                                                + '<div class="item-title col-33">' + (obj[i]["TRADEMETHOD"] == null ? "" : obj[i]["TRADEMETHOD"]) + '</div>'
                                            + '</div>'
                                        + '</li>'
                                        + '<li class="item-content">'
                                            + '<div class="item-inner row">'
                                                + '<div class="item-title col-50">' + (obj[i]["CONSIGNEESHIPPERNAME"] == null ? "" : obj[i]["CONSIGNEESHIPPERNAME"]) + '</div>'
                                                + '<div class="item-title col-33">' + (obj[i]["CONTRACTNO"] == null ? "" : obj[i]["CONTRACTNO"]) + '</div>'
                                                + '<div class="item-title col-33">' + (obj[i]["REPTIME"] == null ? "" : obj[i]["REPTIME"]) + '</div>'
                                            + '</div>'
                                        + '</li>'
                                        + '<li class="item-content">'
                                            + '<div class="item-inner row">'
                                                + '<div class="item-title col-50">' + (obj[i]["TRANSNAME"] == null ? "" : obj[i]["TRANSNAME"]) + '</div>'
                                                + '<div class="item-title col-33">' + getname("MODIFYFLAG", obj[i]["MODIFYFLAG"]) + '</div>'
                                                + '<div class="item-title col-33">' + (obj[i]["CUSTOMSSTATUS"] == null ? "" : obj[i]["CUSTOMSSTATUS"]) + '</div>'
                                            + '</div>'
                                        + '</li>'
                                        + '<li class="item-content">'
                                            + '<div class="item-inner row">'
                                                + '<div class="item-title col-60">' + (obj[i]["BLNO"] == null ? "" : obj[i]["BLNO"]) + '</div>'
                                                + '<div class="item-title col-33">' + (obj[i]["CUSNO"] == null ? "" : obj[i]["CUSNO"]) + '</div>'
                                            + '</div>'
                                        + '</li>'
                                    + '</ul>'
                             + '</div>';

                            $('#div_list').append(tb);
                            tb = ""; objname = "";
                        }

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {//请求失败处理函数
                        //alert(XMLHttpRequest.status);
                        //alert(XMLHttpRequest.readyState);
                        //alert(textStatus);
                        alert('error...状态文本值：' + textStatus + " 异常信息：" + errorThrown);
                    }
                });
            }

        });
        function initsearch_condition() {
            $("#picker_CUSTOMSSTATUS").picker({
                toolbarTemplate: '<header class="bar bar-nav">\
                      <button class="button button-link pull-right close-picker">确定</button>\
                      <h1 class="title">请选择海关状态</h1>\
                      </header>',
                cols: [
                  {
                      textAlign: 'center',
                      values: ['全部', '未结关', '已结关']
                  }
                ]
            });
            $("#picker_MODIFYFLAG").picker({
                toolbarTemplate: '<header class="bar bar-nav">\
                      <button class="button button-link pull-right close-picker">确定</button>\
                      <h1 class="title">请选择删改单</h1>\
                      </header>',
                cols: [
                  {
                      textAlign: 'center',
                      values: ['全部', '正常', '删单', '改单', '改单完成']
                  }
                ]
            });

            //初始化时间控件
            //var before = new Date();
            //before.setDate(before.getDate() - 3);
            //var beforeday = before.Format("yyyy-MM-dd");

            //var now = new Date();
            //var today = now.Format("yyyy-MM-dd");

            //$("#txt_reptime_s").val(beforeday);
            //$("#txt_reptime_s").calendar({ value: [beforeday] });

            //$("#txt_reptime_e").val(today);
            //$("#txt_reptime_e").calendar({ value: [today] });
            $("#txt_reptime_s").calendar({});
            $("#txt_reptime_e").calendar({});

        }

        function getname(key, value) {
            var str = "";
            if (key == "BUSITYPE") {
                switch (value) {
                    case "10": str = "空运出口"; break;
                    case "11": str = "空运进口"; break;
                    case "20": str = "海运出口"; break;
                    case "21": str = "海运进口"; break;
                    case "30": str = "陆运出口"; break;
                    case "31": str = "陆运进口"; break;
                    case "40": str = "国内出口"; break;
                    case "41": str = "国内进口"; break;
                    case "50": str = "特殊出口"; break;
                    case "51": str = "特殊进口"; break;
                }
            }
            if (key == "MODIFYFLAG") {
                switch (value) {
                    case 0: str = "正常"; break;
                    case 1: str = "删单"; break;
                    case 2: str = "改单"; break;
                    case 3: str = "改单完成"; break;
                }
            }

            return str;
        }

        //清除选中
        function clearSelect() {
            $("#div_list .list-block").each(function () {
                if ($(this).children("ul").css('background-color') == "rgb(193, 221, 241)") {
                    $(this).children("ul").css('background-color', '#fff');
                }
            });
        }
       
       
        //打开详情弹出框
        $(document).on('click', '.open-detail', function () {
            var curcount = parseInt($("#span_curchose").text());
            if (curcount != 1) {
                $.toast("请选择一笔记录查看详情");
                return;
            }
            var ordercode = "";
            $("#div_list .list-block").each(function () {
                if ($(this).children("ul").css('background-color') == "rgb(193, 221, 241)") {
                    ordercode = $(this).children("ul")[0].id;
                }
            });
            
            if (ordercode != "") {
                ordercode = ordercode.substring(6);
                getBusiInfo_company(ordercode);
            }
            else {
                $.toast("请选择需要一条记录");
            }
        });

    </script>
</head>
<body>

    <div class="page-group">
        <div id="page-infinite-scroll-bottom" class="page page-current">
            <%--search --%>
            <header class="bar bar-nav">
                <div class="search-input">                 
                    <div class="row"> 
                        <div class="col-25" style="width:25%;font-size:13px;margin-top:.8rem;">报关日期始/末:</div>
                        <div class="col-33" style="width:30%;margin-left:0;"><input type="search" id='txt_reptime_s'/></div>
                        <div class="col-33" style="width:30%;margin-left:0;"><input type="search" id='txt_reptime_e'/></div>
                        <div class="col-10" style="width:10%;margin-left:0;margin-top:.2rem;">
                            <input id="btn_more_m" type="button" value="..." class="open-tabs-modal" style="background-color:#3D4145;color:#ffffff;border-radius:0;border:0;"  />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-50" style="width:46%;"><input type="search" id='txt_declcode' placeholder='报关单号'/></div>
                        <div class="col-25" style="width:21%;margin-left:0;"><input type="search" id='picker_CUSTOMSSTATUS' placeholder='海关状态'/></div>
                        <div class="col-25" style="width:21%;margin-left:0;"><input type="search" id='picker_MODIFYFLAG' placeholder='删改单'/></div>
                        <div class="col-15" style="width:5%;margin-left:0;"><a href="#" id="btn_barcode"><i class="iconfont" style="font-size:1.3rem;color:gray;">&#xe608;</i></a></div>
                    </div> 
                    <div class="row">
                        <div class="col-25" style="width:21%;"><input id="btn_gridname_m" type="button" value="列名" style="background-color:#808080;color:#ffffff;border-radius:0;border:0;" /></div>
                        <div class="col-60" style="width:54%;margin-left:0;"><input id="btn_search_m" type="button" value="查询" style="background-color:#3D4145;color:#ffffff;border-radius:0;border:0;" /></div>
                        <div class="col-25" style="width:21%;margin-left:0;"><input id="btn_reset_m" type="button" value="重置" style="background-color:#808080;color:#ffffff;border-radius:0;border:0;" /></div>
                    </div> 
                    <input type="hidden" id='txt_busitype'/><input type="hidden" id='txt_ischeck'/><input type="hidden" id='txt_ispass'/>
                    <input type="hidden" id='txt_busiunit'/>
                    <input type="hidden" id='txt_ordercode'/> <input type="hidden" id='txt_cusno'/>  
                    <input type="hidden" id='txt_tradeway'/> <input type="hidden" id='txt_contractno'/>  
                    <input type="hidden" id='txt_blno'/>
                    <input type="hidden" id='txt_submittime_s'/><input type="hidden" id='txt_submittime_e'/>
                    <input type="hidden" id='txt_sitepasstime_s'/><input type="hidden" id='txt_sitepasstime_e'/>
                </div>   
                <div id="div_tbar" style="font-size:13px;margin:.2rem 0;">
                    <font color="#929292">共计</font>
                    <span id="span_sum">0</span>
                    <font color="#929292">笔,当前选中</font>
                    <span id="span_curchose">0</span>
                    <font color="#929292">笔</font>
                </div>                         
            </header>


            <%--工具栏 --%>
            <nav class="bar bar-tab">
                <a class="tab-item external" href="#" id="Ass_a"><%--active--%>
                    <span class="icon icon-menu"></span>
                    <span class="tab-label">关联报关单</span>
                </a>
                <a class="tab-item external" href="#" id="FileConsult_a">
                    <span class="icon icon-message"></span>
                    <span class="tab-label">文件调阅<input type="hidden" id="hd_AdminUrl" value='<%= System.Configuration.ConfigurationManager.AppSettings["AdminUrl"] %>' /></span>
                </a>
                <a class="tab-item external" href="#" id="Subs_decl_a">
                    <span class="icon icon-card"></span>
                    <span class="tab-label">报关订阅</span>
                </a>
                <a class="tab-item open-detail" href="#" > 
                    <span class="icon icon-menu"></span>
                    <span class="tab-label">业务详情</span>
                </a>
            </nav>

           <%--body --%>
            <div class="content infinite-scroll native-scroll" data-distance="100">                
                <div id="div_list"></div>

                <!-- 加载提示符 -->
                <div class="infinite-scroll-preloader">
                  <div class="preloader"></div>
                </div>
                <div class="float-button" onclick="clearSelect()"><img src="../../image/clearbtn.png" /></div>
            </div>

            
        </div>
    </div>  

    <!--popup 订阅弹出页-->
    <div class="popup popup-subscribe" id="popup-subscribe-decl" >
        <div class="content" >
            <div id="pop_sub_decl">
                <div class="myrow">
                    报关状态订阅<input type="hidden" id="Pop_hd_predeclcode" value="" /><input type="hidden" id="Pop_hd_ordercode" value="" />
                    <input type="hidden" id="Pop_hd_declcode" value="" /><input type="hidden" id="Pop_hd_cusno" value="" />
                </div>
                <div class="row">
                    <div class="col-66">申报完成</div>
                    <div class="col-33"><input type="checkbox" name="chk_status" value="申报完成"/></div>
                </div>
                <div class="row">
                    <div class="col-66">已放行</div>
                    <div class="col-33"><input type="checkbox" name="chk_status" value="已放行"/></div>
                </div>
                <div class="row">
                    <div class="col-66">已结关</div>
                    <div class="col-33"><input type="checkbox" name="chk_status" value="已结关"/></div>
                </div>
                <div class="row">
                    <div class="col-66">改单完成</div>
                    <div class="col-33"><input type="checkbox" name="chk_status" value="改单完成"/></div>
                </div>
                <div class="row">
                    <div class="col-66">删单完成</div>
                    <div class="col-33"><input type="checkbox" name="chk_status" value="删单完成"/></div>
                </div>
            </div>
            <div class="content-block row">
                <div class="col-50"><a href="#" class="close-popup button">返  回</a></div>
                <div class="col-50"><a href="#" class="button button-fill" id="Pop_Subscribe"  style="background-color: #3d4145">确  认</a></div>
            </div>
        </div>
    </div>

     <!--popup 详情弹出页-->
    <div class="popup popup-detail">
            <div class="content" style="bottom: 60px;">
                <div class="buttons-tab">
                    <a href="#tab1" class="tab-link active button">报关信息</a>
                    <a href="#tab2" class="tab-link button">报检信息</a>
                    <a href="#tab3" class="tab-link button">物流信息</a>
                </div>
                <div class="content-block">
                    <div class="tabs">
                        <div id="tab1" class="tab active">
                            <div class="content-block " id="pop_tab_decl"></div>
                        </div>
                        <div id="tab2" class="tab">
                            <div class="content-block" id="pop_tab_insp"></div>
                        </div>
                        <div id="tab3" class="tab">
                            <div class="content-block" id="pop_tab_logistics"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="bottom: 1.5rem; position: absolute; width: 80%; margin-left: 10%"><a href="#" class="close-popup button">返&nbsp;&nbsp;&nbsp;&nbsp;回</a></div>
        </div>

    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>   
   <%-- <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>--%>
    <script src="/js/sm-extend.min.js"></script>
</body>

    <script type='text/javascript' src='http://res.wx.qq.com/open/js/jweixin-1.2.0.js'></script>
    <script type='text/javascript'>


        var conf = [];
        $.ajax({
            type: "post", //要用post方式                 
            url: "MyDeclareList.aspx/getConf",//方法所在页面和方法名
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: "{'url':'" + window.location.href.split('#')[0] + "'}",
            cache: false,
            async: false,//默认是true，异步；false为同步，此方法执行完在执行下面代码
            success: function (data) {
                conf = eval("(" + data.d + ")");//将字符串转为json
            }
        });

        wx.config({
            debug: false,
            appId: conf.appid,
            timestamp: conf.timestamp,
            nonceStr: conf.noncestr,
            signature: conf.signature,
            jsApiList: ['scanQRCode']
        });

    </script>


</html>
