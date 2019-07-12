file -inlinebatch DROP_BATCH

drop table ORDERS if exists  cascade;

DROP_BATCH

file -inlinebatch CREATE_BATCH

create table ORDERS (
	order_id integer not null,
	asset_id integer not null,
	exchange varchar(10) not null,
	executed tinyint not null,
	recv_time timestamp not null,
	primary key(order_id)
);
partition table ORDERS on column order_id;

DR table ORDERS;

CREATE_BATCH

load classes procs.jar;

file -inlinebatch PROCS_BATCH

create procedure NEW_ORDER partition on table ORDERS column ORDER_ID as insert into orders values (?, ?, ?, ?, NOW);

PROCS_BATCH