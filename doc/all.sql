# 电子书表
# drop table if exists `ebook`;
# create table `ebook`(
#     `id` bigint not null comment 'id',
#     `name` varchar(50) comment '名称',
#     `category1_id` bigint comment '分类1',
#     `category2_id` bigint comment '分类2',
#     `description` varchar(200) comment '描述',
#     `cover` varchar(200) comment '封面',
#     `doc_count` int comment '文档数',
#     `view_count` int comment '阅读数',
#     `vote_count` int comment '点赞数',
#     primary key (`id`)
# ) engine=innodb default charset=utf8mb4 comment='电子书';

#分类
# drop table if exists `category`;
# create table `category`(
#     `id` bigint not null comment 'id',
#     `parent` bigint not null default 0 comment '父id',
#     `name` varchar(50) not null comment '名称',
#     `sort` int comment '顺序',
#     primary key (`id`)
# )engine=innodb default charset=utf8mb4 comment='分类';

# #文档表
# drop table if exists `doc`;
# create table `doc` (
#     `id` bigint not null comment 'id',
#     `ebook-id` bigint not null default 0 comment '电子书id',
#     `parent` bigint not null default 0 comment '父id',
#     `name` varchar(50) not null comment '名称',
#     `sort` int comment '顺序',
#     `view_count` int default 0 comment '阅读量',
#     `vote_count` int default 0 comment '点赞数',
#     primary key (`id`)
# )engine=innodb default charset=utf8mb4 comment='文档';

#文档内容
# drop table if exists `content`;
# create table `content` (
#     `id` bigint not null comment '文档id',
#     `content` mediumtext not null comment '内容',
#     primary key (`id`)
# )engine=innodb default charset=utf8mb4 comment='文档内容';

#用户表
# drop table if exists `user`;
# create table `user` (
#     `id` bigint not null comment 'ID',
#     `login_name` varchar(50) not null comment '登录名',
#     `name` varchar(50) comment '昵称',
#     `password` char(32) not null comment '密码',
#     primary key (`id`),
#     unique key `login_name_unique` (`login_name`)
# )engine=innodb default charset=utf8mb4 comment='用户';

-- 电子书快照表
drop table if exists `ebook_snapshot`;
create table `ebook_snapshot`
(
    `id`            bigint auto_increment not null comment 'id',
    `ebook_id`      bigint                not null default 0 comment '电子书id',
    `date`          date                  not null comment '快照日期',
    `view_count`    int                   not null default 0 comment '阅读数',
    `vote_count`    int                   not null default 0 comment '点赞数',
    `view_increase` int                   not null default 0 comment '阅读增长',
    `vote_increase` int                   not null default 0 comment '点赞增长',
    primary key (`id`),
    unique key `ebook_id_date_unique` (`ebook_id`, `date`)
) engine = innodb
  default charset = utf8mb4 comment ='电子书快照表';