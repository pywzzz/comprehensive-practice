/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2022/11/25 15:07:14                          */
/*==============================================================*/


drop table if exists attachment;

drop table if exists b_marketing;

drop table if exists b_marketingGoods;

drop table if exists b_order;

drop table if exists b_orderDetail;

drop table if exists category;

drop table if exists coupon;

drop table if exists couponCategory;

drop table if exists goods;

drop table if exists goodscomment;

drop table if exists goodspic;

drop table if exists member;

drop table if exists memberAddress;

drop table if exists memberCoupon;

drop table if exists memberPickSite;

drop table if exists menus;

drop table if exists pickSite;

drop table if exists proivder;

drop table if exists role;

drop table if exists roleMenu;

drop table if exists user;

/*==============================================================*/
/* Table: attachment                                            */
/*==============================================================*/
create table attachment
(
    id                   varchar(36) not null,
    url                  varchar(200),
    type                 tinyint default 1 comment '1 、图片
            2、视频
            ....',
    miniUrl              varchar(200),
    uploadTime           timestamp default CURRENT_TIMESTAMP,
    isdefault            bit default 0 comment '0 否
            1 是',
    businessId           varchar(36),
    businessType         tinyint default 1 comment '1 商品
            2 评论
            ....',
    primary key (id)
);

/*==============================================================*/
/* Table: b_marketing                                           */
/*==============================================================*/
create table b_marketing
(
    id                   varchar(36) not null,
    name                 varchar(10),
    icon                 varchar(200),
    sorts                tinyint,
    beginDate            varchar(10),
    endDate              varchar(10),
    status               tinyint default 1 comment '1 未开始
            2、已开始
            3 已结束
            4 已取消',
    isdel                bit default 0 comment '0 未删除
            1已删除 ',
    createTime           timestamp default CURRENT_TIMESTAMP,
    updateTime           timestamp default CURRENT_TIMESTAMP,
    createUser           varchar(10),
    primary key (id)
);

/*==============================================================*/
/* Table: b_marketingGoods                                      */
/*==============================================================*/
create table b_marketingGoods
(
    id                   varchar(36) not null,
    mid                  varchar(36),
    goodsId              varchar(36),
    primary key (id)
);

/*==============================================================*/
/* Table: b_order                                               */
/*==============================================================*/
create table b_order
(
    id                   varchar(36) not null,
    orderNum             varchar(10),
    payable              decimal(10,2),
    pay                  decimal(10,2),
    status               tinyint default 1 comment '1 、待付款  （未支付）
            2 、（待收货） （已付款）
            3、 待评论  (已收货)
            4 、取消订单
            5、退货 ',
    orderDate            timestamp default CURRENT_TIMESTAMP,
    mid                  varchar(36),
    nickName             varchar(30),
    siteName             varchar(50),
    siteMobile           varchar(11),
    siteAddress          varchar(200),
    longitude            decimal(9,6),
    latitude             decimal(9,6),
    reviceUser           varchar(10),
    reciveMobile         varchar(11),
    primary key (id)
);

/*==============================================================*/
/* Table: b_orderDetail                                         */
/*==============================================================*/
create table b_orderDetail
(
    id                   varchar(36) not null,
    gid                  varchar(36),
    goodsname            varchar(50),
    price                decimal(10,2),
    num                  tinyint,
    oid                  varchar(36),
    primary key (id)
);

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
    id                   varchar(36) not null,
    name                 varchar(20),
    picurl               varchar(200),
    sorts                tinyint default 0,
    parentId             varchar(36) default '0',
    primary key (id)
);

/*==============================================================*/
/* Table: coupon                                                */
/*==============================================================*/
create table coupon
(
    id                   varchar(36) not null,
    primary key (id)
);

/*==============================================================*/
/* Table: couponCategory                                        */
/*==============================================================*/
create table couponCategory
(
    id                   varchar(36) not null,
    primary key (id)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
    id                   varchar(36) not null,
    name                 varchar(100),
    tags                 varchar(50),
    price                decimal(10,2),
    pid                  varchar(36),
    commentTotal         int default 0,
    score                decimal(2,1) default 0,
    createTime           timestamp default CURRENT_TIMESTAMP,
    updateTime           timestamp default CURRENT_TIMESTAMP,
    isdel                bit default 0 comment '0 未删除
            1 已删除 ',
    categoryPath         varchar(200),
    status               tinyint default 1 comment ' 1  未上架
            2 已上架
            3 已下架',
    primary key (id)
);

/*==============================================================*/
/* Table: goodscomment                                          */
/*==============================================================*/
create table goodscomment
(
    id                   varchar(36) not null,
    nickName             varchar(20),
    mid                  varchar(36),
    content              varchar(500),
    createTime           timestamp default CURRENT_TIMESTAMP,
    isAudit              bit default 0 comment '0 未审核
            1已审核 ',
    score                tinyint default 0,
    parentId             varchar(36) default '1' comment '1.默认情况下父id 是商品id
            2. 它也可以是评论id ',
    primary key (id)
);

/*==============================================================*/
/* Table: goodspic                                              */
/*==============================================================*/
create table goodspic
(
    id                   varchar(36) not null,
    gid                  varchar(36),
    picurl               varchar(200),
    miniUrl              varchar(200),
    uploadTime           timestamp,
    isdefault            bit default 0 comment '0 否
            1 是',
    primary key (id)
);

/*==============================================================*/
/* Table: member                                                */
/*==============================================================*/
create table member
(
    id                   varchar(36) not null,
    nickName             varchar(20),
    avatarUrl            varchar(200),
    gender               tinyint default 0 comment '0 未知道
            1 男
            2 女',
    country              varchar(20),
    province             varchar(30),
    city                 varchar(30),
    mobile               varchar(11),
    openid               varchar(30),
    createTime           timestamp default CURRENT_TIMESTAMP,
    updateTime           timestamp default CURRENT_TIMESTAMP,
    primary key (id)
);

/*==============================================================*/
/* Table: memberAddress                                         */
/*==============================================================*/
create table memberAddress
(
    id                   varchar(36) not null,
    mid                  varchar(36),
    province             varchar(20),
    city                 varchar(20),
    address              varchar(200),
    longitude            decimal(9,6),
    latitude             decimal(9,6),
    isdefault            bit default 0 comment '0 否
            1 是',
    isdel                bit default 0 comment '0 否
            1 是 ',
    createTime           timestamp default CURRENT_TIMESTAMP,
    updateTime           timestamp default CURRENT_TIMESTAMP,
    primary key (id)
);

/*==============================================================*/
/* Table: memberCoupon                                          */
/*==============================================================*/
create table memberCoupon
(
    id                   varchar(36)
);

/*==============================================================*/
/* Table: memberPickSite                                        */
/*==============================================================*/
create table memberPickSite
(
    id                   varchar(36) not null,
    mid                  varchar(36),
    psid                 varchar(36),
    primary key (id)
);

/*==============================================================*/
/* Table: menus                                                 */
/*==============================================================*/
create table menus
(
    id                   varchar(36)
);

/*==============================================================*/
/* Table: pickSite                                              */
/*==============================================================*/
create table pickSite
(
    id                   varchar(36),
    name                 varchar(20),
    province             varchar(20),
    city                 varchar(20),
    area                 varchar(10),
    address              varchar(200),
    longitude            decimal(9,6),
    latitude             decimal(9,6),
    photo                varchar(200),
    isHasBusinessLicense bit default 1 comment '0  没有
            1  有',
    url                  varchar(200),
    groupCount           tinyint,
    code                 varchar(10),
    mobile               varchar(11),
    auditTime            timestamp,
    isAudit              tinyint default 0 comment '0 未审核
            1 审核通过
            2 审核拒绝',
    status               tinyint default 0 comment '0 尚未营业
            1 正常营业
            2 暂停营业
            ',
    createTime           timestamp default CURRENT_TIMESTAMP,
    updateTime           timestamp default CURRENT_TIMESTAMP
);

/*==============================================================*/
/* Table: proivder                                              */
/*==============================================================*/
create table proivder
(
    id                   varchar(36) not null,
    provideGoods         varchar(200),
    area                 varchar(100),
    name                 varchar(30),
    contactName          varchar(10),
    mobile               varchar(11),
    other                varchar(50),
    isAudit              bit default 0 comment '0 未审核
            1 已审核 ',
    isdel                bit default 0 comment '0 未删除
            1已删除',
    createTime           timestamp default CURRENT_TIMESTAMP,
    updateTime           timestamp default CURRENT_TIMESTAMP,
    primary key (id)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
    id                   varchar(36)
);

/*==============================================================*/
/* Table: roleMenu                                              */
/*==============================================================*/
create table roleMenu
(
    id                   varchar(36)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
    id                   varchar(36) not null,
    username             varchar(50),
    password             varchar(50),
    name                 varchar(10),
    gender               tinyint default 0 comment '0未知
            1 男
            2女
            ',
    mobile               varchar(11),
    email                varchar(30),
    roleId               varchar(36),
    status               tinyint default 1 comment '1 正常
            2 锁定
            3 禁用
            。。。。',
    createTime           timestamp default CURRENT_TIMESTAMP,
    updateTime           timestamp default CURRENT_TIMESTAMP,
    isdel                bit default 0 comment '0 未删除
            1已删除',
    lastLoginTime        timestamp default CURRENT_TIMESTAMP,
    primary key (id)
);

