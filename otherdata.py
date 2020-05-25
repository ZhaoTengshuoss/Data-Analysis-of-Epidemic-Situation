import time, json, requests
import pymysql
url = 'https://view.inews.qq.com/g2/getOnsInfo?name=disease_other&callback=&_=%d' % int(time.time() * 1000)
data = json.loads(requests.get(url=url).json()['data'])
print(data)

conn = pymysql.connect(host="localhost", user="root", password="root", database="virus", charset="utf8")  # 连接数据库
cursor = conn.cursor()

print('以前的数据*********************')
sql="truncate table n_data"
cursor.execute(sql)
conn.commit()
sql="truncate table compare_data"
cursor.execute(sql)
conn.commit()
print('中国数据总量：' + str(len(data['chinaDayList'])))

d_type = ""
for i in range(len(data['chinaDayList'])):
    print('截止时间：' + str(data['chinaDayList'][i]['date']))
    print('全国确诊人数：' + str(data['chinaDayList'][i]['confirm']))
    print('全国疑似病例：' + str(data['chinaDayList'][i]['suspect']))
    print('全国死亡人数：' + str(data['chinaDayList'][i]['dead']))
    print('全国治愈人数：' + str(data['chinaDayList'][i]['heal']))
    print('全国死亡率：' + str(data['chinaDayList'][i]['deadRate']))
    print('全国治愈率：' + str(data['chinaDayList'][i]['healRate']))

    # ----***新增加**------
    print('全国现有确诊：' + str(data['chinaDayList'][i]['nowConfirm']))
    print('全国现有重症：' + str(data['chinaDayList'][i]['nowSevere']))

    d_type = "0"
    sql = "insert into n_data (lastUpdateTime ,confirm  ,suspect  ,dead  ,heal ,deadRate ,healRate,d_type,nowConfirm,nowSevere ) value('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(
        str(data['chinaDayList'][i]['date']), str(data['chinaDayList'][i]['confirm']),
        str(data['chinaDayList'][i]['suspect']), str(data['chinaDayList'][i]['dead']),
        str(data['chinaDayList'][i]['heal']), str(data['chinaDayList'][i]['deadRate']),
        str(data['chinaDayList'][i]['healRate']), d_type, str(data['chinaDayList'][i]['nowConfirm']),
        str(data['chinaDayList'][i]['nowSevere']))
    print(sql)  # 打印出执行sql的结果
    cursor.execute(sql)
    conn.commit()
    print('-----------------------------------------')

print('+++++++++++++++++++++++++++++++++++++++++++++++')

print('+++++++++++++++++++++++++++++++++++++++++++++++')
print('中国数据总量(增加)：' + str(len(data['chinaDayAddList'])))
for i in range(len(data['chinaDayAddList'])):
    d_type = "1"
    print('截止时间：' + str(data['chinaDayAddList'][i]['date']))
    print('全国确诊人数：' + str(data['chinaDayAddList'][i]['confirm']))
    print('全国疑似病例：' + str(data['chinaDayAddList'][i]['suspect']))
    print('全国死亡人数：' + str(data['chinaDayAddList'][i]['dead']))
    print('全国治愈人数：' + str(data['chinaDayAddList'][i]['heal']))
    print('全国死亡率：' + str(data['chinaDayAddList'][i]['deadRate']))
    print('全国治愈率：' + str(data['chinaDayAddList'][i]['healRate']))
    sql = "insert into n_data (lastUpdateTime ,confirm  ,suspect  ,dead  ,heal ,deadRate ,healRate,d_type,nowConfirm,nowSevere ) value('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(
        str(data['chinaDayAddList'][i]['date']), str(data['chinaDayAddList'][i]['confirm']),
        str(data['chinaDayAddList'][i]['suspect']), str(data['chinaDayAddList'][i]['dead']),
        str(data['chinaDayAddList'][i]['heal']), str(data['chinaDayAddList'][i]['deadRate']),
        str(data['chinaDayAddList'][i]['healRate']), d_type,"","")
    print(sql)  # 打印出执行sql的结果
    cursor.execute(sql)
    conn.commit()
    print('-----------------------------------------')


print('+++++++++++++++++++++++++++++++++++++++++++++++')
print('每日新增记录：')
print('记录总量：' + str(len(data['dailyNewAddHistory'])))
for i in range(len(data['dailyNewAddHistory'])):
    print('时间：' + str(data['dailyNewAddHistory'][i]['date']))
    print('湖北：' + str(data['dailyNewAddHistory'][i]['hubei']))
    print('全国：' + str(data['dailyNewAddHistory'][i]['country']))
    print('不是湖北:' + str(data['dailyNewAddHistory'][i]['notHubei']))
    sql = "insert into compare_data (d_date ,hubei  ,country  ,nohubei  ) value('{}','{}','{}','{}')".format(
        str(data['dailyNewAddHistory'][i]['date']), str(data['dailyNewAddHistory'][i]['hubei']),
        str(data['dailyNewAddHistory'][i]['country']), str(data['dailyNewAddHistory'][i]['notHubei']))
    print(sql)  # 打印出执行sql的结果
    cursor.execute(sql)
    conn.commit()
    print('-----------------------------------------')



print('每日死亡率历史记录：')
print('记录总量：' + str(len(data['dailyHistory'])))
for i in range(len(data['dailyHistory'])):
    print('时间：' + str(data['dailyHistory'][i]['date']))
    print('湖北死亡：' + str(data['dailyHistory'][i]['hubei']['dead']))
    print('湖北治愈：' + str(data['dailyHistory'][i]['hubei']['heal']))
    print('湖北确认:' + str(data['dailyHistory'][i]['hubei']['nowConfirm']))
    print('湖北病死率：' + str(data['dailyHistory'][i]['hubei']['deadRate']))
    print('湖北治愈率：' + str(data['dailyHistory'][i]['hubei']['healRate']))

    print('非湖北死亡：' + str(data['dailyHistory'][i]['notHubei']['dead']))
    print('非湖北治愈：' + str(data['dailyHistory'][i]['notHubei']['heal']))
    print('非湖北确认:' + str(data['dailyHistory'][i]['notHubei']['nowConfirm']))
    print('非湖北病死率：' + str(data['dailyHistory'][i]['notHubei']['deadRate']))
    print('非湖北治愈率：' + str(data['dailyHistory'][i]['notHubei']['healRate']))

    print('国家死亡人数：' + str(data['dailyHistory'][i]['country']['dead']))
    print('国家北治愈：' + str(data['dailyHistory'][i]['country']['heal']))
    print('国家确认:' + str(data['dailyHistory'][i]['country']['nowConfirm']))
    print('国家病死率：' + str(data['dailyHistory'][i]['country']['deadRate']))
    print('国家治愈率：' + str(data['dailyHistory'][i]['country']['healRate']))
    sql = "insert into newhistory_dc_data2 (d_date ,Dead_hubeiRate  ,Dead_notHubeiRate  ,Dead_countryRate  ,Heal_hubeiRate  ,Heal_notHubeiRate  ,Heal_countryRate,h_dead,nh_dead,c_dead, h_heal,nh_heal,c_heal,h_nowConfirm,nh_nowConfirm,c_nowConfirm) value('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(
            str(data['dailyHistory'][i]['date']), str(data['dailyHistory'][i]['hubei']['deadRate']),
            str(data['dailyHistory'][i]['notHubei']['deadRate']),
            str(data['dailyHistory'][i]['country']['deadRate']),
            str(data['dailyHistory'][i]['hubei']['healRate']),
            str(data['dailyHistory'][i]['notHubei']['healRate']),
            str(data['dailyHistory'][i]['country']['healRate']), str(data['dailyHistory'][i]['hubei']['dead']),
            str(data['dailyHistory'][i]['notHubei']['dead']), str(data['dailyHistory'][i]['country']['dead']),
            str(data['dailyHistory'][i]['hubei']['heal']),
            str(data['dailyHistory'][i]['notHubei']['heal']), str(data['dailyHistory'][i]['country']['heal']),
            str(data['dailyHistory'][i]['hubei']['nowConfirm']),
            str(data['dailyHistory'][i]['notHubei']['nowConfirm']), str(data['dailyHistory'][i]['country']['nowConfirm']), )



    print(sql)  # 打印出执行sql的结果
    cursor.execute(sql)
    conn.commit()
    print('-----------------------------------------')

print('+++++++++++++++++++++++++++++++++++++++++++++++')
print("武汉疫情情况")
print('总记录数：' + str(len(data['wuhanDayList'])))
for i in range(len(data['wuhanDayList'])):
    print('时间：' + str(data['wuhanDayList'][i]['date']))
    print('武汉确认病例增加数：' + str(data['wuhanDayList'][i]['wuhan']['confirmAdd']))
    print('非武汉确认病例增加数：' + str(data['wuhanDayList'][i]['notWuhan']['confirmAdd']))
    print('非湖北确认病例增加数：' + str(data['wuhanDayList'][i]['notHubei']['confirmAdd']))
    sql = "insert into wuhanDayList (w_date ,w_confirmAdd  ,nw_confirmAdd  ,nh_confirmAdd ) value('{}','{}','{}','{}')".format(
        str((data['wuhanDayList'][i]['date'])),
        str(data['wuhanDayList'][i]['wuhan']['confirmAdd']),
        str(data['wuhanDayList'][i]['notWuhan']['confirmAdd']),
        str(data['wuhanDayList'][i]['notHubei']['confirmAdd']))
    print(sql)  # 打印出执行sql的结果
    cursor.execute(sql)
    conn.commit()
    print('-----------------------------------------')

print('+++++++++++++++++++++++++++++++++++++++++++++++')
print('文章列表：')
print('文章总数：' + str(len(data['articleList'])))
for i in range(len(data['articleList'])):
    print('文章id：' + str(data['articleList'][i]['cmsId']))
    print('文章来源：' + str(data['articleList'][i]['source']))
    print('文章地址：' + str(data['articleList'][i]['media']))
    print('发表日期：' + str(data['articleList'][i]['publish_time']))
    print('可用数：' + str(data['articleList'][i]['can_use']))
    print('文章内容：' + str(data['articleList'][i]['desc']))
    print('文章链接：' + str(data['articleList'][i]['url']))
    print('文章标题：' + str(data['articleList'][i]['title']))
    sql = "insert into text_data (cmsId ,source  ,media  ,publish_time  ,can_use  ,c_desc  ,url  ,title  ) value('{}','{}','{}','{}','{}','{}','{}','{}')".format(
        str(data['articleList'][i]['cmsId']),
        str(data['articleList'][i]['source']),
        str(data['articleList'][i]['media']),
        str(data['articleList'][i]['publish_time']),
        str(data['articleList'][i]['can_use']),
        str(data['articleList'][i]['desc']),
        str(data['articleList'][i]['url']),
        str(data['articleList'][i]['title']))
    print(sql)  # 打印出执行sql的结果
    cursor.execute(sql)
    conn.commit()
    print('-----------------------------------------')

cursor.close()
conn.close()