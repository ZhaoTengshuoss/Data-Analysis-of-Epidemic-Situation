<%@page import="com.BigData.model.Line"%>
<%@page import="java.util.List"%>
<%@page import="com.BigData.Dao.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>数据可视化demo</title>
    <link href="../styles/common.css" rel="stylesheet">
    <link href="../styles/bootstrap.min.css" rel="stylesheet">
    <link href="../styles/bootstrap-table.css" rel="stylesheet">
    <link href="../styles/pagination.css" rel="stylesheet">
    <script src="../scripts/Plugin/jquery-3.3.1.min.js"></script>
    <script src="../scripts/Plugin/echarts.min.js"></script>
    <script src="jquery.pagination.min.js"></script>
    <script src="../scripts/common.js"></script>
    <script src="../scripts/chronic.js"></script>
    <script type="text/javascript">
        //全局变量
        var numCount;       //数据总数量
        var columnsCounts;  //数据列数量
        var pageCount;      //每页显示的数量
        var pageNum;        //总页数
        var currPageNum ;   //当前页数

        //页面标签变量
        var blockTable;
        var preSpan;
        var firstSpan;
        var nextSpan;
        var lastSpan;
        var pageNumSpan;
        var currPageSpan;



        window.onload=function(){
            //页面标签变量
            blockTable = document.getElementById("blocks");
            preSpan = document.getElementById("spanPre");
            firstSpan = document.getElementById("spanFirst");
            nextSpan = document.getElementById("spanNext");
            lastSpan = document.getElementById("spanLast");
            pageNumSpan = document.getElementById("spanTotalPage");
            currPageSpan = document.getElementById("spanPageNum");

            numCount = document.getElementById("blocks").rows.length - 1;       //取table的行数作为数据总数量（减去标题行1）
            
            columnsCounts = blockTable.rows[0].cells.length;
            pageCount = 10;
            pageNum = parseInt(numCount/pageCount);
            if(0 != numCount%pageCount){
                pageNum += 1;
            }

            firstPage();
        };
    </script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
UserDaoImpl dataImp=new UserDaoImpl();
List<Line> lines=dataImp.load_NL2(request.getParameter("content"));


%>
<!--顶部-->
<header class="header left">
    <div class="left nav">
        <ul>
             <li ><i class="nav_1"></i><a href="XUYAO.jsp">疫情概况</a> </li>
            <li ><i class="nav_2"></i><a href="Road.jsp">路线分析</a> </li>
            <li ><i class="nav_3"></i><a href="Otherdata.jsp">其他信息</a> </li>
            <li class="nav_active"><i class="nav_4"></i><a href="Line.jsp">同城信息查询</a> </li>
            </ul>
    </div>
    <div class="header_center left" style="position:relative">
        <h2><strong>新型冠状病毒疫情数据分析系统</strong></h2>

    </div>
    <div class="right nav text_right">
        <ul>

        </ul>
    </div>

</header>
<!--内容部分-->
<div class="con left" style="width: 98%;margin-left: 1%;margin-bottom: 25px;">
 <form action="Line.jsp" method="post">
    <input type="text" placeholder="请输入日期或车次/航班信息" id="content" name="content"/>
    <button class="btn btn-primary btn-sm" style="margin-left:20px" type="submit">
    <span class="glyphicon glyphicon-search"></span>查询</button>
   </form>

    <div class="div_any_child">
          <div class="table_p" style="height: 96%;margin-top: 20px;">
              <table id="blocks">
                  <thead><tr>
                      <th>日期</th>
                      <th>车次或航班</th>
                      <th>始发站</th>
                      <th>终止站</th>
                      <th>交通方式</th>
                      <th>车厢</th>
                      <th>详细信息</th>
                      <th>来源</th>
                  </tr>
                  </thead>
                  <tbody>
                  <%
                  int count=1;
                  for(Line line:lines){
                  %>
                  
                 <tr><td><%=line.getT_date() %></td><td><%=line.getT_no() %></td><td><%=line.getT_pos_start() %></td><td><%=line.getT_pos_end() %></td><td><%=line.getT_type() %></td><td><%=line.getT_no_sub() %></td><td><%=line.getT_memo() %></td><td><button class="btn btn-primary btn-sm"><a href="<%=line.getSource()%>" style="color:white"><%=line.getWho() %></a></button></td></tr>
                 <%
                
                 count++;
                  } %>
                  </tbody>
              </table>
          </div>
          <div class="box">
             
    <div id="pagiDiv" align="right" class="ui-pagination-container">
        <span id="spanFirst" class="ui-pagination-page-item">首页</span>&nbsp;&nbsp;
        <span id="spanPre" class="ui-pagination-page-item">上一页</span>&nbsp;&nbsp;
        <span id="spanNext" class="ui-pagination-page-item"><span style="color:white">下一页</span>&nbsp;&nbsp;</span>
        <span id="spanLast" class="ui-pagination-page-item">尾页</span>&nbsp;&nbsp;
   <span class="ui-pagination-page-item">  第&nbsp;<span id="spanPageNum"></span>&nbsp;页/共&nbsp;<span id="spanTotalPage"></span>&nbsp;页
   </span>    </div>
          </div>
        </div>


    </div>

<script>


function firstPage(){
    hide();
    currPageNum = 1;
    showCurrPage(currPageNum);
    showTotalPage();
    for(i = 1; i < pageCount + 1; i++){
        blockTable.rows[i].style.display = "";
    }

    firstText();
    preText();
    nextLink();
    lastLink();
}

function prePage(){
    hide();
    currPageNum--;
    showCurrPage(currPageNum);
    showTotalPage();
    var firstR = firstRow(currPageNum);
    var lastR = lastRow(firstR);
    for(i = firstR; i < lastR; i++){
        blockTable.rows[i].style.display = "";
    }

    if(1 == currPageNum){
        firstText();
        preText();
        nextLink();
        lastLink();
    }else if(pageNum == currPageNum){
        preLink();
        firstLink();
        nextText();
        lastText();
    }else{
        firstLink();
        preLink();
        nextLink();
        lastLink();
    }

}

function nextPage(){
    hide();
    currPageNum++;
    showCurrPage(currPageNum);
    showTotalPage();
    var firstR = firstRow(currPageNum);
    var lastR = lastRow(firstR);
    for(i = firstR; i < lastR; i ++){
        blockTable.rows[i].style.display = "";
    }

    if(1 == currPageNum){
        firstText();
        preText();
        nextLink();
        lastLink();
    }else if(pageNum == currPageNum){
        preLink();
        firstLink();
        nextText();
        lastText();
    }else{
        firstLink();
        preLink();
        nextLink();
        lastLink();
    }
}

function lastPage(){
    hide();
    currPageNum = pageNum;
    showCurrPage(currPageNum);
    showTotalPage();
    var firstR = firstRow(currPageNum);
    for(i = firstR; i < numCount + 1; i++){
        blockTable.rows[i].style.display = "";
    }

    firstLink();
    preLink();
    nextText();
    lastText();
}

// 计算将要显示的页面的首行和尾行
function firstRow(currPageNum){
    return pageCount*(currPageNum - 1) + 1;
}

function lastRow(firstRow){
    var lastRow = firstRow + pageCount;
    if(lastRow > numCount + 1){
        lastRow = numCount + 1;
    }
    return lastRow;
}

function showCurrPage(cpn){
    currPageSpan.innerHTML = cpn;
}

function showTotalPage(){
    pageNumSpan.innerHTML = pageNum;
}

//隐藏所有行
function hide(){
    for(var i = 1; i < numCount + 1; i ++){
        blockTable.rows[i].style.display = "none";
    }
}

//控制首页等功能的显示与不显示
function firstLink(){firstSpan.innerHTML = "<a href='javascript:firstPage();'>首页</a>";}
function firstText(){firstSpan.innerHTML = "首页";}

function preLink(){preSpan.innerHTML = "<a href='javascript:prePage();'>上一页</a>";}
function preText(){preSpan.innerHTML = "上一页";}

function nextLink(){nextSpan.innerHTML = "<a href='javascript:nextPage();'>下一页</a>";}
function nextText(){nextSpan.innerHTML = "下一页";}

function lastLink(){lastSpan.innerHTML = "<a href='javascript:lastPage();'>尾页</a>";}
function lastText(){lastSpan.innerHTML = "尾页";}
</script>
</body>
</html>
