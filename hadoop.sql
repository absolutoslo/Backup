HADOOP general commands

connecting to Hadoop using Putty Tray
Hostname: hadoop-staging.prod.booking.com

CREATE DATABASE IF NOT EXISTS ${env:USER};


drop table if exists ${env:USER}.mynewtable;
create table ${env:USER}.newtable as *insert query here*


Cancellations fees later waived
drop table cdiloreto.feeslaterwaived;	

create table cdiloreto.feeslaterwaived as select *,DATEDIFF(adyen.creation_date,res.cancel_date) as DateDiff from (
select type,hotelreservation_id,merchant_account,creation_date,gross_amount,status from fin_AdyenB2CSettlement where type='refunded'
) adyen inner join (
select hotelreservation_id as resid,cancel_date,checkin,checkout,completed_booking from res_b_roomreservation where completed_booking in (0,-8,-10)
) res
on adyen.hotelreservation_id=res.resid;


Complaints -- doesnt work!!!--
create table cdiloreto.complaints as 
	select bvc.id, res.hotelreservation_id, res.complaint_type, res.complaint_type_name ,res.policy 
	from 
	(select apc.hotel_id as id 
		from bp_altpaymentconfig_hotel apc join bp_b_hotel bh 
		on bh.id = apc.hotel_id 
		where apc.group_id in (3,46) and bh.is_closed = 0 and apc.status = 1) bvc 
	join reservation_flat res on bvc.id = res.hotel_id where res.complaint_type <> 0;


VANs open checkin today
 
from query page
create table ${env:USER}.checkin_today as select * from (select res.hotelreservation_id as resid, res.checkin, res.policy, res.completed_booking_name as status from (select bh.id as id from bp_altpaymentconfig_hotel apc join bp_b_hotel bh on bh.id = apc.hotel_id where apc.group_id in (3,46) and bh.is_closed = 0 and apc.status = 1) bvc join reservation_flat res on bvc.id = res.hotel_id where date(res.checkin) = to_date(from_unixtime(unix_timestamp())) and completed_booking_name = 'ok') restoday join (select hotelreservation_id from (select a.hotelreservation_id as hotelreservation_id from (select hotelreservation_id from pay_vcchistory where activity_type='Issue' group by hotelreservation_id) a left outer join (select hotelreservation_id from pay_vcchistory WHERE activity_type = 'Closed' group by hotelreservation_id) b on a.hotelreservation_id = b.hotelreservation_id where b.hotelreservation_id IS null and a.hotelreservation_id > 0) opencards group by opencards.hotelreservation_id) cards on restoday.resid = cards.hotelreservation_id;




hotels not charging VANs!
5 tables

-- Need to add whether xml or fax and which xml in case

drop table cdiloreto.badhotels;

create table cdiloreto.badhotels as
select hotelcc.id,hotelcc.name,hotelcc.city,hotelcc.cc1,hotel.group_id,vcc.hotelreservation_id,vcc.amount,vcc.activity_type
from pay_vcchistory vcc
join reservation_flat res
on res.hotelreservation_id = vcc.hotelreservation_id
join bp_b_hotel hotelcc
on hotelcc.id = res.hotel_id
join bp_altpaymentconfig_hotel hotel
on hotel.hotel_id = hotelcc.id
where vcc.activity_type in ("FundsReturned","AuthVariance")
and vcc.amount > 100
and hotel.group_id in (3,46)
and hotel.status = 1;

create table cdiloreto.prova as
select *
from pay_vcchistory
where activity_type = "AuthVariance"
and amount > 20;



create table cdiloreto.goodhotels as
select hotelcc.id,hotelcc.name,hotelcc.city,hotelcc.cc1,hotel.group_id,vcc.hotelreservation_id,vcc.amount,vcc.activity_type
  from pay_vcchistory vcc
  join reservation_flat res
on res.hotelreservation_id = vcc.hotelreservation_id
join bp_b_hotel hotelcc
on hotelcc.id = res.hotel_id
join bp_altpaymentconfig_hotel hotel
on hotel.hotel_id = hotelcc.id
where vcc.activity_type in ("FundVan")
and hotel.group_id in (3,46)
and hotel.status = 1;

-- doesnt work!!! ---
--select bad.id,count(bad.activity_type),count(good.activity_type)
--from cdiloreto.badhotels bad
--join cdiloreto.goodhotels good
--on bad.id = good.id
--group by bad.id;

 This works!
create table cdiloreto.badhotels_id as
select id,count(activity_type) as RUFS
from cdiloreto.badhotels 
group by id;

create table cdiloreto.goodhotels_id as
select id,count(activity_type) as total
from cdiloreto.goodhotels
group by id;

Bram - get distinct hotelreservation_id to eliminate the vans that are reissued
create table cdiloreto.goodhotels_id as
select id,count(DISTINCT hotelreservation_id) as total
from cdiloreto.goodhotels
group by id;


create table cdiloreto.badhotels_stats as
select bad.id,hotelcc.name,hotelcc.city,hotelcc.cc1,hotel.group_id,bad.RUFS,good.total,round(bad.RUFS/good.total*100,2) as percentage, 
CASE 
when bad.RUFS/good.total>0.10 and bad.RUFS>=10 then 'BAD'
when bad.RUFS/good.total<=0.10 or bad.RUFS<10 then 'OK'
END as status
from cdiloreto.badhotels_id bad
join cdiloreto.goodhotels_id good
on bad.id = good.id
join bp_b_hotel hotelcc
on hotelcc.id = bad.id
join bp_altpaymentconfig_hotel hotel
on hotel.hotel_id = hotelcc.id
order by percentage desc;


Alternative that doesnt work!!!!

create table cdiloreto.badhotels_find as
select id,name,city,cc1,count(activity_type = "FundVan"), count(activity_type = "AuthVariance")
from cdiloreto.badhotels
group by id,name,city,cc1;

