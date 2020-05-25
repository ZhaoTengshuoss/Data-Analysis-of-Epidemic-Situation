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
<div style="margin-left: 20px;margin-right: 20px;">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend style="color:white">地区查询</legend>
</fieldset>
<div>
<div id="dg" style="z-index: 9999; position: fixed ! important; right: 0; top: 10%;">
<table  style="position: absolute; width:260px; right: 0px; top: 0px;">
<button class="all_list_brands_title_details_btn" id="brands_button" onclick="window.location.href = 'Road.jsp?addr-show=<%=Getdatas%>'">
    <span class="glyphicon" style=" text-align: center;">更多疫情</span>
</button>
</table>

</div>
    <fieldset style="width:500px;margin-left: 600px;">
        <form action="Road2.jsp"  method="get">
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
        <div class="left div_any01" style="width:100%;">
            <div class="div_any_child" style="width:98%;position:relative;height: 600px;">
               <div id="l-map"style="width:98%;height: 580px;margin:10px 0 0 17px"></div>
	</div>
	<%for(int i=0;i<locations.size();i++){ %>
	<input type="hidden" id="locations" name="locations" value="<%=locations.get(i) %>">
	<%} %>
	<%for(int i=0;i<mesgs.size();i++){ %>
	<input type="hidden" id="mesg" name="mesg" value="<%=mesgs.get(i) %>">
	<%} %>
	<%for(int i=0;i<Other_infos.size();i++){ %>
	<input type="hidden" id="other_infos" name="other_infos" value="<%=Other_infos.get(i) %>">
	<%} %>
	<%for(int i=0;i<contens.size();i++){ %>
	<input type="hidden" id="contents" name="contents" value="<%=contens.get(i).replace("++++", "。</br>").replace(":::","：") %>">
	<%} %>
            </div>
        </div>
        
         
      </div>
    </div>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=4.0&ak=WSrX4bCfgcjTfhWNCwvfI1ZnQnfZDxFW"></script>

<script type="text/javascript">
	// 百度地图API功能
	var loca1 = document.getElementsByName('locations');
	var locations= new Array();

	for(var pp1=0;pp1<loca1.length;pp1++){
		
		locations.push(loca1[pp1].value);
	}
	var mesgs1 = document.getElementsByName('mesg');
	var mesgs= new Array();
	
	for(var pp1=0;pp1<mesgs1.length;pp1++){
		
		mesgs.push(mesgs1[pp1].value);
	}
	
	var other_infos1 = document.getElementsByName('other_infos');
	var other_infos= new Array();
	
	for(var pp1=0;pp1<other_infos1.length;pp1++){
		
		other_infos.push(other_infos1[pp1].value);
	}
	
	var contents1 = document.getElementsByName('contents');
	var contents= new Array();
	
	for(var pp1=0;pp1<contents1.length;pp1++){
		
		contents.push(contents1[pp1].value);
	}
	
	var map = new BMap.Map("l-map");
	 map.setMapStyle({style:'midnight'});
	map.centerAndZoom(new BMap.Point(116.402831,39.914271), 13);/// 初始化地图，设置中心点坐标和地图级别
	map.enableScrollWheelZoom(true);
	var index = 0;
	var myGeo = new BMap.Geocoder();
	var adds = locations;
	var adds2=mesgs;
	var adds3=other_infos;
	var adds4=contents;
	 window.onload = function(){bdGEO();}
	function bdGEO(){
		if(index<adds.length){
		var add = adds[index];
		var mesg=adds2[index];
		var other_info=adds3[index];
		var content=adds4[index];
		geocodeSearch(add,mesg,other_info,content);
		index++;
		}
	}
	
	function geocodeSearch(add,mesg,other_info,content){
		if(index < adds.length){
			setTimeout(window.bdGEO,100);
		} 
		myGeo.getPoint(add, function(point){
			var address;
			if (point) {
				//document.getElementById("result").innerHTML +=  index + "、" + add + ":" + point.lng + "," + point.lat + "</br>";
				//document.getElementById("result").innerHTML += "longitude = " + point.lng + ", latitude =" + point.lat + "</br>";
				 address = new BMap.Point(point.lng, point.lat);
				//index
				addMarker(address,new BMap.Label("<div><h3>"+add+"</h3><span>内容："+mesg+"&nbsp;"+other_info+"</span><br/><span>"+content.replace("++++", "。</br>").replace(":::","：")+"</span></div>",{offset:new BMap.Size(20,-10)}));
			}
		}, "北京市");
	}
	// 编写自定义函数,创建标注
	function addMarker(point,label){
		
		
		var marker = new BMap.Marker(point);
		marker.addEventListener("click", function(){    
			
			label.setStyle({ 
				display:"block",
				paddingLeft:"12px",  //给label设置样式，任意的CSS都是可以的
				fontSize:"12px", //字号
				border:"1", //边
				height:"auto", //高度
				width:"auto", //宽
				textAlign:"top", //文字水平居中显示
				lineHeight:"25px", //行高，文字垂直居中显示
				cursor:"pointer"
				});
			   this.setLabel(label);   //提示信息
			   
			});
		label.addEventListener("click", function(){ //点击label隐藏label
	    	label.setStyle({
	    		display: "none",
	    	})
	    });
		map.addOverlay(marker);
		/* marker.setLabel(label); */
	}

</script>

    
<script src="../dist/layui.js" charset="utf-8"></script>

<script src="js/city.js"></script>
<script src="js/method.js"></script>
</body>
</html>
