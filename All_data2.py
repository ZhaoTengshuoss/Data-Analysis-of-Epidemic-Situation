import time, json, requests
import pymysql
url = 'https://view.inews.qq.com/g2/getOnsInfo?name=disease_h5&callback=&_=%d' % int(time.time() * 1000)
data = json.loads(requests.get(url=url).json()['data'])
print(data)

conn = pymysql.connect(host="localhost", user="root", password="root", database="virus", charset="utf8")  # 连接数据库
cursor = conn.cursor()


sql="truncate table all_data"
cursor.execute(sql)
conn.commit()
#
print('统计截至时间：' + str(data['lastUpdateTime']))
print('全国确诊人数：' + str(data['chinaTotal']['confirm']))
print('全国治愈人数：' + str(data['chinaTotal']['heal']))
print('全国死亡人数：' + str(data['chinaTotal']['dead']))
print('全国现有疑似人数：' + str(data['chinaTotal']['suspect']))
print('全国现有确诊人数：' + str(data['chinaTotal']['nowConfirm']))
print('全国现有重症人数：' + str(data['chinaTotal']['nowSevere']))


print('+++++++++++++++++++++++++++++++++++++++++++++++')

print('相较于昨天确诊人数：' + str(data['chinaAdd']['confirm']))
print('相较于昨天治愈人数：' + str(data['chinaAdd']['heal']))
print('相较于昨天疑似人数：' + str(data['chinaAdd']['suspect']))
print('相较于昨天死亡人数：' + str(data['chinaAdd']['dead']))
print('相较于昨天重症人数：' + str(data['chinaAdd']['nowSevere']))
print('+++++++++++++++++++++++++++++++++++++++++++++++')

sql = "insert into n_simpledata(lastUpdateTime ,confirm  ,suspect  ,dead  ,heal  ,add_confirm ,add_suspect ,add_dead ,add_heal ,nowConfirm,nowSevere,add_nowServer) value('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(
    str(data['lastUpdateTime']), str(data['chinaTotal']['confirm']), str(data['chinaTotal']['suspect']),
    str(data['chinaTotal']['dead']),
    str(data['chinaTotal']['heal']), str(data['chinaAdd']['confirm']), str(data['chinaAdd']['suspect']),
    str(data['chinaAdd']['dead']),
    str(data['chinaAdd']['heal']),str(data['chinaTotal']['nowConfirm']),str(data['chinaTotal']['nowSevere']),str(data['chinaAdd']['nowSevere']))
print(sql)  # 打印出执行sql的结果
cursor.execute(sql)
conn.commit()



print('+++++++++++++++++++++++++++++++++++++++++++++++')
print('省份情况：：')
print('记录总量：' + str(len(data['areaTree'])))
infotype = ""
country = ""
province = ""
area = ""
signal = True
print(data['areaTree'])
for i in range(len(data['areaTree'])):
    print('-----------------1------------------------')
    if i >= 1:
        signal = False
    else:
        signal = True
    print('国家：' + str(data['areaTree'][i]['name']))
    print('当天确诊人数：' + str(data['areaTree'][i]['today']['confirm']))
    # print('当天疑似病例：' + str(data['areaTree'][i]['today']['suspect']))
    # print('当天死亡人数:' + str(data['areaTree'][i]['today']['dead']))
    # print('当天治愈人数:' + str(data['areaTree'][i]['today']['heal']))
    print('全部确诊人数：' + str(data['areaTree'][i]['total']['confirm']))
    print('全部疑似病例：' + str(data['areaTree'][i]['total']['suspect']))
    print('全部死亡人数:' + str(data['areaTree'][i]['total']['dead']))
    print('全部治愈人数:' + str(data['areaTree'][i]['total']['heal']))
    print('全部死亡率:' + str(data['areaTree'][i]['total']['deadRate']))
    print('全部治愈率:' + str(data['areaTree'][i]['total']['healRate']))

    infotype = "country"
    country = str(data['areaTree'][i]['name'])
    province = ""
    area = ""
    sql = "insert into all_data (t_confirm  ,t_suspect  ,t_dead  ,t_heal,all_confirm  ,all_suspect  ,all_dead  ,all_heal,all_deadRate ,all_healRate  ,country  ,province ,area ,infotype ) value('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(
        str(data['areaTree'][i]['today']['confirm']),"",
     "", "",
        str(data['areaTree'][i]['total']['confirm']), str(data['areaTree'][i]['total']['suspect']),
        str(data['areaTree'][i]['total']['dead']), str(data['areaTree'][i]['total']['heal']),
        str(data['areaTree'][i]['total']['deadRate']), str(data['areaTree'][i]['total']['healRate']),
        country, province,
        area, infotype)
    print(sql)  # 打印出执行sql的结果
    cursor.execute(sql)
    conn.commit()
    if (signal):
        for j in range(len(data['areaTree'][i]['children'])):
            print('---------------------2--------------------')
            # print(data['areaTree'][i]['children'][0])
            print('省份名称：' + str(data['areaTree'][i]['children'][j]['name']))
            print('当天确诊人数：' + str(data['areaTree'][i]['children'][j]['today']['confirm']))
            # print('当天疑似病例：' + str(data['areaTree'][i]['children'][j]['today']['suspect']))
            # print('当天死亡人数:' + str(data['areaTree'][i]['children'][j]['today']['dead']))
            # print('当天治愈人数:' + str(data['areaTree'][i]['children'][j]['today']['heal']))
            print('全部确诊人数：' + str(data['areaTree'][i]['children'][j]['total']['confirm']))
            print('全部疑似病例：' + str(data['areaTree'][i]['children'][j]['total']['suspect']))
            print('全部死亡人数:' + str(data['areaTree'][i]['children'][j]['total']['dead']))
            print('全部治愈人数:' + str(data['areaTree'][i]['children'][j]['total']['heal']))
            print('全部死亡率:' + str(data['areaTree'][i]['children'][j]['total']['deadRate']))
            print('全部治愈率:' + str(data['areaTree'][i]['children'][j]['total']['healRate']))
            infotype = "province"
            country = str(data['areaTree'][i]['name'])
            province = str(data['areaTree'][i]['children'][j]['name'])
            area = ""
            sql = "insert into all_data (t_confirm  ,t_suspect  ,t_dead  ,t_heal,all_confirm  ,all_suspect  ,all_dead  ,all_heal,all_deadRate ,all_healRate  ,country  ,province ,area ,infotype ) value('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(
                str(data['areaTree'][i]['children'][j]['today']['confirm']),
               "",
                "",
                "",
                str(data['areaTree'][i]['children'][j]['total']['confirm']),
                str(data['areaTree'][i]['children'][j]['total']['suspect']),
                str(data['areaTree'][i]['children'][j]['total']['dead']),
                str(data['areaTree'][i]['children'][j]['total']['heal']),
                str(data['areaTree'][i]['children'][j]['total']['deadRate']),
                str(data['areaTree'][i]['children'][j]['total']['healRate']),
                country, province,
                area, infotype)
            print(sql)  # 打印出执行sql的结果
            cursor.execute(sql)
            conn.commit()
            for h in range(len(data['areaTree'][i]['children'][j]['children'])):
                print('---------------------3--------------------')
                print('省的地区名称：' + str(data['areaTree'][i]['children'][j]['children'][h]['name']))
                print('当天确诊人数：' + str(data['areaTree'][i]['children'][j]['children'][h]['today']['confirm']))
                # print('当天疑似病例：' + str(data['areaTree'][i]['children'][j]['children'][h]['today']['suspect']))
                # print('当天死亡人数:' + str(data['areaTree'][i]['children'][j]['children'][h]['today']['dead']))
                # print('当天治愈人数:' + str(data['areaTree'][i]['children'][j]['children'][h]['today']['heal']))
                print('全部确诊人数：' + str(data['areaTree'][i]['children'][j]['children'][h]['total']['confirm']))
                print('全部疑似病例：' + str(data['areaTree'][i]['children'][j]['children'][h]['total']['suspect']))
                print('全部死亡人数:' + str(data['areaTree'][i]['children'][j]['children'][h]['total']['dead']))
                print('全部治愈人数:' + str(data['areaTree'][i]['children'][j]['children'][h]['total']['heal']))
                print('全部死亡率:' + str(data['areaTree'][i]['children'][j]['children'][h]['total']['deadRate']))
                print('全部治愈率:' + str(data['areaTree'][i]['children'][j]['children'][h]['total']['healRate']))
                infotype = "area"
                country = str(data['areaTree'][i]['name'])
                province = str(data['areaTree'][i]['children'][j]['name'])
                area = str(data['areaTree'][i]['children'][j]['children'][h]['name'])

                sql = "insert into all_data (t_confirm  ,t_suspect  ,t_dead  ,t_heal,all_confirm  ,all_suspect  ,all_dead  ,all_heal,all_deadRate ,all_healRate  ,country  ,province ,area ,infotype ) value('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(
                    str(data['areaTree'][i]['children'][j]['children'][h]['today']['confirm']),
                       "",
                        "",
                       "",
                    str(data['areaTree'][i]['children'][j]['children'][h]['total']['confirm']),
                    str(data['areaTree'][i]['children'][j]['children'][h]['total']['suspect']),
                    str(data['areaTree'][i]['children'][j]['children'][h]['total']['dead']),
                    str(data['areaTree'][i]['children'][j]['children'][h]['total']['heal']),
                    str(data['areaTree'][i]['children'][j]['children'][h]['total']['deadRate']),
                    str(data['areaTree'][i]['children'][j]['children'][h]['total']['healRate']),
                    country, province,
                    area, infotype)
                print(sql)  # 打印出执行sql的结果
                cursor.execute(sql)
                conn.commit()
        print('-----------------------------------------')
