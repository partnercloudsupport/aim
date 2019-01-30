create table if not exists tb_user_stock (
    id integer primary key,
    code char(16) not null,
    name char(32) not null,
    ctime int not null,
);
