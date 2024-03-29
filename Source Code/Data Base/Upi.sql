--------------------------------------------------------
--  File created - Tuesday-January-17-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table UPI
--------------------------------------------------------

  CREATE TABLE "ECOM"."UPI" 
   (	"ID" NUMBER, 
	"UPI_NAME" VARCHAR2(60 BYTE), 
	"NAME" VARCHAR2(100 BYTE), 
	"UPI_ID" VARCHAR2(60 BYTE), 
	"CID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index UPI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ECOM"."UPI_PK" ON "ECOM"."UPI" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger UPI_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ECOM"."UPI_TRG" 
BEFORE INSERT ON UPI 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT UPI_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ECOM"."UPI_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table UPI
--------------------------------------------------------

  ALTER TABLE "ECOM"."UPI" ADD CONSTRAINT "UPI_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ECOM"."UPI" MODIFY ("UPI_ID" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."UPI" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."UPI" MODIFY ("UPI_NAME" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."UPI" MODIFY ("ID" NOT NULL ENABLE);
