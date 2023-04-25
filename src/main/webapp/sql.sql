create table TBL_JUMIN_202108(
JUMIN VARCHAR2(20) NOT NULL PRIMARY KEY,
NAME VARCHAR2(15),
PHONE VARCHAR2(15),
ADDRESS VARCHAR2(50)
);

insert INTO TBL_JUMIN_202108 values('710101-1000001','���ֹ�','010-1111-1111','��⵵ ������ ������ ����1��');
insert INTO TBL_JUMIN_202108 values('720101-2000001','���ֹ�','010-1111-2222','��⵵ ������ ������ ����2��');
insert INTO TBL_JUMIN_202108 values('730101-1000001','���ֹ�','010-1111-3333','��⵵ ������ ������ ������');
insert INTO TBL_JUMIN_202108 values('740101-2000001','ȫ�ֹ�','010-1111-4444','��⵵ ������ ������ �꼺��');
insert INTO TBL_JUMIN_202108 values('750101-1000001','���ֹ�','010-1111-5555','��⵵ ������ �߿��� ������');
insert INTO TBL_JUMIN_202108 values('760101-2000001','���ֹ�','010-1111-6666','��⵵ ������ �߿��� �߾ӵ�');
insert INTO TBL_JUMIN_202108 values('770101-1000001','���ֹ�','010-1111-7777','��⵵ ������ �߿��� ������');
insert INTO TBL_JUMIN_202108 values('780101-2000001','���ֹ�','010-1111-8888','��⵵ ������ �߿��� �ϴ����');
insert INTO TBL_JUMIN_202108 values('790101-1000001','���ֹ�','010-1111-9999','��⵵ ������ �д籸 ��ž1��');
insert INTO TBL_JUMIN_202108 values('800101-2000001','���ֹ�','010-2222-1111','��⵵ ������ �д籸 ��ž2��');

create table TBL_HOSP_202108(
HOSPCODE CHAR(4) NOT NULL PRIMARY KEY,
HOSPNAME VARCHAR2(40),
HOSPTEL VARCHAR2(15),
HOSPADDR VARCHAR2(50)
);

insert into TBL_HOSP_202108 values('H001','��_����','031-1111-2222','10');
insert into TBL_HOSP_202108 values('H002','��_����','031-1111-3333','20');
insert into TBL_HOSP_202108 values('H003','��_����','031-1111-4444','30');
insert into TBL_HOSP_202108 values('H004','��_����','031-1111-5555','40');

create table TBL_VACCRESV_202108(
RESVNO NUMBER(8) NOT NULL PRIMARY KEY,
JUMIN VARCHAR2(20),
HOSPCODE CHAR(4),
RESVDATE DATE,
RESVTIME NUMBER(4),
VCODE CHAR(4)
);


INSERT INTO TBL_VACCRESV_202108 VALUES(20210001,'710101-1000001','H001','20210801',0930,'V001');
INSERT INTO TBL_VACCRESV_202108 VALUES(20210002,'720101-2000001','H002','20210801',1030,'V002');
INSERT INTO TBL_VACCRESV_202108 VALUES(20210003,'730101-1000001','H003','20210801',1130,'V003');
INSERT INTO TBL_VACCRESV_202108 VALUES(20210004,'740101-2000001','H001','20210801',1230,'V001');
INSERT INTO TBL_VACCRESV_202108 VALUES(20210005,'750101-1000001','H001','20210801',1330,'V002');
INSERT INTO TBL_VACCRESV_202108 VALUES(20210006,'760101-2000001','H002','20210801',1430,'V003');
INSERT INTO TBL_VACCRESV_202108 VALUES(20210007,'770101-1000001','H003','20210801',1530,'V001');
INSERT INTO TBL_VACCRESV_202108 VALUES(20210008,'780101-2000001','H001','20210801',1630,'V002');
INSERT INTO TBL_VACCRESV_202108 VALUES(20210009,'790101-1000001','H001','20210801',1730,'V003');
INSERT INTO TBL_VACCRESV_202108 VALUES(20210010,'800101-2000001','H002','20210801',1830,'V001');

SELECT * FROM TBL_JUMIN_202108
SELECT * FROM TBL_HOSP_202108
SELECT * FROM TBL_VACCRESV_202108

select v.RESVNO, j.NAME,case substr(j.JUMIN,8,1) when '1' then '��' when '2' then '��' end as gender
, case vcode when 'V001' then 'A���' when 'V002' then 'B���' when 'V003' then 'C���' end as vcode
, case v.hospcode when 'H001' then '��_����' when 'H002' then '��_����' when 'H003' then '��_����' when 'H004' then '��_����' end as hcode
, case h.hospaddr when '10' then '����' when '20' then '����' when '30' then '�뱸' when '40' then '����' end as hospaddr
, to_char(v.RESVDATE,'yyyy\"��\"mm\"��\"dd\"��\"') as resvdate
, substr(to_char(v.RESVTIME,'FM0000'),1,2) ||':'|| substr(to_char(v.RESVTIME,'FM0000'),3,4)
from TBL_JUMIN_202108 j, TBL_HOSP_202108 h, TBL_VACCRESV_202108 v 
where j.JUMIN = v.JUMIN and h.HOSPCODE = v.HOSPCODE
select h.HOSPADDR, case h.hospaddr when '10' then '����' when '20' then '����' when '30' then '�뱸' when '40' then '����' end as hosparea,count(v.HOSPCODE) from TBL_HOSP_202108 h, TBL_VACCRESV_202108 v where h.HOSPCODE = v.HOSPCODE(+) group by HOSPADDR order by HOSPADDR