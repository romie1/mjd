-- set serveroutput on

insert into users values(users_id_seq.nextval, 'Mario Rossi', 'ciao');
insert into users values(users_id_seq.nextval, 'Giovanni Neri', 'ciao2');
insert into users values(users_id_seq.nextval, 'Davide Rossi', 'ciao3');


insert into orders values(orders_id_seq.nextval, sysdate, 4);
insert into orders values(orders_id_seq.nextval, sysdate, 5);
insert into orders values(orders_id_seq.nextval, sysdate, 6);

insert into products values(products_id_seq.nextval, 'book', 10.0);
insert into products values(products_id_seq.nextval, 'tv', 700.00);
insert into products values(products_id_seq.nextval, 'headphone', 100.00);

insert into order_details values(21, 10, 2,1);
insert into order_details values(32, 10, 3,2);
insert into order_details values(43, 10, 4,3);


select u.name_user, o.date_order, d.quantity, p.name, p.price 
from users U join orders O using(user_id) 
             join order_details D using(order_id) 
             join products P using (product_id)
where U.name_user = 'Mario Rossi';

select * from users U join orders O using(user_id) 
                    join order_details D using(order_id) 
                    join products P using (product_id);
                  
insert into products values(products_id_seq.nextval, 'cd', 25.00);
insert into orders values(orders_id_seq.nextval, sysdate, 4);
insert into order_details values(65, 1, 6,5);

insert into order_details values(33, 1, 3,3);
insert into order_details values(35, 10, 3,5);

insert into orders values(orders_id_seq.nextval, sysdate-1, 5);
insert into order_details values(75, 2, 7,5);
insert into order_details values(75, 1, 7,5);

commit;
 select u.name_user, o.date_order, p.name, d.quantity,  p.price,  d.quantity*p.price 
        from users U join orders O using(user_id) 
                     join order_details D using(order_id) 
                     join products P using(product_id)
        where order_id = 3;
        
-- STORED PROCEDURE
-- user_id -> dammi ordini e il totale
create or replace procedure get_total_orders(
        p_user_id in users.user_id%type)is
        cursor v_order_cursor is
        select u.name_user, o.date_order, p.name, d.quantity,  p.price,  d.quantity*p.price 
        from users U join orders O using(user_id) 
                     join order_details D using(order_id) 
                     join products P using(product_id)
        where user_id = p_user_id;
        v_total_order products.price%type;
begin
        for v_cur in v_order_cursor loop
        dbms_output.put_line(
        'Date order: ' || v_cur.date_order || ' - Name: ' || v_cur.name || 
        ' - Quantity: ' || v_cur.quantity|| ' - Price: ' || v_cur.price || ' - Total: ' || v_cur.quantity*v_cur.price);
        end loop;
        
        select sum(d.quantity*p.price)
        into v_total_order
        from users U join orders O using(user_id) 
                 join order_details D using(order_id) 
                 join products P using(product_id)
        where user_id = p_user_id;
        dbms_output.put_line('Big Total: ' || v_total_order);
end get_total_orders;
/

declare
    v_user_id users.user_id%type := '4'; 
    v_name_user users.name_user%type;
begin
    select name_user
    into v_name_user
    from users
    where user_id = v_user_id;
    dbms_output.put_line('User: ' || v_name_user);
    get_total_orders(v_user_id);
exception
    when others then
        dbms_output.put_line('Can''t get orders for user id ' || v_user_id);
end;
/

-- ordine_id -> dettagli ordine con prodotti e totale
create or replace procedure get_total_orders_2(
        p_order_id in orders.order_id%type)is
        cursor v_order_cursor is
        select u.name_user, o.date_order, p.name, d.quantity,  p.price
        from users U join orders O using(user_id) 
                     join order_details D using(order_id) 
                     join products P using(product_id)
        where order_id = p_order_id;
        v_total_order products.price%type;
begin
        for v_cur in v_order_cursor loop
        dbms_output.put_line(
        'Date order: ' || v_cur.date_order || ' - Name: ' || v_cur.name || 
        ' - Quantity: ' || v_cur.quantity|| ' - Price: ' || v_cur.price || ' - Total: ' || v_cur.quantity*v_cur.price);
        end loop;
        
        select sum(d.quantity*p.price)
        into v_total_order
        from users U join orders O using(user_id) 
                 join order_details D using(order_id) 
                 join products P using(product_id)
        where order_id = p_order_id;
        dbms_output.put_line('Big Total: ' || v_total_order);
end get_total_orders_2;
/
    
declare
    v_order_id orders.order_id%type := '3'; 
begin
    select order_id
    into v_order_id
    from orders
    where order_id = v_order_id;
    dbms_output.put_line('Order Id: ' || v_order_id);
    get_total_orders_2(v_order_id);
exception
    when others then
        dbms_output.put_line('Can''t get order with id ' || v_order_id);
end;
/    

-- procedure get_users()
-- param in product_id
-- put_line name_user che ha ordinato il prodotto
-- create or replace procedure get_users()
create or replace procedure get_users(
    p_product_id in products.product_id%type) is
    cursor v_users_cursors is
        select distinct name_user, SUM(quantity) OVER (partition by name_user) Total
        from users U join orders O using(user_id) 
                 join order_details D using(order_id) 
                 join products P using(product_id)
        where product_id = p_product_id;
    p_product_name products.name%type;
    p_total products.price%type := 0;
begin
    select name
    into p_product_name
    from  products 
    where product_id = p_product_id;          
    dbms_output.put_line('Users who bought product ' || p_product_name || ' are: ');
    
    for v_cur in v_users_cursors loop
        dbms_output.put_line(v_cur.name_user || ' - Quantity: ' || v_cur.Total);
    end loop;  
end get_users;
/

declare
    v_product_id products.product_id%type := '5'; 
begin
    get_users(v_product_id);
exception
    when others then
        dbms_output.put_line('Can''t get users for product with id ' || v_product_id);
end;
/   
 

select name_user, SUM(quantity) 
        from users U join orders O using(user_id) 
                 join order_details D using(order_id) 
                 join products P using(product_id)
                 where product_id = 5
group by name_user;

select name_user, d.order_details_id, d.quantity
        from users U join orders O using(user_id) 
                 join order_details D using(order_id) 
                 join products P using(product_id)
                 where product_id = 5;
