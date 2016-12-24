<%--
  Created by IntelliJ IDEA.
  User: zouy
  Date: 2016/12/23
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>info</title>
    <!-- 引入 Bootstrap -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body{
            padding:0px;
        }
        th,td,ul{
            text-align:center;
        }
    </style>
</head>
<body style="background-color: #f7f7f7;" ng-app="mainapp">
<%@ include  file="info_include.jsp"%>

<div class="container" style="background-color: #f7f7f7;padding: 0px;" ng-controller="maincontroller">
    <nav class="navbar navbar-default" role="navigation" style="background-color: #31708f;">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" style="color: #fcf8e3;font-size: 25px;">UMS</a>
            </div>
            <div>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <div class="btn-group">
                            <input id="btnid-username" type="button" class="btn" value=""/>
                            <button type="button" class="btn btn-warning"  onclick="modalToggle(this)">
                                <span class="glyphicon glyphicon-envelope"></span>
                                系统消息
                            </button>
                            <button type="button" class="btn btn-success" onclick="modalToggle(this)">
                                <span class="glyphicon glyphicon-edit"></span>
                                编辑
                            </button>
                            <button type="button" class="btn btn-danger" onclick="modalToggle(this)">
                                <span class="glyphicon glyphicon-off"></span>
                                注销
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </nav>
</div>

<!--<div class="container" style="background-color: #f7f7f7;margin-top: 10px;padding: 0px;">
    <div style="background-image: url(assets/images/top_bkg.jpg);background-repeat:repeat-x;width: 100%;height: 160px;padding: 5px;">
            <div class="pull-left" style="width:100px;height:100px;border: 1px solid #9d9d9d;">
                <img src="assets/images/touxiang.png" alt="no image" width="100%" height="100%">
            </div>
            <div class="btn-group pull-right">
                <input type="button" class="btn btn-warning" value="系统消息"/>
                <input type="button" class="btn btn-success" value="编辑"/>
                <input type="button" class="btn btn-danger" value="注销"/>
            </div>
            <div class="" style="width:100px;height:106px;"></div>&lt;!&ndash;填充头像100*100区域的左浮动&ndash;&gt;
            <div>&lt;!&ndash;用户名&ndash;&gt;
                <h3 style="display: inline;">Tomasyao</h3>
                <h3 style="display: inline;">33</h3>
            </div>
    </div>
</div>-->

<div class="container" style="background-color: #f7f7f7;margin-top: 2px;" ng-controller="maincontroller">
    <div class="row" >
        <div class="col-xs-2" style="border: 1px solid #d9edf7;padding: 2px;">
            <ul class="nav nav-pills nav-stacked">
                <%--这里a标签不能加href属性，否则会相对首页进行#跳转，但在静态页面无影响--%>
                <li class="active" id="liid-homepage"><a style="cursor: pointer;" ng-click="rightDiv(homePage)" ng-bind="homePage"></a></li>
                <li id="liid-usermanage"><a style="cursor: pointer;" ng-click="rightDiv(userManage)" ng-bind="userManage"></a></li>
                <li id="liid-filemanage"><a style="cursor: pointer;" ng-click="rightDiv(fileManage)" ng-bind="fileManage"></a></li>
            </ul>
        </div>

        <div class="col-xs-10" style="background-color: #f7f7f7;" id="divid-homepage">
            <h1>欢迎来到</h1>
            <h2>这里</h2>
        </div>

        <div class="col-xs-10" style="background-color: #f7f7f7;display: none;" id="divid-usermanage">
            <table class="table table-hover table-striped table-bordered">
                <caption>用户列表</caption>
                <thead>
                <tr><th>用户名</th><th>邮箱</th><th>电话</th><th>创建时间</th><th>操作</th></tr>
                </thead>
                <tbody>
                <tr ng-repeat="item in userList">
                    <td ng-bind="item.username"></td>
                    <td ng-bind="item.email"></td>
                    <td ng-bind="item.tel"></td>
                    <td ng-bind="item.createTime"></td>
                    <td><input ng-click="deleteOne(item)" type="button" class="btn btn-danger btn-sm" value="删除" /></td>
                </tr>
                </tbody>
            </table>
            <div><!--分页bar-->
                <span ng-show="userList.length > 0">
                    <input type="button" id="btnid-prevpage" ng-click="makePagingList(prevPage)" class="btn btn-default" value={{prevPage}} />&nbsp;
                    <input type="text" style="text-align:center;width:50px;" ng-model="currentPage" />&nbsp;
                    <input type="button" id="btnid-nextpage" ng-click="makePagingList(nextPage)"  class="btn btn-default" value="{{nextPage}}" />&nbsp;
                    <span>共&nbsp;</span>
                    <input type="text" readonly="readonly" style="text-align:center;width:50px;border:none;" ng-model="totalPage" />
                    <span>&nbsp;页</span>
                </span>
            </div>
        </div>

        <div class="col-xs-10" style="background-color: #f7f7f7;display: none;" id="divid-filemanage">
            <table class="table table-hover table-striped table-bordered">
                <caption>用户列表</caption>
                <thead>
                <tr><th>名称</th><th>城市</th><th>邮编</th></tr>
                </thead>
                <tbody>
                <tr><td>Tanmay</td><td>Bangalore</td><td>560001</td></tr>
                <tr><td>Tanmay</td><td>Bangalore</td><td>560001</td></tr>
                <tr><td>Tanmay</td><td>Bangalore</td><td>560001</td></tr>
                </tbody>
            </table>
        </div>
        <!--<div class="clearfix visible-xs"></div>-->
    </div>
</div>

<script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>
<script src="jsp/infojsp/js/js.js"></script>
<script>
    window.onload = function () {
        var GetQueryString = function(name){
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null){return  decodeURI(r[2]);} return null;
        };
        var user_id = GetQueryString("userId");
        if(parseInt(user_id) < 1){
            window.location.href = "/login.html";
        }
        $("#btnid-username").val("用户: "+GetQueryString("userName"));
    };
</script>

</body>
</html>