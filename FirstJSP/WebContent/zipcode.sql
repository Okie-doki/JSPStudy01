--------------------------------------------------------
--  파일이 생성됨 - 월요일-3월-15-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ZIPCODE
--------------------------------------------------------

  CREATE TABLE "HR"."ZIPCODE" 
   (	"ZIPCODE" VARCHAR2(100 BYTE), 
	"SIDO" VARCHAR2(100 BYTE), 
	"GUGUN" VARCHAR2(100 BYTE), 
	"DONG" VARCHAR2(500 BYTE), 
	"BUNJI" VARCHAR2(70 BYTE), 
	"SEQ" NUMBER(38,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
