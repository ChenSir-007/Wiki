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

#文档表
drop table if exists `doc`;
create table `doc` (
    `id` bigint not null comment 'id',
    `ebook-id` bigint not null default 0 comment '电子书id',
    `parent` bigint not null default 0 comment '父id',
    `name` varchar(50) not null comment '名称',
    `sort` int comment '顺序',
    `view_count` int default 0 comment '阅读量',
    `vote_count` int default 0 comment '点赞数',
    primary key (`id`)
)engine=innodb default charset=utf8mb4 comment='文档';