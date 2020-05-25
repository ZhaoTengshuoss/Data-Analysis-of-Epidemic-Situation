<%@page import="com.BigData.model.Personline"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.BigData.Dao.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>路线分析</title>
    
    <script src="../scripts/Plugin/bmap.min.js"></script>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=WSrX4bCfgcjTfhWNCwvfI1ZnQnfZDxFW"></script>
    <script src="../scripts/index.js"></script>
    <script src="../scripts/Plugin/laydate/laydate.js"></script>
    
    
    <link href="../styles/common.css" rel="stylesheet">
    <script src="../scripts/Plugin/jquery-3.3.1.min.js"></script>
    <script src="../scripts/Plugin/echarts.min.js"></script>
    <script src="../scripts/common.js"></script>
    <script src="../scripts/trend.js"></script>
     <link rel="stylesheet" href="../styles/style.css">
    <link rel="stylesheet" href="../dist/css/layui.css"  media="all">
    <style type="text/css">
    .all_list_brands_title_details_btn{
    width: 100px;
    height: 100px;
    text-align: center;
    font-size: 15px;
    line-height: 1.428571429;
    border-radius: 50px;
    margin-top: 30px;
    margin-left: 30px;
    float:left;
    background-color: #537BFF;
    border: 1px solid #d5d5d5;
    color:white
    </style>
</head>
<body>
<%
UserDaoImpl dataImp=new UserDaoImpl();  
String Getdatas="";
if(request.getParameter("addr-show")!=null){
	Getdatas=request.getParameter("addr-show");
}
else{
	Getdatas="-6-";
}

System.out.println(Getdatas);
List<Personline> persons=dataImp.load(Getdatas);
String kk="hah";
int count=0;
int signal=0;
int count1=0;
String[] datas={};
List<String> locations=new ArrayList<String>();
List<String> Pub_times=new ArrayList<String>();
List<String> mesgs=new ArrayList<String>();
List<String> Other_infos=new ArrayList<String>();
List<String> contens=new ArrayList<String>();
List<String> sources=new ArrayList<String>();
List<String> sources_url=new ArrayList<String>();
int oooo=0;
for(Personline person : persons){
	locations.add(person.getProvince()+" "+person.getCity()+" "+person.getCounty());
	Pub_times.add(person.getPub_time());
	mesgs.add((person.getUser_num()+" "+person.getUser_name()).replace(",","&sbquo;"));
	Other_infos.add(person.getOther_info().replace(","," "));
	contens.add(person.getContent().replace(",","&sbquo;").replace("，", "&sbquo;").replace("\"","&quot;"));
	sources.add(person.getSource());
	sources_url.add(person.getSource_url());
	
}
System.out.println(contens.size());
%>
<!--顶部-->
<header class="header left">

  <div class="left nav">
      <ul>
          <li ><i class="nav_1"></i><a href="XUYAO.jsp">疫情概况</a> </li>
            <li class="nav_active"><i class="nav_2"></i><a href="Road.jsp">路线分析</a> </li>
            <li ><i class="nav_3"></i><a href="Otherdata.jsp">其他信息</a> </li>
            <li><i class="nav_4"></i><a href="Line.jsp">同城信息查询</a> </li> </ul>
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
<div id="dg" style="z-index: 9999; position: fixed ! important; right: 0; top: 10%;">
<table  style="position: absolute; width:260px; right: 0px; top: 0px;">
<button class="all_list_brands_title_details_btn" id="brands_button" onclick="window.location.href = 'Road2.jsp?addr-show=<%=Getdatas%>'">
    <span class="glyphicon" style=" text-align: center;">疫情地图</span>
</button>
</table>

</div>
<div style="margin-left: 20px;margin-right: 20px;">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend style="color:white">地区查询</legend>
</fieldset>
<div>

    <fieldset style="width:500px;margin-left: 600px;">
        <form action="Road.jsp"  method="get">
          <!--   <label >您选择的是： -->
                <input type="hidden" value="" id="addr-show" name="addr-show">
            <!-- </label> -->
            <br/>
 
            <!--省份选择-->
            <select id="prov" onchange="showCity(this)">
                <option>=请选择省份=</option>
 
            </select>
 
            <!--城市选择-->
            <select id="city" onchange="showCountry(this)">
                <option>=请选择城市=</option>
            </select>
 
            <!--县区选择-->
            <select id="country" onchange="selecCountry(this)">
                <option>=请选择县区=</option>
            </select>
            <button type="submit" class="btn met1" onClick="showAddr()" id="button-show" >确定</button>
        </form>
    </fieldset>

</div>
</div>
<div class="con left" style="width:100%;">
	
    <!--统计分析图-->
    <div class="div_any">
        <div class="left div_any01" style="width:100%;" >
            <div class="div_any_child" style="width:98%;position:relative;height: auto;margin-top:5px;margin-left:10px;">
                <div class="div_any_title"><img src="../images/title_13.png">路线信息</div>
               <input id = 'test1' type = 'hidden' name="test1" value="<%=locations%>"> 
    			<input id = 'test2' type = 'hidden' name="test2" value="<%=Pub_times%>"> 
    			<input id = 'test3' type = 'hidden' name="test3" value="<%=mesgs%>"> 
   				 <input id = 'test4' type = 'hidden' name="test4" value="<%=Other_infos%>"> 
   				 <input id = 'test5' type = 'hidden' name="test5" value="<%=contens%>">  
    			 <input id = 'test6' type = 'hidden' name="test6" value="<%=sources%>"> 
    			 <input id = 'test7' type = 'hidden' name="test7" value="<%=sources_url%>">  
				<ul class="flow-default" id="LAY_demo1" style="
    margin-left: 20px;
    margin-right: 20px;
    margin-top: 19px;
"></ul>  
            </div>
        </div>

      
          
      </div>
    </div>
<script src="../dist/layui.js" charset="utf-8"></script>
<script>

layui.use('flow', function(){
	
  var flow = layui.flow;
  var pp1 = document.getElementById('test1').value;
  var pp2 = document.getElementById('test2').value;
  var pp3 = document.getElementById('test3').value;
  var pp4 = document.getElementById('test4').value;
  var pp5 = document.getElementById('test5').value;
  var pp6 = document.getElementById('test6').value;
  var pp7 = document.getElementById('test7').value;
  
  var locations=[];
  var Pub_times=[];
  var mesgs=[];
  var Other_infos=[];
  var contens=[];
  var sources=[];
  var sources_url=[];
  
  
  locations=pp1.replace("[","").replace("]","").split(",");
  Pub_times=pp2.replace("[","").replace("]","").split(",");

  mesgs=pp3.replace("[","").replace("]","").split(",");
 
  Other_infos=pp4.replace("[","").replace("]","").split(",");
  contens=pp5.replace("[","").replace("]","").split(",");//真是的，记得下次字符串里的",一定要替换啊！！！！！！
  sources=pp6.replace("[","").replace("]","").split(",");
  sources_url=pp7.replace("[","").replace("]","").split(",");
  var cons=[];

 
  for(var j1=0;j1<contens.length;j1++)
	  {
	
	var datas=contens[j1].split("++++");
	 var data='';
	for(var j2=0;j2<datas.length-1;j2++)
		{
		
		datas[j2]=datas[j2].replace("  ","\,");
		data+='<li class="layui-timeline-item"><i class="layui-icon layui-timeline-axis"></i><div class="layui-timeline-content layui-text"> <h3 class="layui-timeline-title" style="color:#16e61c">'
            +datas[j2].split(":::")[0]+'</h3><p style="color:#fff">'
		+datas[j2].split(":::")[1]
        +'</p></div></li>';
		
		}
	
	cons.push(data);
	
	  }


 
  flow.load({
    elem: '#LAY_demo1' //流加载容器
    
    ,done: function(page, next){ //执行下一页的回调
      
      //模拟数据插入
      setTimeout(function(){
        var lis = [];
        var ll=0;
        if(locations==""){
        	ll=0;
        	 lis.push(
             		'<h2 style="text-align:center;color:blue">该城市病患活动轨迹尚未公布</h2>')
        }else{
   	  for(var i=(page-1);i<page;i++)
    	{
   		  ll=locations.length;
          lis.push(
        		'<blockquote class="layui-elem-quote layui-quote-nm">'
        
         +'<p style="margin-bottom: 20px;"><i class="layui-icon layui-icon-location" style="font-size: 28px; color: #1E9FFF;"></i><span  class="con_style" style="color: #fff;">位置:&nbsp;&nbsp;'
         +locations[i]
          +'</span></p>'
          
          +'<p style="margin-bottom: 20px;"><i class="layui-icon layui-icon-time" style="font-size: 28px; color: #1E9FFF;"></i><span  class="con_style" style="color: #fff;">发布时间:&nbsp;&nbsp;'
          +Pub_times[i]
           +'</span></p>'
          
           +'<p style="margin-bottom: 20px;"><i class="layui-icon layui-icon-friends" style="font-size: 28px; color: #1E9FFF;"></i><span  class="con_style" style="color: #fff;">病患信息:&nbsp;'
           +mesgs[i]
            +'</span></p>'
            
            +'<p style="margin-bottom: 20px;"><i class="layui-icon layui-icon-list" style="font-size: 28px; color: #1E9FFF;"></i><span  class="con_style" style="color: #fff;">其他信息:&nbsp;'
            +Other_infos[i]
             +'</span></p><hr><p style="margin-bottom: 20px;"><img src="../icon/图钉.png" style="font-size: 28px;width: 28px;"></img><span class="con_style" style="color: #fff;">行为轨迹:</span></p>'
             +cons[i]
             
             +'<p style="margin-bottom: 20px;"><i class="layui-icon layui-icon-link" style="font-size: 28px; color: #1E9FFF;"></i><span  class="con_style" style="color: #fff;">信息来源:&nbsp;&nbsp;<a style="color:#ffd505" href="'
             +sources_url[i]
             +'">'
             +sources[i]
              +'</a></span></p>'
          +'<ul class="layui-timeline"></ul></blockquote>')
        
    	}
        }
        //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
        //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
        next(lis.join(''), page < ll); //假设总页数为 10
      }, 500);
    }
  });

});
</script>
<script src="js/city.js"></script>
<script src="js/method.js"></script>
</body>
</html>
