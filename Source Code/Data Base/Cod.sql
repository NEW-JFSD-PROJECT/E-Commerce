--------------------------------------------------------
--  File created - Tuesday-January-17-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table COD
--------------------------------------------------------

  CREATE TABLE "ECOM"."COD" 
   (	"ID" NUMBER, 
	"COD" VARCHAR2(50 BYTE), 
	"CID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index COD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ECOM"."COD_PK" ON "ECOM"."COD" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger COD_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ECOM"."COD_TRG" 
BEFORE INSERT ON COD 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ECOM"."COD_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COD_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ECOM"."COD_TRG1" 
BEFORE INSERT ON COD 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT COD_SEQ1.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ECOM"."COD_TRG1" ENABLE;
--------------------------------------------------------
--  Constraints for Table COD
--------------------------------------------------------

  ALTER TABLE "ECOM"."COD" MODIFY ("COD" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."COD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ECOM"."COD" ADD CONSTRAINT "COD_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ECOM"."COD" MODIFY ("CID" NOT NULL ENABLE);
