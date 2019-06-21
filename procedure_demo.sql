-- mysql存储过程
CREATE
    [DEFINER = { user | CURRENT_USER }]
　PROCEDURE sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body

proc_parameter:
    [ IN | OUT | INOUT ] param_name type

characteristic:
    COMMENT 'string'
  | LANGUAGE SQL
  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }

routine_body:
　　Valid SQL routine statement

[begin_label:] BEGIN
　　[statement_list]
　　　　……
END [end_label]


create procedure my_sp_demo ()
    begin
    declare i int;
    set i = 0;
    while i < 20 do
        insert into t_good('good_no','name','type','num','create_time','status')
        values(concat('GD10000',i), concat('GDNAME10000',i), 1, i,NOW(),1);
        set i=i+1;
    end while;
    end;

-- 调用
call my_sp_demo();


create procedure delete_all_goods()
    begin
    delete from t_good;
    end;

create procedure get_good_name(in p varchar)
    begin
        select name from t_good where good_no = p;
    end;

--触发器
CREATE
    [DEFINER = { user | CURRENT_USER }]
TRIGGER trigger_name
trigger_time trigger_event
ON tbl_name FOR EACH ROW
　　[trigger_order]
trigger_body

trigger_time: { BEFORE | AFTER }

trigger_event: { INSERT | UPDATE | DELETE }

trigger_order: { FOLLOWS | PRECEDES } other_trigger_name

--trigger_time [BEFORE|AFTER] 表示是事件发生之前或是之后触发
--trigger_event:插入数据，更新数据，删除数据
-- for each row指的是任何一条记录在满足触发条件时都回触发该触发器
-- trigger_order:多个触发器的执行顺序

CREATE TRIGGER 触发器名 BEFORE|AFTER 触发事件 ON 表名 FOR EACH ROW 执行语句;


--视图
create view view_name as ...
-- 更新视图
create or replace view view_name as ...

--删除视图
drop view view_name;



