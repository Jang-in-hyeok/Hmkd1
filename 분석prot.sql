select * from purprod;
select * from prodcl;
select * from channel;
select * from membership;
select * from demo;
select * from compet;

drop table purprod0;
create table purprod0 as
select ���޻�, ��������ȣ, ��з��ڵ�, �ߺз��ڵ�, �Һз��ڵ�, ����ȣ, �����ڵ�, ��������, 
    substr(��������, 1, 4) as year_pur, substr(��������, 5, 2) as month_pur, ���Žð�, ���űݾ�
from purprod
order by ���޻�, ����ȣ;

select * from purprod0;

select sum(���űݾ�)
from purprod0;
select sum(������)
from purprod0;

--1.060566469	1.02302403	1.099409925	0.854675523
--1.028415938, 1.023806951, 1.092005222, 0.880950461
--0.239504654	0.24427764	0.228185959	0.288031748
--1.043821054	1.023425642	1.095597648	0.867959876
select 
     round((nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ������ end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ������ end), 0))/
     sum(���űݾ�), 9) as q1,
     round((nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ������ end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ������ end), 0))/
     sum(���űݾ�), 9) as q2,
     round((nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ������ end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ������ end), 0))/
     sum(���űݾ�), 9) as q3,
     round((nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ������ end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ������ end), 0))/
     sum(���űݾ�), 9) as q4     
from purprod0
order by ����ȣ;

select 
    (nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0)) as q1
from purprod0;

select
    (nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0))
     +(sum(���űݾ�)/4*
     (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0))/
     sum(���űݾ�))) as q1,
     (nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0))
     +(sum(���űݾ�)/4*
     (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0))/
     sum(���űݾ�))) as q2,
     (nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0))
     +(sum(���űݾ�)/4*
     (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0))/
     sum(���űݾ�))) as q3,
     (nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0))
     -(sum(���űݾ�)/4*
     (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0))/
     sum(���űݾ�))) as q4
     
from purprod0;


select 
     round(0.25 / ((nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0))/
     sum(���űݾ�)), 9) as q1,
     round(0.25 / ((nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0))/
     sum(���űݾ�)), 9) as q2,
     round(0.25 / ((nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0))/
     sum(���űݾ�)), 9) as q3,
     round(0.25 / ((nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0)+
     nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0))/
     sum(���űݾ�)), 9) as q4     
from purprod0
order by ����ȣ;


create table purprod0 as
select *
from purprod;

alter table purprod0
add(������ NUMBER(38));

alter table purprod0
drop column ������;

update purprod0 
set ������ = case
    when (year_pur = 2014 AND month_pur BETWEEN 01 AND 03) THEN round(���űݾ� * 1.01095526348798337298006670657258000073)
    when (year_pur = 2014 AND month_pur BETWEEN 04 AND 06) THEN round(���űݾ� * 1.00585641041640893800603876840975143483)
    when (year_pur = 2014 AND month_pur BETWEEN 07 AND 09) THEN round(���űݾ� * 1.02389941189179883653144287227632846787)
    when (year_pur = 2014 AND month_pur BETWEEN 10 AND 12) THEN round(���űݾ� * 0.9669899689858096086987385523431673501305)
    when (year_pur = 2015 AND month_pur BETWEEN 01 AND 03) THEN round(���űݾ� * 1.01095526348798337298006670657258000073)
    when (year_pur = 2015 AND month_pur BETWEEN 04 AND 06) THEN round(���űݾ� * 1.00585641041640893800603876840975143483)
    when (year_pur = 2015 AND month_pur BETWEEN 07 AND 09) THEN round(���űݾ� * 1.02389941189179883653144287227632846787)
    when (year_pur = 2015 AND month_pur BETWEEN 10 AND 12) THEN round(���űݾ� * 0.9669899689858096086987385523431673501305)
end
;

drop table purprod1;
create table purprod1 as
select ���޻�, ��������ȣ, ��з��ڵ�, �ߺз��ڵ�, �Һз��ڵ�, ����ȣ, �����ڵ�, ��������, 
    year_pur, month_pur, ���Žð�, ���űݾ�,
    case
        when (year_pur = 2014 AND month_pur BETWEEN 01 AND 03) THEN round(���űݾ� * 1.01095526348798337298006670657258000073)
        when (year_pur = 2014 AND month_pur BETWEEN 04 AND 06) THEN round(���űݾ� * 1.00585641041640893800603876840975143483)
        when (year_pur = 2014 AND month_pur BETWEEN 07 AND 09) THEN round(���űݾ� * 1.02389941189179883653144287227632846787)
        when (year_pur = 2014 AND month_pur BETWEEN 10 AND 12) THEN round(���űݾ� * 0.9669899689858096086987385523431673501305)
        when (year_pur = 2015 AND month_pur BETWEEN 01 AND 03) THEN round(���űݾ� * 1.01095526348798337298006670657258000073)
        when (year_pur = 2015 AND month_pur BETWEEN 04 AND 06) THEN round(���űݾ� * 1.00585641041640893800603876840975143483)
        when (year_pur = 2015 AND month_pur BETWEEN 07 AND 09) THEN round(���űݾ� * 1.02389941189179883653144287227632846787)
        when (year_pur = 2015 AND month_pur BETWEEN 10 AND 12) THEN round(���űݾ� * 0.9669899689858096086987385523431673501305)
    end as ������
from purprod0
order by ���޻�, ����ȣ;

select
    (nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0)) +
    (sum(���űݾ�) / 4 * 
    (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0)) /
    sum(���űݾ�))) as q1,
    
    (nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0)) +
    (sum(���űݾ�) / 4 * 
    (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0)) /
    sum(���űݾ�))) as q2,
    
    (nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0)) +
    (sum(���űݾ�) / 4 * 
    (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0)) /
    sum(���űݾ�))) as q3,
    
    (nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0)) +
    (sum(���űݾ�) / 4 * 
    (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0)) /
    sum(���űݾ�))) as q4
from purprod0;

--163925626332.3125	166349178499.0625	158178396551.5625	188565955558.0625

--1.01095526348798337298006670657258000073	
--1.00585641041640893800603876840975143483	
--1.02389941189179883653144287227632846787	
--0.9669899689858096086987385523431673501305
select
    ((nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0)) +
    (sum(���űݾ�) / 4 * 
    (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0)) /
    sum(���űݾ�)))) / 
    (nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0)) as q1,
    
    ((nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0)) +
    (sum(���űݾ�) / 4 * 
    (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0)) /
    sum(���űݾ�)))) / 
    (nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0)) as q2,
    
    ((nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0)) +
    (sum(���űݾ�) / 4 * 
    (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0)) /
    sum(���űݾ�)))) / 
    (nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0)) as q3,
    
    ((nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0)) +
    (sum(���űݾ�) / 4 * 
    (0.25 - (nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0)) /
    sum(���űݾ�)))) / 
    (nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0) +
    nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0)) as q4 
from purprod0;


select * from purprod0;

--14�⵵ 15�⵵ �Ѹ���
select sum(case when year_pur = 2014 then ���űݾ� end) as �ѱݾ�14,
    sum(case when year_pur = 2015 then ���űݾ� end)as �ѱݾ�15
from purprod0;

-- 14�⵵ ���� 15�⵵ ������ ���� �б� �����--
--14 15 �б⺰ �ѱݾ�
with �б�14 as(
select ����ȣ,
    nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0) as q1,
    nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0) as q2,
    nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0) as q3,
    nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0) as q4
from purprod0
group by ����ȣ
order by ����ȣ
),
�б�15 as(
select ����ȣ,
     nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0) as q5,
     nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0) as q6,
     nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0) as q7,
     nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0) as q8
from purprod0
group by ����ȣ
order by ����ȣ
)
select q14.����ȣ, 
    q14.q1, 
    q14.q2, 
    q14.q3, 
    q14.q4, 
    q15.q5, 
    q15.q6, 
    q15.q7,
    q15.q8
    
from �б�14 q14
join �б�15 q15 on q14.����ȣ = q15.����ȣ;

--14�⵵ ���� 15�⵵ �� ���� �б� ����� ����--
--14
drop table cus_q_14;
create table cus_q_14 as
select ����ȣ,
    nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ������ end), 0) as q1,
    nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ������ end), 0) as q2,
    nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ������ end), 0) as q3,
    nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ������ end), 0) as q4
from purprod0
group by ����ȣ
order by ����ȣ;

select * from cus_q_14;

--15
drop table cus_q_15;
create table cus_q_15 as
select ����ȣ,
     nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ������ end), 0) as q5,
     nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ������ end), 0) as q6,
     nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ������ end), 0) as q7,
     nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ������ end), 0) as q8
from purprod0
group by ����ȣ
order by ����ȣ;

select * from cus_q_15;

select c14.*, q5, q6, q7, q8 
from cus_q_14 c14
join cus_q_15 c15 on c14.����ȣ = c15.����ȣ
where q1 = 0 or q2 = 0 or q3 = 0 or q4= 0 or q5 = 0 or q6 = 0 or q7 = 0 or q8= 0;

--14 15����
drop table cus_q_diff;
create table cus_q_diff as
select q14.����ȣ, 
    q14.q2-q14.q1 AS q2_diff, 
    q14.q3-q14.q2 AS q3_diff, 
    q14.q4-q14.q3 AS q4_diff, 
    q15.q5-q14.q4 AS q5_diff, 
    q15.q6-q15.q5 AS q6_diff, 
    q15.q7-q15.q6 AS q7_diff, 
    q15.q8-q15.q7 AS q8_diff,
    (q14.q2-q14.q1) + (q14.q3-q14.q2) + (q14.q4-q14.q3) + (q15.q5-q14.q4) + 
    (q15.q6-q15.q5) + (q15.q7-q15.q6) + (q15.q8-q15.q7) as ����������,
    (case when((q14.q2-q14.q1) + (q14.q3-q14.q2) + (q14.q4-q14.q3) + (q15.q5-q14.q4) + 
    (q15.q6-q15.q5) + (q15.q7-q15.q6) + (q15.q8-q15.q7)) < 0 then 1 else 0 end) as ���Ű��ҿ���
from cus_q_14 q14
join cus_q_15 q15 on q14.����ȣ = q15.����ȣ;

with �б�14 as(
select ����ȣ,
    nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then ���űݾ� end), 0) as q1,
    nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then ���űݾ� end), 0) as q2,
    nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then ���űݾ� end), 0) as q3,
    nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then ���űݾ� end), 0) as q4
from purprod0
group by ����ȣ
order by ����ȣ
),
�б�15 as(
select ����ȣ,
     nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then ���űݾ� end), 0) as q5,
     nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then ���űݾ� end), 0) as q6,
     nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then ���űݾ� end), 0) as q7,
     nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then ���űݾ� end), 0) as q8
from purprod0
group by ����ȣ
order by ����ȣ
)
select q14.����ȣ, 
    q14.q2-q14.q1 AS q2_diff, 
    q14.q3-q14.q2 AS q3_diff, 
    q14.q4-q14.q3 AS q4_diff, 
    q15.q5-q14.q4 AS q5_diff, 
    q15.q6-q15.q5 AS q6_diff, 
    q15.q7-q15.q6 AS q7_diff, 
    q15.q8-q15.q7 AS q8_diff,
    (q14.q2-q14.q1) + (q14.q3-q14.q2) + (q14.q4-q14.q3) + (q15.q5-q14.q4) + 
    (q15.q6-q15.q5) + (q15.q7-q15.q6) + (q15.q8-q15.q7) as ����������,
    (case when((q14.q2-q14.q1) + (q14.q3-q14.q2) + (q14.q4-q14.q3) + (q15.q5-q14.q4) + 
    (q15.q6-q15.q5) + (q15.q7-q15.q6) + (q15.q8-q15.q7)) < 0 then 1 else 0 end) as ���Ű��ҿ���
from �б�14 q14
full join �б�15 q15 on q14.����ȣ = q15.����ȣ;

select * from cus_q_14;
select * from cus_q_15;
select * from cus_q_diff;
select * from purprod0;

--���Ű��Ұ��� ������������ �ο����� �ݾ�
drop table updown;
create table updown as
select count(case when ���Ű��ҿ��� = 1 then ����ȣ end) as ���Ű��Ұ�,
    count(case when ���Ű��ҿ��� = 0 then ����ȣ end) as ����������,
    nvl(sum(case when ���Ű��ҿ��� = 1 then -���������� end), 0) as ���Ű��ұݾ�,
    nvl(sum(case when ���Ű��ҿ��� = 0 then ���������� end), 0) as ���������ݾ�,
    round(nvl(sum(case when ���Ű��ҿ��� = 1 then -���������� end), 0) /
    nvl(sum(case when ���Ű��ҿ��� = 0 then ���������� end), 0), 4) * 100 as �ۼ�Ʈ
from cus_q_diff;

select * from updown;

-- �ִ밪, �ּҰ�
SELECT
  MAX(CASE WHEN ���Ű��ҿ��� = 0 THEN ���������� END) AS ���_�ִ밪,
  MIN(CASE WHEN ���Ű��ҿ��� = 0 THEN ���������� END) AS ���_�ּҰ�,
  MAX(CASE WHEN ���Ű��ҿ��� = 1 THEN ���������� END) AS �϶�_�ִ밪,
  MIN(CASE WHEN ���Ű��ҿ��� = 1 THEN ���������� END) AS �϶�_�ּҰ�  
FROM cus_q_diff;

�������
--drop table lowrank;
--create table lowrank as
--select ����ȣ, 
--    nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) as ���Ű��ұݾ�,
--    CASE
--      WHEN nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) <= -(SELECT SUM(����������) FROM cus_q_diff where ���Ű��ҿ��� = 1) * (4/5) THEN 1
--      WHEN nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) <= -(SELECT SUM(����������) FROM cus_q_diff where ���Ű��ҿ��� = 1) * (3/5) THEN 2
--      WHEN nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) <= -(SELECT SUM(����������) FROM cus_q_diff where ���Ű��ҿ��� = 1) * (2/5) THEN 3
--      WHEN nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) <= -(SELECT SUM(����������) FROM cus_q_diff where ���Ű��ҿ��� = 1) * (1/5) THEN 4
--      ELSE 5
--    END as �������
--from cus_q_diff
--where nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) <> 0
--order by �������;

--drop table lowrank;
--create table lowrank as
--select ����ȣ, 
--    nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) as ���Ű��ұݾ�,
--    ntile(10) over (order by ����������) as �������
--from cus_q_diff
--where nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) <> 0
--order by ����ȣ;

--drop table uprank;
--create table uprank as
--select ����ȣ, 
--    nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) as ���������ݾ�,
--    CASE
--      WHEN nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) >= 100000000 THEN 1
--      WHEN nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) >= 50000000 THEN 2
--      WHEN nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) >= 10000000 THEN 3
--      WHEN nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) >= 5000000 THEN 4
--      ELSE 5
--    END as �������
--from cus_q_diff
--where nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) <> 0
--order by ����ȣ;

--drop table uprank;
--create table uprank as
--select ����ȣ, 
--    nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) as ���������ݾ�,
--    ntile(10) over (order by ���������� desc) as �������
--from cus_q_diff
--where nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) <> 0
--order by ����ȣ;

--select * 
--from lowrank
--order by ���Ű��ұݾ�;
--
--select * from uprank;
--
--��� ����
drop table lowdata;
create table lowdata as
select
    count(case when ������� = 1 then ����ȣ end) as ���1�ο�,
    count(case when ������� = 2 then ����ȣ end) as ���2�ο�,
    count(case when ������� = 3 then ����ȣ end) as ���3�ο�,
    count(case when ������� = 4 then ����ȣ end) as ���4�ο�,
    count(case when ������� = 5 then ����ȣ end) as ���5�ο�,
    sum(case when ������� = 1 then -���Ű��ұݾ� end) as ���1,
    sum(case when ������� = 2 then -���Ű��ұݾ� end) as ���2,
    sum(case when ������� = 3 then -���Ű��ұݾ� end) as ���3,
    sum(case when ������� = 4 then -���Ű��ұݾ� end) as ���4,
    sum(case when ������� = 5 then -���Ű��ұݾ� end) as ���5,
    round(sum(case when ������� = 1 then ���Ű��ұݾ� end) / sum(���Ű��ұݾ�), 4) * 100 as �ۼ�Ʈ1���,
    round(sum(case when ������� = 2 then ���Ű��ұݾ� end) / sum(���Ű��ұݾ�), 4) * 100 as �ۼ�Ʈ2���,
    round(sum(case when ������� = 3 then ���Ű��ұݾ� end) / sum(���Ű��ұݾ�), 4) * 100 as �ۼ�Ʈ3���,
    round(sum(case when ������� = 4 then ���Ű��ұݾ� end) / sum(���Ű��ұݾ�), 4) * 100 as �ۼ�Ʈ4���,
    round(sum(case when ������� = 5 then ���Ű��ұݾ� end) / sum(���Ű��ұݾ�), 4) * 100 as �ۼ�Ʈ5���,
    -round(sum(case when ������� = 1 then ���Ű��ұݾ� end) / count(case when ������� = 1 then ����ȣ end), 2) as �δ����1���,
    -round(sum(case when ������� = 2 then ���Ű��ұݾ� end) / count(case when ������� = 2 then ����ȣ end), 2) as �δ����2���,
    -round(sum(case when ������� = 3 then ���Ű��ұݾ� end) / count(case when ������� = 3 then ����ȣ end), 2) as �δ����3���,
    -round(sum(case when ������� = 4 then ���Ű��ұݾ� end) / count(case when ������� = 4 then ����ȣ end), 2) as �δ����4���,
    -round(sum(case when ������� = 5 then ���Ű��ұݾ� end) / count(case when ������� = 5 then ����ȣ end), 2) as �δ����5���
from lowrank
;

drop table updata;
create table updata as
select
    count(case when ������� = 1 then ����ȣ end) as ���1�ο�,
    count(case when ������� = 2 then ����ȣ end) as ���2�ο�,
    count(case when ������� = 3 then ����ȣ end) as ���3�ο�,
    count(case when ������� = 4 then ����ȣ end) as ���4�ο�,
    count(case when ������� = 5 then ����ȣ end) as ���5�ο�,
    sum(case when ������� = 1 then ���������ݾ� end) as ���1,
    sum(case when ������� = 2 then ���������ݾ� end) as ���2,
    sum(case when ������� = 3 then ���������ݾ� end) as ���3,
    sum(case when ������� = 4 then ���������ݾ� end) as ���4,
    sum(case when ������� = 5 then ���������ݾ� end) as ���5,
    round(sum(case when ������� = 1 then ���������ݾ� end) / sum(���������ݾ�), 4) * 100 as �ۼ�Ʈ1���,
    round(sum(case when ������� = 2 then ���������ݾ� end) / sum(���������ݾ�), 4) * 100 as �ۼ�Ʈ2���,
    round(sum(case when ������� = 3 then ���������ݾ� end) / sum(���������ݾ�), 4) * 100 as �ۼ�Ʈ3���,
    round(sum(case when ������� = 4 then ���������ݾ� end) / sum(���������ݾ�), 4) * 100 as �ۼ�Ʈ4���,
    round(sum(case when ������� = 5 then ���������ݾ� end) / sum(���������ݾ�), 4) * 100 as �ۼ�Ʈ5���,
    round(sum(case when ������� = 1 then ���������ݾ� end) / count(case when ������� = 1 then ����ȣ end), 2) as �δ����1���,
    round(sum(case when ������� = 2 then ���������ݾ� end) / count(case when ������� = 2 then ����ȣ end), 2) as �δ����2���,
    round(sum(case when ������� = 3 then ���������ݾ� end) / count(case when ������� = 3 then ����ȣ end), 2) as �δ����3���,
    round(sum(case when ������� = 4 then ���������ݾ� end) / count(case when ������� = 4 then ����ȣ end), 2) as �δ����4���,
    round(sum(case when ������� = 5 then ���������ݾ� end) / count(case when ������� = 5 then ����ȣ end), 2) as �δ����5���
from uprank
;

select * from lowdata;
select * from updata;
--
--select ����ȣ, ���Ű��ұݾ�, �������
--from lowrank
--order by ���Ű��ұݾ�;
--
--select ����ȣ, ���������ݾ�, �������
--from uprank
--order by ���������ݾ� desc;

--���Ű��ұݾ��� ���⿵��
drop table purprod1;
create table purprod1 as
select ����ȣ, sum(������) as �ѱݾ�
from purprod0
group by ����ȣ;

select * from purprod1;

select 
    sum(case when l.������� = 1 then -l.���Ű��ұݾ� end) +
    sum(case when l.������� = 2 then -l.���Ű��ұݾ� end) as ������ް��ұݾ�,
    sum(case when u.������� = 1 then u.���������ݾ� end) +
    sum(case when u.������� = 2 then u.���������ݾ� end) as ������������ݾ�,
    nvl(sum(case when c.���Ű��ҿ��� = 1 then -c.���������� end), 0) as ���Ű��ұݾ�,
    nvl(sum(case when c.���Ű��ҿ��� = 0 then c.���������� end), 0) as ���������ݾ�,
    sum(pu.�ѱݾ�) as �ѱݾ�,
    round((sum(case when l.������� = 1 then -l.���Ű��ұݾ� end) +
    sum(case when l.������� = 2 then -l.���Ű��ұݾ� end)) /
    sum(pu.�ѱݾ�), 4) * 100 as ������޸��⿵��1,
    round((sum(case when u.������� = 1 then u.���������ݾ� end) +
    sum(case when u.������� = 2 then u.���������ݾ� end)) /
    sum(pu.�ѱݾ�), 4) * 100 as ������޸��⿵��2,
    round(nvl(sum(case when c.���Ű��ҿ��� = 1 then -c.���������� end), 0) /
    sum(pu.�ѱݾ�), 4) * 100  as ���⿵��1,
    round(nvl(sum(case when c.���Ű��ҿ��� = 0 then c.���������� end), 0) /
    sum(pu.�ѱݾ�), 4) * 100  as ���⿵��2
from cus_q_diff c
full join purprod1 pu on c.����ȣ = pu.����ȣ
full join lowrank l on c.����ȣ = l.����ȣ
full join uprank u on c.����ȣ = u.����ȣ;


--���
with 
    cus_sale as(
    select ����ȣ, 
        nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) as ����������, 
        row_number() over (order by nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0)) as ����
    from cus_q_diff
    where nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) <> 0
    ),
    
    cum_sale as(
    select ����ȣ, ����������,
        sum(����������) over (order by ����) as ������
    from cus_sale
    ),
    
    total as (
    select
        (sum(nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0)) / 5) as ����
    from cus_q_diff
    ),
    
    rank0 as (
    select 
        ����ȣ,
        ����������,
        ������,
        case
         when ������ >= ���� then 1
         else floor((������ - ����) / ����) + 2
        end as rank0
    from total, cum_sale
)

select
    ����ȣ, ����������, ������, rank0
from rank0;

drop table low_cus_sale;
create table low_cus_sale as
select ����ȣ, 
    nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) as ���Ű��ұݾ�, 
    row_number() over (order by nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0)) as ����
from cus_q_diff
where nvl((case when ���Ű��ҿ��� = 1 then ���������� end), 0) <> 0;

drop table up_cus_sale;
create table up_cus_sale as
select ����ȣ, 
    nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) as ���������ݾ�, 
    row_number() over (order by nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) desc) as ����
from cus_q_diff
where nvl((case when ���Ű��ҿ��� = 0 then ���������� end), 0) <> 0;

select * from low_cus_sale;
select * from up_cus_sale;

drop table lowrank;
create table lowrank as
select ����ȣ, ���Ű��ұݾ�,
    sum(���Ű��ұݾ�) over (order by ����) as ������,
    case
        when sum(���Ű��ұݾ�) over (order by ����) >= (select sum(���Ű��ұݾ�) from low_cus_sale) / 5 then 1
        else floor(((sum(���Ű��ұݾ�) over (order by ����)) - ((select sum(���Ű��ұݾ�) from low_cus_sale) / 5)) / 
        ((select sum(���Ű��ұݾ�) from low_cus_sale) / 5)) + 2
    end as �������
from low_cus_sale;

drop table uprank;
create table uprank as
select ����ȣ, ���������ݾ�,
    sum(���������ݾ�) over (order by ����) as ������,
    case
        when sum(���������ݾ�) over (order by ����) <= (select sum(���������ݾ�) from up_cus_sale) / 5 then 1
        else floor(((sum(���������ݾ�) over (order by ����)) - ((select sum(���������ݾ�) from up_cus_sale) / 5)) / 
        ((select sum(���������ݾ�) from up_cus_sale) / 5)) + 2
    end as �������
from up_cus_sale;

select * from lowrank;
select * from uprank;
select * from lowdata;
select * from updata;

--b2b
select pu.*, p.�ߺз���, p.�Һз���
from purprod0 pu
join prodcl p on pu.���޻� = p.���޻� and pu.�ߺз��ڵ� = p.�ߺз��ڵ� and pu.�Һз��ڵ� = p.�Һз��ڵ�
;

select *
from purprod0
where ����ȣ = 07957
order by ��������;

select ����ȣ, year_pur, month_pur, count(����ȣ), ���űݾ�
from purprod0
where �Һз��ڵ� = 'A010101'
group by ����ȣ, year_pur, month_pur, ���űݾ�;

create table com_a as
select pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���, 
    sum(pu.���űݾ�) as �հ�, round(avg(pu.���űݾ�)) as ���
from purprod0 pu
join prodcl p on pu.���޻� = p.���޻� and pu.�ߺз��ڵ� = p.�ߺз��ڵ� and pu.�Һз��ڵ� = p.�Һз��ڵ�
group by pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���
order by pu.���޻�, pu.�ߺз��ڵ�, pu.�Һз��ڵ�;

drop table com_a;
create table com_a as
select pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���, 
    sum(pu.���űݾ�) as �հ�, round(avg(pu.���űݾ�)) as ���
from purprod0 pu
join prodcl p on pu.���޻� = p.���޻� and pu.�ߺз��ڵ� = p.�ߺз��ڵ� and pu.�Һз��ڵ� = p.�Һз��ڵ�
where pu.���޻� = 'A'
group by pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���
order by pu.���޻�, pu.�ߺз��ڵ�, pu.�Һз��ڵ�;

drop table com_b;
create table com_b as
select pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���, 
    sum(pu.���űݾ�) as �հ�, round(avg(pu.���űݾ�)) as ���
from purprod0 pu
join prodcl p on pu.���޻� = p.���޻� and pu.�ߺз��ڵ� = p.�ߺз��ڵ� and pu.�Һз��ڵ� = p.�Һз��ڵ�
where pu.���޻� = 'B'
group by pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���
order by pu.���޻�, pu.�ߺз��ڵ�, pu.�Һз��ڵ�;

drop table com_c;
create table com_c as
select pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���, 
    sum(pu.���űݾ�) as �հ�, round(avg(pu.���űݾ�)) as ���
from purprod0 pu
join prodcl p on pu.���޻� = p.���޻� and pu.�ߺз��ڵ� = p.�ߺз��ڵ� and pu.�Һз��ڵ� = p.�Һз��ڵ�
where pu.���޻� = 'C'
group by pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���
order by pu.���޻�, pu.�ߺз��ڵ�, pu.�Һз��ڵ�;

drop table com_d;
create table com_d as
select pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���, 
    sum(pu.���űݾ�) as �հ�, round(avg(pu.���űݾ�)) as ���
from purprod0 pu
join prodcl p on pu.���޻� = p.���޻� and pu.�ߺз��ڵ� = p.�ߺз��ڵ� and pu.�Һз��ڵ� = p.�Һз��ڵ�
where pu.���޻� = 'D'
group by pu.���޻�, pu.�ߺз��ڵ�, p.�ߺз���, pu.�Һз��ڵ�, p.�Һз���
order by pu.���޻�, pu.�ߺз��ڵ�, pu.�Һз��ڵ�;

select * from com_a;
select * from com_b;
select * from com_c;
select * from com_d;

select �ߺз���, count(�ߺз���)
from com_b
group by �ߺз���
order by �ߺз���;

drop table total_code;
create table total_code as
select a.���޻� as ���޻�a, a.�ߺз��ڵ� as �ߺз��ڵ�a, a.�ߺз��� as �ߺз���a, a.�Һз��ڵ� as �Һз��ڵ�a, a.�Һз��� as �Һз���a,
    b.���޻� as ���޻�b, b.�ߺз��ڵ� as �ߺз��ڵ�b, b.�ߺз��� as �ߺз���b, b.�Һз��ڵ� as �Һз��ڵ�b, b.�Һз��� as �Һз���b,
    c.���޻� as ���޻�c, c.�ߺз��ڵ� as �ߺз��ڵ�c, c.�ߺз��� as �ߺз���c, c.�Һз��ڵ� as �Һз��ڵ�c, c.�Һз��� as �Һз���c,
    d.���޻� as ���޻�d, d.�ߺз��ڵ� as �ߺз��ڵ�d, d.�ߺз��� as �ߺз���d, d.�Һз��ڵ� as �Һз��ڵ�d, d.�Һз��� as �Һз���d
from com_a a
full outer join com_b b on a.�Һз��� = b.�Һз���
full outer join com_c c on a.�Һз��� = c.�Һз���
full outer join com_d d on a.�Һз��� = d.�Һз���
order by a.���޻�, a.�ߺз��ڵ�;

    
select pu.����ȣ, p.�ߺз��ڵ�, p.�ߺз���, p.�Һз��ڵ�, p.�Һз���,
    count(case when (year_pur = 2014 and month_pur between 01 and 03) then p.�Һз��ڵ� end) as q1_14,
    count(case when (year_pur = 2014 and month_pur between 04 and 06) then p.�Һз��ڵ� end) as q2_14,
    count(case when (year_pur = 2014 and month_pur between 07 and 09) then p.�Һз��ڵ� end) as q3_14,
    count(case when (year_pur = 2014 and month_pur between 10 and 12) then p.�Һз��ڵ� end) as q4_14,
    count(case when (year_pur = 2015 and month_pur between 01 and 03) then p.�Һз��ڵ� end) as q1_15,
    count(case when (year_pur = 2015 and month_pur between 04 and 06) then p.�Һз��ڵ� end) as q2_15,
    count(case when (year_pur = 2015 and month_pur between 07 and 09) then p.�Һз��ڵ� end) as q3_15,
    count(case when (year_pur = 2015 and month_pur between 10 and 12) then p.�Һз��ڵ� end) as q4_15,
    nvl(sum(pu.���űݾ�), 0), round(nvl(avg(pu.���űݾ�), 0), 2)
from purprod0 pu
join prodcl p on pu.���޻� = p.���޻� and pu.�ߺз��ڵ� = p.�ߺз��ڵ� and pu.�Һз��ڵ� = p.�Һз��ڵ�
group by pu.����ȣ, p.�ߺз��ڵ�, p.�ߺз���, p.�Һз��ڵ�, p.�Һз���
having 
    count(case when (year_pur = 2014 and month_pur between 01 and 03) then p.�Һз��ڵ� end) >= 30 or
    count(case when (year_pur = 2014 and month_pur between 04 and 06) then p.�Һз��ڵ� end) >= 30 or
    count(case when (year_pur = 2014 and month_pur between 07 and 09) then p.�Һз��ڵ� end) >= 30 or
    count(case when (year_pur = 2014 and month_pur between 10 and 12) then p.�Һз��ڵ� end) >= 30 or
    count(case when (year_pur = 2015 and month_pur between 01 and 03) then p.�Һз��ڵ� end) >= 30 or
    count(case when (year_pur = 2015 and month_pur between 04 and 06) then p.�Һз��ڵ� end) >= 30 or
    count(case when (year_pur = 2015 and month_pur between 07 and 09) then p.�Һз��ڵ� end) >= 30 or
    count(case when (year_pur = 2015 and month_pur between 10 and 12) then p.�Һз��ڵ� end) >= 30
order by nvl(sum(pu.���űݾ�), 0) desc, pu.����ȣ, p.�ߺз��ڵ�;

--���ӱ��� 
--19383��(677019156941), 18866(668,434,841,645) : 517(8584610682), 
--517 = 141(3258138612):73(1082825324):44(1562024708):14(51392240):14(264667484):8(72482159):3(831759):0 
--> 297(6292362286) : 220(2292248396)
select
    pu.����ȣ,
    count(case when (year_pur = 2014 and month_pur between 01 and 03) then p.�Һз��ڵ� end) as q1_14,
    count(case when (year_pur = 2014 and month_pur between 04 and 06) then p.�Һз��ڵ� end) as q2_14,
    count(case when (year_pur = 2014 and month_pur between 07 and 09) then p.�Һз��ڵ� end) as q3_14,
    count(case when (year_pur = 2014 and month_pur between 10 and 12) then p.�Һз��ڵ� end) as q4_14,
    count(case when (year_pur = 2015 and month_pur between 01 and 03) then p.�Һз��ڵ� end) as q1_15,
    count(case when (year_pur = 2015 and month_pur between 04 and 06) then p.�Һз��ڵ� end) as q2_15,
    count(case when (year_pur = 2015 and month_pur between 07 and 09) then p.�Һз��ڵ� end) as q3_15,
    count(case when (year_pur = 2015 and month_pur between 10 and 12) then p.�Һз��ڵ� end) as q4_15,
    sum(pu.������)
from purprod0 pu
join prodcl p on pu.���޻� = p.���޻� and pu.�ߺз��ڵ� = p.�ߺз��ڵ� and pu.�Һз��ڵ� = p.�Һз��ڵ�
group by pu.����ȣ
having 
    count(case when (year_pur = 2014 and month_pur between 01 and 03) then p.�Һз��ڵ� end) = 0 or
    count(case when (year_pur = 2014 and month_pur between 04 and 06) then p.�Һз��ڵ� end) = 0 or
    count(case when (year_pur = 2014 and month_pur between 07 and 09) then p.�Һз��ڵ� end) = 0 or
    count(case when (year_pur = 2014 and month_pur between 10 and 12) then p.�Һз��ڵ� end) = 0 or
    count(case when (year_pur = 2015 and month_pur between 01 and 03) then p.�Һз��ڵ� end) = 0 or
    count(case when (year_pur = 2015 and month_pur between 04 and 06) then p.�Һз��ڵ� end) = 0 or
    count(case when (year_pur = 2015 and month_pur between 07 and 09) then p.�Һз��ڵ� end) = 0 or
    count(case when (year_pur = 2015 and month_pur between 10 and 12) then p.�Һз��ڵ� end) = 0 
order by sum(pu.������) desc;

--
select ����ȣ, min(��������), max(��������)
from purprod0
group by ����ȣ
order by ����ȣ;

--
select ����ȣ, �ߺз��ڵ�, �Һз��ڵ�, round(avg(������)) as p_avg 
from purprod0 
group by ����ȣ, �ߺз��ڵ�, �Һз��ڵ� 
order by ����ȣ, round(avg(������)) desc;

drop table b2b_prot0;
create table b2b_prot0 as
select pu.����ȣ, pu.�ߺз��ڵ�, pu.�Һз��ڵ�, p.�Һз���, 
    count(case when (year_pur = 2014 and month_pur between 01 and 03) then pu.����ȣ end) as q14_1,
    count(case when (year_pur = 2014 and month_pur between 04 and 06) then pu.����ȣ end) as q14_2,
    count(case when (year_pur = 2014 and month_pur between 07 and 09) then pu.����ȣ end) as q14_3,
    count(case when (year_pur = 2014 and month_pur between 10 and 12) then pu.����ȣ end) as q14_4,
    count(case when (year_pur = 2015 and month_pur between 01 and 03) then pu.����ȣ end) as q15_1,
    count(case when (year_pur = 2015 and month_pur between 04 and 06) then pu.����ȣ end) as q15_2,
    count(case when (year_pur = 2015 and month_pur between 07 and 09) then pu.����ȣ end) as q15_3,
    count(case when (year_pur = 2015 and month_pur between 10 and 12) then pu.����ȣ end) as q15_4,
    
    nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then pu.������ end), 0) as q14_1p,
    nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then pu.������ end), 0) as q14_2p,
    nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then pu.������ end), 0) as q14_3p,
    nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then pu.������ end), 0) as q14_4p,
    nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then pu.������ end), 0) as q15_1p,
    nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then pu.������ end), 0) as q15_2p,
    nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then pu.������ end), 0) as q15_3p,
    nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then pu.������ end), 0) as q15_4p,
    sum(pu.������) as �ѱ��ž�,
    round(avg(pu.������)) as ��ձݾ�,
    ROW_NUMBER() OVER (PARTITION BY pu.����ȣ ORDER BY sum(pu.������) desc) AS row_num
from purprod0 pu
join prodcl p on pu.���޻� = p.���޻� and pu.�ߺз��ڵ� = p.�ߺз��ڵ� and pu.�Һз��ڵ� = p.�Һз��ڵ�
group by pu.����ȣ, p.�ߺз���, p.�Һз���, pu.�ߺз��ڵ�, pu.�Һз��ڵ�
having round(avg(pu.������)) * 2 < sum(pu.������)
order by pu.����ȣ, sum(pu.������) desc;

drop table b2b_prot1;
create table b2b_prot1 as
select pu.����ȣ, pu.�Һз��ڵ�, t.�����ڵ�, t.���Ǻз���, t.�Һ���, t.�Һз���, 
    count(case when (year_pur = 2014 and month_pur between 01 and 03) then pu.����ȣ end) as q14_1,
    count(case when (year_pur = 2014 and month_pur between 04 and 06) then pu.����ȣ end) as q14_2,
    count(case when (year_pur = 2014 and month_pur between 07 and 09) then pu.����ȣ end) as q14_3,
    count(case when (year_pur = 2014 and month_pur between 10 and 12) then pu.����ȣ end) as q14_4,
    count(case when (year_pur = 2015 and month_pur between 01 and 03) then pu.����ȣ end) as q15_1,
    count(case when (year_pur = 2015 and month_pur between 04 and 06) then pu.����ȣ end) as q15_2,
    count(case when (year_pur = 2015 and month_pur between 07 and 09) then pu.����ȣ end) as q15_3,
    count(case when (year_pur = 2015 and month_pur between 10 and 12) then pu.����ȣ end) as q15_4,
    
    nvl(sum(case when (year_pur = 2014 and month_pur between 01 and 03) then pu.������ end), 0) as q14_1p,
    nvl(sum(case when (year_pur = 2014 and month_pur between 04 and 06) then pu.������ end), 0) as q14_2p,
    nvl(sum(case when (year_pur = 2014 and month_pur between 07 and 09) then pu.������ end), 0) as q14_3p,
    nvl(sum(case when (year_pur = 2014 and month_pur between 10 and 12) then pu.������ end), 0) as q14_4p,
    nvl(sum(case when (year_pur = 2015 and month_pur between 01 and 03) then pu.������ end), 0) as q15_1p,
    nvl(sum(case when (year_pur = 2015 and month_pur between 04 and 06) then pu.������ end), 0) as q15_2p,
    nvl(sum(case when (year_pur = 2015 and month_pur between 07 and 09) then pu.������ end), 0) as q15_3p,
    nvl(sum(case when (year_pur = 2015 and month_pur between 10 and 12) then pu.������ end), 0) as q15_4p,
    sum(pu.������) as �ѱ��ž�,
    round(avg(pu.������)) as ��ձݾ�,
    ROW_NUMBER() OVER (PARTITION BY pu.����ȣ ORDER BY sum(pu.������) desc) AS row_num
from purprod0 pu
join total_code0 t on pu.�ߺз��ڵ� = t.�ߺз��ڵ� and pu.�Һз��ڵ� = t.�Һз��ڵ�
group by pu.����ȣ, pu.�Һз��ڵ�, t.�����ڵ�, t.���Ǻз���, t.�Һ���, t.�Һз���
having round(avg(pu.������)) * 2 < sum(pu.������)
order by pu.����ȣ, sum(pu.������) desc;

select * from  b2b_prot1
where ���Ǻз��� = '������ǰ' and ����ȣ = 1 and q14_1p <>0;

select *
from b2b_prot1 
where row_num = 1
;


select pu.�ߺз��ڵ�, pu.�Һз��ڵ�, t.�����ڵ�, round(avg(pu.������))
from purprod0 pu
join total_code0 t on pu.�ߺз��ڵ� = t.�ߺз��ڵ� and pu.�Һз��ڵ� = t.�Һз��ڵ�
group by pu.�ߺз��ڵ�, pu.�Һз��ڵ�, t.�����ڵ�
order by pu.�Һз��ڵ�;

--�����ڵ�
drop table total_code;
create table total_code as
select �ߺз��ڵ�, �ߺз���, �Һз��ڵ�, �Һз���, �����ڵ�, ���Ǻз���, �Һ��� 
from pro_a
union
select �ߺз��ڵ�, �ߺз���, �Һз��ڵ�, �Һз���, �����ڵ�, ���Ǻз���, �Һ���
from pro_b
union
select �ߺз��ڵ�, �ߺз���, �Һз��ڵ�, �Һз���, �����ڵ�, �����̸�, �Һ���
from pro_c
union 
select �ߺз��ڵ�, �ߺз���, �Һз��ڵ�, �Һз���, �����ڵ�, ���Ǻз���, �Һ���
from pro_d;

select * from total_code;

drop table total_code0;
create table total_code0 as
select �ߺз��ڵ�, �ߺз���, �Һз��ڵ�, �Һз���, �����ڵ�, ���Ǻз���, �Һ���, substr(�����ڵ�, 2,2) as �����ڵ� 
from total_code
order by �Һз��ڵ�, �����ڵ�;

select * from total_code0; 

--�����͵�����

drop table pro_pur;
create table pro_pur as
 select pu.����ȣ, t.���Ǻз���,
    case
        when year_pur = 2014 and month_pur between 01 and 03 then 'q14_1' 
        when year_pur = 2014 and month_pur between 04 and 06 then 'q14_2' 
        when year_pur = 2014 and month_pur between 07 and 09 then 'q14_3' 
        when year_pur = 2014 and month_pur between 10 and 12 then 'q14_4' 
        when year_pur = 2015 and month_pur between 01 and 03 then 'q15_1' 
        when year_pur = 2015 and month_pur between 04 and 06 then 'q15_2' 
        when year_pur = 2015 and month_pur between 07 and 09 then 'q15_3'
        when year_pur = 2015 and month_pur between 10 and 12 then 'q15_4' 
    end as �б�,
    sum(������) as �����Ѿ�
 from purprod0 pu
 join total_code0 t on pu.�Һз��ڵ� = t.�Һз��ڵ�
 group by pu.����ȣ, t.���Ǻз���,
    case
        when year_pur = 2014 and month_pur between 01 and 03 then 'q14_1' 
        when year_pur = 2014 and month_pur between 04 and 06 then 'q14_2' 
        when year_pur = 2014 and month_pur between 07 and 09 then 'q14_3' 
        when year_pur = 2014 and month_pur between 10 and 12 then 'q14_4' 
        when year_pur = 2015 and month_pur between 01 and 03 then 'q15_1' 
        when year_pur = 2015 and month_pur between 04 and 06 then 'q15_2' 
        when year_pur = 2015 and month_pur between 07 and 09 then 'q15_3'
        when year_pur = 2015 and month_pur between 10 and 12 then 'q15_4' 
    end
 order by pu.����ȣ;
 
--excel
select * from pro_pur order by ����ȣ;
 
select ����ȣ, �����Ѿ�
from pro_pur
where ���Ǻз��� = '������ǰ' and �б� = 'q14_1'
;

drop table pro_pur;
create table pro_pur as
select pu.����ȣ, 
    nvl(sum(case when t.���Ǻз��� = '������ǰ' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����q14_1,
    nvl(sum(case when t.���Ǻз��� = '������ǰ' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����q14_2,
    nvl(sum(case when t.���Ǻз��� = '������ǰ' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����q14_3,
    nvl(sum(case when t.���Ǻз��� = '������ǰ' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����q14_4,
    nvl(sum(case when t.���Ǻз��� = '������ǰ' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����q15_1,
    nvl(sum(case when t.���Ǻз��� = '������ǰ' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����q15_2,
    nvl(sum(case when t.���Ǻз��� = '������ǰ' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����q15_3,
    nvl(sum(case when t.���Ǻз��� = '������ǰ' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����q15_4,
    
    nvl(sum(case when t.���Ǻз��� = '�ż���ǰ' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �ż�q14_1,
    nvl(sum(case when t.���Ǻз��� = '�ż���ǰ' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �ż�q14_2,
    nvl(sum(case when t.���Ǻз��� = '�ż���ǰ' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �ż�q14_3,
    nvl(sum(case when t.���Ǻз��� = '�ż���ǰ' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �ż�q14_4,
    nvl(sum(case when t.���Ǻз��� = '�ż���ǰ' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �ż�q15_1,
    nvl(sum(case when t.���Ǻз��� = '�ż���ǰ' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �ż�q15_2,
    nvl(sum(case when t.���Ǻз��� = '�ż���ǰ' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �ż�q15_3,
    nvl(sum(case when t.���Ǻз��� = '�ż���ǰ' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �ż�q15_4,
    
    nvl(sum(case when t.���Ǻз��� = '�ϻ��ǰ' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �ϻ�q14_1,
    nvl(sum(case when t.���Ǻз��� = '�ϻ��ǰ' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �ϻ�q14_2,
    nvl(sum(case when t.���Ǻз��� = '�ϻ��ǰ' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �ϻ�q14_3,
    nvl(sum(case when t.���Ǻз��� = '�ϻ��ǰ' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �ϻ�q14_4,
    nvl(sum(case when t.���Ǻз��� = '�ϻ��ǰ' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �ϻ�q15_1,
    nvl(sum(case when t.���Ǻз��� = '�ϻ��ǰ' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �ϻ�q15_2,
    nvl(sum(case when t.���Ǻз��� = '�ϻ��ǰ' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �ϻ�q15_3,
    nvl(sum(case when t.���Ǻз��� = '�ϻ��ǰ' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �ϻ�q15_4,
    
    nvl(sum(case when t.���Ǻз��� = '�Ǿ�ǰ/�Ƿ���' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �Ǿ�q14_1,
    nvl(sum(case when t.���Ǻз��� = '�Ǿ�ǰ/�Ƿ���' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �Ǿ�q14_2,
    nvl(sum(case when t.���Ǻз��� = '�Ǿ�ǰ/�Ƿ���' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �Ǿ�q14_3,
    nvl(sum(case when t.���Ǻз��� = '�Ǿ�ǰ/�Ƿ���' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �Ǿ�q14_4,
    nvl(sum(case when t.���Ǻз��� = '�Ǿ�ǰ/�Ƿ���' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �Ǿ�q15_1,
    nvl(sum(case when t.���Ǻз��� = '�Ǿ�ǰ/�Ƿ���' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �Ǿ�q15_2,
    nvl(sum(case when t.���Ǻз��� = '�Ǿ�ǰ/�Ƿ���' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �Ǿ�q15_3,
    nvl(sum(case when t.���Ǻз��� = '�Ǿ�ǰ/�Ƿ���' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �Ǿ�q15_4,
    
    nvl(sum(case when t.���Ǻз��� = '����/��ȭ��ǰ' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����q14_1,
    nvl(sum(case when t.���Ǻз��� = '����/��ȭ��ǰ' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����q14_2,
    nvl(sum(case when t.���Ǻз��� = '����/��ȭ��ǰ' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����q14_3,
    nvl(sum(case when t.���Ǻз��� = '����/��ȭ��ǰ' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����q14_4,
    nvl(sum(case when t.���Ǻз��� = '����/��ȭ��ǰ' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����q15_1,
    nvl(sum(case when t.���Ǻз��� = '����/��ȭ��ǰ' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����q15_2,
    nvl(sum(case when t.���Ǻз��� = '����/��ȭ��ǰ' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����q15_3,
    nvl(sum(case when t.���Ǻз��� = '����/��ȭ��ǰ' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����q15_4,
    
    nvl(sum(case when t.���Ǻз��� = '������/����' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ������q14_1,
    nvl(sum(case when t.���Ǻз��� = '������/����' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ������q14_2,
    nvl(sum(case when t.���Ǻз��� = '������/����' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ������q14_3,
    nvl(sum(case when t.���Ǻз��� = '������/����' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ������q14_4,
    nvl(sum(case when t.���Ǻз��� = '������/����' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ������q15_1,
    nvl(sum(case when t.���Ǻз��� = '������/����' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ������q15_2,
    nvl(sum(case when t.���Ǻз��� = '������/����' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ������q15_3,
    nvl(sum(case when t.���Ǻз��� = '������/����' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ������q15_4,
    
    nvl(sum(case when t.���Ǻз��� = '����/���׸���' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����q14_1,
    nvl(sum(case when t.���Ǻз��� = '����/���׸���' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����q14_2,
    nvl(sum(case when t.���Ǻз��� = '����/���׸���' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����q14_3,
    nvl(sum(case when t.���Ǻз��� = '����/���׸���' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����q14_4,
    nvl(sum(case when t.���Ǻз��� = '����/���׸���' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����q15_1,
    nvl(sum(case when t.���Ǻз��� = '����/���׸���' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����q15_2,
    nvl(sum(case when t.���Ǻз��� = '����/���׸���' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����q15_3,
    nvl(sum(case when t.���Ǻз��� = '����/���׸���' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����q15_4,
    
    nvl(sum(case when t.���Ǻз��� = '�Ƿ�' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �Ƿ�q14_1,
    nvl(sum(case when t.���Ǻз��� = '�Ƿ�' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �Ƿ�q14_2,
    nvl(sum(case when t.���Ǻз��� = '�Ƿ�' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �Ƿ�q14_3,
    nvl(sum(case when t.���Ǻз��� = '�Ƿ�' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �Ƿ�q14_4,
    nvl(sum(case when t.���Ǻз��� = '�Ƿ�' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �Ƿ�q15_1,
    nvl(sum(case when t.���Ǻз��� = '�Ƿ�' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �Ƿ�q15_2,
    nvl(sum(case when t.���Ǻз��� = '�Ƿ�' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �Ƿ�q15_3,
    nvl(sum(case when t.���Ǻз��� = '�Ƿ�' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �Ƿ�q15_4,
    
    nvl(sum(case when t.���Ǻз��� = '����������/����' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����������q14_1,
    nvl(sum(case when t.���Ǻз��� = '����������/����' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����������q14_2,
    nvl(sum(case when t.���Ǻз��� = '����������/����' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����������q14_3,
    nvl(sum(case when t.���Ǻз��� = '����������/����' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����������q14_4,
    nvl(sum(case when t.���Ǻз��� = '����������/����' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����������q15_1,
    nvl(sum(case when t.���Ǻз��� = '����������/����' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����������q15_2,
    nvl(sum(case when t.���Ǻз��� = '����������/����' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����������q15_3,
    nvl(sum(case when t.���Ǻз��� = '����������/����' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����������q15_4,
    
    nvl(sum(case when t.���Ǻз��� = '�м���ȭ' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �м���ȭq14_1,
    nvl(sum(case when t.���Ǻз��� = '�м���ȭ' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �м���ȭq14_2,
    nvl(sum(case when t.���Ǻз��� = '�м���ȭ' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �м���ȭq14_3,
    nvl(sum(case when t.���Ǻз��� = '�м���ȭ' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �м���ȭq14_4,
    nvl(sum(case when t.���Ǻз��� = '�м���ȭ' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as �м���ȭq15_1,
    nvl(sum(case when t.���Ǻз��� = '�м���ȭ' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as �м���ȭq15_2,
    nvl(sum(case when t.���Ǻз��� = '�м���ȭ' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as �м���ȭq15_3,
    nvl(sum(case when t.���Ǻз��� = '�м���ȭ' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as �м���ȭq15_4,
    
    nvl(sum(case when t.���Ǻз��� = '��ǰ' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ��ǰq14_1,
    nvl(sum(case when t.���Ǻз��� = '��ǰ' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ��ǰq14_2,
    nvl(sum(case when t.���Ǻз��� = '��ǰ' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ��ǰq14_3,
    nvl(sum(case when t.���Ǻз��� = '��ǰ' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ��ǰq14_4,
    nvl(sum(case when t.���Ǻз��� = '��ǰ' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ��ǰq15_1,
    nvl(sum(case when t.���Ǻз��� = '��ǰ' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ��ǰq15_2,
    nvl(sum(case when t.���Ǻз��� = '��ǰ' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ��ǰq15_3,
    nvl(sum(case when t.���Ǻз��� = '��ǰ' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ��ǰq15_4,
    
    nvl(sum(case when t.���Ǻз��� = '��Ÿ' and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ��Ÿq14_1,
    nvl(sum(case when t.���Ǻз��� = '��Ÿ' and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ��Ÿq14_2,
    nvl(sum(case when t.���Ǻз��� = '��Ÿ' and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ��Ÿq14_3,
    nvl(sum(case when t.���Ǻз��� = '��Ÿ' and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ��Ÿq14_4,
    nvl(sum(case when t.���Ǻз��� = '��Ÿ' and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ��Ÿq15_1,
    nvl(sum(case when t.���Ǻз��� = '��Ÿ' and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ��Ÿq15_2,
    nvl(sum(case when t.���Ǻз��� = '��Ÿ' and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ��Ÿq15_3,
    nvl(sum(case when t.���Ǻз��� = '��Ÿ' and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ��Ÿq15_4
          
from purprod0 pu
join total_code0 t on pu.�Һз��ڵ� = t.�Һз��ڵ�
group by pu.����ȣ
order by pu.����ȣ;

--
select *
from total_code0;

select pu.����ȣ,
    nvl(sum(case when t.�����ڵ� = 01 and pu.year_pur = 2014 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����q14_1,
    nvl(sum(case when t.�����ڵ� = 01 and pu.year_pur = 2014 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����q14_2,
    nvl(sum(case when t.�����ڵ� = 01 and pu.year_pur = 2014 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����q14_3,
    nvl(sum(case when t.�����ڵ� = 01 and pu.year_pur = 2014 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����q14_4,
    nvl(sum(case when t.�����ڵ� = 01 and pu.year_pur = 2015 and pu.month_pur between 01 and 03 then pu.������ end), 0) as ����q15_1,
    nvl(sum(case when t.�����ڵ� = 01 and pu.year_pur = 2015 and pu.month_pur between 04 and 06 then pu.������ end), 0) as ����q15_2,
    nvl(sum(case when t.�����ڵ� = 01 and pu.year_pur = 2015 and pu.month_pur between 07 and 09 then pu.������ end), 0) as ����q15_3,
    nvl(sum(case when t.�����ڵ� = 01 and pu.year_pur = 2015 and pu.month_pur between 10 and 12 then pu.������ end), 0) as ����q15_4
from purprod0 pu
join total_code0 t on pu.�ߺз��ڵ� = t.�ߺз��ڵ� and pu.�Һз��ڵ� = t.�Һз��ڵ�
group by pu.����ȣ
order by pu.����ȣ
;

select pu.����ȣ,
    nvl(sum(case when t.�����ڵ� = 01 then pu.������ end), 0) as ����
from purprod0 pu
join total_code0 t on pu.�ߺз��ڵ� = t.�ߺз��ڵ� and pu.�Һз��ڵ� = t.�Һз��ڵ�
group by pu.����ȣ
order by pu.����ȣ;

select pu.����ȣ, t.�����ڵ�, t.���Ǻз���, pu.year_pur, pu.month_pur, sum(pu.������),
    ntile(4) over (order by sum(pu.������) desc)
from purprod0 pu
join total_code0 t on pu.�ߺз��ڵ� = t.�ߺз��ڵ� and pu.�Һз��ڵ� = t.�Һз��ڵ�
where t.�����ڵ� = 01
group by pu.����ȣ, t.�����ڵ�, t.���Ǻз���, pu.year_pur, pu.month_pur
order by ����ȣ, t.�����ڵ�, pu.year_pur, pu.month_pur;

drop table pro_pur_rank;
create table pro_pur_rank as
select ����ȣ,
    case when ����q14_1 <> 0 then ntile(10) over (order by ����q14_1 desc) else 10 end as ����1,
    case when ����q14_2 <> 0 then ntile(10) over (order by ����q14_2 desc) else 10 end as ����2,
    case when ����q14_3 <> 0 then ntile(10) over (order by ����q14_3 desc) else 10 end as ����3,
    case when ����q14_4 <> 0 then ntile(10) over (order by ����q14_4 desc) else 10 end as ����4,
    case when ����q15_1 <> 0 then ntile(10) over (order by ����q15_1 desc) else 10 end as ����5,
    case when ����q15_2 <> 0 then ntile(10) over (order by ����q15_2 desc) else 10 end as ����6,
    case when ����q15_3 <> 0 then ntile(10) over (order by ����q15_3 desc) else 10 end as ����7,
    case when ����q15_4 <> 0 then ntile(10) over (order by ����q15_4 desc) else 10 end as ����8,
    
    case when �ż�q14_1 <> 0 then ntile(10) over (order by �ż�q14_1 desc) else 10 end as �ż�1,
    case when �ż�q14_2 <> 0 then ntile(10) over (order by �ż�q14_2 desc) else 10 end as �ż�2,
    case when �ż�q14_3 <> 0 then ntile(10) over (order by �ż�q14_3 desc) else 10 end as �ż�3,
    case when �ż�q14_4 <> 0 then ntile(10) over (order by �ż�q14_4 desc) else 10 end as �ż�4,
    case when �ż�q15_1 <> 0 then ntile(10) over (order by �ż�q15_1 desc) else 10 end as �ż�5,
    case when �ż�q15_2 <> 0 then ntile(10) over (order by �ż�q15_2 desc) else 10 end as �ż�6,
    case when �ż�q15_3 <> 0 then ntile(10) over (order by �ż�q15_3 desc) else 10 end as �ż�7,
    case when �ż�q15_4 <> 0 then ntile(10) over (order by �ż�q15_4 desc) else 10 end as �ż�8,
    
    case when �ϻ�q14_1 <> 0 then ntile(10) over (order by �ϻ�q14_1 desc) else 10 end as �ϻ�1,
    case when �ϻ�q14_2 <> 0 then ntile(10) over (order by �ϻ�q14_2 desc) else 10 end as �ϻ�2,
    case when �ϻ�q14_3 <> 0 then ntile(10) over (order by �ϻ�q14_3 desc) else 10 end as �ϻ�3,
    case when �ϻ�q14_4 <> 0 then ntile(10) over (order by �ϻ�q14_4 desc) else 10 end as �ϻ�4,
    case when �ϻ�q15_1 <> 0 then ntile(10) over (order by �ϻ�q15_1 desc) else 10 end as �ϻ�5,
    case when �ϻ�q15_2 <> 0 then ntile(10) over (order by �ϻ�q15_2 desc) else 10 end as �ϻ�6,
    case when �ϻ�q15_3 <> 0 then ntile(10) over (order by �ϻ�q15_3 desc) else 10 end as �ϻ�7,
    case when �ϻ�q15_4 <> 0 then ntile(10) over (order by �ϻ�q15_4 desc) else 10 end as �ϻ�8,
    
    case when �Ǿ�q14_1 <> 0 then ntile(10) over (order by �Ǿ�q14_1 desc) else 10 end as �Ǿ�1,
    case when �Ǿ�q14_2 <> 0 then ntile(10) over (order by �Ǿ�q14_2 desc) else 10 end as �Ǿ�2,
    case when �Ǿ�q14_3 <> 0 then ntile(10) over (order by �Ǿ�q14_3 desc) else 10 end as �Ǿ�3,
    case when �Ǿ�q14_4 <> 0 then ntile(10) over (order by �Ǿ�q14_4 desc) else 10 end as �Ǿ�4,
    case when �Ǿ�q15_1 <> 0 then ntile(10) over (order by �Ǿ�q15_1 desc) else 10 end as �Ǿ�5,
    case when �Ǿ�q15_2 <> 0 then ntile(10) over (order by �Ǿ�q15_2 desc) else 10 end as �Ǿ�6,
    case when �Ǿ�q15_3 <> 0 then ntile(10) over (order by �Ǿ�q15_3 desc) else 10 end as �Ǿ�7,
    case when �Ǿ�q15_4 <> 0 then ntile(10) over (order by �Ǿ�q15_4 desc) else 10 end as �Ǿ�8,
    
    case when ����q14_1 <> 0 then ntile(10) over (order by ����q14_1 desc) else 10 end as ����1,
    case when ����q14_2 <> 0 then ntile(10) over (order by ����q14_2 desc) else 10 end as ����2,
    case when ����q14_3 <> 0 then ntile(10) over (order by ����q14_3 desc) else 10 end as ����3,
    case when ����q14_4 <> 0 then ntile(10) over (order by ����q14_4 desc) else 10 end as ����4,
    case when ����q15_1 <> 0 then ntile(10) over (order by ����q15_1 desc) else 10 end as ����5,
    case when ����q15_2 <> 0 then ntile(10) over (order by ����q15_2 desc) else 10 end as ����6,
    case when ����q15_3 <> 0 then ntile(10) over (order by ����q15_3 desc) else 10 end as ����7,
    case when ����q15_4 <> 0 then ntile(10) over (order by ����q15_4 desc) else 10 end as ����8,
    
    case when ������q14_1 <> 0 then ntile(10) over (order by ������q14_1 desc) else 10 end as ������1,
    case when ������q14_2 <> 0 then ntile(10) over (order by ������q14_2 desc) else 10 end as ������2,
    case when ������q14_3 <> 0 then ntile(10) over (order by ������q14_3 desc) else 10 end as ������3,
    case when ������q14_4 <> 0 then ntile(10) over (order by ������q14_4 desc) else 10 end as ������4,
    case when ������q15_1 <> 0 then ntile(10) over (order by ������q15_1 desc) else 10 end as ������5,
    case when ������q15_2 <> 0 then ntile(10) over (order by ������q15_2 desc) else 10 end as ������6,
    case when ������q15_3 <> 0 then ntile(10) over (order by ������q15_3 desc) else 10 end as ������7,
    case when ������q15_4 <> 0 then ntile(10) over (order by ������q15_4 desc) else 10 end as ������8,
    
    case when ����q14_1 <> 0 then ntile(10) over (order by ����q14_1 desc) else 10 end as ����1,
    case when ����q14_2 <> 0 then ntile(10) over (order by ����q14_2 desc) else 10 end as ����2,
    case when ����q14_3 <> 0 then ntile(10) over (order by ����q14_3 desc) else 10 end as ����3,
    case when ����q14_4 <> 0 then ntile(10) over (order by ����q14_4 desc) else 10 end as ����4,
    case when ����q15_1 <> 0 then ntile(10) over (order by ����q15_1 desc) else 10 end as ����5,
    case when ����q15_2 <> 0 then ntile(10) over (order by ����q15_2 desc) else 10 end as ����6,
    case when ����q15_3 <> 0 then ntile(10) over (order by ����q15_3 desc) else 10 end as ����7,
    case when ����q15_4 <> 0 then ntile(10) over (order by ����q15_4 desc) else 10 end as ����8,
    
    case when �Ƿ�q14_1 <> 0 then ntile(10) over (order by �Ƿ�q14_1 desc) else 10 end as �Ƿ�1,
    case when �Ƿ�q14_2 <> 0 then ntile(10) over (order by �Ƿ�q14_2 desc) else 10 end as �Ƿ�2,
    case when �Ƿ�q14_3 <> 0 then ntile(10) over (order by �Ƿ�q14_3 desc) else 10 end as �Ƿ�3,
    case when �Ƿ�q14_4 <> 0 then ntile(10) over (order by �Ƿ�q14_4 desc) else 10 end as �Ƿ�4,
    case when �Ƿ�q15_1 <> 0 then ntile(10) over (order by �Ƿ�q15_1 desc) else 10 end as �Ƿ�5,
    case when �Ƿ�q15_2 <> 0 then ntile(10) over (order by �Ƿ�q15_2 desc) else 10 end as �Ƿ�6,
    case when �Ƿ�q15_3 <> 0 then ntile(10) over (order by �Ƿ�q15_3 desc) else 10 end as �Ƿ�7,
    case when �Ƿ�q15_4 <> 0 then ntile(10) over (order by �Ƿ�q15_4 desc) else 10 end as �Ƿ�8,
    
    case when ����������q14_1 <> 0 then ntile(10) over (order by ����������q14_1 desc) else 10 end as ����������1,
    case when ����������q14_2 <> 0 then ntile(10) over (order by ����������q14_2 desc) else 10 end as ����������2,
    case when ����������q14_3 <> 0 then ntile(10) over (order by ����������q14_3 desc) else 10 end as ����������3,
    case when ����������q14_4 <> 0 then ntile(10) over (order by ����������q14_4 desc) else 10 end as ����������4,
    case when ����������q15_1 <> 0 then ntile(10) over (order by ����������q15_1 desc) else 10 end as ����������5,
    case when ����������q15_2 <> 0 then ntile(10) over (order by ����������q15_2 desc) else 10 end as ����������6,
    case when ����������q15_3 <> 0 then ntile(10) over (order by ����������q15_3 desc) else 10 end as ����������7,
    case when ����������q15_4 <> 0 then ntile(10) over (order by ����������q15_4 desc) else 10 end as ����������8,
    
    case when �м���ȭq14_1 <> 0 then ntile(10) over (order by �м���ȭq14_1 desc) else 10 end as �м���ȭ1,
    case when �м���ȭq14_2 <> 0 then ntile(10) over (order by �м���ȭq14_2 desc) else 10 end as �м���ȭ2,
    case when �м���ȭq14_3 <> 0 then ntile(10) over (order by �м���ȭq14_3 desc) else 10 end as �м���ȭ3,
    case when �м���ȭq14_4 <> 0 then ntile(10) over (order by �м���ȭq14_4 desc) else 10 end as �м���ȭ4,
    case when �м���ȭq15_1 <> 0 then ntile(10) over (order by �м���ȭq15_1 desc) else 10 end as �м���ȭ5,
    case when �м���ȭq15_2 <> 0 then ntile(10) over (order by �м���ȭq15_2 desc) else 10 end as �м���ȭ6,
    case when �м���ȭq15_3 <> 0 then ntile(10) over (order by �м���ȭq15_3 desc) else 10 end as �м���ȭ7,
    case when �м���ȭq15_4 <> 0 then ntile(10) over (order by �м���ȭq15_4 desc) else 10 end as �м���ȭ8,
    
    case when ��ǰq14_1 <> 0 then ntile(10) over (order by ��ǰq14_1 desc) else 10 end as ��ǰ1,
    case when ��ǰq14_2 <> 0 then ntile(10) over (order by ��ǰq14_2 desc) else 10 end as ��ǰ2,
    case when ��ǰq14_3 <> 0 then ntile(10) over (order by ��ǰq14_3 desc) else 10 end as ��ǰ3,
    case when ��ǰq14_4 <> 0 then ntile(10) over (order by ��ǰq14_4 desc) else 10 end as ��ǰ4,
    case when ��ǰq15_1 <> 0 then ntile(10) over (order by ��ǰq15_1 desc) else 10 end as ��ǰ5,
    case when ��ǰq15_2 <> 0 then ntile(10) over (order by ��ǰq15_2 desc) else 10 end as ��ǰ6,
    case when ��ǰq15_3 <> 0 then ntile(10) over (order by ��ǰq15_3 desc) else 10 end as ��ǰ7,
    case when ��ǰq15_4 <> 0 then ntile(10) over (order by ��ǰq15_4 desc) else 10 end as ��ǰ8,
    
    case when ��Ÿq14_1 <> 0 then ntile(10) over (order by ��Ÿq14_1 desc) else 10 end as ��Ÿ1,
    case when ��Ÿq14_2 <> 0 then ntile(10) over (order by ��Ÿq14_2 desc) else 10 end as ��Ÿ2,
    case when ��Ÿq14_3 <> 0 then ntile(10) over (order by ��Ÿq14_3 desc) else 10 end as ��Ÿ3,
    case when ��Ÿq14_4 <> 0 then ntile(10) over (order by ��Ÿq14_4 desc) else 10 end as ��Ÿ4,
    case when ��Ÿq15_1 <> 0 then ntile(10) over (order by ��Ÿq15_1 desc) else 10 end as ��Ÿ5,
    case when ��Ÿq15_2 <> 0 then ntile(10) over (order by ��Ÿq15_2 desc) else 10 end as ��Ÿ6,
    case when ��Ÿq15_3 <> 0 then ntile(10) over (order by ��Ÿq15_3 desc) else 10 end as ��Ÿ7,
    case when ��Ÿq15_4 <> 0 then ntile(10) over (order by ��Ÿq15_4 desc) else 10 end as ��Ÿ8
    
from pro_pur
order by ����ȣ;

select ����ȣ,
    case when ����q14_1 <> 0 then ntile(10) over 
    (order by ����q14_1 desc,����q14_2 desc,����q14_3 desc,����q14_4 desc, ����q15_1 desc,����q15_2 desc,����q15_3 desc,����q15_4 desc)
    else 10 end as ����1,
    case when ����q14_2 <> 0 then ntile(10) over 
    (order by ����q14_1 desc,����q14_2 desc,����q14_3 desc,����q14_4 desc, ����q15_1 desc,����q15_2 desc,����q15_3 desc,����q15_4 desc) 
    else 10 end as ����2,
    case when ����q14_3 <> 0 then ntile(10) over (order by ����q14_3 desc) else 10 end as ����3,
    case when ����q14_4 <> 0 then ntile(10) over (order by ����q14_4 desc) else 10 end as ����4,
    case when ����q15_1 <> 0 then ntile(10) over (order by ����q15_1 desc) else 10 end as ����5,
    case when ����q15_2 <> 0 then ntile(10) over (order by ����q15_2 desc) else 10 end as ����6,
    case when ����q15_3 <> 0 then ntile(10) over (order by ����q15_3 desc) else 10 end as ����7,
    case when ����q15_4 <> 0 then ntile(10) over (order by ����q15_4 desc) else 10 end as ����8,

    
from pro_pur
order by ����ȣ;

select * from pro_pur;
select * from pro_pur_rank;

select p1.����ȣ,
    ����1 - ����8,
    �ż�1 - �ż�8,
    �ϻ�1 - �ϻ�8,
    �Ǿ�1 - �Ǿ�8,
    ����1 - ����8,
    ������1 - ������8,
    ����1 - ����8,
    �Ƿ�1 - �Ƿ�8,
    ����������1 - ����������8,
    �м���ȭ1 - �м���ȭ8,
    ��ǰ1 - ��ǰ8,
    ��Ÿ1 - ��Ÿ8,
    -(����q14_1 - ����q15_4),
    -(�ż�q14_1 - �ż�q15_4),
    -(�ϻ�q14_1 - �ϻ�q15_4),
    -(�Ǿ�q14_1 - �Ǿ�q15_4),
    -(����q14_1 - ����q15_4),
    -(������q14_1 - ������q15_4),
    -(����q14_1 - ����q15_4),
    -(�Ƿ�q14_1 - �Ƿ�q15_4),
    -(����������q14_1 - ����������q15_4),
    -(�м���ȭq14_1 - �м���ȭq15_4),
    -(��ǰq14_1 - ��ǰq15_4),
    -(��Ÿq14_1 - ��Ÿq15_4)
    
from pro_pur_rank p1
join pro_pur p on p1.����ȣ = p.����ȣ;

drop table pro_pur1;
create table pro_pur1 as
select pu.����ȣ, pu.year_pur, pu.month_pur,
    nvl(sum(case when t.���Ǻз��� = '������ǰ' then pu.������ end), 0) as ����,
    nvl(sum(case when t.���Ǻз��� = '�ż���ǰ' then pu.������ end), 0) as �ż�,
    nvl(sum(case when t.���Ǻз��� = '�ϻ��ǰ' then pu.������ end), 0) as �ϻ�,
    nvl(sum(case when t.���Ǻз��� = '�Ǿ�ǰ/�Ƿ���' then pu.������ end), 0) as �Ǿ�,
    nvl(sum(case when t.���Ǻз��� = '����/��ȭ��ǰ' then pu.������ end), 0) as ����,
    nvl(sum(case when t.���Ǻз��� = '������/����' then pu.������ end), 0) as ������,
    nvl(sum(case when t.���Ǻз��� = '����/���׸���' then pu.������ end), 0) as ����,
    nvl(sum(case when t.���Ǻз��� = '�Ƿ�' then pu.������ end), 0) as �Ƿ�,
    nvl(sum(case when t.���Ǻз��� = '����������/����' then pu.������ end), 0) as ����������,
    nvl(sum(case when t.���Ǻз��� = '�м���ȭ' then pu.������ end), 0) as �м���ȭ,
    nvl(sum(case when t.���Ǻз��� = '��ǰ' then pu.������ end), 0) as ��ǰ,
    nvl(sum(case when t.���Ǻз��� = '��Ÿ' then pu.������ end), 0) as ��Ÿ
from purprod0 pu
join total_code0 t on pu.�Һз��ڵ� = t.�Һз��ڵ�
group by pu.����ȣ, pu.year_pur, pu.month_pur
order by pu.����ȣ;

select * from pro_pur1;


drop table pro_pur2;
create table pro_pur2 as
select ����ȣ, ����, �ż�, �ϻ�, �Ǿ�, ����, ������, ����, �Ƿ�, ����������, �м���ȭ, ��ǰ, ��Ÿ,
    case
        when year_pur = 2014 and month_pur between 01 and 03 then 1 
        when year_pur = 2014 and month_pur between 04 and 06 then 2
        when year_pur = 2014 and month_pur between 07 and 09 then 3
        when year_pur = 2014 and month_pur between 10 and 12 then 4
        when year_pur = 2015 and month_pur between 01 and 03 then 5
        when year_pur = 2015 and month_pur between 04 and 06 then 6
        when year_pur = 2015 and month_pur between 07 and 09 then 7
        when year_pur = 2015 and month_pur between 10 and 12 then 8
    end as q
    
from pro_pur1
order by ����ȣ, q; 

select * from pro_pur2;

select ����ȣ, q,
    case when nvl(sum(case when q = 1 then ���� end), 0) <> 0 and q = 1 then ntile(10) over (order by ����) end
from pro_pur2
group by ����ȣ, q, ����
order by ����ȣ, q;

select ����ȣ,
    nvl(sum(case when q = 1 then ���� end), 0) as ����1,
    nvl(sum(case when q = 2 then ���� end), 0) as ����2,
    nvl(sum(case when q = 3 then ���� end), 0) as ����3,
    nvl(sum(case when q = 4 then ���� end), 0) as ����4,
    nvl(sum(case when q = 5 then ���� end), 0) as ����5,
    nvl(sum(case when q = 6 then ���� end), 0) as ����6,
    nvl(sum(case when q = 7 then ���� end), 0) as ����7,
    nvl(sum(case when q = 8 then ���� end), 0) as ����8,

    nvl(sum(case when q = 1 then �ż� end), 0) as �ż�1,
    nvl(sum(case when q = 2 then �ż� end), 0) as �ż�2,
    nvl(sum(case when q = 3 then �ż� end), 0) as �ż�3,
    nvl(sum(case when q = 4 then �ż� end), 0) as �ż�4,
    nvl(sum(case when q = 5 then �ż� end), 0) as �ż�5,
    nvl(sum(case when q = 6 then �ż� end), 0) as �ż�6,
    nvl(sum(case when q = 7 then �ż� end), 0) as �ż�7,
    nvl(sum(case when q = 8 then �ż� end), 0) as �ż�8,
    
    nvl(sum(case when q = 1 then �ϻ� end), 0) as �ϻ�1,
    nvl(sum(case when q = 2 then �ϻ� end), 0) as �ϻ�2,
    nvl(sum(case when q = 3 then �ϻ� end), 0) as �ϻ�3,
    nvl(sum(case when q = 4 then �ϻ� end), 0) as �ϻ�4,
    nvl(sum(case when q = 5 then �ϻ� end), 0) as �ϻ�5,
    nvl(sum(case when q = 6 then �ϻ� end), 0) as �ϻ�6,
    nvl(sum(case when q = 7 then �ϻ� end), 0) as �ϻ�7,
    nvl(sum(case when q = 8 then �ϻ� end), 0) as �ϻ�8,
    
    nvl(sum(case when q = 1 then �Ǿ� end), 0) as �Ǿ�1,
    nvl(sum(case when q = 2 then �Ǿ� end), 0) as �Ǿ�2,
    nvl(sum(case when q = 3 then �Ǿ� end), 0) as �Ǿ�3,
    nvl(sum(case when q = 4 then �Ǿ� end), 0) as �Ǿ�4,
    nvl(sum(case when q = 5 then �Ǿ� end), 0) as �Ǿ�5,
    nvl(sum(case when q = 6 then �Ǿ� end), 0) as �Ǿ�6,
    nvl(sum(case when q = 7 then �Ǿ� end), 0) as �Ǿ�7,
    nvl(sum(case when q = 8 then �Ǿ� end), 0) as �Ǿ�8,
    
    nvl(sum(case when q = 1 then ���� end), 0) as ����1,
    nvl(sum(case when q = 2 then ���� end), 0) as ����2,
    nvl(sum(case when q = 3 then ���� end), 0) as ����3,
    nvl(sum(case when q = 4 then ���� end), 0) as ����4,
    nvl(sum(case when q = 5 then ���� end), 0) as ����5,
    nvl(sum(case when q = 6 then ���� end), 0) as ����6,
    nvl(sum(case when q = 7 then ���� end), 0) as ����7,
    nvl(sum(case when q = 8 then ���� end), 0) as ����8,
    
    nvl(sum(case when q = 1 then ������ end), 0) as ������1,
    nvl(sum(case when q = 2 then ������ end), 0) as ������2,
    nvl(sum(case when q = 3 then ������ end), 0) as ������3,
    nvl(sum(case when q = 4 then ������ end), 0) as ������4,
    nvl(sum(case when q = 5 then ������ end), 0) as ������5,
    nvl(sum(case when q = 6 then ������ end), 0) as ������6,
    nvl(sum(case when q = 7 then ������ end), 0) as ������7,
    nvl(sum(case when q = 8 then ������ end), 0) as ������8,
    
    nvl(sum(case when q = 1 then ���� end), 0) as ����1,
    nvl(sum(case when q = 2 then ���� end), 0) as ����2,
    nvl(sum(case when q = 3 then ���� end), 0) as ����3,
    nvl(sum(case when q = 4 then ���� end), 0) as ����4,
    nvl(sum(case when q = 5 then ���� end), 0) as ����5,
    nvl(sum(case when q = 6 then ���� end), 0) as ����6,
    nvl(sum(case when q = 7 then ���� end), 0) as ����7,
    nvl(sum(case when q = 8 then ���� end), 0) as ����8,
    
    nvl(sum(case when q = 1 then �Ƿ� end), 0) as �Ƿ�1,
    nvl(sum(case when q = 2 then �Ƿ� end), 0) as �Ƿ�2,
    nvl(sum(case when q = 3 then �Ƿ� end), 0) as �Ƿ�3,
    nvl(sum(case when q = 4 then �Ƿ� end), 0) as �Ƿ�4,
    nvl(sum(case when q = 5 then �Ƿ� end), 0) as �Ƿ�5,
    nvl(sum(case when q = 6 then �Ƿ� end), 0) as �Ƿ�6,
    nvl(sum(case when q = 7 then �Ƿ� end), 0) as �Ƿ�7,
    nvl(sum(case when q = 8 then �Ƿ� end), 0) as �Ƿ�8,
    
    nvl(sum(case when q = 1 then ���������� end), 0) as ����������1,
    nvl(sum(case when q = 2 then ���������� end), 0) as ����������2,
    nvl(sum(case when q = 3 then ���������� end), 0) as ����������3,
    nvl(sum(case when q = 4 then ���������� end), 0) as ����������4,
    nvl(sum(case when q = 5 then ���������� end), 0) as ����������5,
    nvl(sum(case when q = 6 then ���������� end), 0) as ����������6,
    nvl(sum(case when q = 7 then ���������� end), 0) as ����������7,
    nvl(sum(case when q = 8 then ���������� end), 0) as ����������8,
    
    nvl(sum(case when q = 1 then �м���ȭ end), 0) as �м���ȭ1,
    nvl(sum(case when q = 2 then �м���ȭ end), 0) as �м���ȭ2,
    nvl(sum(case when q = 3 then �м���ȭ end), 0) as �м���ȭ3,
    nvl(sum(case when q = 4 then �м���ȭ end), 0) as �м���ȭ4,
    nvl(sum(case when q = 5 then �м���ȭ end), 0) as �м���ȭ5,
    nvl(sum(case when q = 6 then �м���ȭ end), 0) as �м���ȭ6,
    nvl(sum(case when q = 7 then �м���ȭ end), 0) as �м���ȭ7,
    nvl(sum(case when q = 8 then �м���ȭ end), 0) as �м���ȭ8,
    
    nvl(sum(case when q = 1 then ��ǰ end), 0) as ��ǰ1,
    nvl(sum(case when q = 2 then ��ǰ end), 0) as ��ǰ2,
    nvl(sum(case when q = 3 then ��ǰ end), 0) as ��ǰ3,
    nvl(sum(case when q = 4 then ��ǰ end), 0) as ��ǰ4,
    nvl(sum(case when q = 5 then ��ǰ end), 0) as ��ǰ5,
    nvl(sum(case when q = 6 then ��ǰ end), 0) as ��ǰ6,
    nvl(sum(case when q = 7 then ��ǰ end), 0) as ��ǰ7,
    nvl(sum(case when q = 8 then ��ǰ end), 0) as ��ǰ8,
    
    nvl(sum(case when q = 1 then ��Ÿ end), 0) as ��Ÿ1,
    nvl(sum(case when q = 2 then ��Ÿ end), 0) as ��Ÿ2,
    nvl(sum(case when q = 3 then ��Ÿ end), 0) as ��Ÿ3,
    nvl(sum(case when q = 4 then ��Ÿ end), 0) as ��Ÿ4,
    nvl(sum(case when q = 5 then ��Ÿ end), 0) as ��Ÿ5,
    nvl(sum(case when q = 6 then ��Ÿ end), 0) as ��Ÿ6,
    nvl(sum(case when q = 7 then ��Ÿ end), 0) as ��Ÿ7,
    nvl(sum(case when q = 8 then ��Ÿ end), 0) as ��Ÿ8
from pro_pur2 
group by ����ȣ
order by ����ȣ;

drop table pro_pur3;
create table pro_pur3 as
select ����ȣ, q,
    nvl(SUM(CASE WHEN q = 1 THEN ���� 
        WHEN q = 2 THEN ����
        when q = 3 then ���� 
        when q = 4 then ����
        when q = 5 then ����
        when q = 6 then ����
        when q = 7 then ����
        when q = 8 then ����
        END), 0) as ����,
        
    nvl(SUM(CASE WHEN q = 1 THEN �ż� 
        WHEN q = 2 THEN �ż�
        when q = 3 then �ż� 
        when q = 4 then �ż�
        when q = 5 then �ż�
        when q = 6 then �ż�
        when q = 7 then �ż�
        when q = 8 then �ż�
        END), 0) as �ż�,
        
    nvl(SUM(CASE WHEN q = 1 THEN �ϻ� 
        WHEN q = 2 THEN �ϻ�
        when q = 3 then �ϻ�
        when q = 4 then �ϻ�
        when q = 5 then �ϻ�
        when q = 6 then �ϻ�
        when q = 7 then �ϻ�
        when q = 8 then �ϻ�
        END), 0) as �ϻ�,
        
    nvl(SUM(CASE WHEN q = 1 THEN �Ǿ� 
        WHEN q = 2 THEN �Ǿ�
        when q = 3 then �Ǿ� 
        when q = 4 then �Ǿ�
        when q = 5 then �Ǿ�
        when q = 6 then �Ǿ�
        when q = 7 then �Ǿ�
        when q = 8 then �Ǿ�
        END), 0) as �Ǿ�,
        
    nvl(SUM(CASE WHEN q = 1 THEN ���� 
        WHEN q = 2 THEN ����
        when q = 3 then ���� 
        when q = 4 then ����
        when q = 5 then ����
        when q = 6 then ����
        when q = 7 then ����
        when q = 8 then ����
        END), 0) as ����,
        
    nvl(SUM(CASE WHEN q = 1 THEN ������
        WHEN q = 2 THEN ������
        when q = 3 then ������ 
        when q = 4 then ������
        when q = 5 then ������
        when q = 6 then ������
        when q = 7 then ������
        when q = 8 then ������
        END), 0) as ������,
        
    nvl(SUM(CASE WHEN q = 1 THEN ���� 
        WHEN q = 2 THEN ����
        when q = 3 then ���� 
        when q = 4 then ����
        when q = 5 then ����
        when q = 6 then ����
        when q = 7 then ����
        when q = 8 then ����
        END), 0) as ����,
        
    nvl(SUM(CASE WHEN q = 1 THEN �Ƿ�
        WHEN q = 2 THEN �Ƿ�
        when q = 3 then �Ƿ� 
        when q = 4 then �Ƿ�
        when q = 5 then �Ƿ�
        when q = 6 then �Ƿ�
        when q = 7 then �Ƿ�
        when q = 8 then �Ƿ�
        END), 0) as �Ƿ�,
        
    nvl(SUM(CASE WHEN q = 1 THEN ����������
        WHEN q = 2 THEN ����������
        when q = 3 then ���������� 
        when q = 4 then ����������
        when q = 5 then ����������
        when q = 6 then ����������
        when q = 7 then ����������
        when q = 8 then ����������
        END), 0) as ����������,
        
    nvl(SUM(CASE WHEN q = 1 THEN �м���ȭ
        WHEN q = 2 THEN �м���ȭ
        when q = 3 then �м���ȭ 
        when q = 4 then �м���ȭ
        when q = 5 then �м���ȭ
        when q = 6 then �м���ȭ
        when q = 7 then �м���ȭ
        when q = 8 then �м���ȭ
        END), 0) as �м���ȭ,
        
    nvl(SUM(CASE WHEN q = 1 THEN ��ǰ
        WHEN q = 2 THEN ��ǰ
        when q = 3 then ��ǰ 
        when q = 4 then ��ǰ
        when q = 5 then ��ǰ
        when q = 6 then ��ǰ
        when q = 7 then ��ǰ
        when q = 8 then ��ǰ
        END), 0) as ��ǰ,
        
    nvl(SUM(CASE WHEN q = 1 THEN ��Ÿ 
        WHEN q = 2 THEN ��Ÿ
        when q = 3 then ��Ÿ 
        when q = 4 then ��Ÿ
        when q = 5 then ��Ÿ
        when q = 6 then ��Ÿ
        when q = 7 then ��Ÿ
        when q = 8 then ��Ÿ
        END), 0) as ��Ÿ
        
from pro_pur2
group by ����ȣ, q
order by ����ȣ;


select * from pro_pur3;

select ����ȣ,
    case when q = 1 then ntile(10) over (order by ���� desc) end as ����1
from pro_pur3
order by ����ȣ, q;

drop table pro_pur4;
create table pro_pur4 as
select ����ȣ, q, ����, �ż�, �ϻ�, �Ǿ�, ����, ������, ����, �Ƿ�, ����������, �м���ȭ, ��ǰ, ��Ÿ,
    case when ���� <> 0 then ntile(10) over (order by ���� desc) else 10 end as ����_rank,
    case when �ż� <> 0 then ntile(10) over (order by �ż� desc) else 10 end as �ż�_rank,
    case when �ϻ� <> 0 then ntile(10) over (order by �ϻ� desc) else 10 end as �ϻ�_rank,
    case when �Ǿ� <> 0 then ntile(10) over (order by �Ǿ� desc) else 10 end as �Ǿ�_rank,
    case when ���� <> 0 then ntile(10) over (order by ���� desc) else 10 end as ����_rank,
    case when ������ <> 0 then ntile(10) over (order by ������ desc) else 10 end as ������_rank,
    case when ���� <> 0 then ntile(10) over (order by ���� desc) else 10 end as ����_rank,
    case when �Ƿ� <> 0 then ntile(10) over (order by �Ƿ� desc) else 10 end as �Ƿ�_rank,
    case when ���������� <> 0 then ntile(10) over (order by ���������� desc) else 10 end as ����������_rank,
    case when �м���ȭ <> 0 then ntile(10) over (order by �м���ȭ desc) else 10 end as �м���ȭ_rank,
    case when ��ǰ <> 0 then ntile(10) over (order by ��ǰ desc) else 10 end as ��ǰ_rank,
    case when ��Ÿ <> 0 then ntile(10) over (order by ��Ÿ desc) else 10 end as ��Ÿ_rank
    
from pro_pur3
order by ����ȣ, q;

select * from pro_pur4;

select * from pro_pur;



SELECT p.����ȣ,
     case when max(nvl(case when p4.q = 1 then p4.�ϻ�_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.�ϻ�_rank end, 0)) else 10 end as ����1,
    case when max(nvl(case when p4.q = 7 then p4.�ϻ�_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.�ϻ�_rank end, 0)) else 10 end as ����2
FROM pro_pur4 p4
join pro_pur p on p.����ȣ = p4.����ȣ
GROUP BY p.����ȣ
order by p.����ȣ;

SELECT p.����ȣ,
     case when max(nvl(case when p4.q = 1 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.����_rank end, 0)) else 10 end as ����1,
    case when max(nvl(case when p4.q = 2 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.����_rank end, 0)) else 10 end as ����2,
    case when max(nvl(case when p4.q = 3 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.����_rank end, 0)) else 10 end as ����3,
    case when max(nvl(case when p4.q = 4 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.����_rank end, 0)) else 10 end as ����4,
    case when max(nvl(case when p4.q = 5 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.����_rank end, 0)) else 10 end as ����5,
    case when max(nvl(case when p4.q = 6 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.����_rank end, 0)) else 10 end as ����6,
    case when max(nvl(case when p4.q = 7 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.����_rank end, 0)) else 10 end as ����7,
    case when max(nvl(case when p4.q = 8 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.����_rank end, 0)) else 10 end as ����8
FROM pro_pur4 p4
full join pro_pur p on p.����ȣ = p4.����ȣ
where p.����ȣ = 19383
GROUP BY p.����ȣ
order by p.����ȣ;

drop table pro_pur5;
create table pro_pur5 as
SELECT p.����ȣ, 
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.�ż�q14_1, p.�ż�q14_2, p.�ż�q14_3, p.�ż�q14_4, p.�ż�q15_1, p.�ż�q15_2, p.�ż�q15_3, p.�ż�q15_4,
    p.�ϻ�q14_1, p.�ϻ�q14_2, p.�ϻ�q14_3, p.�ϻ�q14_4, p.�ϻ�q15_1, p.�ϻ�q15_2, p.�ϻ�q15_3, p.�ϻ�q15_4,
    p.�Ǿ�q14_1, p.�Ǿ�q14_2, p.�Ǿ�q14_3, p.�Ǿ�q14_4, p.�Ǿ�q15_1, p.�Ǿ�q15_2, p.�Ǿ�q15_3, p.�Ǿ�q15_4,
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.������q14_1, p.������q14_2, p.������q14_3, p.������q14_4, p.������q15_1, p.������q15_2, p.������q15_3, p.������q15_4,
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.�Ƿ�q14_1, p.�Ƿ�q14_2, p.�Ƿ�q14_3, p.�Ƿ�q14_4, p.�Ƿ�q15_1, p.�Ƿ�q15_2, p.�Ƿ�q15_3, p.�Ƿ�q15_4,
    p.����������q14_1, p.����������q14_2, p.����������q14_3, p.����������q14_4, p.����������q15_1, p.����������q15_2, p.����������q15_3, p.����������q15_4,
    p.�м���ȭq14_1, p.�м���ȭq14_2, p.�м���ȭq14_3, p.�м���ȭq14_4, p.�м���ȭq15_1, p.�м���ȭq15_2, p.�м���ȭq15_3, p.�м���ȭq15_4,
    p.��ǰq14_1, p.��ǰq14_2, p.��ǰq14_3, p.��ǰq14_4, p.��ǰq15_1, p.��ǰq15_2, p.��ǰq15_3, p.��ǰq15_4,
    p.��Ÿq14_1, p.��Ÿq14_2, p.��Ÿq14_3, p.��Ÿq14_4, p.��Ÿq15_1, p.��Ÿq15_2, p.��Ÿq15_3, p.��Ÿq15_4,
    
    case when max(nvl(case when p4.q = 1 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.����_rank end, 0)) else 10 end as ����1,
    case when max(nvl(case when p4.q = 2 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.����_rank end, 0)) else 10 end as ����2,
    case when max(nvl(case when p4.q = 3 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.����_rank end, 0)) else 10 end as ����3,
    case when max(nvl(case when p4.q = 4 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.����_rank end, 0)) else 10 end as ����4,
    case when max(nvl(case when p4.q = 5 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.����_rank end, 0)) else 10 end as ����5,
    case when max(nvl(case when p4.q = 6 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.����_rank end, 0)) else 10 end as ����6,
    case when max(nvl(case when p4.q = 7 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.����_rank end, 0)) else 10 end as ����7,
    case when max(nvl(case when p4.q = 8 then p4.����_rank end, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.����_rank end, 0)) else 10 end as ����8,

    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.�ż�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.�ż�_rank end, 0)) else 10 end AS �ż�1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.�ż�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.�ż�_rank end, 0)) else 10 end AS �ż�2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.�ż�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.�ż�_rank end, 0)) else 10 end AS �ż�3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.�ż�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.�ż�_rank end, 0)) else 10 end AS �ż�4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.�ż�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.�ż�_rank end, 0)) else 10 end AS �ż�5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.�ż�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.�ż�_rank end, 0)) else 10 end AS �ż�6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.�ż�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.�ż�_rank end, 0)) else 10 end AS �ż�7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.�ż�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.�ż�_rank end, 0)) else 10 end AS �ż�8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.�ϻ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.�ϻ�_rank end, 0)) else 10 end AS �ϻ�1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.�ϻ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.�ϻ�_rank end, 0)) else 10 end AS �ϻ�2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.�ϻ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.�ϻ�_rank end, 0)) else 10 end AS �ϻ�3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.�ϻ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.�ϻ�_rank end, 0)) else 10 end AS �ϻ�4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.�ϻ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.�ϻ�_rank end, 0)) else 10 end AS �ϻ�5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.�ϻ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.�ϻ�_rank end, 0)) else 10 end AS �ϻ�6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.�ϻ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.�ϻ�_rank end, 0)) else 10 end AS �ϻ�7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.�ϻ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.�ϻ�_rank end, 0)) else 10 end AS �ϻ�8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.�Ǿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.�Ǿ�_rank end, 0)) else 10 end AS �Ǿ�1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.�Ǿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.�Ǿ�_rank end, 0)) else 10 end AS �Ǿ�2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.�Ǿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.�Ǿ�_rank end, 0)) else 10 end AS �Ǿ�3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.�Ǿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.�Ǿ�_rank end, 0)) else 10 end AS �Ǿ�4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.�Ǿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.�Ǿ�_rank end, 0)) else 10 end AS �Ǿ�5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.�Ǿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.�Ǿ�_rank end, 0)) else 10 end AS �Ǿ�6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.�Ǿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.�Ǿ�_rank end, 0)) else 10 end AS �Ǿ�7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.�Ǿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.�Ǿ�_rank end, 0)) else 10 end AS �Ǿ�8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.����_rank end, 0)) else 10 end AS ����1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.����_rank end, 0)) else 10 end AS ����2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.����_rank end, 0)) else 10 end AS ����3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.����_rank end, 0)) else 10 end AS ����4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.����_rank end, 0)) else 10 end AS ����5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.����_rank end, 0)) else 10 end AS ����6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.����_rank end, 0)) else 10 end AS ����7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.����_rank end, 0)) else 10 end AS ����8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.������_rank end, 0)) else 10 end AS ������1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.������_rank end, 0)) else 10 end AS ������2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.������_rank end, 0)) else 10 end AS ������3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.������_rank end, 0)) else 10 end AS ������4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.������_rank end, 0)) else 10 end AS ������5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.������_rank end, 0)) else 10 end AS ������6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.������_rank end, 0)) else 10 end AS ������7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.������_rank end, 0)) else 10 end AS ������8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.����_rank end, 0)) else 10 end AS ����1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.����_rank end, 0)) else 10 end AS ����2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.����_rank end, 0)) else 10 end AS ����3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.����_rank end, 0)) else 10 end AS ����4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.����_rank end, 0)) else 10 end AS ����5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.����_rank end, 0)) else 10 end AS ����6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.����_rank end, 0)) else 10 end AS ����7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.����_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.����_rank end, 0)) else 10 end AS ����8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.�Ƿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.�Ƿ�_rank end, 0)) else 10 end AS �Ƿ�1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.�Ƿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.�Ƿ�_rank end, 0)) else 10 end AS �Ƿ�2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.�Ƿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.�Ƿ�_rank end, 0)) else 10 end AS �Ƿ�3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.�Ƿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.�Ƿ�_rank end, 0)) else 10 end AS �Ƿ�4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.�Ƿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.�Ƿ�_rank end, 0)) else 10 end AS �Ƿ�5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.�Ƿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.�Ƿ�_rank end, 0)) else 10 end AS �Ƿ�6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.�Ƿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.�Ƿ�_rank end, 0)) else 10 end AS �Ƿ�7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.�Ƿ�_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.�Ƿ�_rank end, 0)) else 10 end AS �Ƿ�8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.����������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.����������_rank end, 0)) else 10 end AS ����������1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.����������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.����������_rank end, 0)) else 10 end AS ����������2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.����������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.����������_rank end, 0)) else 10 end AS ����������3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.����������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.����������_rank end, 0)) else 10 end AS ����������4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.����������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.����������_rank end, 0)) else 10 end AS ����������5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.����������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.����������_rank end, 0)) else 10 end AS ����������6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.����������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.����������_rank end, 0)) else 10 end AS ����������7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.����������_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.����������_rank end, 0)) else 10 end AS ����������8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.�м���ȭ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.�м���ȭ_rank end, 0)) else 10 end AS �м���ȭ1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.�м���ȭ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.�м���ȭ_rank end, 0)) else 10 end AS �м���ȭ2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.�м���ȭ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.�м���ȭ_rank end, 0)) else 10 end AS �м���ȭ3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.�м���ȭ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.�м���ȭ_rank end, 0)) else 10 end AS �м���ȭ4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.�м���ȭ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.�м���ȭ_rank end, 0)) else 10 end AS �м���ȭ5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.�м���ȭ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.�м���ȭ_rank end, 0)) else 10 end AS �м���ȭ6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.�м���ȭ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.�м���ȭ_rank end, 0)) else 10 end AS �м���ȭ7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.�м���ȭ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.�м���ȭ_rank end, 0)) else 10 end AS �м���ȭ8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.��ǰ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.��ǰ_rank end, 0)) else 10 end AS ��ǰ1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.��ǰ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.��ǰ_rank end, 0)) else 10 end AS ��ǰ2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.��ǰ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.��ǰ_rank end, 0)) else 10 end AS ��ǰ3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.��ǰ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.��ǰ_rank end, 0)) else 10 end AS ��ǰ4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.��ǰ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.��ǰ_rank end, 0)) else 10 end AS ��ǰ5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.��ǰ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.��ǰ_rank end, 0)) else 10 end AS ��ǰ6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.��ǰ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.��ǰ_rank end, 0)) else 10 end AS ��ǰ7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.��ǰ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.��ǰ_rank end, 0)) else 10 end AS ��ǰ8,
    
    case when MAX(nvl(CASE WHEN p4.q = 1 THEN p4.��Ÿ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 1 then p4.��Ÿ_rank end, 0)) else 10 end AS ��Ÿ1,
    case when MAX(nvl(CASE WHEN p4.q = 2 THEN p4.��Ÿ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 2 then p4.��Ÿ_rank end, 0)) else 10 end AS ��Ÿ2,
    case when MAX(nvl(CASE WHEN p4.q = 3 THEN p4.��Ÿ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 3 then p4.��Ÿ_rank end, 0)) else 10 end AS ��Ÿ3,
    case when MAX(nvl(CASE WHEN p4.q = 4 THEN p4.��Ÿ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 4 then p4.��Ÿ_rank end, 0)) else 10 end AS ��Ÿ4,
    case when MAX(nvl(CASE WHEN p4.q = 5 THEN p4.��Ÿ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 5 then p4.��Ÿ_rank end, 0)) else 10 end AS ��Ÿ5,
    case when MAX(nvl(CASE WHEN p4.q = 6 THEN p4.��Ÿ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 6 then p4.��Ÿ_rank end, 0)) else 10 end AS ��Ÿ6,
    case when MAX(nvl(CASE WHEN p4.q = 7 THEN p4.��Ÿ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 7 then p4.��Ÿ_rank end, 0)) else 10 end AS ��Ÿ7,
    case when MAX(nvl(CASE WHEN p4.q = 8 THEN p4.��Ÿ_rank END, 0)) <> 0 then
    max(nvl(case when p4.q = 8 then p4.��Ÿ_rank end, 0)) else 10 end AS ��Ÿ8
    
FROM pro_pur4 p4
join pro_pur p on p.����ȣ = p4.����ȣ
GROUP BY p.����ȣ, 
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.�ż�q14_1, p.�ż�q14_2, p.�ż�q14_3, p.�ż�q14_4, p.�ż�q15_1, p.�ż�q15_2, p.�ż�q15_3, p.�ż�q15_4,
    p.�ϻ�q14_1, p.�ϻ�q14_2, p.�ϻ�q14_3, p.�ϻ�q14_4, p.�ϻ�q15_1, p.�ϻ�q15_2, p.�ϻ�q15_3, p.�ϻ�q15_4,
    p.�Ǿ�q14_1, p.�Ǿ�q14_2, p.�Ǿ�q14_3, p.�Ǿ�q14_4, p.�Ǿ�q15_1, p.�Ǿ�q15_2, p.�Ǿ�q15_3, p.�Ǿ�q15_4,
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.������q14_1, p.������q14_2, p.������q14_3, p.������q14_4, p.������q15_1, p.������q15_2, p.������q15_3, p.������q15_4,
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.�Ƿ�q14_1, p.�Ƿ�q14_2, p.�Ƿ�q14_3, p.�Ƿ�q14_4, p.�Ƿ�q15_1, p.�Ƿ�q15_2, p.�Ƿ�q15_3, p.�Ƿ�q15_4,
    p.����������q14_1, p.����������q14_2, p.����������q14_3, p.����������q14_4, p.����������q15_1, p.����������q15_2, p.����������q15_3, p.����������q15_4,
    p.�м���ȭq14_1, p.�м���ȭq14_2, p.�м���ȭq14_3, p.�м���ȭq14_4, p.�м���ȭq15_1, p.�м���ȭq15_2, p.�м���ȭq15_3, p.�м���ȭq15_4,
    p.��ǰq14_1, p.��ǰq14_2, p.��ǰq14_3, p.��ǰq14_4, p.��ǰq15_1, p.��ǰq15_2, p.��ǰq15_3, p.��ǰq15_4,
    p.��Ÿq14_1, p.��Ÿq14_2, p.��Ÿq14_3, p.��Ÿq14_4, p.��Ÿq15_1, p.��Ÿq15_2, p.��Ÿq15_3, p.��Ÿq15_4
order by p.����ȣ;

select * from pro_pur5;

select ����ȣ,
    ����1 - ����8,
    �ż�1 - �ż�8,
    �ϻ�1 - �ϻ�8,
    �Ǿ�1 - �Ǿ�8,
    ����1 - ����8,
    ������1 - ������8,
    ����1 - ����8,
    �Ƿ�1 - �Ƿ�8,
    ����������1 - ����������8,
    �м���ȭ1 - �м���ȭ8,
    ��ǰ1 - ��ǰ8,
    ��Ÿ1 - ��Ÿ8,
    
    abs(����1-����2)+abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7)+abs(����7-����8) as abs����,
    abs(�ż�1-�ż�2)+abs(�ż�2-�ż�3)+abs(�ż�3-�ż�4)+abs(�ż�4-�ż�5)+abs(�ż�5-�ż�6)+abs(�ż�6-�ż�7)+abs(�ż�7-�ż�8) as abs�ż�,
    abs(�ϻ�1-�ϻ�2)+abs(�ϻ�2-�ϻ�3)+abs(�ϻ�3-�ϻ�4)+abs(�ϻ�4-�ϻ�5)+abs(�ϻ�5-�ϻ�6)+abs(�ϻ�6-�ϻ�7)+abs(�ϻ�7-�ϻ�8) as abs�ϻ�,
    abs(�Ǿ�1-�Ǿ�2)+abs(�Ǿ�2-�Ǿ�3)+abs(�Ǿ�3-�Ǿ�4)+abs(�Ǿ�4-�Ǿ�5)+abs(�Ǿ�5-�Ǿ�6)+abs(�Ǿ�6-�Ǿ�7)+abs(�Ǿ�7-�Ǿ�8) as abs�Ǿ�,
    abs(����1-����2)+abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7)+abs(����7-����8) as abs����,
    abs(������1-������2)+abs(������2-������3)+abs(������3-������4)+abs(������4-������5)+abs(������5-������6)+abs(������6-������7)+abs(������7-������8) as abs������,
    abs(����1-����2)+abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7)+abs(����7-����8) as abs����,
    abs(�Ƿ�1-�Ƿ�2)+abs(�Ƿ�2-�Ƿ�3)+abs(�Ƿ�3-�Ƿ�4)+abs(�Ƿ�4-�Ƿ�5)+abs(�Ƿ�5-�Ƿ�6)+abs(�Ƿ�6-�Ƿ�7)+abs(�Ƿ�7-�Ƿ�8) as abs�Ƿ�,
    abs(����������1-����������2)+abs(����������2-����������3)+abs(����������3-����������4)+abs(����������4-����������5)+abs(����������5-����������6)+abs(����������6-����������7)+abs(����������7-����������8) as abs����������,
    abs(�м���ȭ1-�м���ȭ2)+abs(�м���ȭ2-�м���ȭ3)+abs(�м���ȭ3-�м���ȭ4)+abs(�м���ȭ4-�м���ȭ5)+abs(�м���ȭ5-�м���ȭ6)+abs(�м���ȭ6-�м���ȭ7)+abs(�м���ȭ7-�м���ȭ8) as abs�м���ȭ,
    abs(��ǰ1-��ǰ2)+abs(��ǰ2-��ǰ3)+abs(��ǰ3-��ǰ4)+abs(��ǰ4-��ǰ5)+abs(��ǰ5-��ǰ6)+abs(��ǰ6-��ǰ7)+abs(��ǰ7-��ǰ8) as abs��ǰ,
    abs(��Ÿ1-��Ÿ2)+abs(��Ÿ2-��Ÿ3)+abs(��Ÿ3-��Ÿ4)+abs(��Ÿ4-��Ÿ5)+abs(��Ÿ5-��Ÿ6)+abs(��Ÿ6-��Ÿ7)+abs(��Ÿ7-��Ÿ8) as abs��Ÿ,
    
    -(����q14_1 - ����q15_4),
    -(�ż�q14_1 - �ż�q15_4),
    -(�ϻ�q14_1 - �ϻ�q15_4),
    -(�Ǿ�q14_1 - �Ǿ�q15_4),
    -(����q14_1 - ����q15_4),
    -(������q14_1 - ������q15_4),
    -(����q14_1 - ����q15_4),
    -(�Ƿ�q14_1 - �Ƿ�q15_4),
    -(����������q14_1 - ����������q15_4),
    -(�м���ȭq14_1 - �м���ȭq15_4),
    -(��ǰq14_1 - ��ǰq15_4),
    -(��Ÿq14_1 - ��Ÿq15_4)
            
from pro_pur5;

--master
select *
from demo
order by ����ȣ;

drop table company;
create table company as
select ����ȣ,
    count(case when ���޻� = 'A' then ���޻� end) as useA,
    count(case when ���޻� = 'B' then ���޻� end) as useB,
    count(case when ���޻� = 'C' then ���޻� end) as useC,
    count(case when ���޻� = 'D' then ���޻� end) as useD,
    CASE
        WHEN count(case when ���޻� = 'A' then ���޻� end) >
             count(case when ���޻� = 'B' then ���޻� end) AND
             count(case when ���޻� = 'A' then ���޻� end) >
             count(case when ���޻� = 'C' then ���޻� end) AND
             count(case when ���޻� = 'A' then ���޻� end) >
             count(case when ���޻� = 'D' then ���޻� end)
        THEN 'A'
        
        WHEN count(case when ���޻� = 'B' then ���޻� end) >
             count(case when ���޻� = 'A' then ���޻� end) AND
             count(case when ���޻� = 'B' then ���޻� end) >
             count(case when ���޻� = 'C' then ���޻� end) AND
             count(case when ���޻� = 'B' then ���޻� end) >
             count(case when ���޻� = 'D' then ���޻� end)
        THEN 'b'
    
        WHEN count(case when ���޻� = 'C' then ���޻� end) >
             count(case when ���޻� = 'A' then ���޻� end) AND
             count(case when ���޻� = 'C' then ���޻� end) >
             count(case when ���޻� = 'B' then ���޻� end) AND
             count(case when ���޻� = 'C' then ���޻� end) >
             count(case when ���޻� = 'D' then ���޻� end)
        THEN 'C'
        
        WHEN count(case when ���޻� = 'D' then ���޻� end) >
             count(case when ���޻� = 'A' then ���޻� end) AND
             count(case when ���޻� = 'D' then ���޻� end) >
             count(case when ���޻� = 'B' then ���޻� end) AND
             count(case when ���޻� = 'D' then ���޻� end) >
             count(case when ���޻� = 'C' then ���޻� end)
        THEN 'D'
    end as ��ȣ���޻�
from purprod0
group by ����ȣ
order by ����ȣ;

select * from company;

select distinct d.��������
from demo d
join company c on d.����ȣ = c.����ȣ;

select d.����ȣ, nvl(d.��������, 0), c.��ȣ���޻�
from demo d
join company c on d.����ȣ = c.����ȣ
where nvl(d.��������, 0) = 0
order by d.��������;

select ����ȣ, ����, ���ɴ�, ��������,
    case 
        when ���ɴ� in ('19������', '20��~24��', '25��~29��') then 'û����'
        when ���ɴ� in ('30��~34��', '35��~39��', '40��~44��', '45��~49��') then '�߳���'
        when ���ɴ� in ('50��~54��', '55��~59��', '60���̻�') then '�����'
    end as ���ɴ�з�
from demo;

drop table mastertable;
create table mastertable as
SELECT d.����ȣ, d.����, 
    case 
        when ���ɴ� in ('19������', '20��~24��', '25��~29��') then 'û����'
        when ���ɴ� in ('30��~34��', '35��~39��', '40��~44��', '45��~49��') then '�߳���'
        when ���ɴ� in ('50��~54��', '55��~59��', '60���̻�') then '�����'
    end as ���ɴ�з�,
    
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.�ż�q14_1, p.�ż�q14_2, p.�ż�q14_3, p.�ż�q14_4, p.�ż�q15_1, p.�ż�q15_2, p.�ż�q15_3, p.�ż�q15_4,
    p.�ϻ�q14_1, p.�ϻ�q14_2, p.�ϻ�q14_3, p.�ϻ�q14_4, p.�ϻ�q15_1, p.�ϻ�q15_2, p.�ϻ�q15_3, p.�ϻ�q15_4,
    p.�Ǿ�q14_1, p.�Ǿ�q14_2, p.�Ǿ�q14_3, p.�Ǿ�q14_4, p.�Ǿ�q15_1, p.�Ǿ�q15_2, p.�Ǿ�q15_3, p.�Ǿ�q15_4,
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.������q14_1, p.������q14_2, p.������q14_3, p.������q14_4, p.������q15_1, p.������q15_2, p.������q15_3, p.������q15_4,
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.�Ƿ�q14_1, p.�Ƿ�q14_2, p.�Ƿ�q14_3, p.�Ƿ�q14_4, p.�Ƿ�q15_1, p.�Ƿ�q15_2, p.�Ƿ�q15_3, p.�Ƿ�q15_4,
    p.����������q14_1, p.����������q14_2, p.����������q14_3, p.����������q14_4, p.����������q15_1, p.����������q15_2, p.����������q15_3, p.����������q15_4,
    p.�м���ȭq14_1, p.�м���ȭq14_2, p.�м���ȭq14_3, p.�м���ȭq14_4, p.�м���ȭq15_1, p.�м���ȭq15_2, p.�м���ȭq15_3, p.�м���ȭq15_4,
    p.��ǰq14_1, p.��ǰq14_2, p.��ǰq14_3, p.��ǰq14_4, p.��ǰq15_1, p.��ǰq15_2, p.��ǰq15_3, p.��ǰq15_4,
    p.��Ÿq14_1, p.��Ÿq14_2, p.��Ÿq14_3, p.��Ÿq14_4, p.��Ÿq15_1, p.��Ÿq15_2, p.��Ÿq15_3, p.��Ÿq15_4,
    p.����1, p.����2, p.����3, p.����4, p.����5, p.����6, p.����7, p.����8,
    p.�ż�1, p.�ż�2, p.�ż�3, p.�ż�4, p.�ż�5, p.�ż�6, p.�ż�7, p.�ż�8,
    p.�ϻ�1, p.�ϻ�2, p.�ϻ�3, p.�ϻ�4, p.�ϻ�5, p.�ϻ�6, p.�ϻ�7, p.�ϻ�8,
    p.�Ǿ�1, p.�Ǿ�2, p.�Ǿ�3, p.�Ǿ�4, p.�Ǿ�5, p.�Ǿ�6, p.�Ǿ�7, p.�Ǿ�8,
    p.����1, p.����2, p.����3, p.����4, p.����5, p.����6, p.����7, p.����8,
    p.������1, p.������2, p.������3, p.������4, p.������5, p.������6, p.������7, p.������8,
    p.����1, p.����2, p.����3, p.����4, p.����5, p.����6, p.����7, p.����8,
    p.�Ƿ�1, p.�Ƿ�2, p.�Ƿ�3, p.�Ƿ�4, p.�Ƿ�5, p.�Ƿ�6, p.�Ƿ�7, p.�Ƿ�8,
    p.����������1, p.����������2, p.����������3, p.����������4, p.����������5, p.����������6, p.����������7, p.����������8,
    p.�м���ȭ1, p.�м���ȭ2, p.�м���ȭ3, p.�м���ȭ4, p.�м���ȭ5, p.�м���ȭ6, p.�м���ȭ7, p.�м���ȭ8,
    p.��ǰ1, p.��ǰ2, p.��ǰ3, p.��ǰ4, p.��ǰ5, p.��ǰ6, p.��ǰ7, p.��ǰ8,
    p.��Ÿ1, p.��Ÿ2, p.��Ÿ3, p.��Ÿ4, p.��Ÿ5, p.��Ÿ6, p.��Ÿ7, p.��Ÿ8
    
FROM demo d
JOIN pro_pur5 p ON d.����ȣ = p.����ȣ
ORDER BY d.����ȣ;

select * from mastertable;

SELECT ����ȣ,
     min(to_date('2016-01-01', 'YYYY-MM-DD') - to_date(�������� , 'YYYY-MM-DD')) as �ֱٱ�������
FROM purprod0 
group by ����ȣ
order by ����ȣ;

drop table mastertable1;
create table mastertable1 as
select m.����ȣ, m.����, m.���ɴ�з�,
    m.����q14_1, m.����q14_2, m.����q14_3, m.����q14_4, m.����q15_1, m.����q15_2, m.����q15_3, m.����q15_4,
    m.�ż�q14_1, m.�ż�q14_2, m.�ż�q14_3, m.�ż�q14_4, m.�ż�q15_1, m.�ż�q15_2, m.�ż�q15_3, m.�ż�q15_4,
    m.�ϻ�q14_1, m.�ϻ�q14_2, m.�ϻ�q14_3, m.�ϻ�q14_4, m.�ϻ�q15_1, m.�ϻ�q15_2, m.�ϻ�q15_3, m.�ϻ�q15_4,
    m.�Ǿ�q14_1, m.�Ǿ�q14_2, m.�Ǿ�q14_3, m.�Ǿ�q14_4, m.�Ǿ�q15_1, m.�Ǿ�q15_2, m.�Ǿ�q15_3, m.�Ǿ�q15_4,
    m.����q14_1, m.����q14_2, m.����q14_3, m.����q14_4, m.����q15_1, m.����q15_2, m.����q15_3, m.����q15_4,
    m.������q14_1, m.������q14_2, m.������q14_3, m.������q14_4, m.������q15_1, m.������q15_2, m.������q15_3, m.������q15_4,
    m.����q14_1, m.����q14_2, m.����q14_3, m.����q14_4, m.����q15_1, m.����q15_2, m.����q15_3, m.����q15_4,
    m.�Ƿ�q14_1, m.�Ƿ�q14_2, m.�Ƿ�q14_3, m.�Ƿ�q14_4, m.�Ƿ�q15_1, m.�Ƿ�q15_2, m.�Ƿ�q15_3, m.�Ƿ�q15_4,
    m.����������q14_1, m.����������q14_2, m.����������q14_3, m.����������q14_4, m.����������q15_1, m.����������q15_2, m.����������q15_3, m.����������q15_4,
    m.�м���ȭq14_1, m.�м���ȭq14_2, m.�м���ȭq14_3, m.�м���ȭq14_4, m.�м���ȭq15_1, m.�м���ȭq15_2, m.�м���ȭq15_3, m.�м���ȭq15_4,
    m.��ǰq14_1, m.��ǰq14_2, m.��ǰq14_3, m.��ǰq14_4, m.��ǰq15_1, m.��ǰq15_2, m.��ǰq15_3, m.��ǰq15_4,
    m.��Ÿq14_1, m.��Ÿq14_2, m.��Ÿq14_3, m.��Ÿq14_4, m.��Ÿq15_1, m.��Ÿq15_2, m.��Ÿq15_3, m.��Ÿq15_4,
    m.����1, m.����2, m.����3, m.����4, m.����5, m.����6, m.����7, m.����8,
    m.�ż�1, m.�ż�2, m.�ż�3, m.�ż�4, m.�ż�5, m.�ż�6, m.�ż�7, m.�ż�8,
    m.�ϻ�1, m.�ϻ�2, m.�ϻ�3, m.�ϻ�4, m.�ϻ�5, m.�ϻ�6, m.�ϻ�7, m.�ϻ�8,
    m.�Ǿ�1, m.�Ǿ�2, m.�Ǿ�3, m.�Ǿ�4, m.�Ǿ�5, m.�Ǿ�6, m.�Ǿ�7, m.�Ǿ�8,
    m.����1, m.����2, m.����3, m.����4, m.����5, m.����6, m.����7, m.����8,
    m.������1, m.������2, m.������3, m.������4, m.������5, m.������6, m.������7, m.������8,
    m.����1, m.����2, m.����3, m.����4, m.����5, m.����6, m.����7, m.����8,
    m.�Ƿ�1, m.�Ƿ�2, m.�Ƿ�3, m.�Ƿ�4, m.�Ƿ�5, m.�Ƿ�6, m.�Ƿ�7, m.�Ƿ�8,
    m.����������1, m.����������2, m.����������3, m.����������4, m.����������5, m.����������6, m.����������7, m.����������8,
    m.�м���ȭ1, m.�м���ȭ2, m.�м���ȭ3, m.�м���ȭ4, m.�м���ȭ5, m.�м���ȭ6, m.�м���ȭ7, m.�м���ȭ8,
    m.��ǰ1, m.��ǰ2, m.��ǰ3, m.��ǰ4, m.��ǰ5, m.��ǰ6, m.��ǰ7, m.��ǰ8,
    m.��Ÿ1, m.��Ÿ2, m.��Ÿ3, m.��Ÿ4, m.��Ÿ5, m.��Ÿ6, m.��Ÿ7, m.��Ÿ8,
    
    min(to_date('2016-01-01', 'YYYY-MM-DD') - to_date(p.�������� , 'YYYY-MM-DD')) as ���ڰ���
    
from mastertable m
join purprod0 p on m.����ȣ = p.����ȣ
group by m.����ȣ, m.����, m.���ɴ�з�,
    m.����q14_1, m.����q14_2, m.����q14_3, m.����q14_4, m.����q15_1, m.����q15_2, m.����q15_3, m.����q15_4,
    m.�ż�q14_1, m.�ż�q14_2, m.�ż�q14_3, m.�ż�q14_4, m.�ż�q15_1, m.�ż�q15_2, m.�ż�q15_3, m.�ż�q15_4,
    m.�ϻ�q14_1, m.�ϻ�q14_2, m.�ϻ�q14_3, m.�ϻ�q14_4, m.�ϻ�q15_1, m.�ϻ�q15_2, m.�ϻ�q15_3, m.�ϻ�q15_4,
    m.�Ǿ�q14_1, m.�Ǿ�q14_2, m.�Ǿ�q14_3, m.�Ǿ�q14_4, m.�Ǿ�q15_1, m.�Ǿ�q15_2, m.�Ǿ�q15_3, m.�Ǿ�q15_4,
    m.����q14_1, m.����q14_2, m.����q14_3, m.����q14_4, m.����q15_1, m.����q15_2, m.����q15_3, m.����q15_4,
    m.������q14_1, m.������q14_2, m.������q14_3, m.������q14_4, m.������q15_1, m.������q15_2, m.������q15_3, m.������q15_4,
    m.����q14_1, m.����q14_2, m.����q14_3, m.����q14_4, m.����q15_1, m.����q15_2, m.����q15_3, m.����q15_4,
    m.�Ƿ�q14_1, m.�Ƿ�q14_2, m.�Ƿ�q14_3, m.�Ƿ�q14_4, m.�Ƿ�q15_1, m.�Ƿ�q15_2, m.�Ƿ�q15_3, m.�Ƿ�q15_4,
    m.����������q14_1, m.����������q14_2, m.����������q14_3, m.����������q14_4, m.����������q15_1, m.����������q15_2, m.����������q15_3, m.����������q15_4,
    m.�м���ȭq14_1, m.�м���ȭq14_2, m.�м���ȭq14_3, m.�м���ȭq14_4, m.�м���ȭq15_1, m.�м���ȭq15_2, m.�м���ȭq15_3, m.�м���ȭq15_4,
    m.��ǰq14_1, m.��ǰq14_2, m.��ǰq14_3, m.��ǰq14_4, m.��ǰq15_1, m.��ǰq15_2, m.��ǰq15_3, m.��ǰq15_4,
    m.��Ÿq14_1, m.��Ÿq14_2, m.��Ÿq14_3, m.��Ÿq14_4, m.��Ÿq15_1, m.��Ÿq15_2, m.��Ÿq15_3, m.��Ÿq15_4,
    m.����1, m.����2, m.����3, m.����4, m.����5, m.����6, m.����7, m.����8,
    m.�ż�1, m.�ż�2, m.�ż�3, m.�ż�4, m.�ż�5, m.�ż�6, m.�ż�7, m.�ż�8,
    m.�ϻ�1, m.�ϻ�2, m.�ϻ�3, m.�ϻ�4, m.�ϻ�5, m.�ϻ�6, m.�ϻ�7, m.�ϻ�8,
    m.�Ǿ�1, m.�Ǿ�2, m.�Ǿ�3, m.�Ǿ�4, m.�Ǿ�5, m.�Ǿ�6, m.�Ǿ�7, m.�Ǿ�8,
    m.����1, m.����2, m.����3, m.����4, m.����5, m.����6, m.����7, m.����8,
    m.������1, m.������2, m.������3, m.������4, m.������5, m.������6, m.������7, m.������8,
    m.����1, m.����2, m.����3, m.����4, m.����5, m.����6, m.����7, m.����8,
    m.�Ƿ�1, m.�Ƿ�2, m.�Ƿ�3, m.�Ƿ�4, m.�Ƿ�5, m.�Ƿ�6, m.�Ƿ�7, m.�Ƿ�8,
    m.����������1, m.����������2, m.����������3, m.����������4, m.����������5, m.����������6, m.����������7, m.����������8,
    m.�м���ȭ1, m.�м���ȭ2, m.�м���ȭ3, m.�м���ȭ4, m.�м���ȭ5, m.�м���ȭ6, m.�м���ȭ7, m.�м���ȭ8,
    m.��ǰ1, m.��ǰ2, m.��ǰ3, m.��ǰ4, m.��ǰ5, m.��ǰ6, m.��ǰ7, m.��ǰ8,
    m.��Ÿ1, m.��Ÿ2, m.��Ÿ3, m.��Ÿ4, m.��Ÿ5, m.��Ÿ6, m.��Ÿ7, m.��Ÿ8 
order by m.����ȣ;

select * from mastertable1;



--train test
drop table train;
create table train as
select ����ȣ, ����, ���ɴ�з�,
    ����1 - ����6 as ������ȭ,
    �ż�1 - �ż�6 as �ż���ȭ,
    �ϻ�1 - �ϻ�6 as �ϻ�ȭ,
    �Ǿ�1 - �Ǿ�6 as �Ǿຯȭ,
    ����1 - ����6 as ������ȭ,
    ������1 - ������6 as �����к�ȭ,
    ����1 - ����6 as ������ȭ,
    �Ƿ�1 - �Ƿ�6 as �Ƿ���ȭ,
    ����������1 - ����������6 as ������������ȭ,
    �м���ȭ1 - �м���ȭ6 as �м���ȭ��ȭ,
    ��ǰ1 - ��ǰ6 as ��ǰ��ȭ,
    ��Ÿ1 - ��Ÿ6 as ��Ÿ��ȭ,
    
    abs(����1-����2)+abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6) as abs����,
    abs(�ż�1-�ż�2)+abs(�ż�2-�ż�3)+abs(�ż�3-�ż�4)+abs(�ż�4-�ż�5)+abs(�ż�5-�ż�6) as abs�ż�,
    abs(�ϻ�1-�ϻ�2)+abs(�ϻ�2-�ϻ�3)+abs(�ϻ�3-�ϻ�4)+abs(�ϻ�4-�ϻ�5)+abs(�ϻ�5-�ϻ�6) as abs�ϻ�,
    abs(�Ǿ�1-�Ǿ�2)+abs(�Ǿ�2-�Ǿ�3)+abs(�Ǿ�3-�Ǿ�4)+abs(�Ǿ�4-�Ǿ�5)+abs(�Ǿ�5-�Ǿ�6) as abs�Ǿ�,
    abs(����1-����2)+abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6) as abs����,
    abs(������1-������2)+abs(������2-������3)+abs(������3-������4)+abs(������4-������5)+abs(������5-������6) as abs������,
    abs(����1-����2)+abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6) as abs����,
    abs(�Ƿ�1-�Ƿ�2)+abs(�Ƿ�2-�Ƿ�3)+abs(�Ƿ�3-�Ƿ�4)+abs(�Ƿ�4-�Ƿ�5)+abs(�Ƿ�5-�Ƿ�6) as abs�Ƿ�,
    abs(����������1-����������2)+abs(����������2-����������3)+abs(����������3-����������4)+abs(����������4-����������5)+abs(����������5-����������6) as abs����������,
    abs(�м���ȭ1-�м���ȭ2)+abs(�м���ȭ2-�м���ȭ3)+abs(�м���ȭ3-�м���ȭ4)+abs(�м���ȭ4-�м���ȭ5)+abs(�м���ȭ5-�м���ȭ6) as abs�м���ȭ,
    abs(��ǰ1-��ǰ2)+abs(��ǰ2-��ǰ3)+abs(��ǰ3-��ǰ4)+abs(��ǰ4-��ǰ5)+abs(��ǰ5-��ǰ6) as abs��ǰ,
    abs(��Ÿ1-��Ÿ2)+abs(��Ÿ2-��Ÿ3)+abs(��Ÿ3-��Ÿ4)+abs(��Ÿ4-��Ÿ5)+abs(��Ÿ5-��Ÿ6) as abs��Ÿ,
    
    -(����q14_1 - ����q15_2) as ������ȭ�ݾ�,
    -(�ż�q14_1 - �ż�q15_2) as �ż���ȭ�ݾ�,
    -(�ϻ�q14_1 - �ϻ�q15_2) as �ϻ�ȭ�ݾ�,
    -(�Ǿ�q14_1 - �Ǿ�q15_2) as �Ǿຯȭ�ݾ�,
    -(����q14_1 - ����q15_2) as ������ȭ�ݾ�,
    -(������q14_1 - ������q15_2) as �����к�ȭ�ݾ�,
    -(����q14_1 - ����q15_2) as ������ȭ�ݾ�,
    -(�Ƿ�q14_1 - �Ƿ�q15_2) as �Ƿ���ȭ�ݾ�,
    -(����������q14_1 - ����������q15_2) as ������������ȭ�ݾ�,
    -(�м���ȭq14_1 - �м���ȭq15_2) as �м���ȭ��ȭ�ݾ�,
    -(��ǰq14_1 - ��ǰq15_2) as ��ǰ��ȭ�ݾ�,
    -(��Ÿq14_1 - ��Ÿq15_2) as ��Ÿ��ȭ�ݾ�
    
from mastertable;


drop table test;
create table test as
select ����ȣ, ����, ���ɴ�з�,
    ����2 - ����7 as ������ȭ,
    �ż�2 - �ż�7 as �ż���ȭ,
    �ϻ�2 - �ϻ�7 as �ϻ�ȭ,
    �Ǿ�2 - �Ǿ�7 as �Ǿຯȭ,
    ����2 - ����7 as ������ȭ,
    ������2 - ������7 as �����к�ȭ,
    ����2 - ����7 as ������ȭ,
    �Ƿ�2 - �Ƿ�7 as �Ƿ���ȭ,
    ����������2 - ����������7 as ������������ȭ,
    �м���ȭ2 - �м���ȭ7 as �м���ȭ��ȭ,
    ��ǰ2 - ��ǰ7 as ��ǰ��ȭ,
    ��Ÿ2 - ��Ÿ7 as ��Ÿ��ȭ,
    
    abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7) as abs����,
    abs(�ż�2-�ż�3)+abs(�ż�3-�ż�4)+abs(�ż�4-�ż�5)+abs(�ż�5-�ż�6)+abs(�ż�6-�ż�7) as abs�ż�,
    abs(�ϻ�2-�ϻ�3)+abs(�ϻ�3-�ϻ�4)+abs(�ϻ�4-�ϻ�5)+abs(�ϻ�5-�ϻ�6)+abs(�ϻ�6-�ϻ�7) as abs�ϻ�,
    abs(�Ǿ�2-�Ǿ�3)+abs(�Ǿ�3-�Ǿ�4)+abs(�Ǿ�4-�Ǿ�5)+abs(�Ǿ�5-�Ǿ�6)+abs(�Ǿ�6-�Ǿ�7) as abs�Ǿ�,
    abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7) as abs����,
    abs(������2-������3)+abs(������3-������4)+abs(������4-������5)+abs(������5-������6) as abs������,
    abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7) as abs����,
    abs(�Ƿ�2-�Ƿ�3)+abs(�Ƿ�3-�Ƿ�4)+abs(�Ƿ�4-�Ƿ�5)+abs(�Ƿ�5-�Ƿ�6)+abs(�Ƿ�6-�Ƿ�7) as abs�Ƿ�,
    abs(����������3-����������4)+abs(����������4-����������5)+abs(����������5-����������6)+abs(����������6-����������7) as abs����������,
    abs(�м���ȭ2-�м���ȭ3)+abs(�м���ȭ3-�м���ȭ4)+abs(�м���ȭ4-�м���ȭ5)+abs(�м���ȭ5-�м���ȭ6)+abs(�м���ȭ6-�м���ȭ7) as abs�м���ȭ,
    abs(��ǰ2-��ǰ3)+abs(��ǰ3-��ǰ4)+abs(��ǰ4-��ǰ5)+abs(��ǰ5-��ǰ6)+abs(��ǰ6-��ǰ7) as abs��ǰ,
    abs(��Ÿ2-��Ÿ3)+abs(��Ÿ3-��Ÿ4)+abs(��Ÿ4-��Ÿ5)+abs(��Ÿ5-��Ÿ6)+abs(��Ÿ6-��Ÿ7) as abs��Ÿ,
    
    -(����q14_2 - ����q15_3) as ������ȭ�ݾ�,
    -(�ż�q14_2 - �ż�q15_3) as �ż���ȭ�ݾ�,
    -(�ϻ�q14_2 - �ϻ�q15_3) as �ϻ�ȭ�ݾ�,
    -(�Ǿ�q14_2 - �Ǿ�q15_3) as �Ǿຯȭ�ݾ�,
    -(����q14_2 - ����q15_3) as ������ȭ�ݾ�,
    -(������q14_2 - ������q15_3) as �����к�ȭ�ݾ�,
    -(����q14_2 - ����q15_3) as ������ȭ�ݾ�,
    -(�Ƿ�q14_2 - �Ƿ�q15_3) as �Ƿ���ȭ�ݾ�,
    -(����������q14_2 - ����������q15_3) as ������������ȭ�ݾ�,
    -(�м���ȭq14_2 - �м���ȭq15_3) as �м���ȭ��ȭ�ݾ�,
    -(��ǰq14_2 - ��ǰq15_3) as ��ǰ��ȭ�ݾ�,
    -(��Ÿq14_2 - ��Ÿq15_3) as ��Ÿ��ȭ�ݾ�

from mastertable;

select * from train;
select * from test;

drop table train1;
create table train1 as
select t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ,
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�,
    
    ntile(10) over (order by min(case when p.�������� between 20140101 and 20150630 then
    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(p.�������� , 'YYYY-MM-DD') end) desc) as r,
    ntile(10) over (order by count(p.����ȣ)) as f,
    ntile(10) over (order by sum(p.������)) as m,
    
   case when (nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0) -
    nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0)) < 0 
    then 1 else 0 end as label
        
from train t
join purprod0 p on t.����ȣ = p.����ȣ
group by t.����ȣ, t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�
order by t.����ȣ;

drop table test1;
create table test1 as
select  t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ,
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�,
    
    ntile(10) over (order by min(case when p.�������� between 20140401 and 20150930 then
    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(p.�������� , 'YYYY-MM-DD') end) desc) as r,
    ntile(10) over (order by count(p.����ȣ)) as f,
    ntile(10) over (order by sum(p.������)) as m,
    
    case when (nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0) -
    nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0)) < 0 
    then 1 else 0 end as label
    
from test t
join purprod0 p on t.����ȣ = p.����ȣ
group by t.����ȣ, t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�
order by t.����ȣ;

select * from train1;
select * from test1;

drop table pro_pur6;
create table pro_pur6 as
select ����ȣ, 
    ����q14_1, ����q14_2, ����q14_3, ����q14_4, ����q15_1, ����q15_2, ����q15_3, ����q15_4,
    �ż�q14_1, �ż�q14_2, �ż�q14_3, �ż�q14_4, �ż�q15_1, �ż�q15_2, �ż�q15_3, �ż�q15_4,
    �ϻ�q14_1, �ϻ�q14_2, �ϻ�q14_3, �ϻ�q14_4, �ϻ�q15_1, �ϻ�q15_2, �ϻ�q15_3, �ϻ�q15_4,
    �Ǿ�q14_1, �Ǿ�q14_2, �Ǿ�q14_3, �Ǿ�q14_4, �Ǿ�q15_1, �Ǿ�q15_2, �Ǿ�q15_3, �Ǿ�q15_4,
    ����q14_1, ����q14_2, ����q14_3, ����q14_4, ����q15_1, ����q15_2, ����q15_3, ����q15_4,
    ������q14_1, ������q14_2, ������q14_3, ������q14_4, ������q15_1, ������q15_2, ������q15_3, ������q15_4,
    ����q14_1, ����q14_2, ����q14_3, ����q14_4, ����q15_1, ����q15_2, ����q15_3, ����q15_4,
    �Ƿ�q14_1, �Ƿ�q14_2, �Ƿ�q14_3, �Ƿ�q14_4, �Ƿ�q15_1, �Ƿ�q15_2, �Ƿ�q15_3, �Ƿ�q15_4,
    ����������q14_1, ����������q14_2, ����������q14_3, ����������q14_4, ����������q15_1, ����������q15_2, ����������q15_3, ����������q15_4,
    �м���ȭq14_1, �м���ȭq14_2, �м���ȭq14_3, �м���ȭq14_4, �м���ȭq15_1, �м���ȭq15_2, �м���ȭq15_3, �м���ȭq15_4,
    ��ǰq14_1, ��ǰq14_2, ��ǰq14_3, ��ǰq14_4, ��ǰq15_1, ��ǰq15_2, ��ǰq15_3, ��ǰq15_4,
    ��Ÿq14_1, ��Ÿq14_2, ��Ÿq14_3, ��Ÿq14_4, ��Ÿq15_1, ��Ÿq15_2, ��Ÿq15_3, ��Ÿq15_4,
    
    case when ����q14_1 <> 0 then ntile(10) over (order by ����q14_1 desc) else 10 end as ����1,
    case when ����q14_2 <> 0 then ntile(10) over (order by ����q14_2 desc) else 10 end as ����2,
    case when ����q14_3 <> 0 then ntile(10) over (order by ����q14_3 desc) else 10 end as ����3,
    case when ����q14_4 <> 0 then ntile(10) over (order by ����q14_4 desc) else 10 end as ����4,
    case when ����q15_1 <> 0 then ntile(10) over (order by ����q15_1 desc) else 10 end as ����5,
    case when ����q15_2 <> 0 then ntile(10) over (order by ����q15_2 desc) else 10 end as ����6,
    case when ����q15_3 <> 0 then ntile(10) over (order by ����q15_3 desc) else 10 end as ����7,
    case when ����q15_4 <> 0 then ntile(10) over (order by ����q15_4 desc) else 10 end as ����8,
    
    case when �ż�q14_1 <> 0 then ntile(10) over (order by �ż�q14_1 desc) else 10 end as �ż�1,
    case when �ż�q14_2 <> 0 then ntile(10) over (order by �ż�q14_2 desc) else 10 end as �ż�2,
    case when �ż�q14_3 <> 0 then ntile(10) over (order by �ż�q14_3 desc) else 10 end as �ż�3,
    case when �ż�q14_4 <> 0 then ntile(10) over (order by �ż�q14_4 desc) else 10 end as �ż�4,
    case when �ż�q15_1 <> 0 then ntile(10) over (order by �ż�q15_1 desc) else 10 end as �ż�5,
    case when �ż�q15_2 <> 0 then ntile(10) over (order by �ż�q15_2 desc) else 10 end as �ż�6,
    case when �ż�q15_3 <> 0 then ntile(10) over (order by �ż�q15_3 desc) else 10 end as �ż�7,
    case when �ż�q15_4 <> 0 then ntile(10) over (order by �ż�q15_4 desc) else 10 end as �ż�8,
    
    case when �ϻ�q14_1 <> 0 then ntile(10) over (order by �ϻ�q14_1 desc) else 10 end as �ϻ�1,
    case when �ϻ�q14_2 <> 0 then ntile(10) over (order by �ϻ�q14_2 desc) else 10 end as �ϻ�2,
    case when �ϻ�q14_3 <> 0 then ntile(10) over (order by �ϻ�q14_3 desc) else 10 end as �ϻ�3,
    case when �ϻ�q14_4 <> 0 then ntile(10) over (order by �ϻ�q14_4 desc) else 10 end as �ϻ�4,
    case when �ϻ�q15_1 <> 0 then ntile(10) over (order by �ϻ�q15_1 desc) else 10 end as �ϻ�5,
    case when �ϻ�q15_2 <> 0 then ntile(10) over (order by �ϻ�q15_2 desc) else 10 end as �ϻ�6,
    case when �ϻ�q15_3 <> 0 then ntile(10) over (order by �ϻ�q15_3 desc) else 10 end as �ϻ�7,
    case when �ϻ�q15_4 <> 0 then ntile(10) over (order by �ϻ�q15_4 desc) else 10 end as �ϻ�8,
    
    case when �Ǿ�q14_1 <> 0 then ntile(10) over (order by �Ǿ�q14_1 desc) else 10 end as �Ǿ�1,
    case when �Ǿ�q14_2 <> 0 then ntile(10) over (order by �Ǿ�q14_2 desc) else 10 end as �Ǿ�2,
    case when �Ǿ�q14_3 <> 0 then ntile(10) over (order by �Ǿ�q14_3 desc) else 10 end as �Ǿ�3,
    case when �Ǿ�q14_4 <> 0 then ntile(10) over (order by �Ǿ�q14_4 desc) else 10 end as �Ǿ�4,
    case when �Ǿ�q15_1 <> 0 then ntile(10) over (order by �Ǿ�q15_1 desc) else 10 end as �Ǿ�5,
    case when �Ǿ�q15_2 <> 0 then ntile(10) over (order by �Ǿ�q15_2 desc) else 10 end as �Ǿ�6,
    case when �Ǿ�q15_3 <> 0 then ntile(10) over (order by �Ǿ�q15_3 desc) else 10 end as �Ǿ�7,
    case when �Ǿ�q15_4 <> 0 then ntile(10) over (order by �Ǿ�q15_4 desc) else 10 end as �Ǿ�8,
    
    case when ����q14_1 <> 0 then ntile(10) over (order by ����q14_1 desc) else 10 end as ����1,
    case when ����q14_2 <> 0 then ntile(10) over (order by ����q14_2 desc) else 10 end as ����2,
    case when ����q14_3 <> 0 then ntile(10) over (order by ����q14_3 desc) else 10 end as ����3,
    case when ����q14_4 <> 0 then ntile(10) over (order by ����q14_4 desc) else 10 end as ����4,
    case when ����q15_1 <> 0 then ntile(10) over (order by ����q15_1 desc) else 10 end as ����5,
    case when ����q15_2 <> 0 then ntile(10) over (order by ����q15_2 desc) else 10 end as ����6,
    case when ����q15_3 <> 0 then ntile(10) over (order by ����q15_3 desc) else 10 end as ����7,
    case when ����q15_4 <> 0 then ntile(10) over (order by ����q15_4 desc) else 10 end as ����8,
    
    case when ������q14_1 <> 0 then ntile(10) over (order by ������q14_1 desc) else 10 end as ������1,
    case when ������q14_2 <> 0 then ntile(10) over (order by ������q14_2 desc) else 10 end as ������2,
    case when ������q14_3 <> 0 then ntile(10) over (order by ������q14_3 desc) else 10 end as ������3,
    case when ������q14_4 <> 0 then ntile(10) over (order by ������q14_4 desc) else 10 end as ������4,
    case when ������q15_1 <> 0 then ntile(10) over (order by ������q15_1 desc) else 10 end as ������5,
    case when ������q15_2 <> 0 then ntile(10) over (order by ������q15_2 desc) else 10 end as ������6,
    case when ������q15_3 <> 0 then ntile(10) over (order by ������q15_3 desc) else 10 end as ������7,
    case when ������q15_4 <> 0 then ntile(10) over (order by ������q15_4 desc) else 10 end as ������8,
    
    case when ����q14_1 <> 0 then ntile(10) over (order by ����q14_1 desc) else 10 end as ����1,
    case when ����q14_2 <> 0 then ntile(10) over (order by ����q14_2 desc) else 10 end as ����2,
    case when ����q14_3 <> 0 then ntile(10) over (order by ����q14_3 desc) else 10 end as ����3,
    case when ����q14_4 <> 0 then ntile(10) over (order by ����q14_4 desc) else 10 end as ����4,
    case when ����q15_1 <> 0 then ntile(10) over (order by ����q15_1 desc) else 10 end as ����5,
    case when ����q15_2 <> 0 then ntile(10) over (order by ����q15_2 desc) else 10 end as ����6,
    case when ����q15_3 <> 0 then ntile(10) over (order by ����q15_3 desc) else 10 end as ����7,
    case when ����q15_4 <> 0 then ntile(10) over (order by ����q15_4 desc) else 10 end as ����8,
    
    case when �Ƿ�q14_1 <> 0 then ntile(10) over (order by �Ƿ�q14_1 desc) else 10 end as �Ƿ�1,
    case when �Ƿ�q14_2 <> 0 then ntile(10) over (order by �Ƿ�q14_2 desc) else 10 end as �Ƿ�2,
    case when �Ƿ�q14_3 <> 0 then ntile(10) over (order by �Ƿ�q14_3 desc) else 10 end as �Ƿ�3,
    case when �Ƿ�q14_4 <> 0 then ntile(10) over (order by �Ƿ�q14_4 desc) else 10 end as �Ƿ�4,
    case when �Ƿ�q15_1 <> 0 then ntile(10) over (order by �Ƿ�q15_1 desc) else 10 end as �Ƿ�5,
    case when �Ƿ�q15_2 <> 0 then ntile(10) over (order by �Ƿ�q15_2 desc) else 10 end as �Ƿ�6,
    case when �Ƿ�q15_3 <> 0 then ntile(10) over (order by �Ƿ�q15_3 desc) else 10 end as �Ƿ�7,
    case when �Ƿ�q15_4 <> 0 then ntile(10) over (order by �Ƿ�q15_4 desc) else 10 end as �Ƿ�8,
    
    case when ����������q14_1 <> 0 then ntile(10) over (order by ����������q14_1 desc) else 10 end as ����������1,
    case when ����������q14_2 <> 0 then ntile(10) over (order by ����������q14_2 desc) else 10 end as ����������2,
    case when ����������q14_3 <> 0 then ntile(10) over (order by ����������q14_3 desc) else 10 end as ����������3,
    case when ����������q14_4 <> 0 then ntile(10) over (order by ����������q14_4 desc) else 10 end as ����������4,
    case when ����������q15_1 <> 0 then ntile(10) over (order by ����������q15_1 desc) else 10 end as ����������5,
    case when ����������q15_2 <> 0 then ntile(10) over (order by ����������q15_2 desc) else 10 end as ����������6,
    case when ����������q15_3 <> 0 then ntile(10) over (order by ����������q15_3 desc) else 10 end as ����������7,
    case when ����������q15_4 <> 0 then ntile(10) over (order by ����������q15_4 desc) else 10 end as ����������8,
    
    case when �м���ȭq14_1 <> 0 then ntile(10) over (order by �м���ȭq14_1 desc) else 10 end as �м���ȭ1,
    case when �м���ȭq14_2 <> 0 then ntile(10) over (order by �м���ȭq14_2 desc) else 10 end as �м���ȭ2,
    case when �м���ȭq14_3 <> 0 then ntile(10) over (order by �м���ȭq14_3 desc) else 10 end as �м���ȭ3,
    case when �м���ȭq14_4 <> 0 then ntile(10) over (order by �м���ȭq14_4 desc) else 10 end as �м���ȭ4,
    case when �м���ȭq15_1 <> 0 then ntile(10) over (order by �м���ȭq15_1 desc) else 10 end as �м���ȭ5,
    case when �м���ȭq15_2 <> 0 then ntile(10) over (order by �м���ȭq15_2 desc) else 10 end as �м���ȭ6,
    case when �м���ȭq15_3 <> 0 then ntile(10) over (order by �м���ȭq15_3 desc) else 10 end as �м���ȭ7,
    case when �м���ȭq15_4 <> 0 then ntile(10) over (order by �м���ȭq15_4 desc) else 10 end as �м���ȭ8,
    
    case when ��ǰq14_1 <> 0 then ntile(10) over (order by ��ǰq14_1 desc) else 10 end as ��ǰ1,
    case when ��ǰq14_2 <> 0 then ntile(10) over (order by ��ǰq14_2 desc) else 10 end as ��ǰ2,
    case when ��ǰq14_3 <> 0 then ntile(10) over (order by ��ǰq14_3 desc) else 10 end as ��ǰ3,
    case when ��ǰq14_4 <> 0 then ntile(10) over (order by ��ǰq14_4 desc) else 10 end as ��ǰ4,
    case when ��ǰq15_1 <> 0 then ntile(10) over (order by ��ǰq15_1 desc) else 10 end as ��ǰ5,
    case when ��ǰq15_2 <> 0 then ntile(10) over (order by ��ǰq15_2 desc) else 10 end as ��ǰ6,
    case when ��ǰq15_3 <> 0 then ntile(10) over (order by ��ǰq15_3 desc) else 10 end as ��ǰ7,
    case when ��ǰq15_4 <> 0 then ntile(10) over (order by ��ǰq15_4 desc) else 10 end as ��ǰ8,
    
    case when ��Ÿq14_1 <> 0 then ntile(10) over (order by ��Ÿq14_1 desc) else 10 end as ��Ÿ1,
    case when ��Ÿq14_2 <> 0 then ntile(10) over (order by ��Ÿq14_2 desc) else 10 end as ��Ÿ2,
    case when ��Ÿq14_3 <> 0 then ntile(10) over (order by ��Ÿq14_3 desc) else 10 end as ��Ÿ3,
    case when ��Ÿq14_4 <> 0 then ntile(10) over (order by ��Ÿq14_4 desc) else 10 end as ��Ÿ4,
    case when ��Ÿq15_1 <> 0 then ntile(10) over (order by ��Ÿq15_1 desc) else 10 end as ��Ÿ5,
    case when ��Ÿq15_2 <> 0 then ntile(10) over (order by ��Ÿq15_2 desc) else 10 end as ��Ÿ6,
    case when ��Ÿq15_3 <> 0 then ntile(10) over (order by ��Ÿq15_3 desc) else 10 end as ��Ÿ7,
    case when ��Ÿq15_4 <> 0 then ntile(10) over (order by ��Ÿq15_4 desc) else 10 end as ��Ÿ8
    
from pro_pur
order by ����ȣ;

select * from pro_pur6;

drop table mastertable1;
create table mastertable1 as
SELECT d.����ȣ, d.����, 
    case 
        when ���ɴ� in ('19������', '20��~24��', '25��~29��') then 'û����'
        when ���ɴ� in ('30��~34��', '35��~39��', '40��~44��', '45��~49��') then '�߳���'
        when ���ɴ� in ('50��~54��', '55��~59��', '60���̻�') then '�����'
    end as ���ɴ�з�,
    
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.�ż�q14_1, p.�ż�q14_2, p.�ż�q14_3, p.�ż�q14_4, p.�ż�q15_1, p.�ż�q15_2, p.�ż�q15_3, p.�ż�q15_4,
    p.�ϻ�q14_1, p.�ϻ�q14_2, p.�ϻ�q14_3, p.�ϻ�q14_4, p.�ϻ�q15_1, p.�ϻ�q15_2, p.�ϻ�q15_3, p.�ϻ�q15_4,
    p.�Ǿ�q14_1, p.�Ǿ�q14_2, p.�Ǿ�q14_3, p.�Ǿ�q14_4, p.�Ǿ�q15_1, p.�Ǿ�q15_2, p.�Ǿ�q15_3, p.�Ǿ�q15_4,
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.������q14_1, p.������q14_2, p.������q14_3, p.������q14_4, p.������q15_1, p.������q15_2, p.������q15_3, p.������q15_4,
    p.����q14_1, p.����q14_2, p.����q14_3, p.����q14_4, p.����q15_1, p.����q15_2, p.����q15_3, p.����q15_4,
    p.�Ƿ�q14_1, p.�Ƿ�q14_2, p.�Ƿ�q14_3, p.�Ƿ�q14_4, p.�Ƿ�q15_1, p.�Ƿ�q15_2, p.�Ƿ�q15_3, p.�Ƿ�q15_4,
    p.����������q14_1, p.����������q14_2, p.����������q14_3, p.����������q14_4, p.����������q15_1, p.����������q15_2, p.����������q15_3, p.����������q15_4,
    p.�м���ȭq14_1, p.�м���ȭq14_2, p.�м���ȭq14_3, p.�м���ȭq14_4, p.�м���ȭq15_1, p.�м���ȭq15_2, p.�м���ȭq15_3, p.�м���ȭq15_4,
    p.��ǰq14_1, p.��ǰq14_2, p.��ǰq14_3, p.��ǰq14_4, p.��ǰq15_1, p.��ǰq15_2, p.��ǰq15_3, p.��ǰq15_4,
    p.��Ÿq14_1, p.��Ÿq14_2, p.��Ÿq14_3, p.��Ÿq14_4, p.��Ÿq15_1, p.��Ÿq15_2, p.��Ÿq15_3, p.��Ÿq15_4,
    p.����1, p.����2, p.����3, p.����4, p.����5, p.����6, p.����7, p.����8,
    p.�ż�1, p.�ż�2, p.�ż�3, p.�ż�4, p.�ż�5, p.�ż�6, p.�ż�7, p.�ż�8,
    p.�ϻ�1, p.�ϻ�2, p.�ϻ�3, p.�ϻ�4, p.�ϻ�5, p.�ϻ�6, p.�ϻ�7, p.�ϻ�8,
    p.�Ǿ�1, p.�Ǿ�2, p.�Ǿ�3, p.�Ǿ�4, p.�Ǿ�5, p.�Ǿ�6, p.�Ǿ�7, p.�Ǿ�8,
    p.����1, p.����2, p.����3, p.����4, p.����5, p.����6, p.����7, p.����8,
    p.������1, p.������2, p.������3, p.������4, p.������5, p.������6, p.������7, p.������8,
    p.����1, p.����2, p.����3, p.����4, p.����5, p.����6, p.����7, p.����8,
    p.�Ƿ�1, p.�Ƿ�2, p.�Ƿ�3, p.�Ƿ�4, p.�Ƿ�5, p.�Ƿ�6, p.�Ƿ�7, p.�Ƿ�8,
    p.����������1, p.����������2, p.����������3, p.����������4, p.����������5, p.����������6, p.����������7, p.����������8,
    p.�м���ȭ1, p.�м���ȭ2, p.�м���ȭ3, p.�м���ȭ4, p.�м���ȭ5, p.�м���ȭ6, p.�м���ȭ7, p.�м���ȭ8,
    p.��ǰ1, p.��ǰ2, p.��ǰ3, p.��ǰ4, p.��ǰ5, p.��ǰ6, p.��ǰ7, p.��ǰ8,
    p.��Ÿ1, p.��Ÿ2, p.��Ÿ3, p.��Ÿ4, p.��Ÿ5, p.��Ÿ6, p.��Ÿ7, p.��Ÿ8
    
FROM demo d
JOIN pro_pur6 p ON d.����ȣ = p.����ȣ
ORDER BY d.����ȣ;

select * from mastertable1;

drop table train2;
create table train2 as
select ����ȣ, ����, ���ɴ�з�,
    ����1 - ����6 as ������ȭ,
    �ż�1 - �ż�6 as �ż���ȭ,
    �ϻ�1 - �ϻ�6 as �ϻ�ȭ,
    �Ǿ�1 - �Ǿ�6 as �Ǿຯȭ,
    ����1 - ����6 as ������ȭ,
    ������1 - ������6 as �����к�ȭ,
    ����1 - ����6 as ������ȭ,
    �Ƿ�1 - �Ƿ�6 as �Ƿ���ȭ,
    ����������1 - ����������6 as ������������ȭ,
    �м���ȭ1 - �м���ȭ6 as �м���ȭ��ȭ,
    ��ǰ1 - ��ǰ6 as ��ǰ��ȭ,
    ��Ÿ1 - ��Ÿ6 as ��Ÿ��ȭ,
    
    abs(����1-����2)+abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6) as abs����,
    abs(�ż�1-�ż�2)+abs(�ż�2-�ż�3)+abs(�ż�3-�ż�4)+abs(�ż�4-�ż�5)+abs(�ż�5-�ż�6) as abs�ż�,
    abs(�ϻ�1-�ϻ�2)+abs(�ϻ�2-�ϻ�3)+abs(�ϻ�3-�ϻ�4)+abs(�ϻ�4-�ϻ�5)+abs(�ϻ�5-�ϻ�6) as abs�ϻ�,
    abs(�Ǿ�1-�Ǿ�2)+abs(�Ǿ�2-�Ǿ�3)+abs(�Ǿ�3-�Ǿ�4)+abs(�Ǿ�4-�Ǿ�5)+abs(�Ǿ�5-�Ǿ�6) as abs�Ǿ�,
    abs(����1-����2)+abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6) as abs����,
    abs(������1-������2)+abs(������2-������3)+abs(������3-������4)+abs(������4-������5)+abs(������5-������6) as abs������,
    abs(����1-����2)+abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6) as abs����,
    abs(�Ƿ�1-�Ƿ�2)+abs(�Ƿ�2-�Ƿ�3)+abs(�Ƿ�3-�Ƿ�4)+abs(�Ƿ�4-�Ƿ�5)+abs(�Ƿ�5-�Ƿ�6) as abs�Ƿ�,
    abs(����������1-����������2)+abs(����������2-����������3)+abs(����������3-����������4)+abs(����������4-����������5)+abs(����������5-����������6) as abs����������,
    abs(�м���ȭ1-�м���ȭ2)+abs(�м���ȭ2-�м���ȭ3)+abs(�м���ȭ3-�м���ȭ4)+abs(�м���ȭ4-�м���ȭ5)+abs(�м���ȭ5-�м���ȭ6) as abs�м���ȭ,
    abs(��ǰ1-��ǰ2)+abs(��ǰ2-��ǰ3)+abs(��ǰ3-��ǰ4)+abs(��ǰ4-��ǰ5)+abs(��ǰ5-��ǰ6) as abs��ǰ,
    abs(��Ÿ1-��Ÿ2)+abs(��Ÿ2-��Ÿ3)+abs(��Ÿ3-��Ÿ4)+abs(��Ÿ4-��Ÿ5)+abs(��Ÿ5-��Ÿ6) as abs��Ÿ,
    
    -(����q14_1 - ����q15_2) as ������ȭ�ݾ�,
    -(�ż�q14_1 - �ż�q15_2) as �ż���ȭ�ݾ�,
    -(�ϻ�q14_1 - �ϻ�q15_2) as �ϻ�ȭ�ݾ�,
    -(�Ǿ�q14_1 - �Ǿ�q15_2) as �Ǿຯȭ�ݾ�,
    -(����q14_1 - ����q15_2) as ������ȭ�ݾ�,
    -(������q14_1 - ������q15_2) as �����к�ȭ�ݾ�,
    -(����q14_1 - ����q15_2) as ������ȭ�ݾ�,
    -(�Ƿ�q14_1 - �Ƿ�q15_2) as �Ƿ���ȭ�ݾ�,
    -(����������q14_1 - ����������q15_2) as ������������ȭ�ݾ�,
    -(�м���ȭq14_1 - �м���ȭq15_2) as �м���ȭ��ȭ�ݾ�,
    -(��ǰq14_1 - ��ǰq15_2) as ��ǰ��ȭ�ݾ�,
    -(��Ÿq14_1 - ��Ÿq15_2) as ��Ÿ��ȭ�ݾ�
    
from mastertable1;


drop table test2;
create table test2 as
select ����ȣ, ����, ���ɴ�з�,
    ����2 - ����7 as ������ȭ,
    �ż�2 - �ż�7 as �ż���ȭ,
    �ϻ�2 - �ϻ�7 as �ϻ�ȭ,
    �Ǿ�2 - �Ǿ�7 as �Ǿຯȭ,
    ����2 - ����7 as ������ȭ,
    ������2 - ������7 as �����к�ȭ,
    ����2 - ����7 as ������ȭ,
    �Ƿ�2 - �Ƿ�7 as �Ƿ���ȭ,
    ����������2 - ����������7 as ������������ȭ,
    �м���ȭ2 - �м���ȭ7 as �м���ȭ��ȭ,
    ��ǰ2 - ��ǰ7 as ��ǰ��ȭ,
    ��Ÿ2 - ��Ÿ7 as ��Ÿ��ȭ,
    
    abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7) as abs����,
    abs(�ż�2-�ż�3)+abs(�ż�3-�ż�4)+abs(�ż�4-�ż�5)+abs(�ż�5-�ż�6)+abs(�ż�6-�ż�7) as abs�ż�,
    abs(�ϻ�2-�ϻ�3)+abs(�ϻ�3-�ϻ�4)+abs(�ϻ�4-�ϻ�5)+abs(�ϻ�5-�ϻ�6)+abs(�ϻ�6-�ϻ�7) as abs�ϻ�,
    abs(�Ǿ�2-�Ǿ�3)+abs(�Ǿ�3-�Ǿ�4)+abs(�Ǿ�4-�Ǿ�5)+abs(�Ǿ�5-�Ǿ�6)+abs(�Ǿ�6-�Ǿ�7) as abs�Ǿ�,
    abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7) as abs����,
    abs(������2-������3)+abs(������3-������4)+abs(������4-������5)+abs(������5-������6)+abs(������6-������7) as abs������,
    abs(����2-����3)+abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7) as abs����,
    abs(�Ƿ�2-�Ƿ�3)+abs(�Ƿ�3-�Ƿ�4)+abs(�Ƿ�4-�Ƿ�5)+abs(�Ƿ�5-�Ƿ�6)+abs(�Ƿ�6-�Ƿ�7) as abs�Ƿ�,
    abs(����������2-����������3)+abs(����������3-����������4)+abs(����������4-����������5)+abs(����������5-����������6)+abs(����������6-����������7) as abs����������,
    abs(�м���ȭ2-�м���ȭ3)+abs(�м���ȭ3-�м���ȭ4)+abs(�м���ȭ4-�м���ȭ5)+abs(�м���ȭ5-�м���ȭ6)+abs(�м���ȭ6-�м���ȭ7) as abs�м���ȭ,
    abs(��ǰ2-��ǰ3)+abs(��ǰ3-��ǰ4)+abs(��ǰ4-��ǰ5)+abs(��ǰ5-��ǰ6)+abs(��ǰ6-��ǰ7) as abs��ǰ,
    abs(��Ÿ2-��Ÿ3)+abs(��Ÿ3-��Ÿ4)+abs(��Ÿ4-��Ÿ5)+abs(��Ÿ5-��Ÿ6)+abs(��Ÿ6-��Ÿ7) as abs��Ÿ,
    
    -(����q14_2 - ����q15_3) as ������ȭ�ݾ�,
    -(�ż�q14_2 - �ż�q15_3) as �ż���ȭ�ݾ�,
    -(�ϻ�q14_2 - �ϻ�q15_3) as �ϻ�ȭ�ݾ�,
    -(�Ǿ�q14_2 - �Ǿ�q15_3) as �Ǿຯȭ�ݾ�,
    -(����q14_2 - ����q15_3) as ������ȭ�ݾ�,
    -(������q14_2 - ������q15_3) as �����к�ȭ�ݾ�,
    -(����q14_2 - ����q15_3) as ������ȭ�ݾ�,
    -(�Ƿ�q14_2 - �Ƿ�q15_3) as �Ƿ���ȭ�ݾ�,
    -(����������q14_2 - ����������q15_3) as ������������ȭ�ݾ�,
    -(�м���ȭq14_2 - �м���ȭq15_3) as �м���ȭ��ȭ�ݾ�,
    -(��ǰq14_2 - ��ǰq15_3) as ��ǰ��ȭ�ݾ�,
    -(��Ÿq14_2 - ��Ÿq15_3) as ��Ÿ��ȭ�ݾ�
    
from mastertable1;

select ����ȣ,
    CASE 
        WHEN (����q15_3 - ����q14_2) > 0 THEN round(POWER((����q15_3 - ����q14_2), 1/6) - 1, 2)
        when (����q15_3 - ����q14_2) < 0 THEN -round(POWER(abs(����q15_3 - ����q14_2), 1/6) -1, 2)
        else 0
    end as cagr
from mastertable1;

select * from train2;
select * from test2;

drop table train3;
create table train3 as
select t.����ȣ, t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ,
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�,
    
    ntile(10) over (order by min(case when p.�������� between 20140101 and 20150630 then
    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(p.�������� , 'YYYY-MM-DD') end) desc) as r,
    ntile(10) over (order by count(p.����ȣ)) as f,
    ntile(10) over (order by sum(p.������) desc) as m,
    
    CASE 
        WHEN 
        (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)) > 0 
        THEN 
        round(POWER((nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)), 1/6) - 1, 2)
        when 
        (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)) < 0 
        THEN 
        -round(POWER(abs(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)), 1/6) -1, 2)
        else 0
    end as cagr,
    
--    (ntile(10) over (order by (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0)))) -
--    (ntile(10) over (order by (nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)))) as diff,
    
    case when
    (nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then p.������ end), 0) - 
    nvl(sum(case when year_pur = 2014 and month_pur between 01 and 03 then p.������ end), 0)) < 0 and
    ((nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then p.������ end), 0) -
    nvl(sum(case when year_pur = 2014 and month_pur between 01 and 03 then p.������ end), 0)) /
    nvl(sum(case when year_pur = 2014 and month_pur between 01 and 03 then p.������ end), 0)) < -0.1
    then 1 else 0 end as label
        
from train2 t
join purprod0 p on t.����ȣ = p.����ȣ
group by t.����ȣ, t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�
order by t.����ȣ;

--train �� test
drop table test3;
create table test3 as
select t.����ȣ, t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ,
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�,
    
    ntile(10) over (order by min(case when p.�������� between 20140401 and 20150930 then
    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(p.�������� , 'YYYY-MM-DD') end) desc) as r,
    ntile(10) over (order by count(p.����ȣ)) as f,
    ntile(10) over (order by sum(p.������) desc) as m,
    
    CASE 
        WHEN 
        (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0)) > 0 
        THEN 
        round(POWER((nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0)), 1/6) - 1, 2)
        when 
        (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0)) < 0 
        THEN 
        -round(POWER(abs(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0)), 1/6) -1, 2)
        else 0
    end as cagr,
    
--    (ntile(10) over (order by (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0)))) -
--    (ntile(10) over (order by (nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0)))) as diff,
    
    case when
    (nvl(sum(case when year_pur = 2015 and month_pur between 10 and 12 then p.������ end), 0) - 
    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then p.������ end), 0)) < 0 and
    ((nvl(sum(case when year_pur = 2015 and month_pur between 10 and 12 then p.������ end), 0) -
    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then p.������ end), 0)) /
    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then p.������ end), 0)) < -0.1
    then 1 else 0 end as label
    
from test2 t
join purprod0 p on t.����ȣ = p.����ȣ
group by t.����ȣ, t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�
order by t.����ȣ;

select * from train3;
select * from test3;

select ����ȣ,
    
    min(case when �������� between 20140701 and 20151231 then
    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(�������� , 'YYYY-MM-DD') end),
    
    ntile(10) over (order by min(case when �������� between 20140401 and 20150930 then
    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(�������� , 'YYYY-MM-DD') end) desc) as r,
    
    count(����ȣ),
    ntile(10) over (order by count(����ȣ)) as f,
    
    sum(������),
    ntile(10) over (order by sum(������) desc) as m,
    
    (nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then ������ end), 0) - 
    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0)),
    
--    ((nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then ������ end), 0) -
--    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0)) /
--    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0)),
    
    case when
    (nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then ������ end), 0) - 
    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0)) < 0 and
    ((nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then ������ end), 0) -
    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0)) /
    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0)) < -0.1
    then 1 else 0 end as label
    
from purprod0
group by ����ȣ
order by ����ȣ;

drop table train4;
create table train4 as
select ����ȣ, ����, ���ɴ�з�,
    ����3 - ����8 as ������ȭ,
    �ż�3 - �ż�8 as �ż���ȭ,
    �ϻ�3 - �ϻ�8 as �ϻ�ȭ,
    �Ǿ�3 - �Ǿ�8 as �Ǿຯȭ,
    ����3 - ����8 as ������ȭ,
    ������3 - ������8 as �����к�ȭ,
    ����3 - ����8 as ������ȭ,
    �Ƿ�3 - �Ƿ�8 as �Ƿ���ȭ,
    ����������3 - ����������8 as ������������ȭ,
    �м���ȭ3 - �м���ȭ8 as �м���ȭ��ȭ,
    ��ǰ3 - ��ǰ8 as ��ǰ��ȭ,
    ��Ÿ3 - ��Ÿ8 as ��Ÿ��ȭ,
    
    abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7)+abs(����7-����8) as abs����,
    abs(�ż�3-�ż�4)+abs(�ż�4-�ż�5)+abs(�ż�5-�ż�6)+abs(�ż�6-�ż�7)+abs(�ż�7-�ż�8) as abs�ż�,
    abs(�ϻ�3-�ϻ�4)+abs(�ϻ�4-�ϻ�5)+abs(�ϻ�5-�ϻ�6)+abs(�ϻ�6-�ϻ�7)+abs(�ϻ�7-�ϻ�8) as abs�ϻ�,
    abs(�Ǿ�3-�Ǿ�4)+abs(�Ǿ�4-�Ǿ�5)+abs(�Ǿ�5-�Ǿ�6)+abs(�Ǿ�6-�Ǿ�7)+abs(�Ǿ�7-�Ǿ�8) as abs�Ǿ�,
    abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7)+abs(����7-����8) as abs����,
    abs(������3-������4)+abs(������4-������5)+abs(������5-������6)+abs(������6-������7)+abs(������7-������8) as abs������,
    abs(����3-����4)+abs(����4-����5)+abs(����5-����6)+abs(����6-����7)+abs(����7-����8) as abs����,
    abs(�Ƿ�3-�Ƿ�4)+abs(�Ƿ�4-�Ƿ�5)+abs(�Ƿ�5-�Ƿ�6)+abs(�Ƿ�6-�Ƿ�7)+abs(�Ƿ�7-�Ƿ�8) as abs�Ƿ�,
    abs(����������3-����������4)+abs(����������4-����������5)+abs(����������5-����������6)+abs(����������6-����������7)+abs(����������7-����������8) as abs����������,
    abs(�м���ȭ3-�м���ȭ4)+abs(�м���ȭ4-�м���ȭ5)+abs(�м���ȭ5-�м���ȭ6)+abs(�м���ȭ6-�м���ȭ7)+abs(�м���ȭ7-�м���ȭ8) as abs�м���ȭ,
    abs(��ǰ3-��ǰ4)+abs(��ǰ4-��ǰ5)+abs(��ǰ5-��ǰ6)+abs(��ǰ6-��ǰ7)+abs(��ǰ7-��ǰ8) as abs��ǰ,
    abs(��Ÿ3-��Ÿ4)+abs(��Ÿ4-��Ÿ5)+abs(��Ÿ5-��Ÿ6)+abs(��Ÿ6-��Ÿ7)+abs(��Ÿ7-��Ÿ8) as abs��Ÿ,
    
    -(����q14_3 - ����q15_4) as ������ȭ�ݾ�,
    -(�ż�q14_3 - �ż�q15_4) as �ż���ȭ�ݾ�,
    -(�ϻ�q14_3 - �ϻ�q15_4) as �ϻ�ȭ�ݾ�,
    -(�Ǿ�q14_3 - �Ǿ�q15_4) as �Ǿຯȭ�ݾ�,
    -(����q14_3 - ����q15_4) as ������ȭ�ݾ�,
    -(������q14_3 - ������q15_4) as �����к�ȭ�ݾ�,
    -(����q14_3 - ����q15_4) as ������ȭ�ݾ�,
    -(�Ƿ�q14_3 - �Ƿ�q15_4) as �Ƿ���ȭ�ݾ�,
    -(����������q14_3 - ����������q15_4) as ������������ȭ�ݾ�,
    -(�м���ȭq14_3 - �м���ȭq15_4) as �м���ȭ��ȭ�ݾ�,
    -(��ǰq14_3 - ��ǰq15_4) as ��ǰ��ȭ�ݾ�,
    -(��Ÿq14_3 - ��Ÿq15_4) as ��Ÿ��ȭ�ݾ�
    
from mastertable1;


--q3-q8
drop table train5;
create table train5 as
select t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ,
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�,
    
    ntile(10) over (order by min(case when p.�������� between 20140701 and 20151231 then
    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(p.�������� , 'YYYY-MM-DD') end) desc) as r,
    ntile(10) over (order by count(p.����ȣ)) as f,
    ntile(10) over (order by sum(p.������) desc) as m,
    
    CASE 
        WHEN 
        (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0)) > 0 
        THEN 
        round(POWER((nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0)), 1/6) - 1, 2)
        when 
        (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0)) < 0 
        THEN 
        -round(POWER(abs(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0)), 1/6) -1, 2)
        else 0
    end as cagr
    
from train4 t
join purprod0 p on t.����ȣ = p.����ȣ
group by t.����ȣ, t.����, t.���ɴ�з�, 
    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
    
    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
    t.abs��ǰ,t.abs��Ÿ
    
--    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
--    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�
order by t.����ȣ;

select * from train5;

--
--drop table train6;
--create table train6 as
--select t.����, t.���ɴ�з�, 
--    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
--    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
--    
--    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
--    t.abs��ǰ,t.abs��Ÿ,
--    
----    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
----    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�,
--    
--    ntile(10) over (order by min(case when p.�������� between 20140101 and 20150630 then
--    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(p.�������� , 'YYYY-MM-DD') end) desc) as r,
--    ntile(10) over (order by count(p.����ȣ)) as f,
--    ntile(10) over (order by sum(p.������) desc) as m,
--    
--    case when
--    (nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then ������ end), 0) -
--    nvl(sum(case when year_pur = 2014 and month_pur between 01 and 03 then ������ end), 0)) < 0
--    then 1 else 0 end as label
--        
--from train2 t
--join purprod0 p on t.����ȣ = p.����ȣ
--group by t.����ȣ, t.����, t.���ɴ�з�, 
--    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
--    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
--    
--    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
--    t.abs��ǰ,t.abs��Ÿ
--    
----    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
----    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�
--order by t.����ȣ;

--drop table test6;
--create table test6 as
--select  t.����, t.���ɴ�з�, 
--    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
--    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
--    
--    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
--    t.abs��ǰ,t.abs��Ÿ,
--    
----    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
----    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�,
--    
--    ntile(10) over (order by min(case when p.�������� between 20140401 and 20150930 then
--    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(p.�������� , 'YYYY-MM-DD') end) desc) as r,
--    ntile(10) over (order by count(p.����ȣ)) as f,
--    ntile(10) over (order by sum(p.������) desc) as m,
--    
--    case when
--    (nvl(sum(case when year_pur = 2015 and month_pur between 10 and 12 then ������ end), 0) -
--    nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0)) < 0
--    then 1 else 0 end as label
--    
--from test2 t
--join purprod0 p on t.����ȣ = p.����ȣ
--group by t.����ȣ, t.����, t.���ɴ�з�, 
--    t.������ȭ, t.�ż���ȭ, t.�ϻ�ȭ, t.�Ǿຯȭ, t.������ȭ, t.�����к�ȭ, t.������ȭ, t.�Ƿ���ȭ, t.������������ȭ, 
--    t.�м���ȭ��ȭ, t.��ǰ��ȭ, t.��Ÿ��ȭ,
--    
--    t.abs����,t.abs�ż�,t.abs�ϻ�,t.abs�Ǿ�,t.abs����,t.abs������,t.abs����,t.abs�Ƿ�,t.abs����������,t.abs�м���ȭ,
--    t.abs��ǰ,t.abs��Ÿ
--    
----    t.������ȭ�ݾ�,t.�ż���ȭ�ݾ�,t.�ϻ�ȭ�ݾ�,t.�Ǿຯȭ�ݾ�,t.������ȭ�ݾ�,t.�����к�ȭ�ݾ�,t.������ȭ�ݾ�,t.�Ƿ���ȭ�ݾ�,t.������������ȭ�ݾ�,
----    t.�м���ȭ��ȭ�ݾ�,t.��ǰ��ȭ�ݾ�,t.��Ÿ��ȭ�ݾ�
--order by t.����ȣ;
--
--select * from train6;
--select * from test6;

select ����ȣ,
    nvl(sum(case when year_pur = 2014 and month_pur between 01 and 03 then ������ end), 0),
    nvl(sum(case when year_pur = 2015 and month_pur between 10 and 12 then ������ end), 0),
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 01 and 03 then ������ end), 0))desc)) as ��1,
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0))desc)) as ��2,
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 07 and 09 then ������ end), 0))desc)) as ��3,
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 10 and 12 then ������ end), 0))desc)) as ��4,
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 01 and 03 then ������ end), 0))desc)) as ��5,
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 04 and 06 then ������ end), 0))desc)) as ��6,
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then ������ end), 0))desc)) as ��7,
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 10 and 12 then ������ end), 0))desc)) as ��8,

    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0))desc)) -
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 01 and 03 then ������ end), 0))desc)) as �б�1,
    
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 07 and 09 then ������ end), 0))desc)) -
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 04 and 06 then ������ end), 0))desc)) as �б�2,
    
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 10 and 12 then ������ end), 0))desc)) -
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 07 and 09 then ������ end), 0))desc)) as �б�3,
    
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 01 and 03 then ������ end), 0))desc)) -
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 10 and 12 then ������ end), 0))desc)) as �б�4,
    
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 04 and 06 then ������ end), 0))desc)) -
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 01 and 03 then ������ end), 0))desc)) as �б�5,
    
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then ������ end), 0))desc)) -
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 04 and 06 then ������ end), 0))desc)) as �б�6,
    
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 10 and 12 then ������ end), 0))desc)) -
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 07 and 09 then ������ end), 0))desc)) as �б�7,
    
    -((ntile(10) over (order by (nvl(sum(case when year_pur = 2015 and month_pur between 10 and 12 then ������ end), 0))desc)) -
    (ntile(10) over (order by (nvl(sum(case when year_pur = 2014 and month_pur between 01 and 03 then ������ end), 0))desc))) as diff
    
from purprod0
group by ����ȣ
order by ����ȣ;

--����ȭ

select * from mastertable1;

select * from purprod0;
select * from total_code0 where ���Ǻз��� = '��Ÿ';
select * from pro_pur;

select 
    nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 05 then p.������ end), 0),
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0),
    round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 05 then p.������ end), 0)/
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0),10)
from purprod0 p
join total_code0 t on p.�Һз��ڵ� = t.�Һз��ڵ�
group by p.����ȣ
order by p.����ȣ;

drop table prefer;
create table prefer as
select p.����ȣ,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 01 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �������űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 01 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �������űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 01 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �������űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 01 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �������űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 01 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �������űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 01 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �������űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 01 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �������űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 01 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �������űݾ�8,
    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 02 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �ż����űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 02 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �ż����űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 02 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �ż����űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 02 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �ż����űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 02 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �ż����űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 02 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �ż����űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 02 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �ż����űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 02 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �ż����űݾ�8,
    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 03 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �ϻ󱸸űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 03 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �ϻ󱸸űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 03 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �ϻ󱸸űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 03 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �ϻ󱸸űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 03 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �ϻ󱸸űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 03 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �ϻ󱸸űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 03 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �ϻ󱸸űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 03 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �ϻ󱸸űݾ�8,
--    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 05 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �Ǿ౸�űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 05 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �Ǿ౸�űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 05 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �Ǿ౸�űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 05 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �Ǿ౸�űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 05 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �Ǿ౸�űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 05 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �Ǿ౸�űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 05 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �Ǿ౸�űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 05 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �Ǿ౸�űݾ�8,
    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 06 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �������űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 06 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �������űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 06 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �������űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 06 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �������űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 06 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �������űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 06 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �������űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 06 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �������űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 06 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �������űݾ�8,
    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 07 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �����б��űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 07 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �����б��űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 07 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �����б��űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 07 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �����б��űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 07 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �����б��űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 07 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �����б��űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 07 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �����б��űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 07 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �����б��űݾ�8,
    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 08 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �������űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 08 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �������űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 08 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �������űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 08 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �������űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 08 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �������űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 08 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �������űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 08 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �������űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 08 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �������űݾ�8,
    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 09 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �Ƿ����űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 09 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �Ƿ����űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 09 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �Ƿ����űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 09 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �Ƿ����űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 09 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �Ƿ����űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 09 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �Ƿ����űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 09 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �Ƿ����űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 09 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �Ƿ����űݾ�8,

    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 10 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �������������űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 10 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �������������űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 10 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �������������űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 10 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �������������űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 10 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �������������űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 10 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �������������űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 10 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �������������űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 10 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �������������űݾ�8,
    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 11 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as �м���ȭ���űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 11 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �м���ȭ���űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 11 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �м���ȭ���űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 11 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �м���ȭ���űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 11 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as �м���ȭ���űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 11 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as �м���ȭ���űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 11 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as �м���ȭ���űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 11 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as �м���ȭ���űݾ�8,
    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 12 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as ��ǰ���űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 12 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as ��ǰ���űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 12 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as ��ǰ���űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 12 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as ��ǰ���űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 12 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as ��ǰ���űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 12 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as ��ǰ���űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 12 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as ��ǰ���űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 12 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as ��ǰ���űݾ�8,
    
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 and t.�����ڵ� = 99 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100 as ��Ÿ���űݾ�1,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 and t.�����ڵ� = 99 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as ��Ÿ���űݾ�2,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 and t.�����ڵ� = 99 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as ��Ÿ���űݾ�3,
    nvl(round(nvl(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 and t.�����ڵ� = 99 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2014 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as ��Ÿ���űݾ�4,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 and t.�����ڵ� = 99 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 01 and 03 then p.������ end), 0), 3), 0) * 100  as ��Ÿ���űݾ�5,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 and t.�����ڵ� = 99 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 04 and 06 then p.������ end), 0), 3), 0) * 100  as ��Ÿ���űݾ�6,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 and t.�����ڵ� = 99 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 07 and 09 then p.������ end), 0), 3), 0) * 100  as ��Ÿ���űݾ�7,
    nvl(round(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 and t.�����ڵ� = 99 then p.������ end), 0) /
    nullif(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0), 3), 0) * 100  as ��Ÿ���űݾ�8
    
    
    
from purprod0 p
join total_code0 t on p.�Һз��ڵ� = t.�Һз��ڵ�
group by p.����ȣ
order by p.����ȣ;

select * from prefer;

drop table prefer1;
create table prefer1 as
select ����ȣ, 
    case 
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �������űݾ�1
        then 01 
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �ż����űݾ�1
        then 02 
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �ϻ󱸸űݾ�1
        then 03
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �Ǿ౸�űݾ�1
        then 05
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �������űݾ�1
        then 06
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �����б��űݾ�1
        then 07
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �������űݾ�1
        then 08
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �Ƿ����űݾ�1
        then 09
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �������������űݾ�1
        then 10
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = �м���ȭ���űݾ�1
        then 11
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = ��ǰ���űݾ�1
        then 12
        when greatest(�������űݾ�1, �ż����űݾ�1, �ϻ󱸸űݾ�1, �Ǿ౸�űݾ�1, �������űݾ�1, �����б��űݾ�1, �������űݾ�1, 
                �Ƿ����űݾ�1, �������������űݾ�1, �м���ȭ���űݾ�1, ��ǰ���űݾ�1, ��Ÿ���űݾ�1) = ��Ÿ���űݾ�1
        then 99
    end as ��ȣ��ǰ1,
    
    case 
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �������űݾ�2
        then 01 
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �ż����űݾ�2
        then 02 
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �ϻ󱸸űݾ�2
        then 03
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �Ǿ౸�űݾ�2
        then 05
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �������űݾ�2
        then 06
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �����б��űݾ�2
        then 07
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �������űݾ�2
        then 08
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �Ƿ����űݾ�2
        then 09
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �������������űݾ�2
        then 10
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = �м���ȭ���űݾ�2
        then 11
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = ��ǰ���űݾ�2
        then 12
        when greatest(�������űݾ�2, �ż����űݾ�2, �ϻ󱸸űݾ�2, �Ǿ౸�űݾ�2, �������űݾ�2, �����б��űݾ�2, �������űݾ�2, 
                �Ƿ����űݾ�2, �������������űݾ�2, �м���ȭ���űݾ�2, ��ǰ���űݾ�2, ��Ÿ���űݾ�2) = ��Ÿ���űݾ�2
        then 99
    end as ��ȣ��ǰ2,
    
    case 
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �������űݾ�3
        then 01 
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �ż����űݾ�3
        then 02 
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �ϻ󱸸űݾ�3
        then 03
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �Ǿ౸�űݾ�3
        then 05
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �������űݾ�3
        then 06
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �����б��űݾ�3
        then 07
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �������űݾ�3
        then 08
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �Ƿ����űݾ�3
        then 09
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �������������űݾ�3
        then 10
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = �м���ȭ���űݾ�3
        then 11
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = ��ǰ���űݾ�3
        then 12
        when greatest(�������űݾ�3, �ż����űݾ�3, �ϻ󱸸űݾ�3, �Ǿ౸�űݾ�3, �������űݾ�3, �����б��űݾ�3, �������űݾ�3, 
                �Ƿ����űݾ�3, �������������űݾ�3, �м���ȭ���űݾ�3, ��ǰ���űݾ�3, ��Ÿ���űݾ�3) = ��Ÿ���űݾ�3
        then 99
    end as ��ȣ��ǰ3,
    
    case 
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �������űݾ�4
        then 01 
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �ż����űݾ�4
        then 02 
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �ϻ󱸸űݾ�4
        then 03
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �Ǿ౸�űݾ�4
        then 05
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �������űݾ�4
        then 06
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �����б��űݾ�4
        then 07
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �������űݾ�4
        then 08
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �Ƿ����űݾ�4
        then 09
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �������������űݾ�4
        then 10
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = �м���ȭ���űݾ�4
        then 11
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = ��ǰ���űݾ�4
        then 12
        when greatest(�������űݾ�4, �ż����űݾ�4, �ϻ󱸸űݾ�4, �Ǿ౸�űݾ�4, �������űݾ�4, �����б��űݾ�4, �������űݾ�4, 
                �Ƿ����űݾ�4, �������������űݾ�4, �м���ȭ���űݾ�4, ��ǰ���űݾ�4, ��Ÿ���űݾ�4) = ��Ÿ���űݾ�4
        then 99
    end as ��ȣ��ǰ4,
    
    case 
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �������űݾ�5
        then 01 
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �ż����űݾ�5
        then 02 
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �ϻ󱸸űݾ�5
        then 03
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �Ǿ౸�űݾ�5
        then 05
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �������űݾ�5
        then 06
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �����б��űݾ�5
        then 07
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �������űݾ�5
        then 08
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �Ƿ����űݾ�5
        then 09
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �������������űݾ�5
        then 10
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = �м���ȭ���űݾ�5
        then 11
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = ��ǰ���űݾ�5
        then 12
        when greatest(�������űݾ�5, �ż����űݾ�5, �ϻ󱸸űݾ�5, �Ǿ౸�űݾ�5, �������űݾ�5, �����б��űݾ�5, �������űݾ�5, 
                �Ƿ����űݾ�5, �������������űݾ�5, �м���ȭ���űݾ�5, ��ǰ���űݾ�5, ��Ÿ���űݾ�5) = ��Ÿ���űݾ�5
        then 99
    end as ��ȣ��ǰ5,
    
    case 
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �������űݾ�6
        then 01 
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �ż����űݾ�6
        then 02 
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �ϻ󱸸űݾ�6
        then 03
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �Ǿ౸�űݾ�6
        then 05
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �������űݾ�6
        then 06
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �����б��űݾ�6
        then 07
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �������űݾ�6
        then 08
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �Ƿ����űݾ�6
        then 09
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �������������űݾ�6
        then 10
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = �м���ȭ���űݾ�6
        then 11
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = ��ǰ���űݾ�6
        then 12
        when greatest(�������űݾ�6, �ż����űݾ�6, �ϻ󱸸űݾ�6, �Ǿ౸�űݾ�6, �������űݾ�6, �����б��űݾ�6, �������űݾ�6, 
                �Ƿ����űݾ�6, �������������űݾ�6, �м���ȭ���űݾ�6, ��ǰ���űݾ�6, ��Ÿ���űݾ�6) = ��Ÿ���űݾ�6
        then 99
    end as ��ȣ��ǰ6,
    
    case 
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �������űݾ�7
        then 01 
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �ż����űݾ�7
        then 02 
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �ϻ󱸸űݾ�7
        then 03
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �Ǿ౸�űݾ�7
        then 05
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �������űݾ�7
        then 06
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �����б��űݾ�7
        then 07
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �������űݾ�7
        then 08
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �Ƿ����űݾ�7
        then 09
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �������������űݾ�7
        then 10
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = �м���ȭ���űݾ�7
        then 11
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = ��ǰ���űݾ�7
        then 12
        when greatest(�������űݾ�7, �ż����űݾ�7, �ϻ󱸸űݾ�7, �Ǿ౸�űݾ�7, �������űݾ�7, �����б��űݾ�7, �������űݾ�7, 
                �Ƿ����űݾ�7, �������������űݾ�7, �м���ȭ���űݾ�7, ��ǰ���űݾ�7, ��Ÿ���űݾ�7) = ��Ÿ���űݾ�7
        then 99
    end as ��ȣ��ǰ7,
    
    case 
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �������űݾ�8
        then 01 
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �ż����űݾ�8
        then 02 
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �ϻ󱸸űݾ�8
        then 03
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �Ǿ౸�űݾ�8
        then 05
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �������űݾ�8
        then 06
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �����б��űݾ�8
        then 07
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �������űݾ�8
        then 08
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �Ƿ����űݾ�8
        then 09
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �������������űݾ�8
        then 10
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = �м���ȭ���űݾ�8
        then 11
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = ��ǰ���űݾ�8
        then 12
        when greatest(�������űݾ�8, �ż����űݾ�8, �ϻ󱸸űݾ�8, �Ǿ౸�űݾ�8, �������űݾ�8, �����б��űݾ�8, �������űݾ�8, 
                �Ƿ����űݾ�8, �������������űݾ�8, �м���ȭ���űݾ�8, ��ǰ���űݾ�8, ��Ÿ���űݾ�8) = ��Ÿ���űݾ�8
        then 99
    end as ��ȣ��ǰ8
    
from prefer;

select * from prefer1;



select ����ȣ, ��ȣ��ǰ1, ��ȣ��ǰ2, ��ȣ��ǰ3, ��ȣ��ǰ4, ��ȣ��ǰ5, ��ȣ��ǰ6, ��ȣ��ǰ7, ��ȣ��ǰ8,
    greatest(��ȣ��ǰ1, ��ȣ��ǰ2, ��ȣ��ǰ3, ��ȣ��ǰ4, ��ȣ��ǰ5, ��ȣ��ǰ6, ��ȣ��ǰ7, ��ȣ��ǰ8) as ����1
from prefer1;

select * from train3;

drop table train_prot;
create table train_prot as
select t.*, greatest(��ȣ��ǰ1, ��ȣ��ǰ2, ��ȣ��ǰ3, ��ȣ��ǰ4, ��ȣ��ǰ5, ��ȣ��ǰ6) as ��ȣ
from train3 t
join prefer1 p on t.����ȣ = p.����ȣ
order by t.����ȣ;

drop table test_prot;
create table test_prot as
select t.*, greatest(��ȣ��ǰ2, ��ȣ��ǰ3, ��ȣ��ǰ4, ��ȣ��ǰ5, ��ȣ��ǰ6, ��ȣ��ǰ7) as ��ȣ
from test3 t
join prefer1 p on t.����ȣ = p.����ȣ
order by t.����ȣ;

drop table pred_prot;
create table pred_prot as
select t.*, greatest(��ȣ��ǰ3, ��ȣ��ǰ4, ��ȣ��ǰ5, ��ȣ��ǰ6, ��ȣ��ǰ7, ��ȣ��ǰ8) as ��ȣ
from test3 t
join prefer1 p on t.����ȣ = p.����ȣ
order by t.����ȣ;

drop table mastertable0;
create table mastertable0 as
select m.����ȣ, m.����, m.���ɴ�з�,
    m.����1 - m.����8 as ������ȭ,
    m.�ż�1 - m.�ż�8 as �ż���ȭ,
    m.�ϻ�1 - m.�ϻ�8 as �ϻ�ȭ,
    m.�Ǿ�1 - m.�Ǿ�8 as �Ǿຯȭ,
    m.����1 - m.����8 as ������ȭ,
    m.������1 - m.������8 as �����к�ȭ,
    m.����1 - m.����8 as ������ȭ,
    m.�Ƿ�1 - m.�Ƿ�8 as �Ƿ���ȭ,
    m.����������1 - m.����������8 as ������������ȭ,
    m.�м���ȭ1 - m.�м���ȭ8 as �м���ȭ��ȭ,
    m.��ǰ1 - m.��ǰ8 as ��ǰ��ȭ,
    m.��Ÿ1 - m.��Ÿ8 as ��Ÿ��ȭ,
    
    abs(m.����1-m.����2)+abs(m.����2-m.����3)+abs(m.����3-m.����4)+abs(m.����4-m.����5)+abs(m.����5-m.����6)+abs(m.����6-m.����7)+abs(m.����7-m.����8) as abs����,
    abs(m.�ż�1-m.�ż�2)+abs(m.�ż�2-m.�ż�3)+abs(m.�ż�3-m.�ż�4)+abs(m.�ż�4-m.�ż�5)+abs(m.�ż�5-m.�ż�6)+abs(m.�ż�6-m.�ż�7)+abs(m.�ż�7-m.�ż�8) as abs�ż�,
    abs(m.�ϻ�1-m.�ϻ�2)+abs(m.�ϻ�2-m.�ϻ�3)+abs(m.�ϻ�3-m.�ϻ�4)+abs(m.�ϻ�4-m.�ϻ�5)+abs(m.�ϻ�5-m.�ϻ�6)+abs(m.�ϻ�6-m.�ϻ�7)+abs(m.�ϻ�7-m.�ϻ�8) as abs�ϻ�,
    abs(m.�Ǿ�1-m.�Ǿ�2)+abs(m.�Ǿ�2-m.�Ǿ�3)+abs(m.�Ǿ�3-m.�Ǿ�4)+abs(m.�Ǿ�4-m.�Ǿ�5)+abs(m.�Ǿ�5-m.�Ǿ�6)+abs(m.�Ǿ�6-m.�Ǿ�7)+abs(m.�Ǿ�7-m.�Ǿ�8) as abs�Ǿ�,
    abs(m.����1-m.����2)+abs(m.����2-m.����3)+abs(m.����3-m.����4)+abs(m.����4-m.����5)+abs(m.����5-m.����6)+abs(m.����6-m.����7)+abs(m.����7-m.����8) as abs����,
    abs(m.������1-m.������2)+abs(m.������2-m.������3)+abs(m.������3-m.������4)+abs(m.������4-m.������5)+abs(m.������5-m.������6)+abs(m.������6-m.������7)+abs(m.������7-m.������8) as abs������,
    abs(m.����1-m.����2)+abs(m.����2-m.����3)+abs(m.����3-m.����4)+abs(m.����4-m.����5)+abs(m.����5-m.����6)+abs(m.����6-m.����7)+abs(m.����7-m.����8) as abs����,
    abs(m.�Ƿ�1-m.�Ƿ�2)+abs(m.�Ƿ�2-m.�Ƿ�3)+abs(m.�Ƿ�3-m.�Ƿ�4)+abs(m.�Ƿ�4-m.�Ƿ�5)+abs(m.�Ƿ�5-m.�Ƿ�6)+abs(m.�Ƿ�6-m.�Ƿ�7)+abs(m.�Ƿ�7-m.�Ƿ�8) as abs�Ƿ�,
    abs(m.����������1-m.����������2)+abs(m.����������2-m.����������3)+abs(m.����������3-m.����������4)+abs(m.����������4-m.����������5)+abs(m.����������5-m.����������6)+abs(m.����������6-m.����������7)+abs(m.����������7-m.����������8) as abs����������,
    abs(m.�м���ȭ1-m.�м���ȭ2)+abs(m.�м���ȭ2-m.�м���ȭ3)+abs(m.�м���ȭ3-m.�м���ȭ4)+abs(�м���ȭ4-�м���ȭ5)+abs(�м���ȭ5-�м���ȭ6)+abs(�м���ȭ6-�м���ȭ7)+abs(�м���ȭ7-�м���ȭ8) as abs�м���ȭ,
    abs(m.��ǰ1-m.��ǰ2)+abs(m.��ǰ2-m.��ǰ3)+abs(m.��ǰ3-m.��ǰ4)+abs(m.��ǰ4-m.��ǰ5)+abs(m.��ǰ5-m.��ǰ6)+abs(m.��ǰ6-m.��ǰ7)+abs(m.��ǰ7-m.��ǰ8) as abs��ǰ,
    abs(m.��Ÿ1-m.��Ÿ2)+abs(m.��Ÿ2-m.��Ÿ3)+abs(m.��Ÿ3-m.��Ÿ4)+abs(m.��Ÿ4-m.��Ÿ5)+abs(m.��Ÿ5-m.��Ÿ6)+abs(m.��Ÿ6-m.��Ÿ7)+abs(m.��Ÿ7-m.��Ÿ8) as abs��Ÿ,
    
--    nvl(sum(case when year_pur = 2015 and month_pur between 10 and 12 then p������ end), 0) -
--    nvl(sum(case when year_pur = 2014 and month_pur between 01 and 03 then ������ end), 0) as diff,

    (ntile(10) over (order by (nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0))desc)) -
    (ntile(10) over (order by (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0))desc)) as ��diff,
    
    ntile(10) over (order by min(case when p.�������� between 20140103 and 20151231 then
    to_date('2016-01-01', 'YYYY-MM-DD') - to_date(p.�������� , 'YYYY-MM-DD') end) desc) as r,
    ntile(10) over (order by count(p.����ȣ)) as f,
    ntile(10) over (order by sum(p.������) desc) as m,
    
    CASE 
        WHEN 
        (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)) > 0 
        THEN 
        round(POWER((nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)), 1/8) - 1, 2)
        
        when 
        (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)) < 0 
        THEN 
        -round(POWER(abs(nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0) - 
        nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)), 1/8) -1, 2)
        
        else 0
    end as cagr,
    
    case when 
    (nvl(sum(case when p.year_pur = 2015 and p.month_pur between 10 and 12 then p.������ end), 0) -
    nvl(sum(case when p.year_pur = 2014 and p.month_pur between 01 and 03 then p.������ end), 0)) < 0
    then 1 else 0 end as label
    
from purprod0 p
join mastertable1 m on p.����ȣ = m.����ȣ
group by m.����ȣ, m.����, m.���ɴ�з� ,
    m.����1 - m.����8 ,
    m.�ż�1 - m.�ż�8 ,
    m.�ϻ�1 - m.�ϻ�8 ,
    m.�Ǿ�1 - m.�Ǿ�8 ,
    m.����1 - m.����8 ,
    m.������1 - m.������8 ,
    m.����1 - m.����8,
    m.�Ƿ�1 - m.�Ƿ�8 ,
    m.����������1 - m.����������8 ,
    m.�м���ȭ1 - m.�м���ȭ8 ,
    m.��ǰ1 - m.��ǰ8 ,
    m.��Ÿ1 - m.��Ÿ8 ,
    
    abs(m.����1-m.����2)+abs(m.����2-m.����3)+abs(m.����3-m.����4)+abs(m.����4-m.����5)+abs(m.����5-m.����6)+abs(m.����6-m.����7)+abs(m.����7-m.����8) ,
    abs(m.�ż�1-m.�ż�2)+abs(m.�ż�2-m.�ż�3)+abs(m.�ż�3-m.�ż�4)+abs(m.�ż�4-m.�ż�5)+abs(m.�ż�5-m.�ż�6)+abs(m.�ż�6-m.�ż�7)+abs(m.�ż�7-m.�ż�8) ,
    abs(m.�ϻ�1-m.�ϻ�2)+abs(m.�ϻ�2-m.�ϻ�3)+abs(m.�ϻ�3-m.�ϻ�4)+abs(m.�ϻ�4-m.�ϻ�5)+abs(m.�ϻ�5-m.�ϻ�6)+abs(m.�ϻ�6-m.�ϻ�7)+abs(m.�ϻ�7-m.�ϻ�8) ,
    abs(m.�Ǿ�1-m.�Ǿ�2)+abs(m.�Ǿ�2-m.�Ǿ�3)+abs(m.�Ǿ�3-m.�Ǿ�4)+abs(m.�Ǿ�4-m.�Ǿ�5)+abs(m.�Ǿ�5-m.�Ǿ�6)+abs(m.�Ǿ�6-m.�Ǿ�7)+abs(m.�Ǿ�7-m.�Ǿ�8) ,
    abs(m.����1-m.����2)+abs(m.����2-m.����3)+abs(m.����3-m.����4)+abs(m.����4-m.����5)+abs(m.����5-m.����6)+abs(m.����6-m.����7)+abs(m.����7-m.����8) ,
    abs(m.������1-m.������2)+abs(m.������2-m.������3)+abs(m.������3-m.������4)+abs(m.������4-m.������5)+abs(m.������5-m.������6)+abs(m.������6-m.������7)+abs(m.������7-m.������8) ,
    abs(m.����1-m.����2)+abs(m.����2-m.����3)+abs(m.����3-m.����4)+abs(m.����4-m.����5)+abs(m.����5-m.����6)+abs(m.����6-m.����7)+abs(m.����7-m.����8) ,
    abs(m.�Ƿ�1-m.�Ƿ�2)+abs(m.�Ƿ�2-m.�Ƿ�3)+abs(m.�Ƿ�3-m.�Ƿ�4)+abs(m.�Ƿ�4-m.�Ƿ�5)+abs(m.�Ƿ�5-m.�Ƿ�6)+abs(m.�Ƿ�6-m.�Ƿ�7)+abs(m.�Ƿ�7-m.�Ƿ�8) ,
    abs(m.����������1-m.����������2)+abs(m.����������2-m.����������3)+abs(m.����������3-m.����������4)+abs(m.����������4-m.����������5)+abs(m.����������5-m.����������6)+abs(m.����������6-m.����������7)+abs(m.����������7-m.����������8),
    abs(m.�м���ȭ1-m.�м���ȭ2)+abs(m.�м���ȭ2-m.�м���ȭ3)+abs(m.�м���ȭ3-m.�м���ȭ4)+abs(�м���ȭ4-�м���ȭ5)+abs(�м���ȭ5-�м���ȭ6)+abs(�м���ȭ6-�м���ȭ7)+abs(�м���ȭ7-�м���ȭ8) ,
    abs(m.��ǰ1-m.��ǰ2)+abs(m.��ǰ2-m.��ǰ3)+abs(m.��ǰ3-m.��ǰ4)+abs(m.��ǰ4-m.��ǰ5)+abs(m.��ǰ5-m.��ǰ6)+abs(m.��ǰ6-m.��ǰ7)+abs(m.��ǰ7-m.��ǰ8) ,
    abs(m.��Ÿ1-m.��Ÿ2)+abs(m.��Ÿ2-m.��Ÿ3)+abs(m.��Ÿ3-m.��Ÿ4)+abs(m.��Ÿ4-m.��Ÿ5)+abs(m.��Ÿ5-m.��Ÿ6)+abs(m.��Ÿ6-m.��Ÿ7)+abs(m.��Ÿ7-m.��Ÿ8) 
    
order by m.����ȣ;

select * from mastertable0;

--��õ

drop table choice;
create table choice as
select  p.���޻�, t.�����ڵ�,
    count(t.�����ڵ�) as ������ǰ��,
    ROW_NUMBER() OVER (PARTITION BY p.���޻� ORDER BY count(t.�����ڵ�) DESC) AS rn

from purprod0 p
join total_code0 t on p.�Һз��ڵ� = t.�Һз��ڵ�
group by p.���޻�, t.�����ڵ�
order by p.���޻�;

select *
from choice;


drop table purprod1;
create table purprod1 as
select p.����ȣ, p.���޻�, t.�����ڵ�, t.�����ڵ�,
    count(t.�����ڵ�) as ���ź�,
    row_number() over (partition by p.����ȣ, p.���޻� order by count(t.�����ڵ�) desc) as rank0,
    ntile(5) over (partition by p.����ȣ, p.���޻� order by count(t.�����ڵ�)) as rank1
from purprod0 p
join total_code0 t on p.�Һз��ڵ� = t.�Һз��ڵ�
group by p.����ȣ, p.���޻�, t.�����ڵ�, t.�����ڵ�
order by p.����ȣ, p.���޻�, rank0;

select * from purprod1;

drop table purprod2;
create table purprod2 as
select p.�Һз��ڵ�, t.�����ڵ�, t.�Һз���, t.���Ǻз���, count(t.�����ڵ�) as ���ź�
from purprod0 p
join total_code0 t on p.�Һз��ڵ� = t.�Һз��ڵ�
group by p.����ȣ, p.���޻�, t.�����ڵ�, t.���Ǻз���, t.�����ڵ�, p.�Һз��ڵ�, t.�Һз���
order by p.����ȣ, p.���޻�;

select * from purprod2;

select * from total_code0;

select * 
from purprod0;

drop table purprod3;
create table purprod3 as
select p.����ȣ, p.���޻�, p.�Һз��ڵ�, t.�����ڵ�, t.�����ڵ�,
    count(p.�Һз��ڵ�) as ���ź�,
    row_number() over (partition by p.����ȣ, p.���޻� order by count(p.�Һз��ڵ�) desc) as rank0,
    case when count(p.�Һз��ڵ�) <> 1 
    then ntile(5) over (partition by p.����ȣ, p.���޻� order by count(p.�Һз��ڵ�)) else 1 end as rank1
from purprod0 p
join total_code0 t on p.�Һз��ڵ� = t.�Һз��ڵ�
group by p.����ȣ, p.���޻�, t.�����ڵ�, t.�����ڵ�, p.�Һз��ڵ�
order by p.����ȣ, p.���޻�, rank0;

select * from purprod3;

drop table purprod4;
create table purprod4 as
select p.����ȣ, p.�Һз��ڵ�, t.�����ڵ�, t.�����ڵ�,
    count(p.�Һз��ڵ�) as ���ź�,
    nvl(sum(p.������), 0) as ���űݾ�,
    row_number() over (partition by p.����ȣ order by count(p.�Һз��ڵ�) desc) as rank0,
    case when count(p.�Һз��ڵ�) <> 1 
    then ntile(5) over (partition by p.����ȣ order by count(p.�Һз��ڵ�)) else 1 end as rank1,
    ntile(5) over (partition by p. ����ȣ order by nvl(sum(p.������), 0)) as rank2,
    (case when count(p.�Һз��ڵ�) <> 1 
    then ntile(5) over (partition by p.����ȣ order by count(p.�Һз��ڵ�)) else 1 end +
    ntile(5) over (partition by p. ����ȣ order by nvl(sum(p.������), 0))) / 2 as rank3
    
from purprod0 p
join total_code0 t on p.�Һз��ڵ� = t.�Һз��ڵ�
group by p.����ȣ, t.�����ڵ�, t.�����ڵ�, p.�Һз��ڵ�
order by p.����ȣ, rank0;

select * from purprod4 where rank3 = 1.5;

select count(p.������), sum(p.������), t.�Һз��� 
from purprod0 p
join total_code0 t on p.�Һз��ڵ� = t.�Һз��ڵ�
group by p.����ȣ, p.�Һз��ڵ�, t.�Һз���
having p.����ȣ = '11763'
order by sum(p.������) desc;