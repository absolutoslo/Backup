SQL tutorial
http://www.w3schools.com/sql/

select curdate();

-- to find values in a column
select distinct currency_code from `fin`.`DP_RemittanceAdvice`;

-- to find where the data is 
select distinct table_name, column_name from information_schema.columns where 1=1 and (column_name) like '%payment_method%' and table_schema='fin';

-- CRA refunds
select * from `res`.`AltPayment_Refund_Recommendation`;

-- who changed bank account /// STATS
select distinct changed_by from `fin`.`B2CHotelBankAccount` order by changed_by asc;


-- Remittance advice data
select ra_id,created,hotel_id,settled_amount,currency_code from `fin`.`DP_RemittanceAdvice`;

-- BMP hotels - 3 VAN - 7 Argentina - 11 Philippines - 13 EUR - 14 GBP - 15 USD - 46 BVC
select hotel_id,status,group_id,dp_type from `bp`.`AltPaymentConfig_Hotel` where status=1 and group_id in (3,7,11,13,14,15,46);

-- Find PSP tool (query
select payment_ref,hotelreservation_id,amount from `res`.`AltPayment` where payment_ref = 

-- SAP errors
select debtor.debtor_id,debtor.cc1,debtor.invoice_cc1,debtor.sap_state,debtor.sap_message,debtor.sap_last_try,dp.group_id,dp.payability_status
from fin.Debtor debtor
join fin.DP_Hotel dp on debtor.debtor_id=dp.hotel_id
where debtor.sap_state = 'error'
and dp.group_id in (7,11,13,14,15)
and dp.active_until is null
and debtor.sap_message not like '%problem importing debtor%'
order by debtor.sap_message asc;


-- SEPA HOTELS
-- to find where the data is /// SEPA hotels
select distinct table_name, column_name from information_schema.columns where (column_name) like '%debtor%' and table_schema='fin';
select distinct payment_method from `fin`.`DebtorPaymentMethod`;
select * from `fin`.`DebtorPaymentMethod` where payment_method ='sepa' and id in ('debtor_ids')


-- Payment method for DP_hotels (PH - EUR - GBP)
select debtor.debtor_id,debtor.payment_method,debtor.date_from,debtor.date_until,hotel.group_id,hotel.active_until from fin.DebtorPaymentMethod debtor
join fin.DP_Hotel hotel on debtor.debtor_id=hotel.hotel_id
where group_id in (11,13,14,15) and debtor.date_until is null and hotel.active_until is null and payment_method != 'banktransfer_nofee';



-- Table DEBTOR
select debtor_id,is_closed,cc1,credit_controller,currencycode,sap_state from`fin`.`Debtor` where debtor_id in 

-- for the cancellation type
select hotelreservation_id,checkin,checkout,currencycode,created,cancel_date,completed_booking from `res`.`B_RoomReservation` where hotelreservation_id in ;

completed_booking	cancellation type (name)	action?
-20	cancelled by hotel (waived commission - guest relocated)	yes
-18	cancelled by guest (partially waived fees)	yes
-14	waived fees	no
-11	cancelled by hotel (reservation statement)	no
-10	invalid CC	note
-8	no show	note
-7	cancelled by hotel (other reason)	yes
-6	cancelled by hotel (hotel closed)	yes
0	cancelled by guest	note
1	overbooking / active (to be investigated)	yes
-13	cancelled by BOOKING (fraudulent)	

Improved formula with CASE WHEN

select hotelreservation_id, CASE completed_booking
WHEN '-20' THEN "Cancelled by hotel (waived commission - guest relocated)"
WHEN '-18' THEN "Cancelled by guest (partially waived fees)"
WHEN '-14' THEN "Waived fees"
WHEN '-11' THEN "Cancelled by hotel (reservation statement)"
WHEN '-10' THEN "Invalid CC"
WHEN '-8' THEN "No show"
WHEN '-7' THEN "Cancelled by hotel (other reason)"
WHEN '-6' THEN "Cancelled by hotel (hotel closed)"
WHEN '0' THEN "Cancelled by guest"
WHEN '1' THEN "Overbooking / active"
WHEN '-13' THEN "Cancelled by BOOKING (fraudulent)"
ELSE "Never seen before!" END as roomstatus
from `res`.`B_RoomReservation` where hotelreservation_id in (paste 'booking numbers' here, comma separated);

or

select hotelreservation_id,info from `res`.`B_BookingNote` where type = 'cancellation' and hotelreservation_id in 

or join!
select info.hotelreservation_id,info.checkin,info.checkout,info.currencycode,info.created,info.cancel_date,info.completed_booking,note.info 
from `res`.`B_RoomReservation` info
left join `res`.`B_BookingNote` note
on info.hotelreservation_id=note.hotelreservation_id
where note.type = 'cancellation'
and info.hotelreservation_id in

-- Payment method of hotels in BMP?
select debtor_id,payment_method from `fin`.`DebtorPaymentMethod`
inner join `fin`.`AdyenB2CHotel`
on `fin`.`DebtorPaymentMethod`.debtor_id=`fin`.`AdyenB2CHotel`.hotel_id;

-- bLOCK PAYOUT DATA
select * from `fin`.`BlockedPayments`;

-- bank account country specifics
SELECT * from `fin`.`SAP_BankSpecs`;

-- query SAP bank data
SELECT * from `fin`.`SAP_BankMaster`;


-- query for BMP hotels with legal country nl
select d.is_closed, d.cc1, d.invoice_cc1, h.*
from fin.DP_Hotel h
left outer join fin.Debtor d on (h.hotel_id = d.debtor_id)
where h.active_until is null 
and h.group_id in (7,11,13,14,15)
and d.invoice_cc1='nl'
and d.invoice_cc1 <> d.cc1
order by h.hotel_id;

-- Argentinian hotels in USD payout
select debtor_id,bank_cc1,payout_currency,date_until,active_until from fin.B2CHotelBankAccount 
join fin.DP_Hotel
on fin.DP_Hotel.hotel_id=fin.B2CHotelBankAccount.debtor_id 
where fin.DP_Hotel.group_id='7' and payout_currency = 'USD' and date_until is null and active_until is null;


-- Tables index

`bp`.`AltPaymentConfig_Group` -- group configurations!
`bp`.`AltPaymentConfig_Hotel` -- hotels in BMP
bp.B_Hotel --  all hotels
bp.B_Partner
bp.B_Hotelreg
`bp`.`CountryCommission` -- commission per country (ALSO DIRECT PAY AND VIRTUAL CARD)

`res`.`AltPayment` -- all BMP
`res`.`AltPayment_History` -- payment_ref and status in the system
`res`.`AltPaymentNotification` -- payment status in Adyen
`res`.`B_BookingNote` -- cancellation type (info)
`res`.`B_HotelReservation` -- all reservations data
`res`.`B_RoomReservation` -- all reservations data
`res`.`B_RoomReservationHistory` -- all resservations data
`res`.`CustomerPayment` -- CRA payouts to customers
`res`.`HotelReservationComplaint` -- all complaints!

