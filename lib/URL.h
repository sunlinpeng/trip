//
//  URL.h
//  trip
//
//  Created by 孙林鹏 on 15/12/2.
//  Copyright © 2015年 jinzhaoshenghui.com. All rights reserved.
//

#ifndef URL_h
#define URL_h
#define BaseUrl @"http://36.110.16.14:9999"
//#define BaseUrl @"http://app.goutrip.com"
// 主页数据
#define HomeUrl ([NSString stringWithFormat:@"%@/index.html",BaseUrl])

// 路线详情 (需要路线id)
#define RouteDetailUrl ([NSString stringWithFormat:@"%@/route/detail.html",BaseUrl])

// 获取路线出发日期 (routeId year month)
#define lineStartDateUrl ([NSString stringWithFormat:@"%@/route/getPriceDailyList.json",BaseUrl])

// 路线,酒店的收藏
#define SaveOrderUrl ([NSString stringWithFormat:@"%@/member/addBookmark.html",BaseUrl])

// 路线,酒店的取消
#define RemoveOrderUrl ([NSString stringWithFormat:@"%@/member/cancelBookmark.html",BaseUrl])

// 生成订单号 (好多参数)
#define MakeOrderCode ([NSString stringWithFormat:@"%@/pay/makeOrder.html",BaseUrl])

// 城市列表
#define CityList ([NSString stringWithFormat:@"%@/hotel/hotelSelectCity.html",BaseUrl])
// 酒店列表
#define HotelList ([NSString stringWithFormat:@"%@/hotel/list.html",BaseUrl])

// 酒店详情 需要传一些参数 post
#define HotelDetail ([NSString stringWithFormat:@"%@/hotel/info.html",BaseUrl])

// 主题游列表 也可以穿一些参数  id等
#define ThemeUrl ([NSString stringWithFormat:@"%@/type.html",BaseUrl])

// 登录接口 (参数 userName password)
#define LoginUrl ([NSString stringWithFormat:@"%@/member/logined.html",BaseUrl])

// 我的 订单数目 接口 需要传 userId
#define OrderMenu ([NSString stringWithFormat:@"%@/member/myIndex.html",BaseUrl])

// 我的 全部订单 路线 (userId 等参数)
#define OrderLineListUrl ([NSString stringWithFormat:@"%@/member/orderList.html",BaseUrl])

// 我的 全部订单 酒店 (userId 等参数)
#define OrderHotelListUrl ([NSString stringWithFormat:@"%@/member/hotel_orders.html",BaseUrl])

// 我的收藏 (userId type)
#define SaveUrl ([NSString stringWithFormat:@"%@/member/bookmark_list.html",BaseUrl])

// 取消订单 (orderNo 订单编号)
#define CancelOrderUrl ([NSString stringWithFormat:@"%@/member/updateOrders.html",BaseUrl])

// 反馈信息 (userId yijian)
#define ReViewUrl ([NSString stringWithFormat:@"%@/index/yijian_email.html",BaseUrl])

// 获取个人信息 (userId)
#define PersonInfoUrl ([NSString stringWithFormat:@"%@/member/personalInfo.html",BaseUrl])

// 获取注册时候的验证码 (userName  手机号)
#define GetRegisterCodeUrl ([NSString stringWithFormat:@"%@/member/registerCode.html",BaseUrl])

// 获取修改密码时候的验证码 (userName  手机号)
#define GetForgetCodeUrl ([NSString stringWithFormat:@"%@/member/findPwdCode.html",BaseUrl])

// 注册url
#define RegisterUrl ([NSString stringWithFormat:@"%@/member/save.html",BaseUrl])

// 修改个人信息 /memeber/update_info.html (userId)
#define UpdateUserUrl ([NSString stringWithFormat:@"%@/memeber/update_info.html",BaseUrl])

// 找回密码 (手机号，密码)
#define LookPasswordUrl ([NSString stringWithFormat:@"%@/member/updatePwdByUserName.html",BaseUrl])

// 第三方登录成功后 请求的地址(uid loginName)
#define LoginSuccessUrl ([NSString stringWithFormat:@"%@/autoLogin/collbackUrl.html",BaseUrl])


// 微信回调地址
#define weixinUrl ([NSString stringWithFormat:@"%@/pay/weixin/notifyUrl.html",BaseUrl])

// 支付宝回调地址
#define alipayUrl ([NSString stringWithFormat:@"%@/pay/ali/notify_url.html",BaseUrl])

// 支付回调 用订单号去后台验证(orderNo)
#define QueryPayStatusUrl ([NSString stringWithFormat:@"%@/member/queryOrderStatus.html",BaseUrl])

// 邮箱验证
#define PostUrl ([NSString stringWithFormat:@"%@/member/mailGetCode.html",BaseUrl])


#endif /* URL_h */
