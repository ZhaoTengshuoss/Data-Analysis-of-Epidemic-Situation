# Data-Analysis-of-Epidemic-Situation
使用python爬取新型冠状病毒每日疑似病例和确诊病例的人数，和病例所在城市，确诊人数的活动路线，针对疫情数据进行数据分析，生成疫情扩散图表以地图形式展示，和疫情数据统计图标，并实现查询某城市，确诊病人的活动路线。
1.疫情首页
疫情首页记录了每日疫情的疑似病例，确诊病例和治愈病例的人数，疫情的相关报道，疫情扩展图，中国的疫情数据表和国外的数据表展示。疫情地图支持下钻功能，可以查看省市疫情情况。
![图片](https://github.com/ZhaoTengshuoss/Data-Analysis-of-Epidemic-Situation/tree/master/photo1.png)
2.疫情数据统计
 针对爬取的全国，武汉，和湖北非武汉的治愈人数，死亡人数，确诊人数，病死率，治愈率信息，进行统计分析，整合，以折线图，柱状图样式，供用户查看。

3.疫情路线
疫情路线分为疫情时间线路线展示，和地图标注，地图标注取用路线中的位置信息，调用百度地图接口，位置信息与地图横纵坐标点做对应，得到地图标注效果。

4.同城乘坐
记录了确诊病例乘坐交通信息。
