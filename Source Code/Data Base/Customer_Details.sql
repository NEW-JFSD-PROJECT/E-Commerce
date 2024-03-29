--------------------------------------------------------
--  File created - Tuesday-January-17-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMER_DETAILS
--------------------------------------------------------

  CREATE TABLE "ECOM"."CUSTOMER_DETAILS" 
   (	"ID" NUMBER, 
	"FULLNAME" VARCHAR2(60 BYTE), 
	"GENDER" VARCHAR2(60 BYTE), 
	"AGE" VARCHAR2(60 BYTE), 
	"PHNO" VARCHAR2(60 BYTE), 
	"EMAIL" VARCHAR2(60 BYTE), 
	"PASSWORD" VARCHAR2(60 BYTE), 
	"ADDRESS" VARCHAR2(60 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ECOM"."CUSTOMER_DETAILS_PK" ON "ECOM"."CUSTOMER_DETAILS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger CUSTOMER_DETAILS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ECOM"."CUSTOMER_DETAILS_TRG" 
BEFORE INSERT ON CUSTOMER_DETAILS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ECOM"."CUSTOMER_DETAILS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CUSTOMER_DETAILS_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ECOM"."CUSTOMER_DETAILS_TRG1" 
BEFORE INSERT ON CUSTOMER_DETAILS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT CUSTOMER_DETAILS_SEQ1.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ECOM"."CUSTOMER_DETAILS_TRG1" ENABLE;
--------------------------------------------------------
--  Constraints for Table CUSTOMER_DETAILS
--------------------------------------------------------

  ALTER TABLE "ECOM"."CUSTOMER_DETAILS" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CUSTOMER_DETAILS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CUSTOMER_DETAILS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CUSTOMER_DETAILS" MODIFY ("PHNO" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CUSTOMER_DETAILS" MODIFY ("AGE" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CUSTOMER_DETAILS" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CUSTOMER_DETAILS" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CUSTOMER_DETAILS" ADD CONSTRAINT "CUSTOMER_DETAILS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ECOM"."CUSTOMER_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
