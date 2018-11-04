<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>中国地图</title>

    <link rel="stylesheet" href="${ctxStatic}/screen/css/bootstrap.css">
    <link rel="stylesheet" href="${ctxStatic}/screen/css/index.css">
    <script src="${ctxStatic}/screen/js/script.js"></script>
    <style>
        #tagbox{position:relative;width:100%;height:240px;}
        #tagbox a{position:absolute;padding:3px 6px;font-family:Microsoft YaHei;color:#89A049;TOP:0px;font-weight:bold;text-decoration:none;left:0px}
        /*#tagbox a:hover{border:#eee 1px solid;background:#000;}*/
        #tagbox .blue{color:#5D618B}
        #tagbox .red{color:#DF9CD7}
        #tagbox .yellow{color:#E7B842}
        #tagbox .fen{color:#2F80FE}
    </style>

</head>
<body>
<div class="head text-center textShadow_lan">
    <img src="${ctxStatic}/screen/images/topiocn.png" class="topiocn"/>解放号数据看板
</div>
<div class="numbjbox">
    <h1>平台累计发包金额</h1>
    <div class="numbj" id="num3">
        2,501,026,000
    </div>
</div>
<div id="china-map" style="width:700px; height: 600px; margin-left: -350px;   position: absolute; left: 50%; top: 240px;
		-webkit-tap-highlight-color: transparent; user-select: none; background: rgb(64, 74, 89);"_echarts_instance_="ec_1530108498996">
    <div style="position: relative; overflow: hidden; width: 809px; height: 600px; padding: 0px; margin: 0px;
		 	 border-width: 0px; cursor: default;">
        <canvas width="809" height="600" data-zr-dom-id="zr_0"
                style="position: absolute; left: 0px; top: 0px; width: 809px; height: 600px; user-select: none;
		 	 	 -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;">
        </canvas>
        <canvas width="809" height="600" data-zr-dom-id="zr_1" style="position: absolute; left: 0px; top: 0px; width: 809px;
		 		 height: 600px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px;
		 		 border-width: 0px;"></canvas></div><div style="position: absolute; display: none; border-style: solid;
		 	white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1),
		 	top 0.4s cubic-bezier(0.23, 1, 0.32, 1); background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color:
		 	rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font-style: normal; font-variant: normal;
		 	 font-weight: normal; font-stretch: normal; font-size: 50px; font-family: &quot;Microsoft YaHei&quot;
		 	 line-height: 21px; padding: 5px; left: 618px; top: 389px;">上海 : 1
</div>
</div>
<div class="left pull-left">
    <div class="yuan overflow">
        <div class="yuanbox pull-left">
            <img src="${ctxStatic}/screen/images/yuan.png"/>
            <div class="yuanbox_text text-center">
                <p class="yuanbox_text1 textShadow_lan">全球注册用户</p>
                <p class="yuanbox_text2 textShadow_lan" id="num1" style="    text-indent: 20px;">${gScreen.consumerSum}</p>
            </div>
        </div>
        <div class="yuanbox pull-left">
            <img src="${ctxStatic}/screen/images/yuan.png"/>
            <div class="yuanbox_text text-center">
                <p class="yuanbox_text1 textShadow_lan">注册企业 </p>
                <p class="yuanbox_text2 yuanbj textShadow_lan" style="text-indent: 20px;" id="num2">${gScreen.enterpriseSum}</p>
            </div>
        </div>
    </div>
    <div class="page page1 mag50">
        <h5 class="pagetitle text-center">搜索热词</h5>
        <div id="tagbox">
            <c:set value="${fn:split(gScreen.searchHotWords,',') }" var="ths"></c:set>
            <c:forEach items="${ths }" var="th"  varStatus="status" >
                <c:if test="${status.index%3==0}"></c:if>
                <c:choose>
                    <c:when test="${status.index%3==0}">
                        <a href="#" class="fen">${th}</a>
                    </c:when>
                    <c:when test="${status.index%3==1}">
                        <a href="#" class="red">${th}</a>
                    </c:when>
                    <c:when test="${status.index%3==2}">
                        <a href="#" class="yellow">${th}</a>
                    </c:when>
                    <c:otherwise><a href="#" class="fen">${th}</a></c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </div>
    <div class="page page2 mag20">
        <h5 class="pagetitle text-center" style="letter-spacing: -1px;">云上软件园入驻商家TOP6地区</h5>
        <ul  class="page2box jvbj1">
            <c:forEach items="${cloudMap}" var="map">
                <li>
                    <div class="jbHeight1" style="height: ${map.value}%;"></div>
                </li>
            </c:forEach>
        </ul>
        <div class="page2text2box">
            <c:forEach items="${cloudMap}" var="map">
                <li>
                    <div class="page2text2">${map.key}</div>
                </li>
            </c:forEach>
        </div>
    </div>

</div>
<div class="right pull-right overflow">
    <div class="page page3 mag6">
        <h5 class="pagetitle text-center">区域累计签约金额TOP6</h5>
        <ul  class="page2box jvbj2">
            <c:forEach items="${moneyMap}" var="map">
                <li>
                    <div class="jbHeight2" style="height: ${map.value}%;"></div>
                </li>
            </c:forEach>
        </ul>
        <div class="page2text2box">
            <c:forEach items="${moneyMap}" var="map">
                <li>
                    <div class="page2text2">${map.key}</div>
                </li>
            </c:forEach>
        </div>
    </div>
    <div class="page page4 mag20">
        <h5 class="pagetitle text-center">区域线上商家数量TOP6 </h5>
        <ul  class="page2box jvbj3">
            <c:forEach items="${bussinessMap}" var="map">
                <li>
                    <div class="jbHeight3" style="height: ${map.value}%;"></div>
                </li>
            </c:forEach>
        </ul>
        <div class="page2text2box">
            <c:forEach items="${bussinessMap}" var="map">
                <li>
                    <div class="page2text2">${map.key}</div>
                </li>
            </c:forEach>
        </div>
    </div>
    <div class="page page5 mag20">
        <h5 class="pagetitle text-center">线上交易服务类型排行榜</h5>
        <ul  class="page2box jvbj4" style="padding: 20px 32px 0;">
            <c:forEach items="${onlieMap}" var="map">
                <li>
                    <div class="jbHeight4" style="height: ${map.value}%;"></div>
                </li>
            </c:forEach>
        </ul>
        <div class="page2text2box">
            <c:forEach items="${onlieMap}" var="map">
                <li>
                    <div class="page2text2">${map.key}</div>
                </li>
            </c:forEach>
        </div>
    </div>

</div>
<div class="bottom overflow">
    <div class="pagebj " style="margin-right: 22px;padding-top: 8px;">
        <h5 class="pagetitle text-center">解放号“地面陆军”核心服务地区分布</h5>
        <ul class="pagecont overflow">
            <c:set value="${fn:split(gScreen.coreArea,',') }" var="ths"></c:set>
            <c:forEach items="${ths }" var="th"  varStatus="status" >
                <li>${th}</li>
            </c:forEach>
        </ul>
    </div>
</div>

</body>
<script src="${ctxStatic}/screen/js/jquery.min.js"></script>
<script src="${ctxStatic}/screen/js/echarts.min.js"></script>
<script src="${ctxStatic}/screen/js/china.js"></script>
<script>
    $("body").click(function(){
        jsObject.activeH5();
    });
    setTimeout("location=location; ", 50000000);
    var page2text1=$(".page2text1");
    var page2con=$(".page2con");
    for(var i=0; i<page2text1.length;i++){
        $(page2text1[i]).css({
            "bottom": $(page2con[i]).outerHeight()+"px"
        })
    }
    var num1=${gScreen.consumerSum};
    var num2=${gScreen.enterpriseSum};
    var num3=${gScreen.enterpriseSum};
    var changFd1=${gScreen.changeFd1};
    var changFd2=${gScreen.changeFd2};
    var changFd3=${gScreen.changeFd3};
    var changPl1=${gScreen.changePl1};
    var changPl2=${gScreen.changePl2};
    var changPl3=${gScreen.changePl3};

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
    function format(num) {
        var reg=/\d{1,3}(?=(\d{3})+$)/g;
        return (num + '').replace(reg, '$&,');
    }
    setInterval(function() {
        if(num1<353200){
//			console.log(format(num1=num1+getRandomInt(1, 10)))
            $("#num1").text(format(num1=num1+changFd1));//1-10
            // $("#num1").text(format(num1=num1+getRandomInt(1, 10)));//1-10
            return false
        }
    }, changPl1);

    setInterval(function() {
//		console.log(getRandomInt(1, 5))

            $("#num2").text(format(num2=num2+changFd2));//1-6
            // $("#num2").text(format(num2=num2+getRandomInt(1, 5)));//1-6
            return false

    }, changPl2);
    var arr=[1000,1500,2000,2500,3000,3500,4000,4500,5000]
    setInterval(function() {

//		console.log(getRandomInt(1000,5000))
//		if(num3<2600000000){
//         $("#num3").text(format(num3=num3+arr[Math.floor(Math.random()*arr.length)]));//按数组的方法变动
        $("#num3").text(format(num3=num3+changFd3));//按数组的方法变动
//			$("#num3").text(format(num3=num3+getRandomInt(1000,5000)));
        return false
//		}
    }, changPl3);




    var myChart = echarts.init(document.getElementById('china-map'));
    var geoCoordMap = {
        "海门": [121.15, 31.89],
        "鄂尔多斯": [109.781327, 39.608266],
        "招远": [120.38, 37.35],
        "舟山": [122.207216, 29.985295],
        "齐齐哈尔": [123.97, 47.33],
        "盐城": [120.13, 33.38],
        "赤峰": [118.87, 42.28],
        "青岛": [120.33, 36.07],
        "乳山": [121.52, 36.89],
        "金昌": [102.188043, 38.520089],
        "泉州": [118.58, 24.93],
        "莱西": [120.53, 36.86],
        "日照": [119.46, 35.42],
        "胶南": [119.97, 35.88],
        "南通": [121.05, 32.08],
        "拉萨": [91.11, 29.97],
        "云浮": [112.02, 22.93],
        "梅州": [116.1, 24.55],
        "文登": [122.05, 37.2],
        "上海": [121.48, 31.22],
        "攀枝花": [101.718637, 26.582347],
        "威海": [122.1, 37.5],
        "承德": [117.93, 40.97],
        "厦门": [118.1, 24.46],
        "汕尾": [115.375279, 22.786211],
        "潮州": [116.63, 23.68],
        "丹东": [124.37, 40.13],
        "太仓": [121.1, 31.45],
        "曲靖": [103.79, 25.51],
        "烟台": [121.39, 37.52],
        "福州": [119.3, 26.08],
        "瓦房店": [121.979603, 39.627114],
        "即墨": [120.45, 36.38],
        "抚顺": [123.97, 41.97],
        "玉溪": [102.52, 24.35],
        "张家口": [114.87, 40.82],
        "阳泉": [113.57, 37.85],
        "莱州": [119.942327, 37.177017],
        "湖州": [120.1, 30.86],
        "汕头": [116.69, 23.39],
        "昆山": [120.95, 31.39],
        "宁波": [121.56, 29.86],
        "湛江": [110.359377, 21.270708],
        "揭阳": [116.35, 23.55],
        "荣成": [122.41, 37.16],
        "连云港": [119.16, 34.59],
        "葫芦岛": [120.836932, 40.711052],
        "常熟": [120.74, 31.64],
        "东莞": [113.75, 23.04],
        "河源": [114.68, 23.73],
        "淮安": [119.15, 33.5],
        "泰州": [119.9, 32.49],
        "南宁": [108.33, 22.84],
        "营口": [122.18, 40.65],
        "惠州": [114.4, 23.09],
        "江阴": [120.26, 31.91],
        "蓬莱": [120.75, 37.8],
        "韶关": [113.62, 24.84],
        "嘉峪关": [98.289152, 39.77313],
        "广州": [113.23, 23.16],
        "延安": [109.47, 36.6],
        "太原": [112.53, 37.87],
        "清远": [113.01, 23.7],
        "中山": [113.38, 22.52],
        "昆明": [102.73, 25.04],
        "寿光": [118.73, 36.86],
        "盘锦": [122.070714, 41.119997],
        "长治": [113.08, 36.18],
        "深圳": [114.07, 22.62],
        "珠海": [113.52, 22.3],
        "宿迁": [118.3, 33.96],
        "咸阳": [108.72, 34.36],
        "铜川": [109.11, 35.09],
        "平度": [119.97, 36.77],
        "佛山": [113.11, 23.05],
        "海口": [110.35, 20.02],
        "江门": [113.06, 22.61],
        "章丘": [117.53, 36.72],
        "肇庆": [112.44, 23.05],
        "大连": [121.62, 38.92],
        "临汾": [111.5, 36.08],
        "吴江": [120.63, 31.16],
        "石嘴山": [106.39, 39.04],
        "沈阳": [123.38, 41.8],
        "苏州": [120.62, 31.32],
        "茂名": [110.88, 21.68],
        "嘉兴": [120.76, 30.77],
        "长春": [125.35, 43.88],
        "胶州": [120.03336, 36.264622],
        "银川": [106.27, 38.47],
        "张家港": [120.555821, 31.875428],
        "三门峡": [111.19, 34.76],
        "锦州": [121.15, 41.13],
        "南昌": [115.89, 28.68],
        "柳州": [109.4, 24.33],
        "三亚": [109.511909, 18.252847],
        "自贡": [104.778442, 29.33903],
        "吉林": [126.57, 43.87],
        "阳江": [111.95, 21.85],
        "泸州": [105.39, 28.91],
        "西宁": [101.74, 36.56],
        "宜宾": [104.56, 29.77],
        "呼和浩特": [111.65, 40.82],
        "成都": [104.06, 30.67],
        "大同": [113.3, 40.12],
        "镇江": [119.44, 32.2],
        "桂林": [110.28, 25.29],
        "张家界": [110.479191, 29.117096],
        "宜兴": [119.82, 31.36],
        "北海": [109.12, 21.49],
        "西安": [108.95, 34.27],
        "金坛": [119.56, 31.74],
        "东营": [118.49, 37.46],
        "牡丹江": [129.58, 44.6],
        "遵义": [106.9, 27.7],
        "绍兴": [120.58, 30.01],
        "扬州": [119.42, 32.39],
        "常州": [119.95, 31.79],
        "潍坊": [119.1, 36.62],
        "重庆": [106.54, 29.59],
        "台州": [121.420757, 28.656386],
        "南京": [118.78, 32.04],
        "滨州": [118.03, 37.36],
        "贵阳": [106.71, 26.57],
        "无锡": [120.29, 31.59],
        "本溪": [123.73, 41.3],
        "克拉玛依": [84.77, 45.59],
        "渭南": [109.5, 34.52],
        "马鞍山": [118.48, 31.56],
        "宝鸡": [107.15, 34.38],
        "焦作": [113.21, 35.24],
        "句容": [119.16, 31.95],
        "北京": [116.46, 39.92],
        "徐州": [117.2, 34.26],
        "衡水": [115.72, 37.72],
        "包头": [110, 40.58],
        "绵阳": [104.73, 31.48],
        "乌鲁木齐": [87.68, 43.77],
        "枣庄": [117.57, 34.86],
        "杭州": [120.19, 30.26],
        "淄博": [118.05, 36.78],
        "鞍山": [122.85, 41.12],
        "溧阳": [119.48, 31.43],
        "库尔勒": [86.06, 41.68],
        "安阳": [114.35, 36.1],
        "开封": [114.35, 34.79],
        "济南": [117, 36.65],
        "德阳": [104.37, 31.13],
        "温州": [120.65, 28.01],
        "九江": [115.97, 29.71],
        "邯郸": [114.47, 36.6],
        "临安": [119.72, 30.23],
        "兰州": [103.73, 36.03],
        "沧州": [116.83, 38.33],
        "临沂": [118.35, 35.05],
        "南充": [106.110698, 30.837793],
        "天津": [117.2, 39.13],
        "富阳": [119.95, 30.07],
        "泰安": [117.13, 36.18],
        "诸暨": [120.23, 29.71],
        "郑州": [113.65, 34.76],
        "哈尔滨": [126.63, 45.75],
        "聊城": [115.97, 36.45],
        "芜湖": [118.38, 31.33],
        "唐山": [118.02, 39.63],
        "平顶山": [113.29, 33.75],
        "邢台": [114.48, 37.05],
        "德州": [116.29, 37.45],
        "济宁": [116.59, 35.38],
        "荆州": [112.239741, 30.335165],
        "宜昌": [111.3, 30.7],
        "义乌": [120.06, 29.32],
        "丽水": [119.92, 28.45],
        "洛阳": [112.44, 34.7],
        "秦皇岛": [119.57, 39.95],
        "株洲": [113.16, 27.83],
        "石家庄": [114.48, 38.03],
        "莱芜": [117.67, 36.19],
        "常德": [111.69, 29.05],
        "保定": [115.48, 38.85],
        "湘潭": [112.91, 27.87],
        "金华": [119.64, 29.12],
        "岳阳": [113.09, 29.37],
        "长沙": [113, 28.21],
        "衢州": [118.88, 28.97],
        "廊坊": [116.7, 39.53],
        "菏泽": [115.480656, 35.23375],
        "合肥": [117.27, 31.86],
        "武汉": [114.31, 30.52],
        "大庆": [125.03, 46.58]
    };

    // 地图散点图数据
    var data = [
        { name: "青岛", value: 254242},{ name: "南京", value: 92542 }, { name: "徐州", value: 12542 },
        { name: "重庆", value: 125454 }, { name: "济宁", value: 1254254 }, { name: "成都", value: 225425 },
        { name: "武汉", value: 1254 }, { name: "漳州", value: 1254 }, { name: "常州", value: 22525 },
        { name: "南平", value: 22542542 },{ name: "西安", value: 225425 },{ name: "威海", value: 965552 }
    ]
    function convertData(data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name: data[i].name,
                    value: geoCoord.concat(data[i].value),

                });
            }
        }
        return res;
    };
    // 地图散点图配置
    option = {
        backgroundColor: '',//整块地图背景颜色
        title: {
            /* text: '某某全国合作城市',
             subtext: '内部数据请勿外传',*/
            x: 'center',
            textStyle: {
                color: '#fff'
            }
        },
        tooltip: {  //hover的块
            trigger: 'item',
            show: true,
            position: function (point, params, dom, rect, size) {
                $(dom).html('<div class="tip">'+params.name+'销售额 :<span> '+params.value[2] +'</span></div>')
            },
            extraCssText:'padding: 4px 10px; border: 1px solid #fff;font-size: 16px !important;',
        },
        geo: {//地理坐标系组件。
            map: 'china',
            zoom: '1.1',
            selectedMode : 'multiple',
            label: {
                normal: {
                    show: false,
                    color: '#fff'
                },
                emphasis: {
                    show: true,
                    color: 'rgba(0, 0, 0, 0)',//hover 每块地图省字的颜色
                }
            },
            itemStyle: {
                normal: {
                    areaColor: '#2F80FE',//每块地图的颜色
                    borderColor: '#111'
                },
                emphasis: {
                    areaColor: '#29AB8F',//每块地图hover的颜色
                    show: false
                }
            },
            regions:[//对特定的区域配置样式
                {name: '山东',selected:true},
                {name: '四川',selected:true},
                {name: '重庆',selected:true},
                {name: '湖北',selected:true},
                {name: '广东',selected:true},
                {name: '陕西',selected:true},
                {name: '福建',selected:true},
                {name: '北京',selected:true},
                {name: '天津',selected:true},
                {name: '辽宁',selected:true},
                {name: '江苏',selected:true},
                {name: '上海',selected:true},
                {name: '安徽',selected:true},
            ]
        },
        series: [

            {
                type: 'scatter',
                coordinateSystem: 'geo',
                symbolSize: 10, //小圆点背景大小
                data: convertData(data),
                label: {
                    normal: {
                        show: false//hover的设为true
                    },
                    emphasis: {
                        show: true
                    }
                },
                itemStyle: {
                    emphasis: {
                        borderColor: '#fff',
                        borderWidth: 1
                    }
                }
            },
            {
                type: 'effectScatter',
                coordinateSystem: 'geo',
                hoverAnimation:true,
                data: convertData(data),
                symbolSize: 12,
                showEffectOn: 'render',
                rippleEffect: {
                    brushType: 'stroke'
                },

                label: {
                    normal: {
                        formatter: '{b}',
                        position: 'right',
                        show: true
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#f4e925', //点点的颜色
                        shadowBlur: 10,
                        shadowColor: '#333'
                    },
                    emphasis:{
                        color: 'red'
                    }
                },
                zlevel: 1 //用于 Canvas 分层
            },
        ]
    }
    myChart.setOption(option);
    /* myChart.dispatchAction({//通过 echarts.init 创建的实例。
              type: 'showTip',
              seriesIndex: 1,
              dataIndex: 0
          });
      var index = 1; //播放所在下标
      var mTime = setInterval(function() {
          myChart.dispatchAction({//通过 echarts.init 创建的实例。
              type: 'showTip',
              seriesIndex: 1,
              dataIndex: index
          });

          index++;
          if(index > data.length) {
              index = 0;
          }
      }, 2000);*/
</script>

</html>
