<%@page import="com.BigData.model.All_data"%>
<%@page import="com.BigData.model.N_data"%>
<%@page import="com.BigData.model.Text_data"%>
<%@page import="com.BigData.model.Simpledata"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.BigData.model.Personline"%>
<%@page import="com.BigData.Dao.UserDaoImpl"%>
<%@page import="com.BigData.Dao.UserDao"%>
<%@page import="com.BigData.model.Virus"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>疫情情况</title>
    <link href="../styles/common.css" rel="stylesheet">
    <script src="../scripts/Plugin/jquery-3.3.1.min.js"></script>
    <script src="../scripts/Plugin/echarts.js"></script>
    <script src="../scripts/Plugin/bmap.min.js"></script>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=WSrX4bCfgcjTfhWNCwvfI1ZnQnfZDxFW"></script>
    <script src="../scripts/common.js"></script>
    <script src="../scripts/index.js"></script>
    <script src="../scripts/Plugin/laydate/laydate.js"></script>
    <script type="text/javascript" src="jquery.js"></script>
   <script src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
	 <script src="js/province/hubei.js"></script> 
	<script src="js/province/guangdong.js"></script> 
	<script src="js/province/shanxi1.js"></script> 
	<script src="js/province/anhui.js"></script> <script src="js/province/aomen.js"></script> 
	<script src="js/province/beijing.js"></script> <script src="js/province/chongqing.js"></script>
	<script src="js/province/fujian.js"></script>  <script src="js/province/gansu.js"></script> 
	<script src="js/province/guangxi.js"></script> <script src="js/province/guizhou.js"></script> 
	<script src="js/province/hainan.js"></script> <script src="js/province/hebei.js"></script> 
	 <script src="js/province/heilongjiang.js"></script> <script src="js/province/henan.js"></script>
	<script src="js/province/hunan.js"></script> <script src="js/province/jiangsu.js"></script> 
	<script src="js/province/jiangxi.js"></script> <script src="js/province/jilin.js"></script> 
	<script src="js/province/liaoning.js"></script> <script src="js/province/neimenggu.js"></script>
	<script src="js/province/ningxia.js"></script> <script src="js/province/qinghai.js"></script>  
	<script src="js/province/shandong.js"></script> <script src="js/province/shanxi.js"></script> 
	<script src="js/province/sichuan.js"></script> <script src="js/province/taiwan.js"></script> 
	<script src="js/province/tianjin.js"></script> <script src="js/province/xianggang.js"></script>
	<script src="js/province/xinjiang.js"></script>  <script src="js/province/xizang.js"></script> 
	<script src="js/province/yunnan.js"></script> <script src="js/province/zhejiang.js"></script> 
	<script src="china.js"></script>
	<link rel="stylesheet" href="../dist/css/layui.css">

<script src="jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
        //要实现各行变色效果，添加以下jQuery代码:
        $(function () {
          /*   $("tbody>tr:odd").addClass("odd");//将表体的奇数行添加样式
            $("tbody>tr:even").addClass("even");//将表体的偶数行添加样式
            //选中的行实现高亮效果则添加如下代码
            $("tbody>tr").mouseover(function () {
                $(this).addClass("selected");
            }).mouseout(function () {
                $(this).removeClass("selected");
            }); */
            //表格的展开和收缩实现代码
            $("tr.parent").click(function () {  //获取所谓的父行
                var $a = $("<strong>+</strong>");
                var $b = $("<strong>-</strong>");
                //添加/删除高亮效果             //  隐藏/显示所谓的子行
                $(this).toggleClass("selected").siblings(".child_" + this.id).toggle();        
               //想让表格一加载就折叠，需要加上click事件触发就行了
            }).click();
        });
    </script>
	<script type="text/javascript">
	$(document).ready(function(){
		var html=$(".wrap ul").html()
		$(".wrap ul").append(html)
		var ls=$(".wrap li").length/2+1
		i=0
		ref = setInterval(function(){
			i++
			if(i==ls){
				i=1
				$(".wrap ul").css({marginTop:0})
				$(".wrap ul").animate({marginTop:-'.52'*i+'rem'},1000)
			}
	    	$(".wrap ul").animate({marginTop:-'.52'*i+'rem'},1000)


		},2400);
	})
	
	 
</script>
  <style>

 
.wrap{ overflow: hidden;}
.wrap li{  line-height:.42rem; height:18px; font-size: .18rem; text-indent: .24rem; margin-bottom: .1rem; }
.wrap li p{color: rgba(255,255,255,.6); height:18px;font-size:13px}

.box_all{ border: 1px solid rgba(25,186,139,.17); padding:0 .3rem .3rem .3rem;  background: rgba(255,255,255,.04) url(../images/line.png); background-size: 100% auto; position: relative; margin-bottom: .3rem; z-index: 10;}
.box_all:before,
.box_all:after{ position:absolute; width: .1rem; height: .1rem; content: "";  border-top: 2px solid #02a6b5; top: 0;}
.box_all:before,.boxfoot:before{border-left: 2px solid #02a6b5;left: 0;}
.box_all:after,.boxfoot:after{border-right: 2px solid #02a6b5; right: 0;}
.all_title{ font-size:.24rem; color:#fff; text-align: center; line-height: .6rem; border-bottom:1px solid rgba(255,255,255,.2)}

.all_title {
    font-size:15px;
    color: #fff;
    height:18px;
    text-align: center;
    line-height: .6rem;
    margin-top:3px;
    border-bottom: 1px solid rgba(255,255,255,.2);
}
.wrap {
    height:175px;
    overflow: hidden;
}
ol,ul,p{ padding:0; margin:0}
.boxfoot{ position:absolute; bottom: 0; width: 100%; left: 0;}
.boxfoot:before,
.boxfoot:after{ position:absolute; width: .1rem; height: .1rem;  content: "";border-bottom: 2px solid #02a6b5; bottom: 0;}


</style>
</head>
<body style="">
<%
UserDaoImpl dataImp=new UserDaoImpl();
Date t = new Date();
SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
String date=df2.format(t);
Simpledata simpledatas=dataImp.load_SD(date);
List<Text_data> text_datas =dataImp.load_T();
List<Virus> viruses=dataImp.loads();
Virus virus=new Virus();
String beijingdata=dataImp.load_data1("北京").getAll_confirm();
String TJdata=dataImp.load_data1("天津").getAll_confirm();
String SHdata=dataImp.load_data1("上海").getAll_confirm();
String CQdata=dataImp.load_data1("重庆").getAll_confirm();
String HBdata=dataImp.load_data1("河北").getAll_confirm();

/*河南*/
String HNdata=dataImp.load_data1("河南").getAll_confirm();
String HNXY_data=dataImp.load_data2("信阳").getAll_confirm();
String HNZZ_data=dataImp.load_data2("郑州").getAll_confirm();
String HNNY_data=dataImp.load_data2("南阳").getAll_confirm();
String HNZMD_data=dataImp.load_data2("驻马店").getAll_confirm();
String HNSQ_data=dataImp.load_data2("商丘").getAll_confirm();
String HNZK_data=dataImp.load_data2("周口").getAll_confirm();
String HNPGS_data=dataImp.load_data2("平顶山").getAll_confirm();
String HNXX_data=dataImp.load_data2("新乡").getAll_confirm();
String HNAY_data=dataImp.load_data2("安阳").getAll_confirm();
String HNXC_data=dataImp.load_data2("许昌").getAll_confirm();
String HNLH_data=dataImp.load_data2("漯河").getAll_confirm();
String HNJZ_data=dataImp.load_data2("焦作").getAll_confirm();
String HNLY_data=dataImp.load_data2("洛阳").getAll_confirm();
String HNKF_data=dataImp.load_data2("开封").getAll_confirm();
String HNHB_data=dataImp.load_data2("鹤壁").getAll_confirm();
String HNPY_data=dataImp.load_data2("濮阳").getAll_confirm();
String HNSMX_data=dataImp.load_data2("三门峡").getAll_confirm();
String HNJY_data=dataImp.load_data2("济源示范区").getAll_confirm();


String YNdata=dataImp.load_data1("云南").getAll_confirm();
String LNdata=dataImp.load_data1("辽宁").getAll_confirm();
String HLJdata=dataImp.load_data1("黑龙江").getAll_confirm();

String HN_data=dataImp.load_data1("湖南").getAll_confirm();
String HNCS_data=dataImp.load_data2("长沙").getAll_confirm();
String HNYY_data=dataImp.load_data2("岳阳").getAll_confirm();
String HNSY_data=dataImp.load_data2("邵阳").getAll_confirm();
String HNCD_data=dataImp.load_data2("常德").getAll_confirm();
String HNZ_data=dataImp.load_data2("株洲").getAll_confirm();
String HNLD_data=dataImp.load_data2("娄底").getAll_confirm();
String HNY_data=dataImp.load_data2("益阳").getAll_confirm();
String HNHY_data=dataImp.load_data2("衡阳").getAll_confirm();
String HNYZ_data=dataImp.load_data2("永州").getAll_confirm();
String HNHH_data=dataImp.load_data2("怀化").getAll_confirm();
String HNCZ_data=dataImp.load_data2("郴州").getAll_confirm();//chen zhou
String HNXT_data=dataImp.load_data2("湘潭").getAll_confirm();
String HNX_data=dataImp.load_data2("湘西自治州").getAll_confirm();
String HNZJJ_data=dataImp.load_data2("张家界").getAll_confirm();




String AHdata=dataImp.load_data1("安徽").getAll_confirm();




String SDdata=dataImp.load_data1("山东").getAll_confirm();
String XJdata=dataImp.load_data1("新疆").getAll_confirm();
String JSdata=dataImp.load_data1("江苏").getAll_confirm();

String ZJdata=dataImp.load_data1("浙江").getAll_confirm();
String ZJWZ_data=dataImp.load_data2("温州").getAll_confirm();
String ZJHZ_data=dataImp.load_data2("杭州").getAll_confirm();
String ZJNB_data=dataImp.load_data2("宁波").getAll_confirm();
String ZJTZ_data=dataImp.load_data2("台州").getAll_confirm();
String ZJJH_data=dataImp.load_data2("金华").getAll_confirm();
String ZJJX_data=dataImp.load_data2("嘉兴").getAll_confirm();
String ZJSX_data=dataImp.load_data2("绍兴").getAll_confirm();
String ZJLS_data=dataImp.load_data2("丽水").getAll_confirm();
String ZJHZ1_data=dataImp.load_data2("湖州").getAll_confirm();
String ZJZS_data=dataImp.load_data2("舟山").getAll_confirm();
String ZJKZ_data=dataImp.load_data2("衢州").getAll_confirm();


String JXdata=dataImp.load_data1("江西").getAll_confirm();

/*湖北*/
String HB_data=dataImp.load_data1("湖北").getAll_confirm();
String HBWH_data=dataImp.load_data2("武汉").getAll_confirm();
String HBXG_data=dataImp.load_data2("孝感").getAll_confirm();
String HBHG_data=dataImp.load_data2("黄冈").getAll_confirm();
String HBJZ_data=dataImp.load_data2("荆州").getAll_confirm();
String HBEZ_data=dataImp.load_data2("鄂州").getAll_confirm();
String HBSZ_data=dataImp.load_data2("随州").getAll_confirm();
String HBXY_data=dataImp.load_data2("襄阳").getAll_confirm();
String HBHS_data=dataImp.load_data2("黄石").getAll_confirm();
String HBYC_data=dataImp.load_data2("宜昌").getAll_confirm();
String HBJM_data=dataImp.load_data2("荆门").getAll_confirm();
String HBXN_data=dataImp.load_data2("咸宁").getAll_confirm();
String HBSY_data=dataImp.load_data2("十堰").getAll_confirm();
String HBXT_data=dataImp.load_data2("仙桃").getAll_confirm();
String HBTM_data=dataImp.load_data2("天门").getAll_confirm();
String HB_ES_data=dataImp.load_data2("恩施州").getAll_confirm();
String HBQJ=dataImp.load_data2("潜江").getAll_confirm();
String HB_SNJ_data=dataImp.load_data2("神农架").getAll_confirm();


String GXdata=dataImp.load_data1("广西").getAll_confirm();
String GSdata=dataImp.load_data1("甘肃").getAll_confirm();
String SXdata=dataImp.load_data1("山西").getAll_confirm();
String NMGdata=dataImp.load_data1("内蒙古").getAll_confirm();

String JLdata=dataImp.load_data1("吉林").getAll_confirm();
String FJdata=dataImp.load_data1("福建").getAll_confirm();
String GZdata=dataImp.load_data1("贵州").getAll_confirm();



/*广东*/
String GDdata=dataImp.load_data1("广东").getAll_confirm();

String GD_SZdata=dataImp.load_data2("深圳").getAll_confirm();
String GD_GZdata=dataImp.load_data2("广州").getAll_confirm();
String GD_ZHdata=dataImp.load_data2("珠海").getAll_confirm();
String GD_DWdata=dataImp.load_data2("东莞").getAll_confirm();
String GD_FSdata=dataImp.load_data2("佛山").getAll_confirm();
String GD_ZSdata=dataImp.load_data2("中山").getAll_confirm();
String GD_HZdata=dataImp.load_data2("惠州").getAll_confirm();
String GD_STdata=dataImp.load_data2("汕头").getAll_confirm();
String GD_JMdata=dataImp.load_data2("江门").getAll_confirm();
String GD_ZJdata=dataImp.load_data2("湛江").getAll_confirm();
String GD_ZQdata=dataImp.load_data2("肇庆").getAll_confirm();
String GD_MZdata=dataImp.load_data2("梅州").getAll_confirm();
String GD_MMdata=dataImp.load_data2("茂名").getAll_confirm();
String GD_YJdata=dataImp.load_data2("阳江").getAll_confirm();
String GD_QYdata=dataImp.load_data2("清远").getAll_confirm();
String GD_SGdata=dataImp.load_data2("韶关").getAll_confirm();
String GD_JYdata=dataImp.load_data2("揭阳").getAll_confirm();
String GD_SWdata=dataImp.load_data2("汕尾").getAll_confirm();
String GD_CZdata=dataImp.load_data2("潮州").getAll_confirm();
String GD_HYdata=dataImp.load_data2("河源").getAll_confirm();




String QHdata=dataImp.load_data1("青海").getAll_confirm();
String QH_XNdata=dataImp.load_data2("西宁").getAll_confirm();
String QH_HBZdata=dataImp.load_data2("海北州").getAll_confirm();

String XZdata=dataImp.load_data1("西藏").getAll_confirm();
String SCdata=dataImp.load_data1("四川").getAll_confirm();
String NXdata=dataImp.load_data1("宁夏").getAll_confirm();
String NX_YCdata=dataImp.load_data2("银川").getAll_confirm();
String NX_WZdata=dataImp.load_data2("吴忠").getAll_confirm();
String NX_GYdata=dataImp.load_data2("固原").getAll_confirm();
String NX_ZWdata=dataImp.load_data2("中卫").getAll_confirm();
String NX_SZSdata=dataImp.load_data2("石嘴山").getAll_confirm();

String TWdata=dataImp.load_data1("台湾").getAll_confirm();
String XGdata=dataImp.load_data1("香港").getAll_confirm();
String AMdata=dataImp.load_data1("澳门").getAll_confirm();

/*陕西*/
String SX_data=dataImp.load_data1("陕西").getAll_confirm();
String SX_YLdata=dataImp.load_data2("榆林").getAll_confirm();
String SX_YAdata=dataImp.load_data2("延安").getAll_confirm();
String SX_BJdata=dataImp.load_data2("宝鸡").getAll_confirm();
String SX_TCdata=dataImp.load_data2("铜川").getAll_confirm();
String SX_XYdata=dataImp.load_data2("咸阳").getAll_confirm();
String SX_XAdata=dataImp.load_data2("西安").getAll_confirm();
String SX_WNdata=dataImp.load_data2("渭南").getAll_confirm();
String SX_SLdata=dataImp.load_data2("商洛").getAll_confirm();
String SX_HZdata=dataImp.load_data2("汉中").getAll_confirm();
String SX_AKdata=dataImp.load_data2("安康").getAll_confirm();

List<N_data> ndatas=dataImp.load_ND();
List<String> confirms=new ArrayList<String>();
List<String> suspects=new ArrayList<String>();
List<String> lastUpdateTimes=new ArrayList<String>();

List<N_data> ndatas2=dataImp.load_ND2();
for (N_data ndata:ndatas){
	confirms.add(ndata.getConfirm());
	suspects.add(ndata.getSuspect());
	lastUpdateTimes.add(ndata.getLastUpdateTime());
}
List<String> confirms2=new ArrayList<String>();
List<String> suspects2=new ArrayList<String>();
List<String> lastUpdateTimes2=new ArrayList<String>();

for (N_data ndata:ndatas2){
	confirms2.add(ndata.getConfirm());
	suspects2.add(ndata.getSuspect());
	lastUpdateTimes2.add(ndata.getLastUpdateTime());
}

List<All_data> all_datas_c=dataImp.load_all("country");
List<All_data> all_datas=dataImp.load_all("province");
%>
<%for(int i=0;i<confirms.size();i++){ %>
<input type="hidden" id="Test1" name="Test1" value="<%=confirms.get(i) %>"/>
<%} %>


<%for(int i=0;i<suspects.size();i++){ %>
<input type="hidden" id="Test2" name="Test2" value="<%=suspects.get(i) %>"/>
<%} %>
<%for(int i=0;i<lastUpdateTimes.size();i++){ %>
<input type="hidden" id="Test3" name="Test3" value="<%=lastUpdateTimes.get(i) %>"/>
<%} %>
<%for(int i=0;i<confirms2.size();i++){ %>
<input type="hidden" id="Test4" name="Test4" value="<%=confirms2.get(i) %>"/>
<%} %>


<%for(int i=0;i<suspects2.size();i++){ %>
<input type="hidden" id="Test5" name="Test5" value="<%=suspects2.get(i) %>"/>
<%} %>
<%for(int i=0;i<lastUpdateTimes2.size();i++){ %>
<input type="hidden" id="Test6" name="Test6" value="<%=lastUpdateTimes2.get(i) %>"/>
<%} %>
<!--顶部-->
<header class="header left">
    <div class="left nav">
        <ul>
            <li class="nav_active"><i class="nav_1"></i><a href="XUYAO.jsp">疫情概况</a> </li>
            <li ><i class="nav_2"></i><a href="Road.jsp">路线分析</a> </li>
            <li ><i class="nav_3"></i><a href="Otherdata.jsp">其他信息</a> </li>
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

</header>
<!--内容部分-->
<div class="con left" style="
    height: auto;
">
    <!--数据总概-->
    <div class="con_div">
        <div class="con_div_text left">
            <div class="con_div_text01 left">
                <img src="../images/info_1.png" class="left text01_img"/>
                <div class="left text01_div">
                    <p>总确认病例数</p>
                    <p><%=simpledatas.getConfirm() %></p>
                </div>
            </div>
            <div class="con_div_text01 right">
                <img src="../images/info_2.png" class="left text01_img"/>
                <div class="left text01_div">
                    <p>当天确诊疑似病例(人)</p>
                    <p><%=simpledatas.getAdd_confirm() %></p>
                </div>
            </div>
        </div>
           <div class="con_div_text left">

            <div class="con_div_text01 left">
                <img src="../images/info_5.png" class="left text01_img"/>
                <div class="left text01_div">
                    <p>疑似病例</p>
                    <p class="org"><%=simpledatas.getSuspect() %></p>
                </div>
            </div>
            <div class="con_div_text01 right">
                <img src="../images/info_6.png" class="left text01_img"/>
                <div class="left text01_div">
                    <p>当天增加疑似病例(人)</p>
                    <p class="org"><%=simpledatas.getAdd_suspect() %></p>
                </div>
            </div>
        </div>
        <div class="con_div_text left">
            <div class="con_div_text01 left">
                <img src="../images/info_3.png" class="left text01_img"/>
                <div class="left text01_div">
                    <p>总治愈病例</p>
                    <p class="sky"><%=simpledatas.getHeal() %></p>
                </div>
            </div>
            <div class="con_div_text01 right">
                <img src="../images/info_4.png" class="left text01_img"/>
                <div class="left text01_div">
                    <p>当天增加治愈病例(人)</p>
                    <p class="sky"><%=simpledatas.getAdd_heal() %></p>
                </div>
            </div>
        </div>
     
           <div class="con_div_text left">
            <div class="con_div_text01 left">
                <img src="../images/info_5.png" class="left text01_img"/>
                <div class="left text01_div">
                    <p>总死亡病例</p>
                    <p class="org"><%=simpledatas.getDead() %></p>
                </div>
            </div>
            <div class="con_div_text01 right">
                <img src="../images/info_6.png" class="left text01_img"/>
                <div class="left text01_div">
                    <p>当天增加死亡病例</p>
                    <p class="org"><%=simpledatas.getAdd_dead() %></p>
                </div>
            </div>
        </div>
    </div>
  <!--统计分析图-->
    <div class="box_all" style="height: 200px;">
                    <div class="all_title">最新进展</div>
                    <div class="wrap">
                        <ul >
                        <%for (Text_data text_data:text_datas){ %>
                            <li>
                                <p><a style="color:blue" href="<%=text_data.getUrl() %>">来源:<%=text_data.getMedia()%></a>&nbsp;&nbsp;<span>时间:<%=text_data.getPublish_time() %>&nbsp;&nbsp;<%=text_data.getC_desc() %></span></p>
                            </li>
                           
                            <%} %>
                        </ul>
                    
                    </div>
                    	<div class="boxfoot"></div>
                    	</div>
                    	 <div id="main" style="height: 700px;width: 1000px;-webkit-tap-highlight-color: transparent;float:left;user-select: none;top: 60px;""></div>

<div id="main2" style="height: 300px;width:520px;float:right"></div>
<div id="main3" style="height: 300px;width:520px;float:right"></div>
<div style=" margin-left: 25px;margin-right: 25px;background-color:transparent">
	<table class="layui-table" style="background-color:transparent">
		<thead>
			<tr style="color:#61d2f7; background-color:transparent">
				<th>中国地区</th>
				<th>新增确诊</th>
				<th>累计确诊</th>
				<th>累计治愈</th>
				<th>累计死亡</th>
				<th>累计治愈率</th>
				<th>累计死亡率</th>
			</tr>
		</thead>
		<tbody >
		<%
		int i=1;
		for(All_data all_data :all_datas){ 
			List<All_data> all_datas2=dataImp.load_all2(all_data.getProvince());
		%>
			<tr class="parent" id="row_<%=i%>" style="color: #56ec59">
				<td><strong><%=all_data.getProvince() %></strong></td>
				<td><%=all_data.getT_confirm() %></td>
				<td><%=all_data.getConfirm() %></td>
				<td><%=all_data.getAll_heal() %></td>
				<td><%=all_data.getAll_dead() %></td>
				<td><%=all_data.getAll_healRate() %></td>
				<td><%=all_data.getAll_deadRate() %></td>
			</tr>
			<%for(All_data all_data2 :all_datas2) {%>
			<tr class="child_row_<%=i%>" style="color: yellow">
			<td><%=all_data2.getArea() %></td>
			<td><%=all_data2.getT_confirm() %></td>
			<td><%=all_data2.getConfirm() %></td>
				<td><%=all_data2.getAll_heal() %></td>
				<td><%=all_data2.getAll_dead() %></td>
				<td><%=all_data2.getAll_healRate() %></td>
				<td><%=all_data2.getAll_deadRate() %></td>
			<%} %>
			<%
		i++;	
		} %>
			
		</tbody>
	</table >
	<br/>
	<table class="layui-table" style="background-color:transparent">
		<thead>
			<tr style="color: #ffa80a; background-color:transparent">
				<th>各个国家</th>
				<th>新增确诊</th>
				<th>累计确诊</th>
				<th>累计治愈</th>
				<th>累计死亡</th>
				<th>累计治愈率</th>
				<th>累计死亡率</th>
			</tr>
		</thead>
		<tbody style="color: #61d2f7">
		<%
		int j=0;
		for(All_data all_data :all_datas_c){ 
		%>
			<tr class="parent" id="row_<%=j%>">
				<td><strong><%=all_data.getCountry() %></strong></td>
				<td><%=all_data.getT_confirm() %></td>
				<td><%=all_data.getConfirm() %></td>
				<td><%=all_data.getAll_heal() %></td>
				<td><%=all_data.getAll_dead() %></td>
				<td><%=all_data.getAll_healRate() %></td>
				<td><%=all_data.getAll_deadRate() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	</div>
</div>

<script type="text/javascript">
    // 全国省份列表
 
function randomData() {  
	return Math.round(Math.random()*500);
}  
 
var dataMap =[  
    {name: '北京',value: <%=beijingdata%> },
    {name: '天津',value: <%=TJdata%>},  
    {name: '上海',value: <%=SHdata%>},
    {name: '重庆',value: <%=CQdata%>},  
    {name: '河北',value: <%=HBdata%> },
    {name: '河南',value: <%=HNdata%>},  
    {name: '云南',value: <%=YNdata%> },
    {name: '辽宁',value: <%=LNdata%> },  
    {name: '黑龙江',value: <%=HLJdata%> },
    {name: '湖南',value: <%=HN_data%> },  
    {name: '安徽',value: <%=AHdata%> },
    {name: '山东',value: <%=SDdata%> },  
    {name: '新疆',value: <%=XJdata%> },
    {name: '江苏',value: <%=JSdata%> },  
    {name: '浙江',value: <%=ZJdata%> },
    {name: '江西',value: <%=JXdata%> },  
    {name: '湖北',value: <%=HB_data%> },
    {name: '广西',value: <%=GXdata%> },  
    {name: '甘肃',value: <%=GSdata%> },
    {name: '山西',value: <%=SXdata%> },  
    {name: '内蒙古',value: <%=NMGdata%> },
    {name: '陕西',value: <%=SX_data%> },  
    {name: '吉林',value: <%=JLdata%> },
    {name: '福建',value: <%=FJdata%> },  
    {name: '贵州',value: <%=GZdata%> },
    {name: '广东',value: <%=GDdata%> },  
    {name: '青海',value: <%=QHdata%> },
    {name: '西藏',value: <%=XZdata%> },  
    {name: '四川',value: <%=SCdata%> },
    {name: '宁夏',value: <%=NXdata%> },  
    {name: '海南',value: <%=HNdata%> },
    {name: '台湾',value: <%=TWdata%> },  
    {name: '香港',value: <%=XGdata%> },
    {name: '澳门',value: <%=AMdata%> },
    {name: '南海诸岛',value: 0}
];

var guangdongData = [
	
	{name: '广州市',value: <%=GD_GZdata%> },{name: '佛山市',value: <%=GD_FSdata%>},
	{name: '肇庆市',value: <%=GD_ZQdata%>},{name: '韶关市',value: <%=GD_SGdata%> },
	{name: '清远市',value: <%=GD_QYdata%>},{name: '云浮市',value: <%=GD_SZdata%>},
	{name: '茂名市',value: <%=GD_MMdata%>},{name: '湛江市',value: <%=GD_ZJdata%>},
	{name: '江门市',value: <%=GD_JMdata%> },{name: '东莞市',value:<%=GD_DWdata%> },
	{name: '阳江市',value: <%=GD_YJdata%> },{name: '深圳市',value: <%=GD_SZdata%> },
	{name: '惠州市',value: <%=GD_HZdata%> },
	{name: '汕尾市',value: <%=GD_SWdata%> },{name: '揭阳市',value:<%=GD_JYdata%> },
	{name: '河源市',value: <%=GD_HYdata%> },{name: '梅州市',value: <%=GD_MZdata%> },
	{name: '潮州市',value: <%=GD_CZdata%> },{name: '汕头市',value: <%=GD_STdata%> },
	{name: '中山市',value:<%=GD_ZSdata%>},{name: '珠海市',value:<%=GD_ZHdata%>},
	{name: '榆林市',value: <%=SX_YLdata%>},{name: '延安市',value: <%=SX_YAdata%>},
	{name: '宝鸡市',value: <%=SX_BJdata%>},{name: '铜川市',value: <%=SX_TCdata%> },
	{name: '咸阳市',value: <%=SX_XYdata%>},{name: '西安市',value: <%=SX_XAdata%> },
	{name: '渭南市',value: <%=SX_WNdata%>},{name: '商洛市',value:<%=SX_SLdata%> },
	{name: '汉中市',value: <%=SX_HZdata%>},{name: '安康市',value: <%=SX_AKdata%>},
	{name: '孝感市',value: <%=HBXG_data%>},{name: '黄冈市',value: <%=HBHG_data%>},
	{name: '荆州市',value: <%=HBJZ_data%>},{name: '武汉市',value: <%=HBWH_data%> },
	{name: '鄂州市',value: <%=HBEZ_data%>},{name: '随州市',value: <%=HBSZ_data%> },
	{name: '襄阳市',value: <%=HBXY_data%>},{name: '黄石市',value:<%=HBHS_data%> },
	{name: '宜昌市',value: <%=HBYC_data%>},{name: '荆门市',value: <%=HBJM_data%>},
	{name: '咸宁市',value: <%=HBXY_data%>},{name: '十堰市',value:<%=HBSY_data%> },
	{name: '仙桃市',value: <%=HBXT_data%>},{name: '天门市',value: <%=HBTM_data%>},
	{name: '恩施土家族苗族自治州',value: <%=HB_ES_data%>},{name: '潜江市',value:<%=HBQJ%> },
	{name: '神农架林区',value: <%=HB_SNJ_data%>},{name: '宜昌市',value: <%=HBYC_data%>},
	{name: '荆门市',value: <%=HBJM_data%>},{name: '咸宁市',value: <%=HBXY_data%>},
	{name: '十堰市',value:<%=HBSY_data%> },{name: '仙桃市',value: <%=HBXT_data%>},
	{name: '天门市',value: <%=HBTM_data%>},{name: '深圳市',value: <%=GD_SZdata%>},
	{name: '信阳市',value: <%=HNXY_data%>},{name: '郑州市',value:<%=HNZZ_data%> },
	{name: '南阳市',value: <%=HNNY_data%>},{name: '驻马店市',value: <%=HNZMD_data%>},
	{name: '商丘市',value: <%=HNSQ_data%>},{name: '周口市',value:<%=HNZK_data%> },
	{name: '平顶山市',value: <%=HNPGS_data%>},{name: '新乡市',value: <%=HNXX_data%>},
	{name: '安阳市',value: <%=HNAY_data%>},{name: '许昌市',value:<%=HNXC_data%> },
	{name: '漯河市',value: <%=HNLH_data%>},{name: '焦作市',value: <%=HNJZ_data%>},
	{name: '洛阳市',value: <%=HNLY_data%>},{name: '开封市',value:<%=HNKF_data%> },
	{name: '鹤壁市',value: <%=HNHB_data%>},{name: '濮阳市',value: <%=HNPY_data%>},
	{name: '三门峡市',value: <%=HNSMX_data%>},{name: '济源市',value: <%=HNJY_data%>},
	
	{name: '温州市',value: <%=ZJWZ_data%>},{name: '杭州市',value: <%=HNJZ_data%>},
	{name: '宁波市',value: <%=ZJNB_data%>},{name: '台州市',value:<%=ZJTZ_data%> },
	{name: '金华市',value: <%=ZJJH_data%>},{name: '嘉兴市',value: <%=ZJJX_data%>},
	{name: '绍兴市',value: <%=ZJSX_data%>},{name: '丽水市',value: <%=ZJLS_data%>},
	{name: '湖州市',value: <%=ZJHZ1_data%>},{name: '舟山市',value: <%=ZJZS_data%>},
	{name: '衢州市',value: <%=ZJKZ_data%>},{name: '湘西土家族苗族自治州',value: <%=HNX_data%>},
	{name: '长沙市',value: <%=HNCS_data%>},{name: '岳阳市',value: <%=HNYY_data%>},
	{name: '邵阳市',value: <%=HNSY_data%>},{name: '常德市',value:<%=HNCD_data%> },
	{name: '株洲市',value: <%=HNZ_data%>},{name: '娄底市',value: <%=HNLD_data%>},
	{name: '益阳市',value: <%=HNY_data%>},{name: '衡阳市',value: <%=HNHY_data%>},
	{name: '永州市',value: <%=HNYZ_data%>},{name: '怀化市',value: <%=HNHH_data%>},
	{name: '郴州市',value: <%=HNCZ_data%>},{name: '湘潭市',value: <%=HNXT_data%>},
	{name: '张家界市',value: <%=HNZJJ_data%>}, {name: '台湾省',value: <%=AMdata%>},
	{name: '西宁市',value: <%=QH_XNdata%>},{name: '海北藏族自治州',value: <%=QH_HBZdata%>},
	{name: '石嘴山市',value: <%=NX_SZSdata%>},{name: '中卫市',value: <%=NX_ZWdata%>},
	{name: '银川市',value: <%=NX_YCdata%>}, {name: '固原市',value: <%=NX_GYdata%>},
	{name: '吴忠市',value: <%=NX_WZdata%>}
	];


    function drawMap(darwMapType, data) {
    	// 需要在页面上直接标记出来的城市
    	 
    	var specialMap = [];
    	    // 对dataMap进行处理，使其可以直接在页面上展示
    	    for (var i = 0; i < specialMap.length; i++) {
    	        for (var j = 0; j < data.length; j++) {
    	            if (specialMap[i] == data[j].name) {
    	            	data[j].selected = true;
    	                break;
    	            }
    	 
    	        }
    	    }
var option = {
 		
        title : {
            text: '中国疫情地图',
            textStyle : {
			    color : 'yellow'
		    },
            subtext: '确认病例',
            subtextStyle: {
	        	fontWeight: 'normal',              //标题颜色
	        	color: '#fff'
	      	},
            x:'center'
        },
    tooltip: {
    	/* formatter: function (params) {
            var info = '<p style="font-size:18px">' + params.name + '</p><p style="font-size:14px">这里可以写一些，想展示在页面上的别的信息</p>'
            return info;
        }, */
        trigger: 'item',
        backgroundColor: "#ff7f50",//提示标签背景颜色
        textStyle: { color: "#fff" } //提示标签字体颜色
    },
		//左侧小导航图标
            visualMap: {  
            	textStyle : {
    			    color : '#fff'
    		    },
                show : true,  
                x: 'left',  
                y: 'center',  
                splitList: [   
                    {start: 10000, end:100000},{start: 1000, end:9999},  
                    {start: 500, end: 999},{start: 100, end: 499},  
                    {start: 10, end: 99},{start: 0, end: 9},  
                ],  
                color: ['#a11818', '#e53333' ,'#f36b6b','#ff9e6c', '#fec2b3','#ffe8e8']  
            }, 
    series: [
        {
            name: '中国',
            type: 'map',
            mapType: darwMapType,
            
            label: {
                normal: {
                    show: true,//显示省份标签
                },
                emphasis: {
                    show: true,//对应的鼠标悬浮效果
                }
            },
 
            data: data
        }
    ]
};
	echarts.dispose(document.getElementById('main'));//先去掉原来的地图
	var chart = echarts.init(document.getElementById('main'));
	chart.setOption(option);
	chart.on("dblclick", function(param) {
		drawMap(param.name, guangdongData);
	});
	}
	window.onload = function() {
		drawMap('china', dataMap);
	}
	
	
	
	var confirms = document.getElementsByName('Test1');
	var test1= new Array();

	for(var pp1=0;pp1<confirms.length;pp1++){
		test1.push(confirms[pp1].value);
	}

	var suspects = document.getElementsByName('Test2');
	var test2= new Array();
	for(var pp2=0;pp2<suspects.length;pp2++){
		test2.push(suspects[pp2].value);
	}
	var lastUpdateTimes =document.getElementsByName('Test3');

	var test3= new Array();
	for(var pp3=0;pp3<lastUpdateTimes.length;pp3++){
		test3.push(lastUpdateTimes[pp3].value);
	}
	var chart1 = echarts.init(document.getElementById('main2'));
	var option1 = {
			color:['#00ffe7','#26ff0c '],
		    title: {
		        text: '全国疫情新增趋势 ',
		        
		        textStyle : {
				    color : '#f98a00'
			    },
			    subtext: '单位：例',
	            subtextStyle: {
		        	fontWeight: 'normal',              //标题颜色
		        	color: '#5eead0' 
		      	}
		        
		    },
		    tooltip: {
		        trigger: 'axis',
		       
		        
		    },
		    legend: {
		        data: ['新增确诊', '新增疑似'],
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
		            saveAsImage: {}
		        }
		    },
		    xAxis: {
		    	
		        type: 'category',
		        boundaryGap: false,
		        data: test3,
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
		    	splitLine:{
					show:true,  //去掉背景的网格线
			    },
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
		            name: '新增确诊',
		            type: 'line',
		            data: test1,
		            smooth: true
		        },
		        {
		            name: '新增疑似',
		            type: 'line',
		            data: test2,
		            smooth: true
		        }
		    ]
		};
	chart1.setOption(option1);
	var confirms2 = document.getElementsByName('Test4');
	var test4= new Array();

	for(var pp1=0;pp1<confirms2.length;pp1++){
		test4.push(confirms2[pp1].value);
	}

	var suspects2= document.getElementsByName('Test5');
	var test5= new Array();
	for(var pp2=0;pp2<suspects2.length;pp2++){
		test5.push(suspects2[pp2].value);
	}

	var lastUpdateTimes2 =document.getElementsByName('Test6');

	var test6= new Array();
	for(var pp3=0;pp3<lastUpdateTimes2.length;pp3++){
		test6.push(lastUpdateTimes2[pp3].value);
	}

	var chart2 = echarts.init(document.getElementById('main3'));
	var option2 = {
			color:['#f54545','#ffac38'],
		    title: {
		        text: '全国累计确诊/疑似 趋势 ',
		        textStyle : {
				    color : '#0cff35'
			    },
			    subtext: '单位：例',
	            subtextStyle: {
		        	fontWeight: 'normal',              //标题颜色
		        	color: 'yellow'
		      	}
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        data: ['确诊', '疑似'],
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
		        data: test6,
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
		            name: '确诊',
		            type: 'line',
		            data: test4,
		            smooth: true
		        },
		        {
		            name: '疑似',
		            type: 'line',
		            data: test5,
		            smooth: true
		        }
		    ]
		};
	chart2.setOption(option2);
	</script>
 
</body>
</html>
