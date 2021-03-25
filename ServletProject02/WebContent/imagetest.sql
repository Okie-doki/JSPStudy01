--------------------------------------------------------
--  颇老捞 积己凳 - 格夸老-3岿-25-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table IMAGETEST
--------------------------------------------------------

  CREATE TABLE "HR"."IMAGETEST" 
   (	"NAME" VARCHAR2(50 BYTE), 
	"TITLE" VARCHAR2(50 BYTE), 
	"IMAGE" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table IMAGETEST
--------------------------------------------------------

  ALTER TABLE "HR"."IMAGETEST" MODIFY ("NAME" NOT NULL ENABLE);
