drop table if exists `tb_user_stock`;

create table if not exists `tb_user_stock` (
    `id` integer primary key,
    `code` char(16) not null,
    `name` char(32) not null,
    `order` int not null,
    `deleted` boolean not null default false,
    `ctime` int not null,
    `dtime` int default null
);
