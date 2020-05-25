<%@page import="com.BigData.model.NH_data"%>
<%@page import="com.BigData.model.C_data"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.BigData.model.N_data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="com.BigData.Dao.UserDaoImpl"%>
<%@page import="com.BigData.Dao.UserDao"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>数据可视化demo</title>
    <link href="../styles/common.css" rel="stylesheet">
    <script src="../scripts/Plugin/jquery-3.3.1.min.js"></script>
    <script src="../scripts/Plugin/echarts.min.js"></script>
    <script src="../scripts/Plugin/bmap.min.js"></script>
   <script src="../scripts/common.js"></script>
    <script src="../scripts/quota.js"></script>
</head>
<body>
<!--顶部-->
<header class="header left">
  <div class="left nav">
      <ul>
            <li ><i class="nav_1"></i><a href="XUYAO.jsp">疫情概况</a> </li>
            <li ><i class="nav_2"></i><a href="Road.jsp">路线分析</a> </li>
            <li class="nav_active"><i class="nav_3"></i><a href="Otherdata.jsp">其他信息</a> </li>
            <li><i class="nav_4"></i><a href="Line.jsp">同城信息查询</a> </li>
            </ul>
  </div>
    <div class="header_center left" style="position:relative">
        
        <h2><strong>新型冠状病毒疫情数据分析系统</strong></h2>

    </div>
    <div class="right nav text_right">
        <ul>

        </ul>
    </div>
<%
UserDaoImpl dataImp=new UserDaoImpl();  
List<N_data> ndatas=dataImp.load_ND();
List<N_data> ndatas2=dataImp.load_ND2();
List<C_data> cdatas4=dataImp.load_NC();
List<NH_data> nh_datas=dataImp.load_NH();
List<String> confirms=new ArrayList<String>();
List<String> suspects=new ArrayList<String>();
List<String> lastUpdateTimes=new ArrayList<String>();


List<String> d_dates2=new ArrayList<String>();
List<String> Dead_hR2=new ArrayList<String>();
List<String> Dead_nhR2=new ArrayList<String>();
List<String> Dead_cR2=new ArrayList<String>();
List<String> Heal_hR2=new ArrayList<String>();
List<String> Heal_nhR2=new ArrayList<String>();
List<String> Heal_cR2=new ArrayList<String>();

for (NH_data nhdata:nh_datas){
	d_dates2.add(nhdata.getD_date());
	Dead_hR2.add(nhdata.getDead_hubeiRate());
	Dead_nhR2.add(nhdata.getDead_notHubeiRate());
	Dead_cR2.add(nhdata.getDead_countryRate());
	Heal_hR2.add(nhdata.getHeal_hubeiRate());
	Heal_nhR2.add(nhdata.getHeal_notHubeiRate());
	Heal_cR2.add(nhdata.getHeal_countryRate());
	
}




List<String> d_dates=new ArrayList<String>();
List<String> hubeis=new ArrayList<String>();
List<String> countrys=new ArrayList<String>();
List<String> nohubeis=new ArrayList<String>();


List<String> heal3=new ArrayList<String>();
List<String> dead3=new ArrayList<String>();
List<String> healRate3=new ArrayList<String>();
List<String> deadRate3=new ArrayList<String>();
List<String> lastUpdateTimes3=new ArrayList<String>();

for (N_data ndata:ndatas2){
	heal3.add(ndata.getHeal());
	dead3.add(ndata.getDead());
	healRate3.add(ndata.getHealRate());
	deadRate3.add(ndata.getDeadRate());
	lastUpdateTimes3.add(ndata.getLastUpdateTime());
	
}

for (C_data cdata:cdatas4){

	d_dates.add(cdata.getD_date());
	hubeis.add(cdata.getHubei());
	countrys.add(cdata.getCountry());
	nohubeis.add(cdata.getNohubei());
	
}


%>
<%for(int i=0;i<heal3.size();i++){ %>
<input type="hidden" id="Test7" name="Test7" value="<%=heal3.get(i) %>"/>
<%} %>
<%for(int i=0;i<dead3.size();i++){ %>
<input type="hidden" id="Test8" name="Test8" value="<%=dead3.get(i) %>"/>
<%} %>
<%for(int i=0;i<healRate3.size();i++){ %>
<input type="hidden" id="Test9" name="Test9" value="<%=healRate3.get(i) %>"/>
<%} %>
<%for(int i=0;i<deadRate3.size();i++){ %>
<input type="hidden" id="Test10" name="Test10" value="<%=deadRate3.get(i) %>"/>
<%} %>
<%for(int i=0;i<lastUpdateTimes3.size();i++){ %>
<input type="hidden" id="Test11" name="Test11" value="<%=lastUpdateTimes3.get(i) %>"/>
<%} %>


<%for(int i=0;i<d_dates.size();i++){ %>
<input type="hidden" id="Test12" name="Test12" value="<%=d_dates.get(i) %>"/>
<%} %>
<%for(int i=0;i<hubeis.size();i++){ %>
<input type="hidden" id="Test13" name="Test13" value="<%=hubeis.get(i) %>"/>
<%} %>
<%for(int i=0;i<countrys.size();i++){ %>
<input type="hidden" id="Test14" name="Test14" value="<%=countrys.get(i) %>"/>
<%} %>
<%for(int i=0;i<nohubeis.size();i++){ %>
<input type="hidden" id="Test15" name="Test15" value="<%=nohubeis.get(i) %>"/>
<%} %>


<%for(int i=0;i<d_dates2.size();i++){ %>
<input type="hidden" id="Test16" name="Test16" value="<%=d_dates2.get(i) %>"/>
<%} %>
<%for(int i=0;i<Dead_hR2.size();i++){ %>
<input type="hidden" id="Test17" name="Test17" value="<%=Dead_hR2.get(i) %>"/>
<%} %>
<%for(int i=0;i<Dead_nhR2.size();i++){ %>
<input type="hidden" id="Test18" name="Test18" value="<%=Dead_nhR2.get(i) %>"/>
<%} %>
<%for(int i=0;i<Dead_cR2.size();i++){ %>
<input type="hidden" id="Test19" name="Test19" value="<%=Dead_cR2.get(i) %>"/>
<%} %>
<%for(int i=0;i<Heal_hR2.size();i++){ %>
<input type="hidden" id="Test20" name="Test20" value="<%=Heal_hR2.get(i) %>"/>
<%} %>
<%for(int i=0;i<Heal_nhR2.size();i++){ %>
<input type="hidden" id="Test21" name="Test21" value="<%=Heal_nhR2.get(i) %>"/>
<%} %>
<%for(int i=0;i<Heal_cR2.size();i++){ %>
<input type="hidden" id="Test22" name="Test22" value="<%=Heal_cR2.get(i) %>"/>
<%} %>


</header>
<!--内容部分-->
<div class="con left">
  <!--数据总概-->
  
    <!--统计分析图-->
    <div class="div_any">
        <div class="left div_any01" style="width:31%">
            <div class="div_any_child">
                <div class="div_any_title"><img src="../images/title_5.png">全国累计治愈/死亡趋势</div>
                <p  ><div id="main3" style="right: 8px;height: 300px;width:500px;margin:20px 0 0;float:right"></div>
                </p>
            </div>
            <div class="div_any_child">
                <div class="div_any_title"><img src="../images/title_6.png">全国治愈率/病死率趋势</div>
                <p ><div id="main4" style="right: 8px;height: 300px;width:500px;margin:20px 0 0;float:right"></div>
               </p>
            </div>
        </div>
        <div class="left div_any01" style="width:31%">
            <div class="div_any_child">
                <div class="div_any_title"><img src="../images/title_7.png">武汉新增确诊趋势</div>
                <p ><div id="main5" style="right: 8px;height: 300px;width:500px;margin:20px 0 0;float:right"></div></p>
            </div>
            <div class="div_any_child">
                <div class="div_any_title"><img src="../images/title_8.png">全国(非湖北)新增确诊趋势</div>
                <p ><div id="main6" style="right: 8px;height: 300px;width:500px;margin:20px 0 0;float:right"></div></p>
            </div>
        </div>
        <div class="left div_any01" style="width:31%">
            <div class="div_any_child">
                <div class="div_any_title"><img src="../images/title_9.png">湖北(非武汉)新增确诊趋势</div>
                <p ><div id="main7" style="right: 8px;height: 300px;width:500px;margin:20px 0 0;float:right"></div></p>
            </div>
            <div class="div_any_child">
                <div class="div_any_title"><img src="../images/title_10.png">湖北内外治愈率对比</div>
                <p ><div id="main8" style="right: 8px;height: 300px;width:500px;margin:20px 0 0;float:right"></div></p>
            </div>
        </div>
        <div class="left div_any01" style="width:31%">
            <div class="div_any_child">
                <div class="div_any_title"><img src="../images/title_5.png">湖北内外死亡率对比</div>
                <p  ><div id="main9" style="right: 8px;height: 300px;width:500px;margin:20px 0 0;float:right"></div>
                </p>
            </div>
           
        </div>
       
    </div>


</div>
</body>
<script type="text/javascript">

var heal3 = document.getElementsByName('Test7');
var test7= new Array();

for(var pp1=0;pp1<heal3.length;pp1++){
	test7.push(heal3[pp1].value);
}

var dead3= document.getElementsByName('Test8');
var test8= new Array();
for(var pp2=0;pp2<dead3.length;pp2++){
	test8.push(dead3[pp2].value);
}
var healRate3 = document.getElementsByName('Test9');
var test9= new Array();

for(var pp1=0;pp1<healRate3.length;pp1++){
	test9.push(healRate3[pp1].value);
}

var deadRate3= document.getElementsByName('Test10');
var test10= new Array();
for(var pp2=0;pp2<deadRate3.length;pp2++){
	test10.push(deadRate3[pp2].value);
}

var lastUpdateTimes3 =document.getElementsByName('Test11');

var test11= new Array();
for(var pp3=0;pp3<lastUpdateTimes3.length;pp3++){
	test11.push(lastUpdateTimes3[pp3].value);
}

var d_dates =document.getElementsByName('Test12');

var test12= new Array();
for(var pp3=0;pp3<d_dates.length;pp3++){
	test12.push(d_dates[pp3].value);
}

var hubeis =document.getElementsByName('Test13');
var test13= new Array();
for(var pp3=0;pp3<hubeis.length;pp3++){
	test13.push(hubeis[pp3].value);
}

var countrys =document.getElementsByName('Test14');
var test14= new Array();
for(var pp3=0;pp3<countrys.length;pp3++){
	test14.push(countrys[pp3].value);
}

var nohubeis =document.getElementsByName('Test15');
var test15= new Array();
for(var pp3=0;pp3<nohubeis.length;pp3++){
	test15.push(nohubeis[pp3].value);
}


var d_dates2 =document.getElementsByName('Test16');

var test16= new Array();
for(var pp3=0;pp3<d_dates2.length;pp3++){
	test16.push(d_dates2[pp3].value);
}
var t17 =document.getElementsByName('Test17');
var test17= new Array();
for(var pp3=0;pp3<t17.length;pp3++){
	test17.push(t17[pp3].value);
}

var t18 =document.getElementsByName('Test18');
var test18= new Array();
for(var pp3=0;pp3<t18.length;pp3++){
	test18.push(t18[pp3].value);
}

var t19 =document.getElementsByName('Test19');
var test19= new Array();
for(var pp3=0;pp3<t19.length;pp3++){
	test19.push(t19[pp3].value);
}

var t20 =document.getElementsByName('Test20');
var test20= new Array();
for(var pp3=0;pp3<t20.length;pp3++){
	test20.push(t20[pp3].value);
}

var t21 =document.getElementsByName('Test21');
var test21= new Array();
for(var pp3=0;pp3<t21.length;pp3++){
	test21.push(t21[pp3].value);
}

var t22 =document.getElementsByName('Test22');
var test22= new Array();
for(var pp3=0;pp3<t22.length;pp3++){
	test22.push(t22[pp3].value);
}


var chart3 = echarts.init(document.getElementById('main3'));
var option3 = {
		color:['#47ff66','#f54545'],
	    title: {
	       
		    subtext: '单位：例',
            subtextStyle: {
	        	fontWeight: 'bold',              //标题颜色
	        	color: 'yellow'
	      	}
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data: ['治愈', '死亡'],
	        textStyle:{
                color:'#fff'
            }
	    
	    },
	    dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	            
	        },
	        {
	            type: 'inside',
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	        }
	    ],
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '50',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	        	dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: { }
	            
	        },
	        iconStyle:{
                normal:{
                  color:'#fff'//设置颜色
                }
            }
	    
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: test11,
	        axisLine: {
                lineStyle: {
                    type: 'solid',
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#fff',//坐标值得具体的颜色

                }
            }
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}'
	        },
	        axisLine: {
                lineStyle: {
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#fff',//坐标值得具体的颜色

                }
            }
	    },
	    series: [
	        {
	            name: '治愈',
	            type: 'line',
	            data: test7,
	            smooth: true
	        },
	        {
	            name: '死亡',
	            type: 'line',
	            data: test8,
	            smooth: true
	        }
	    ]
	};
chart3.setOption(option3);


var chart4 = echarts.init(document.getElementById('main4'));
var option4 = {
		color:['#8907ff','#ffc907'],
	    title: {
	       
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data: ['治愈率', '死亡率'],
	        textStyle:{
                color:'#fff'
            }
	    
	    },
	    dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	            
	        },
	        {
	            type: 'inside',
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	        }
	    ],
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '50',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	        	dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: { }
	            
	        },
	        iconStyle:{
                normal:{
                  color:'#fff'//设置颜色
                }
            }
	    
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: test11,
	        axisLine: {
                lineStyle: {
                    type: 'solid',
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#fff',//坐标值得具体的颜色

                }
            }
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value} %'
	        },
	        axisLine: {
                lineStyle: {
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            }
	    },
	    series: [
	        {
	            name: '治愈率',
	            type: 'line',
	            data: test9,
	            smooth: true
	        },
	        {
	            name: '死亡率',
	            type: 'line',
	            data: test10,
	            smooth: true
	        }
	    ]
	};
chart4.setOption(option4);

var chart5 = echarts.init(document.getElementById('main5'));
var option5 = {
		color:['#38fff6'],
	    title: {
	       
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data: ['武汉新增确诊趋势'],
	        textStyle:{
                color:'#fff'
            }
	    
	    },
	    dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	            
	        },
	        {
	            type: 'inside',
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	        }
	    ],
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '50',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	        	dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: { }
	            
	        },
	        iconStyle:{
                normal:{
                  color:'#fff'//设置颜色
                }
            }
	    
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: test12,
	        axisLine: {
                lineStyle: {
                    type: 'solid',
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#fff',//坐标值得具体的颜色

                }
            }
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}'
	        },
	        axisLine: {
                lineStyle: {
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            }
	    },
	    series: [
	        {
	            name: '武汉新增确诊趋势',
	            type: 'line',
	            data: test13,
	            smooth: true
	        }
	    ]
	};
chart5.setOption(option5);

var chart6 = echarts.init(document.getElementById('main6'));
var option6 = {
		color:['#4407ff'], 
	    title: {
	       
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data: ['全国(非湖北)新增确诊趋势'],
	        textStyle:{
                color:'#fff'
            }
	    
	    },
	    dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	            
	        },
	        {
	            type: 'inside',
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	        }
	    ],
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '50',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	        	dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: { }
	            
	        },
	        iconStyle:{
                normal:{
                  color:'#fff'//设置颜色
                }
            }
	    
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: test12,
	        axisLine: {
                lineStyle: {
                    type: 'solid',
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#fff',//坐标值得具体的颜色

                }
            }
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}'
	        },
	        axisLine: {
                lineStyle: {
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            }
	    },
	    series: [
	        {
	            name: '全国(非湖北)新增确诊趋势',
	            type: 'line',
	            data: test14,
	            smooth: true
	        }
	    ]
	};
chart6.setOption(option6);

var chart7 = echarts.init(document.getElementById('main7'));
var option7 = {
		color:['#ff8547'],
	    title: {
	       
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data: ['全国(非湖北)新增确诊趋势'],
	        textStyle:{
                color:'#fff'
            }
	    
	    },
	    dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	            
	        },
	        {
	            type: 'inside',
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	        }
	    ],
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '50',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	        	dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: { }
	            
	        },
	        iconStyle:{
                normal:{
                  color:'#fff'//设置颜色
                }
            }
	    
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: test12,
	        axisLine: {
                lineStyle: {
                    type: 'solid',
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#fff',//坐标值得具体的颜色

                }
            }
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}'
	        },
	        axisLine: {
                lineStyle: {
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            }
	    },
	    series: [
	        {
	            name: '全国(非湖北)新增确诊趋势',
	            type: 'line',
	            data: test15,
	            smooth: true
	        }
	    ]
	};
chart7.setOption(option7);

var chart8 = echarts.init(document.getElementById('main8'));
var option8 = {
		color:['#8907ff','#5197ff','#ff8547'],
	    title: {
	       
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data: [ '湖北','非湖北','全国'],
	        textStyle:{
                color:'#fff'
            }
	    
	    },
	    dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	            
	        },
	        {
	            type: 'inside',
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	        }
	    ],
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '50',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	        	dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: { }
	            
	        },
	        iconStyle:{
                normal:{
                  color:'#fff'//设置颜色
                }
            }
	    
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: test16,
	        axisLine: {
                lineStyle: {
                    type: 'solid',
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#fff',//坐标值得具体的颜色

                }
            }
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value} %'
	        },
	        axisLine: {
                lineStyle: {
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            }
	    },
	    series: [
	        {
	            name: '湖北',
	            type: 'line',
	            data: test17,
	            smooth: true
	        },
	        {
	            name: '非湖北',
	            type: 'line',
	            data: test18,
	            smooth: true
	        },
	        {
	            name: '全国',
	            type: 'line',
	            data: test19,
	            smooth: true
	        }
	        
	    ]
	};
chart8.setOption(option8);

var chart9 = echarts.init(document.getElementById('main9'));
var option9 = {
		color:['#6bf912','#51ffff','#c33b7a'],
	    title: {
	       
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data: [ '湖北','非湖北','全国'],
	        textStyle:{
                color:'#fff'
            }
	    
	    },
	    dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	            
	        },
	        {
	            type: 'inside',
	            realtime: true,
	            start: 65,
	            end: 85,
	            textStyle:{
	                color:'#fff'
	            }
	        }
	    ],
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '50',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	        	dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: { }
	            
	        },
	        iconStyle:{
                normal:{
                  color:'#fff'//设置颜色
                }
            }
	    
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: test16,
	        axisLine: {
                lineStyle: {
                    type: 'solid',
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            },
            axisLabel: {
                textStyle: {
                    color: '#fff',//坐标值得具体的颜色

                }
            }
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value} %'
	        },
	        axisLine: {
                lineStyle: {
                    color: '#fff',//左边线的颜色
                    width:'2'//坐标线的宽度
                }
            }
	    },
	    series: [
	        {
	            name: '湖北',
	            type: 'line',
	            data: test20,
	            smooth: true
	        },
	        {
	            name: '非湖北',
	            type: 'line',
	            data: test21,
	            smooth: true
	        },
	        {
	            name: '全国',
	            type: 'line',
	            data: test22,
	            smooth: true
	        }
	        
	    ]
	};
chart9.setOption(option9);

</script>
</html>
