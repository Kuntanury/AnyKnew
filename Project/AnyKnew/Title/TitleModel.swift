//
//  HomeModel.swift
//  AnyKnew
//
//  Created by Kuntanury on 2019/4/18.
//  Copyright © 2019 Kuntanury. All rights reserved.
//

import Foundation

class TitleModel: Codable {
    
    let status: Int
    let msg: String
    let data: TitleDataModel?
    
    init() {
        self.status = 1
        self.msg = ""
        self.data = nil
    }
}

class TitleDataModel: Codable {
    let site: TitleDataSiteModel?
}

class TitleDataSiteModel: Codable {
    let subs: Array<TitleDataSiteSubsModel>?
    let site: String?
    let attrs: TitleDataSiteAttrsModel?
}

class TitleDataSiteSubsModel: Codable {
    let items: Array<TitleDataSiteSubsItemsModel>?
    let attrs: TitleDataSiteSubsAttrsModel?
}

class TitleDataSiteSubsItemsModel: Codable {
    let iid: Int
    let ext: String?
    let new_tag: Bool
    let seq: Int
    let title: String?
}

class TitleDataSiteSubsAttrsModel: Codable {
    let cn: String?
    let display: Int
}

class TitleDataSiteAttrsModel: Codable {
    let url: String?
    let logo: String?
    let cn: String?
    let iter: Int
    
}

//
//// 20190422142133
//// https://www.anyknew.com/api/v1/sites/weibo
//
//{
//    "status": 0,
//    "msg": "success",
//    "data": {
//        "site": {
//            "subs": [
//            {
//            "items": [
//            {
//            "iid": 3213052,
//            "ext": "1529022",
//            "new_tag": false,
//            "seq": 1,
//            "title": "曝胜利曾和群成员在酒吧吸毒"
//            },
//            {
//            "iid": 3213051,
//            "ext": "1382568",
//            "new_tag": false,
//            "seq": 2,
//            "title": "乐山女子夜跑遇害案凶手死刑"
//            },
//            {
//            "iid": 3213050,
//            "ext": "1165377",
//            "new_tag": true,
//            "seq": 3,
//            "title": "美国公交色魔终生禁乘公交"
//            },
//            {
//            "iid": 3213049,
//            "ext": "847733",
//            "new_tag": false,
//            "seq": 4,
//            "title": "ofo还钱了"
//            },
//            {
//            "iid": 3213048,
//            "ext": "817259",
//            "new_tag": false,
//            "seq": 5,
//            "title": "无缝衔接恋爱算出轨吗"
//            },
//            {
//            "iid": 3213047,
//            "ext": "635854",
//            "new_tag": false,
//            "seq": 6,
//            "title": "朴有天将和黄荷娜当面对质"
//            },
//            {
//            "iid": 3213046,
//            "ext": "412048",
//            "new_tag": false,
//            "seq": 7,
//            "title": "非沪籍可在上海16区申请共有产权房"
//            },
//            {
//            "iid": 3213045,
//            "ext": "371110",
//            "new_tag": false,
//            "seq": 8,
//            "title": "南太铉张才人恋情"
//            },
//            {
//            "iid": 3213044,
//            "ext": "336885",
//            "new_tag": false,
//            "seq": 9,
//            "title": "全国416个本科专业被撤销"
//            },
//            {
//            "iid": 3213043,
//            "ext": "334630",
//            "new_tag": false,
//            "seq": 10,
//            "title": "蓝洁瑛墓碑被熏黑受损"
//            },
//            {
//            "iid": 3213042,
//            "ext": "325218",
//            "new_tag": true,
//            "seq": 11,
//            "title": "十年前你在玩什么游戏"
//            },
//            {
//            "iid": 3213041,
//            "ext": "263711",
//            "new_tag": false,
//            "seq": 12,
//            "title": "广电总局游戏新规"
//            },
//            {
//            "iid": 3213040,
//            "ext": "245491",
//            "new_tag": false,
//            "seq": 13,
//            "title": "张馨予升级当妈"
//            },
//            {
//            "iid": 3213039,
//            "ext": "240039",
//            "new_tag": false,
//            "seq": 14,
//            "title": "邻居爆黄心颖曾带两名男伴回家"
//            },
//            {
//            "iid": 3213038,
//            "ext": "210595",
//            "new_tag": false,
//            "seq": 15,
//            "title": "古人笑对996"
//            },
//            {
//            "iid": 3213037,
//            "ext": "210545",
//            "new_tag": true,
//            "seq": 16,
//            "title": "我只喜欢你 定档"
//            },
//            {
//            "iid": 3213036,
//            "ext": "210340",
//            "new_tag": false,
//            "seq": 17,
//            "title": "唐嫣"
//            },
//            {
//            "iid": 3213035,
//            "ext": "210165",
//            "new_tag": true,
//            "seq": 18,
//            "title": "张度妍"
//            },
//            {
//            "iid": 3213034,
//            "ext": "210009",
//            "new_tag": true,
//            "seq": 19,
//            "title": "祖孙三代都是复联粉"
//            },
//            {
//            "iid": 3213033,
//            "ext": "209918",
//            "new_tag": true,
//            "seq": 20,
//            "title": "乔一 F君"
//            },
//            {
//            "iid": 3213032,
//            "ext": "209701",
//            "new_tag": true,
//            "seq": 21,
//            "title": "猫咪拍屁股级别"
//            },
//            {
//            "iid": 3213031,
//            "ext": "209604",
//            "new_tag": false,
//            "seq": 22,
//            "title": "权游 二丫"
//            },
//            {
//            "iid": 3213030,
//            "ext": "209486",
//            "new_tag": false,
//            "seq": 23,
//            "title": "女孩子睡着后的样子"
//            },
//            {
//            "iid": 3213029,
//            "ext": "176516",
//            "new_tag": false,
//            "seq": 24,
//            "title": "池昌旭将退伍"
//            },
//            {
//            "iid": 3213028,
//            "ext": "152942",
//            "new_tag": false,
//            "seq": 25,
//            "title": "威少"
//            },
//            {
//            "iid": 3213027,
//            "ext": "149263",
//            "new_tag": true,
//            "seq": 26,
//            "title": "中学回应男女生分区吃饭"
//            },
//            {
//            "iid": 3213026,
//            "ext": "148950",
//            "new_tag": true,
//            "seq": 27,
//            "title": "哈尔滨日晕"
//            },
//            {
//            "iid": 3213025,
//            "ext": "146905",
//            "new_tag": false,
//            "seq": 28,
//            "title": "岳岳叫陈都灵都都"
//            },
//            {
//            "iid": 3213024,
//            "ext": "136813",
//            "new_tag": false,
//            "seq": 29,
//            "title": "香芋色的虎皮鹦鹉"
//            },
//            {
//            "iid": 3213023,
//            "ext": "124710",
//            "new_tag": false,
//            "seq": 30,
//            "title": "权力的游戏"
//            },
//            {
//            "iid": 3213022,
//            "ext": "124079",
//            "new_tag": true,
//            "seq": 31,
//            "title": "哪一刻让你感觉青春结束了"
//            },
//            {
//            "iid": 3213021,
//            "ext": "118921",
//            "new_tag": false,
//            "seq": 32,
//            "title": "生活中喜极而泣的瞬间"
//            },
//            {
//            "iid": 3213020,
//            "ext": "113564",
//            "new_tag": true,
//            "seq": 33,
//            "title": "沙雕cos猫和老鼠"
//            },
//            {
//            "iid": 3213019,
//            "ext": "113019",
//            "new_tag": false,
//            "seq": 34,
//            "title": "陈展鹏当爸"
//            },
//            {
//            "iid": 3213018,
//            "ext": "112147",
//            "new_tag": true,
//            "seq": 35,
//            "title": "巴厘岛阿贡火山再次喷发"
//            },
//            {
//            "iid": 3213017,
//            "ext": "107753",
//            "new_tag": false,
//            "seq": 36,
//            "title": "王思聪"
//            },
//            {
//            "iid": 3213016,
//            "ext": "104277",
//            "new_tag": false,
//            "seq": 37,
//            "title": "背着一块完整土块的鳄龟"
//            },
//            {
//            "iid": 3213015,
//            "ext": "103242",
//            "new_tag": false,
//            "seq": 38,
//            "title": "日本超燃一镜到底CM"
//            },
//            {
//            "iid": 3213014,
//            "ext": "101855",
//            "new_tag": false,
//            "seq": 39,
//            "title": "天天美剧"
//            },
//            {
//            "iid": 3213013,
//            "ext": "80734",
//            "new_tag": true,
//            "seq": 40,
//            "title": "成年世界的潜台词"
//            },
//            {
//            "iid": 3213012,
//            "ext": "79921",
//            "new_tag": true,
//            "seq": 41,
//            "title": "观影提示属实贴心"
//            },
//            {
//            "iid": 3213011,
//            "ext": "79347",
//            "new_tag": true,
//            "seq": 42,
//            "title": "特斯拉起火原因"
//            },
//            {
//            "iid": 3213010,
//            "ext": "77612",
//            "new_tag": true,
//            "seq": 43,
//            "title": "吴倩"
//            },
//            {
//            "iid": 3213009,
//            "ext": "76645",
//            "new_tag": true,
//            "seq": 44,
//            "title": "深海先生"
//            },
//            {
//            "iid": 3213008,
//            "ext": "75304",
//            "new_tag": false,
//            "seq": 45,
//            "title": "圣母院重建筹款接近10亿美元"
//            },
//            {
//            "iid": 3213007,
//            "ext": "75013",
//            "new_tag": true,
//            "seq": 46,
//            "title": "斯里兰卡爆炸4名中国学者失联"
//            },
//            {
//            "iid": 3213006,
//            "ext": "73952",
//            "new_tag": false,
//            "seq": 47,
//            "title": "游客大理洱海里洗奥迪"
//            },
//            {
//            "iid": 3213005,
//            "ext": "73894",
//            "new_tag": true,
//            "seq": 48,
//            "title": "中国游戏版号申报重启"
//            },
//            {
//            "iid": 3213004,
//            "ext": "72091",
//            "new_tag": false,
//            "seq": 49,
//            "title": "矮子追星现状"
//            }
//            ],
//            "attrs": {
//            "cn": "热搜榜",
//            "display": 10
//            }
//            }
//            ],
//            "site": "weibo",
//            "attrs": {
//                "url": "https://www.weibo.com",
//                "logo": "https://f0cdn.anyknew.com/static/logo/weibo.png",
//                "cn": "微博",
//                "iter": 6796
//            }
//        }
//    }
//}
