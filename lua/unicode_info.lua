--[[
说明:
unicode display filter
字符转Unicode码滤镜

2022年11月9日 Shitlime

2023年2月13日 飞梧
合并字集lua，显示单字字集及Unicode码

使用步骤：
0. 在rime.lua添加如下一行：
unicode_info = require("unicode_info")  -- Unicode显示滤镜

1. 在方案“filters: #过滤器”中添加如下一行:
    - lua_filter@unicode_info #lua unicode显示滤镜

2. 在方案“switches: #开关”中添加名为uninfo的开关,对本滤镜进行控制:
例:
  - name: uninfo
    reset: 1
    states: [ 〇, JU] # reset指定是否默认开启,1是默认开启,0默认关闭,若常用可以默认开启
]]--

local function ziji(danzi)
  local ji = ""
  if 0x4e00 <= danzi and danzi <= 0x9fff then
    ji = "基本"
  elseif 0x3400 <= danzi and danzi <= 0x4dbf then
    ji = "扩Ａ"
  elseif 0x20000 <= danzi and danzi <= 0x2a6df then
    ji = "扩Ｂ"
  elseif 0x2a700 <= danzi and danzi <= 0x2b73f then
    ji = "扩Ｃ"
  elseif 0x2b740 <= danzi and danzi <= 0x2b81f then
    ji = "扩Ｄ"
  elseif 0x2b820 <= danzi and danzi <= 0x2ceaf then
    ji = "扩Ｅ"
  elseif 0x2ceb0 <= danzi and danzi <= 0x2ebef then
    ji = "扩Ｆ"
  elseif 0x30000 <= danzi and danzi <= 0x3134f then
    ji = "扩Ｇ"
  elseif 0x31350 <= danzi and danzi <= 0x323af then
    ji = "扩Ｈ"
  elseif 0xf900 <= danzi and danzi <= 0xfaff then
    if danzi == 0xfa0e or danzi == 0xfa0f or danzi == 0xfa11 or danzi == 0xfa13 or danzi == 0xfa14 or danzi == 0xfa1f or danzi == 0xfa21 or danzi == 0xfa23 or danzi == 0xfa24 or danzi == 0xfa27 or danzi == 0xfa28 or danzi == 0xfa29 then
      --﨎﨏﨑﨓﨔﨟﨡﨣﨤﨧﨨﨩
      ji = "兼容区12统一字"
    else
      ji = "兼容字"
    end
  elseif 0x2f800 <= danzi and danzi <= 0x2fa1f then
    ji = "兼容字补"
  elseif 0x31c0 <= danzi and danzi <= 0x31ef then
    ji = "笔画"
  elseif 0x2e80 <= danzi and danzi <= 0x2eff then
    ji = "部首补"
  elseif 0x2f00 <= danzi and danzi <= 0x2fdf then
    ji = "康熙部首"
  elseif 0xe000 <= danzi and danzi <= 0xf8ff then
    ji = "ＰＵＡ"
  elseif 0xf0000 <= danzi and danzi <= 0xfffff then
    ji = "ＰＵＡ扩Ａ"
  elseif 0x100000 <= danzi and danzi <= 0x10ffff then
    ji = "ＰＵＡ扩Ｂ"
  elseif 0x2ff0 <= danzi and danzi <= 0x2ffb then
    ji = "ＩＤＳ"
  elseif 0x3100 <= danzi and danzi <= 0x312f then
    ji = "注音"
  elseif 0x31a0 <= danzi and danzi <= 0x31bf then
    ji = "注音符号扩"
  elseif 0x0000 <= danzi and danzi <= 0x007f then
    ji = "拉丁文"
  elseif 0x0080 <= danzi and danzi <= 0x00ff then
    ji = "拉丁文补"
  elseif 0x0100 <= danzi and danzi <= 0x017f then
    ji = "拉丁语扩Ａ"
  elseif 0x0180 <= danzi and danzi <= 0x024f then
    ji = "拉丁语扩Ｂ"
  elseif 0x0250 <= danzi and danzi <= 0x02af then
    ji = "国际音标扩"
  elseif 0x02b0 <= danzi and danzi <= 0x02ff then
    ji = "间距修饰符"
  elseif 0x0300 <= danzi and danzi <= 0x036f then
    ji = "组合变音标记"
  elseif 0x0370 <= danzi and danzi <= 0x03ff then
    ji = "希腊文"
  elseif 0x0400 <= danzi and danzi <= 0x04ff then
    ji = "西里尔文"
  elseif 0x0500 <= danzi and danzi <= 0x052f then
    ji = "西里尔文补"
  elseif 0x0530 <= danzi and danzi <= 0x058f then
    ji = "亚美尼亚语"
  elseif 0x0590 <= danzi and danzi <= 0x05ff then
    ji = "希伯来文"
  elseif 0x0600 <= danzi and danzi <= 0x06ff then
    ji = "阿拉伯语"
  elseif 0x0700 <= danzi and danzi <= 0x074f then
    ji = "叙利亚文"
  elseif 0x0750 <= danzi and danzi <= 0x077f then
    ji = "阿拉伯语补"
  elseif 0x0780 <= danzi and danzi <= 0x07bf then
    ji = "它拿字母"
  elseif 0x07c0 <= danzi and danzi <= 0x07ff then
    ji = "西非书面文字"
  elseif 0x0800 <= danzi and danzi <= 0x083f then
    ji = "撒玛利亚字母"
  elseif 0x0840 <= danzi and danzi <= 0x085f then
    ji = "曼达文"
  elseif 0x0860 <= danzi and danzi <= 0x086f then
    ji = "叙利亚文补"
  elseif 0x08a0 <= danzi and danzi <= 0x08ff then
    ji = "阿拉伯语扩Ａ"
  elseif 0x0900 <= danzi and danzi <= 0x097f then
    ji = "梵文"
  elseif 0x0980 <= danzi and danzi <= 0x09ff then
    ji = "孟加拉语"
  elseif 0x0a00 <= danzi and danzi <= 0x0a7f then
    ji = "古木基文"
  elseif 0x0a80 <= danzi and danzi <= 0x0aff then
    ji = "古吉拉特文"
  elseif 0x0b00 <= danzi and danzi <= 0x0b7f then
    ji = "奥里亚语"
  elseif 0x0b80 <= danzi and danzi <= 0x0bff then
    ji = "泰米尔语"
  elseif 0x0c00 <= danzi and danzi <= 0x0c7f then
    ji = "泰卢固语"
  elseif 0x0c80 <= danzi and danzi <= 0x0cff then
    ji = "卡纳达语"
  elseif 0x0d00 <= danzi and danzi <= 0x0d7f then
    ji = "马拉雅拉姆语"
  elseif 0x0d80 <= danzi and danzi <= 0x0dff then
    ji = "僧伽罗语"
  elseif 0x0e00 <= danzi and danzi <= 0x0e7f then
    ji = "泰语"
  elseif 0x0e80 <= danzi and danzi <= 0x0eff then
    ji = "老挝语"
  elseif 0x0f00 <= danzi and danzi <= 0x0fff then
    ji = "藏文"
  elseif 0x1000 <= danzi and danzi <= 0x109f then
    ji = "缅甸语"
  elseif 0x10a0 <= danzi and danzi <= 0x10ff then
    ji = "格鲁吉亚语"
  elseif 0x1100 <= danzi and danzi <= 0x11ff then
    ji = "韩文字母"
  elseif 0x1200 <= danzi and danzi <= 0x137f then
    ji = "阿姆哈拉语"
  elseif 0x1380 <= danzi and danzi <= 0x139f then
    ji = "阿姆哈拉语补"
  elseif 0x13a0 <= danzi and danzi <= 0x13ff then
    ji = "切罗基语"
  elseif 0x1400 <= danzi and danzi <= 0x167f then
    ji = "加拿大原住民音节"
  elseif 0x1680 <= danzi and danzi <= 0x169f then
    ji = "欧甘字母"
  elseif 0x16a0 <= danzi and danzi <= 0x16ff then
    ji = "卢恩字母"
  elseif 0x1700 <= danzi and danzi <= 0x171f then
    ji = "他加禄语"
  elseif 0x1720 <= danzi and danzi <= 0x173f then
    ji = "哈努诺文"
  elseif 0x1740 <= danzi and danzi <= 0x175f then
    ji = "布希德文"
  elseif 0x1760 <= danzi and danzi <= 0x177f then
    ji = "塔格巴努亚文"
  elseif 0x1780 <= danzi and danzi <= 0x17ff then
    ji = "高棉语"
  elseif 0x1800 <= danzi and danzi <= 0x18af then
    ji = "蒙古语"
  elseif 0x18b0 <= danzi and danzi <= 0x18ff then
    ji = "加拿大原住民音节扩"
  elseif 0x1900 <= danzi and danzi <= 0x194f then
    ji = "林布语"
  elseif 0x1950 <= danzi and danzi <= 0x197f then
    ji = "德宏傣文"
  elseif 0x1980 <= danzi and danzi <= 0x19df then
    ji = "傣仂语"
  elseif 0x19e0 <= danzi and danzi <= 0x19ff then
    ji = "高棉符号"
  elseif 0x1a00 <= danzi and danzi <= 0x1a1f then
    ji = "布吉语"
  elseif 0x1a20 <= danzi and danzi <= 0x1aaf then
    ji = "老傣文"
  elseif 0x1ab0 <= danzi and danzi <= 0x1aff then
    ji = "结合变音符号扩"
  elseif 0x1b00 <= danzi and danzi <= 0x1b7f then
    ji = "巴厘语"
  elseif 0x1b80 <= danzi and danzi <= 0x1bbf then
    ji = "巽他语"
  elseif 0x1bc0 <= danzi and danzi <= 0x1bff then
    ji = "巴塔克语"
  elseif 0x1c00 <= danzi and danzi <= 0x1c4f then
    ji = "绒巴文"
  elseif 0x1c50 <= danzi and danzi <= 0x1c7f then
    ji = "桑塔利语字母"
  elseif 0x1c80 <= danzi and danzi <= 0x1c8f then
    ji = "西里尔文扩Ｃ"
  elseif 0x1c90 <= danzi and danzi <= 0x1cbf then
    ji = "格鲁吉亚文扩"
  elseif 0x1cc0 <= danzi and danzi <= 0x1ccf then
    ji = "巽他文补"
  elseif 0x1cd0 <= danzi and danzi <= 0x1cff then
    ji = "吠陀扩"
  elseif 0x1d00 <= danzi and danzi <= 0x1d7f then
    ji = "国际音标扩"
  elseif 0x1d80 <= danzi and danzi <= 0x1dbf then
    ji = "国际音标补"
  elseif 0x1dc0 <= danzi and danzi <= 0x1dff then
    ji = "结合变音标记补"
  elseif 0x1e00 <= danzi and danzi <= 0x1eff then
    ji = "拉丁语扩附加"
  elseif 0x1f00 <= danzi and danzi <= 0x1fff then
    ji = "希腊语扩"
  elseif 0x2000 <= danzi and danzi <= 0x206f then
    ji = "标点"
  elseif 0x2070 <= danzi and danzi <= 0x209f then
    ji = "上标和下标"
  elseif 0x20a0 <= danzi and danzi <= 0x20cf then
    ji = "货币符号"
  elseif 0x20d0 <= danzi and danzi <= 0x20ff then
    ji = "结合符号变音符号"
  elseif 0x2100 <= danzi and danzi <= 0x214f then
    ji = "类字母符号"
  elseif 0x2150 <= danzi and danzi <= 0x218f then
    ji = "数字"
  elseif 0x2190 <= danzi and danzi <= 0x21ff then
    ji = "箭头"
  elseif 0x2200 <= danzi and danzi <= 0x22ff then
    ji = "数运"
  elseif 0x2300 <= danzi and danzi <= 0x23ff then
    ji = "杂项技术符号"
  elseif 0x2400 <= danzi and danzi <= 0x243f then
    ji = "控制图片"
  elseif 0x2440 <= danzi and danzi <= 0x245f then
    ji = "光学字符识别"
  elseif 0x2460 <= danzi and danzi <= 0x24ff then
    ji = "带圈数字"
  elseif 0x2500 <= danzi and danzi <= 0x257f then
    ji = "制表符"
  elseif 0x2580 <= danzi and danzi <= 0x259f then
    ji = "方块元素"
  elseif 0x25a0 <= danzi and danzi <= 0x25ff then
    ji = "几何"
  elseif 0x2600 <= danzi and danzi <= 0x26ff then
    if 0x2630 <= danzi and danzi <= 0x2637 then
      ji = "八卦"
    else
      ji = "杂项"
    end
  elseif 0x2700 <= danzi and danzi <= 0x27bf then
    ji = "装饰"
  elseif 0x27c0 <= danzi and danzi <= 0x27ef then
    ji = "杂项数学符号-A"
  elseif 0x27f0 <= danzi and danzi <= 0x27ff then
    ji = "补箭头-A"
  elseif 0x2800 <= danzi and danzi <= 0x28ff then
    ji = "盲文"
  elseif 0x2900 <= danzi and danzi <= 0x297f then
    ji = "补箭头-B"
  elseif 0x2980 <= danzi and danzi <= 0x29ff then
    ji = "杂项数学符号-B"
  elseif 0x2a00 <= danzi and danzi <= 0x2aff then
    ji = "数学运算补"
  elseif 0x2b00 <= danzi and danzi <= 0x2bff then
    ji = "其他符号和箭头"
  elseif 0x2c00 <= danzi and danzi <= 0x2c5f then
    ji = "格拉哥里字母"
  elseif 0x2c60 <= danzi and danzi <= 0x2c7f then
    ji = "拉丁语扩Ｃ"
  elseif 0x2c80 <= danzi and danzi <= 0x2cff then
    ji = "科普特文"
  elseif 0x2d00 <= danzi and danzi <= 0x2d2f then
    ji = "格鲁吉亚文补"
  elseif 0x2d30 <= danzi and danzi <= 0x2d7f then
    ji = "提非纳字母"
  elseif 0x2d80 <= danzi and danzi <= 0x2ddf then
    ji = "阿姆哈拉语扩"
  elseif 0x2de0 <= danzi and danzi <= 0x2dff then
    ji = "西里尔文扩Ａ"
  elseif 0x2e00 <= danzi and danzi <= 0x2e7f then
    ji = "补标点符号"
  elseif 0x3000 <= danzi and danzi <= 0x303f then
    ji = "符号和标点"
  elseif 0x3040 <= danzi and danzi <= 0x309f then
    ji = "平假名"
  elseif 0x30a0 <= danzi and danzi <= 0x30ff then
    ji = "片假名"
  elseif 0x3130 <= danzi and danzi <= 0x318f then
    ji = "韩文兼容字母"
  elseif 0x3190 <= danzi and danzi <= 0x319f then
    ji = "汉文训读"
  elseif 0x31f0 <= danzi and danzi <= 0x31ff then
    ji = "假名扩"
  elseif 0x3200 <= danzi and danzi <= 0x32ff then
    ji = "括弧带圈字符"
  elseif 0x3300 <= danzi and danzi <= 0x33ff then
    ji = "兼容单位"
  elseif 0x4dc0 <= danzi and danzi <= 0x4dff then
    ji = "六十四卦"
  elseif 0xa000 <= danzi and danzi <= 0xa48f then
    ji = "彝族音节"
  elseif 0xa490 <= danzi and danzi <= 0xa4cf then
    ji = "彝族部首"
  elseif 0xa4d0 <= danzi and danzi <= 0xa4ff then
    ji = "傈僳语"
  elseif 0xa500 <= danzi and danzi <= 0xa63f then
    ji = "瓦伊语"
  elseif 0xa640 <= danzi and danzi <= 0xa69f then
    ji = "西里尔文扩Ｂ"
  elseif 0xa6a0 <= danzi and danzi <= 0xa6ff then
    ji = "巴姆穆语"
  elseif 0xa700 <= danzi and danzi <= 0xa71f then
    ji = "声调修饰符"
  elseif 0xa720 <= danzi and danzi <= 0xa7ff then
    ji = "拉丁语扩Ｄ"
  elseif 0xa800 <= danzi and danzi <= 0xa82f then
    ji = "锡尔赫特文"
  elseif 0xa830 <= danzi and danzi <= 0xa83f then
    ji = "常用印度数字形式"
  elseif 0xa840 <= danzi and danzi <= 0xa87f then
    ji = "八思巴字"
  elseif 0xa880 <= danzi and danzi <= 0xa8df then
    ji = "索拉什特拉语"
  elseif 0xa8e0 <= danzi and danzi <= 0xa8ff then
    ji = "天城文扩"
  elseif 0xa900 <= danzi and danzi <= 0xa92f then
    ji = "克耶字母"
  elseif 0xa930 <= danzi and danzi <= 0xa95f then
    ji = "拉让语"
  elseif 0xa960 <= danzi and danzi <= 0xa97f then
    ji = "韩文字母扩Ａ"
  elseif 0xa980 <= danzi and danzi <= 0xa9df then
    ji = "爪哇语"
  elseif 0xa9e0 <= danzi and danzi <= 0xa9ff then
    ji = "缅甸语扩Ｂ"
  elseif 0xaa00 <= danzi and danzi <= 0xaa5f then
    ji = "占语"
  elseif 0xaa60 <= danzi and danzi <= 0xaa7f then
    ji = "缅甸语扩Ａ"
  elseif 0xaa80 <= danzi and danzi <= 0xaadf then
    ji = "傣文"
  elseif 0xaae0 <= danzi and danzi <= 0xaaff then
    ji = "曼尼普尔语扩"
  elseif 0xab00 <= danzi and danzi <= 0xab2f then
    ji = "阿姆哈拉语扩Ａ"
  elseif 0xab30 <= danzi and danzi <= 0xab6f then
    ji = "拉丁文扩Ｅ"
  elseif 0xab70 <= danzi and danzi <= 0xabbf then
    ji = "切罗基语补"
  elseif 0xabc0 <= danzi and danzi <= 0xabff then
    ji = "曼尼普尔语"
  elseif 0xac00 <= danzi and danzi <= 0xd7af then
    ji = "韩文音节"
  elseif 0xd7b0 <= danzi and danzi <= 0xd7ff then
    ji = "韩文字母扩Ｂ"
  elseif 0xd800 <= danzi and danzi <= 0xdb7f then
    ji = "高位替代区"
  elseif 0xdb80 <= danzi and danzi <= 0xdbff then
    ji = "高位专用替代"
  elseif 0xdc00 <= danzi and danzi <= 0xdfff then
    ji = "低位替代区"
  elseif 0xfb00 <= danzi and danzi <= 0xfb4f then
    ji = "字母连写形式"
  elseif 0xfb50 <= danzi and danzi <= 0xfdff then
    ji = "阿拉伯语表现形式-A"
  elseif 0xfe00 <= danzi and danzi <= 0xfe0f then
    ji = "变体选择器"
  elseif 0xfe10 <= danzi and danzi <= 0xfe1f then
    ji = "竖排形式"
  elseif 0xfe20 <= danzi and danzi <= 0xfe2f then
    ji = "组合用半符号"
  elseif 0xfe30 <= danzi and danzi <= 0xfe4f then
    ji = "中日韩兼容形式"
  elseif 0xfe50 <= danzi and danzi <= 0xfe6f then
    ji = "小型变体形式"
  elseif 0xfe70 <= danzi and danzi <= 0xfeff then
    ji = "阿拉伯语表现形式-B"
  elseif 0xff00 <= danzi and danzi <= 0xffef then
    ji = "字符"
  elseif 0xfff0 <= danzi and danzi <= 0xffff then
    ji = "特殊字符"
  elseif 0x10000 <= danzi and danzi <= 0x1007f then
    ji = "线形文字B音节"
  elseif 0x10080 <= danzi and danzi <= 0x100ff then
    ji = "线形文字B表意文字"
  elseif 0x10100 <= danzi and danzi <= 0x1013f then
    ji = "爱琴海数字"
  elseif 0x10140 <= danzi and danzi <= 0x1018f then
    ji = "古希腊数字"
  elseif 0x10190 <= danzi and danzi <= 0x101cf then
    ji = "古罗马符号"
  elseif 0x101d0 <= danzi and danzi <= 0x101ff then
    ji = "斐斯托斯圆盘古文字"
  elseif 0x10280 <= danzi and danzi <= 0x1029f then
    ji = "吕基亚语"
  elseif 0x102a0 <= danzi and danzi <= 0x102df then
    ji = "卡里亚字母"
  elseif 0x102e0 <= danzi and danzi <= 0x102ff then
    ji = "科普特闰余数字"
  elseif 0x10300 <= danzi and danzi <= 0x1032f then
    ji = "古意大利字母"
  elseif 0x10330 <= danzi and danzi <= 0x1034f then
    ji = "哥特字母"
  elseif 0x10350 <= danzi and danzi <= 0x1037f then
    ji = "古彼尔姆文"
  elseif 0x10380 <= danzi and danzi <= 0x1039f then
    ji = "乌加里特语"
  elseif 0x103a0 <= danzi and danzi <= 0x103df then
    ji = "古波斯语"
  elseif 0x10400 <= danzi and danzi <= 0x1044f then
    ji = "德瑟雷特字母"
  elseif 0x10450 <= danzi and danzi <= 0x1047f then
    ji = "萧伯纳字母"
  elseif 0x10480 <= danzi and danzi <= 0x104af then
    ji = "奥斯曼亚字母"
  elseif 0x104b0 <= danzi and danzi <= 0x104ff then
    ji = "欧塞奇字母"
  elseif 0x10500 <= danzi and danzi <= 0x1052f then
    ji = "爱尔巴桑字母"
  elseif 0x10530 <= danzi and danzi <= 0x1056f then
    ji = "高加索阿尔巴尼亚语言"
  elseif 0x10600 <= danzi and danzi <= 0x1077f then
    ji = "线性文字A"
  elseif 0x10800 <= danzi and danzi <= 0x1083f then
    ji = "塞浦路斯语音节"
  elseif 0x10840 <= danzi and danzi <= 0x1085f then
    ji = "帝国阿拉姆語"
  elseif 0x10860 <= danzi and danzi <= 0x1087f then
    ji = "巴尔米拉字母"
  elseif 0x10880 <= danzi and danzi <= 0x108af then
    ji = "纳巴泰字母"
  elseif 0x108e0 <= danzi and danzi <= 0x108ff then
    ji = "哈特兰字母"
  elseif 0x10900 <= danzi and danzi <= 0x1091f then
    ji = "腓尼基字母"
  elseif 0x10920 <= danzi and danzi <= 0x1093f then
    ji = "吕底亚语"
  elseif 0x10980 <= danzi and danzi <= 0x1099f then
    ji = "麦罗埃象形文字"
  elseif 0x109a0 <= danzi and danzi <= 0x109ff then
    ji = "麦罗埃文草体字"
  elseif 0x10a00 <= danzi and danzi <= 0x10a5f then
    ji = "佉卢文"
  elseif 0x10a60 <= danzi and danzi <= 0x10a7f then
    ji = "古南部阿拉伯语"
  elseif 0x10a80 <= danzi and danzi <= 0x10a9f then
    ji = "古北部阿拉伯语"
  elseif 0x10ac0 <= danzi and danzi <= 0x10aff then
    ji = "摩尼字母"
  elseif 0x10b00 <= danzi and danzi <= 0x10b3f then
    ji = "阿维斯陀字母"
  elseif 0x10b40 <= danzi and danzi <= 0x10b5f then
    ji = "碑刻帕提亚文"
  elseif 0x10b60 <= danzi and danzi <= 0x10b7f then
    ji = "碑刻巴列维文"
  elseif 0x10b80 <= danzi and danzi <= 0x10baf then
    ji = "诗篇巴列维文"
  elseif 0x10c00 <= danzi and danzi <= 0x10c4f then
    ji = "古代突厥語"
  elseif 0x10c80 <= danzi and danzi <= 0x10cff then
    ji = "古匈牙利字母"
  elseif 0x10d00 <= danzi and danzi <= 0x10d3f then
    ji = "哈乃斐罗兴亚文字"
  elseif 0x10e60 <= danzi and danzi <= 0x10e7f then
    ji = "鲁米数字符号"
  elseif 0x10e80 <= danzi and danzi <= 0x10ebf then
    ji = "雅慈迪文字"
  elseif 0x10f00 <= danzi and danzi <= 0x10f2f then
    ji = "古粟特字母"
  elseif 0x10f30 <= danzi and danzi <= 0x10f6f then
    ji = "粟特字母"
  elseif 0x10fb0 <= danzi and danzi <= 0x10fdf then
    ji = "花剌子模文字"
  elseif 0x10fe0 <= danzi and danzi <= 0x10fff then
    ji = "以利买字母"
  elseif 0x11000 <= danzi and danzi <= 0x1107f then
    ji = "婆罗米文"
  elseif 0x11080 <= danzi and danzi <= 0x110cf then
    ji = "凯提文"
  elseif 0x110d0 <= danzi and danzi <= 0x110ff then
    ji = "索拉僧平文字"
  elseif 0x11100 <= danzi and danzi <= 0x1114f then
    ji = "查克马语"
  elseif 0x11150 <= danzi and danzi <= 0x1117f then
    ji = "马哈雅尼文"
  elseif 0x11180 <= danzi and danzi <= 0x111df then
    ji = "夏拉达文"
  elseif 0x111e0 <= danzi and danzi <= 0x111ff then
    ji = "古僧伽罗文数字"
  elseif 0x11200 <= danzi and danzi <= 0x1124f then
    ji = "和卓文"
  elseif 0x11280 <= danzi and danzi <= 0x112af then
    ji = "木尔坦文"
  elseif 0x112b0 <= danzi and danzi <= 0x112ff then
    ji = "库达瓦迪文"
  elseif 0x11300 <= danzi and danzi <= 0x1137f then
    ji = "古兰塔文"
  elseif 0x11400 <= danzi and danzi <= 0x1147f then
    ji = "尼瓦尔语"
  elseif 0x11480 <= danzi and danzi <= 0x114df then
    ji = "提尔胡塔文"
  elseif 0x11580 <= danzi and danzi <= 0x115ff then
    ji = "悉昙文字"
  elseif 0x11600 <= danzi and danzi <= 0x1165f then
    ji = "莫迪文"
  elseif 0x11660 <= danzi and danzi <= 0x1167f then
    ji = "蒙古语补"
  elseif 0x11680 <= danzi and danzi <= 0x116cf then
    ji = "塔克里文"
  elseif 0x11700 <= danzi and danzi <= 0x1173f then
    ji = "阿洪姆语"
  elseif 0x11800 <= danzi and danzi <= 0x1184f then
    ji = "多格拉语"
  elseif 0x118a0 <= danzi and danzi <= 0x118ff then
    ji = "瓦兰齐地文"
  elseif 0x11900 <= danzi and danzi <= 0x1195f then
    ji = "迪维希文字"
  elseif 0x119a0 <= danzi and danzi <= 0x119ff then
    ji = "南迪城文"
  elseif 0x11a00 <= danzi and danzi <= 0x11a4f then
    ji = "札那巴札尔方形字母"
  elseif 0x11a50 <= danzi and danzi <= 0x11aaf then
    ji = "索永布字母"
  elseif 0x11ac0 <= danzi and danzi <= 0x11aff then
    ji = "包钦豪文"
  elseif 0x11c00 <= danzi and danzi <= 0x11c6f then
    ji = "拜克舒基文"
  elseif 0x11c70 <= danzi and danzi <= 0x11cbf then
    ji = "玛钦文"
  elseif 0x11d00 <= danzi and danzi <= 0x11d5f then
    ji = "马萨拉姆贡德文字"
  elseif 0x11d60 <= danzi and danzi <= 0x11daf then
    ji = "贡贾拉贡德文"
  elseif 0x11ee0 <= danzi and danzi <= 0x11eff then
    ji = "望加锡文"
  elseif 0x11fb0 <= danzi and danzi <= 0x11fbf then
    ji = "傈僳文字补"
  elseif 0x11fc0 <= danzi and danzi <= 0x11fff then
    ji = "泰米尔文补"
  elseif 0x12000 <= danzi and danzi <= 0x123ff then
    ji = "楔形文字"
  elseif 0x12400 <= danzi and danzi <= 0x1247f then
    ji = "楔形文字数字和标点符号"
  elseif 0x12480 <= danzi and danzi <= 0x1254f then
    ji = "古代楔形文字"
  elseif 0x13000 <= danzi and danzi <= 0x1342f then
    ji = "埃及圣书体"
  elseif 0x13430 <= danzi and danzi <= 0x1343f then
    ji = "埃及圣书体格式控制"
  elseif 0x14400 <= danzi and danzi <= 0x1467f then
    ji = "安纳托利亚象形文字"
  elseif 0x16800 <= danzi and danzi <= 0x16a3f then
    ji = "巴姆穆文字补"
  elseif 0x16a40 <= danzi and danzi <= 0x16a6f then
    ji = "默禄文"
  elseif 0x16ad0 <= danzi and danzi <= 0x16aff then
    ji = "巴萨哇文字"
  elseif 0x16b00 <= danzi and danzi <= 0x16b8f then
    ji = "帕哈苗文"
  elseif 0x16e40 <= danzi and danzi <= 0x16e9f then
    ji = "梅德法伊德林文"
  elseif 0x16f00 <= danzi and danzi <= 0x16f9f then
    ji = "柏格理苗文"
  elseif 0x16fe0 <= danzi and danzi <= 0x16fff then
    ji = "表意符号和标点符号"
  elseif 0x17000 <= danzi and danzi <= 0x187ff then
    ji = "西夏文"
  elseif 0x18800 <= danzi and danzi <= 0x18aff then
    ji = "西夏文部首"
  elseif 0x18b00 <= danzi and danzi <= 0x18cff then
    ji = "契丹小字"
  elseif 0x18d00 <= danzi and danzi <= 0x18d8f then
    ji = "西夏文字补"
  elseif 0x1b000 <= danzi and danzi <= 0x1b0ff then
    ji = "假名补"
  elseif 0x1b100 <= danzi and danzi <= 0x1b12f then
    ji = "假名扩Ａ"
  elseif 0x1b130 <= danzi and danzi <= 0x1b16f then
    ji = "小型日文假名扩"
  elseif 0x1b170 <= danzi and danzi <= 0x1b2ff then
    ji = "女书"
  elseif 0x1bc00 <= danzi and danzi <= 0x1bc9f then
    ji = "杜普雷速记"
  elseif 0x1bca0 <= danzi and danzi <= 0x1bcaf then
    ji = "速记格式控制符"
  elseif 0x1d000 <= danzi and danzi <= 0x1d0ff then
    ji = "拜占庭音乐符号"
  elseif 0x1d100 <= danzi and danzi <= 0x1d1ff then
    ji = "音乐符号"
  elseif 0x1d200 <= danzi and danzi <= 0x1d24f then
    ji = "古希腊音乐记号"
  elseif 0x1d2e0 <= danzi and danzi <= 0x1d2ff then
    ji = "玛雅数字"
  elseif 0x1d300 <= danzi and danzi <= 0x1d35f then
    ji = "太玄经符号"
  elseif 0x1d360 <= danzi and danzi <= 0x1d37f then
    ji = "算筹"
  elseif 0x1d400 <= danzi and danzi <= 0x1d7ff then
    ji = "字母和数字符号"
  elseif 0x1d800 <= danzi and danzi <= 0x1daaf then
    ji = "萨顿书写符号"
  elseif 0x1e000 <= danzi and danzi <= 0x1e02f then
    ji = "格拉哥里字母补"
  elseif 0x1e100 <= danzi and danzi <= 0x1e14f then
    ji = "尼亚坑普阿绰苗文"
  elseif 0x1e2c0 <= danzi and danzi <= 0x1e2ff then
    ji = "文乔字母"
  elseif 0x1e800 <= danzi and danzi <= 0x1e8df then
    ji = "门德基卡库文"
  elseif 0x1e900 <= danzi and danzi <= 0x1e95f then
    ji = "阿德拉姆字母"
  elseif 0x1ec70 <= danzi and danzi <= 0x1ecbf then
    ji = "印度西亚格数字"
  elseif 0x1ed00 <= danzi and danzi <= 0x1ed4f then
    ji = "奥斯曼西亚克数字"
  elseif 0x1ee00 <= danzi and danzi <= 0x1eeff then
    ji = "阿拉伯字母数字符号"
  elseif 0x1f000 <= danzi and danzi <= 0x1f02f then
    ji = "麻将牌"
  elseif 0x1f030 <= danzi and danzi <= 0x1f09f then
    ji = "多米诺骨牌"
  elseif 0x1f0a0 <= danzi and danzi <= 0x1f0ff then
    ji = "扑克牌"
  elseif 0x1f100 <= danzi and danzi <= 0x1f1ff then
    ji = "带圈字母补"
  elseif 0x1f200 <= danzi and danzi <= 0x1f2ff then
    ji = "方框字补"
  elseif 0x1f300 <= danzi and danzi <= 0x1f5ff then
    ji = "杂符"
  elseif 0x1f600 <= danzi and danzi <= 0x1f64f then
    ji = "表情"
  elseif 0x1f650 <= danzi and danzi <= 0x1f67f then
    ji = "装饰符号"
  elseif 0x1f680 <= danzi and danzi <= 0x1f6ff then
    ji = "交通和地图符号"
  elseif 0x1f700 <= danzi and danzi <= 0x1f77f then
    ji = "炼金术符号"
  elseif 0x1f780 <= danzi and danzi <= 0x1f7ff then
    ji = "几何扩"
  elseif 0x1f800 <= danzi and danzi <= 0x1f8ff then
    ji = "追加箭头-C"
  elseif 0x1f900 <= danzi and danzi <= 0x1f9ff then
    ji = "符号补"
  elseif 0x1fa00 <= danzi and danzi <= 0x1fa6f then
    ji = "象棋"
  elseif 0x1fa70 <= danzi and danzi <= 0x1faff then
    ji = "符号和象形文字扩Ａ"
  elseif 0x1fb00 <= danzi and danzi <= 0x1fbff then
    ji = "传统计算机符号"
  elseif 0xe0000 <= danzi and danzi <= 0xe007f then
    ji = "标签"
  elseif 0xe0100 <= danzi and danzi <= 0xe01ef then
    ji = "异体选择器补"
  --可根据需要自行修改字集
  end
  return ji
end

local function C2U(char)
    local unicode_d = utf8.codepoint(char)
    local unicode_h = string.format('%X', unicode_d)
    return unicode_d,unicode_h
end

local function unicode_info(input, env)
    local context = env.engine.context
    local input_text = context.input
    local uninfo = context:get_option("uninfo")
    for cand in input:iter() do
        if #input_text >= 1 and uninfo then
            local char = cand.text
            if utf8.len(char) == 1 then
                local unicode_d,unicode_h = C2U(char)
                local ji = ziji(unicode_d)
                yield(Candidate(input_text, cand.start, cand._end, cand.text, cand.comment.."["..ji.." U+"..unicode_h.."]"))
            else
                yield(cand)
            end
        else
            yield(cand)
        end
    end
end

return unicode_info