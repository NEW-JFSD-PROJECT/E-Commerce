--------------------------------------------------------
--  File created - Tuesday-January-17-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CARD
--------------------------------------------------------

  CREATE TABLE "ECOM"."CARD" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(100 BYTE), 
	"CARD_NUMBER" VARCHAR2(50 BYTE), 
	"MONTH" VARCHAR2(45 BYTE), 
	"YEAR" VARCHAR2(45 BYTE), 
	"CVV" VARCHAR2(5 BYTE), 
	"CID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ECOM"."CARD_PK" ON "ECOM"."CARD" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger CARD_TRG2
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ECOM"."CARD_TRG2" 
BEFORE INSERT ON CARD 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT CARD_SEQ2.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ECOM"."CARD_TRG2" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CARD_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ECOM"."CARD_TRG" 
BEFORE INSERT ON CARD 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ECOM"."CARD_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CARD_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ECOM"."CARD_TRG1" 
BEFORE INSERT ON CARD 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ECOM"."CARD_TRG1" ENABLE;
--------------------------------------------------------
--  Constraints for Table CARD
--------------------------------------------------------

  ALTER TABLE "ECOM"."CARD" MODIFY ("CID" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CARD" ADD CONSTRAINT "CARD_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ECOM"."CARD" MODIFY ("CVV" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CARD" MODIFY ("YEAR" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CARD" MODIFY ("MONTH" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CARD" MODIFY ("CARD_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CARD" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."CARD" MODIFY ("ID" NOT NULL ENABLE);
