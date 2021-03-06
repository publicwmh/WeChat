﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="WeChat.test2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1" />
    <script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css" />

    <style>
    *{ padding:0; margin:0; list-style: none;}
    header{ background: #f7483b; border-bottom: 1px solid #ccc}
    header h2{ text-align: center; line-height: 54px; font-size: 16px; color: #fff}
   .list-ul{ overflow: hidden}
    .list-li{ line-height: 60px; border-bottom: 1px solid #fcfcfc; position:relative;padding: 0 12px; color: #666;
       background: #f2f2f2;
       -webkit-transform: translateX(0px);
   }
    .btn{ position: absolute; top: 0; right: -80px; text-align: center; background: #999; color: #fff; width: 80px}
</style>
    
 
<script type="text/javascript" src="js/touchWipe.js"></script>
<script type="text/javascript">

    $(function () {
        
        //延时监听     
        setTimeout(function () {
            //监听物理返回按钮    
            window.addEventListener("popstate", function (e) {
                alert("sfd");
                layer.open({
                    content: '您确定要返回微信吗？',

                    btn: ['确认', '再逛逛'],
                    shadeClose: false,

                    yes: function () {
                        //调用微信浏览器私有API关闭浏览器  
                        WeixinJSBridge.call('closeWindow');
                    }, no: function () {
                        //点击【再逛逛】，再次写入空白历史记录  
                        pushHistory();
                    }
                });
            }, false);

        }, 3000);
       
        $('.list-li').touchWipe({ itemDelete: '.btn' });
    });
    function show() {
        window.location = "Home.aspx";
    }
</script>
</head>
<body>
<header>
    <h2>消息列表</h2>
  </header>
  <section class="list">
    <ul class="list-ul">
      <li id="li" class="list-li">
        <div class="con">
          <div>你的快递到了，请到楼下签收</div>
          <div>你的快递到了，请到楼下签收</div>
          <div>你的快递到了，请到楼下签收</div>
        </div>
        <div class="btn" onclick="show()">删除</div>
      </li>
      <li class="list-li">
        <div class="con">
          <div>哇，你在干嘛，快点来啊就等你了</div>
          <div>哇，你在干嘛，快点来啊就等你了</div>
          <div>哇，你在干嘛，快点来啊就等你了</div>
          <div>哇，你在干嘛，快点来啊就等你了</div>
        </div>
        <div class="btn">删除</div>
      </li>
    </ul>
  </section>

</body>
</html>
