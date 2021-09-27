USE ROLE SYSADMIN;
USE WAREHOUSE COMPUTE_WH;

CREATE DATABASE IF NOT EXISTS VBI;

USE DATABASE VBI;

CREATE SCHEMA IF NOT EXISTS "VBI"."DATA_LAKE";
CREATE SCHEMA IF NOT EXISTS "VBI"."REPORTING";

USE SCHEMA "VBI"."DATA_LAKE";

CREATE OR REPLACE TABLE "VBI"."DATA_LAKE"."REVENUE" 
("REGION" INTEGER NOT NULL,
 "PRODUCT" INTEGER NOT NULL,
 "YEAR" INTEGER NOT NULL,
 "MONTH" INTEGER NOT NULL,
 "REVENUE_MILLIONS" FLOAT NOT NULL,
 "QUANTITY_SOLD" NUMBER NOT NULL
);


CREATE TABLE IF NOT EXISTS "VBI"."DATA_LAKE"."REGION_MASTER" 
("REGION_CODE" INTEGER NOT NULL,
 "REGION_NAME" STRING NOT NULL
);


CREATE OR REPLACE TABLE "VBI"."DATA_LAKE"."PRODUCT_MASTER" 
("PRODUCT_CODE" INTEGER NOT NULL,
 "PRODUCT_NAME" STRING NOT NULL,
 "UNIT_PRICE" INTEGER NOT NULL,
 "VALID_FROM_PERIOD" DATE NOT NULL,
 "VALID_TO_PERIOD" DATE NOT NULL
);


CREATE OR REPLACE TABLE "VBI"."DATA_LAKE"."ORDER_HEADER_SOURCE" 
( "ORDER_NO" INTEGER NOT NULL,
 "ORDER_DATE" DATE NOT NULL,
 "ORDER_TYPE" INTEGER NOT NULL,
 "CUSTOMER_ID" INTEGER NOT NULL,
 "SHIPPING_TYPE" INTEGER NOT NULL,
 "CREATED_ON" DATE NOT NULL,
 "UPDATED_ON" DATE NOT NULL
);

CREATE OR REPLACE TABLE "VBI"."DATA_LAKE"."ORDER_ITEM_SOURCE" 
("ORDER_NUMBER" INTEGER NOT NULL,
 "ITEM_NO" INTEGER NOT NULL,
 "PRODUCT_ID" INTEGER NOT NULL,
 "QUANTITY" INTEGER NOT NULL,
 "PRICE" INTEGER NOT NULL,
 "CREATED_ON" DATE NOT NULL,
 "UPDATED_ON" DATE NOT NULL
);

CREATE OR REPLACE SCHEMA "VBI"."REPORTING";

CREATE OR REPLACE TABLE "VBI"."REPORTING"."RP_ODR_HEAD_SRC" 
("ORDER_NO" INTEGER NOT NULL,
 "ORDER_DATE" DATE NOT NULL,
 "ORDER_TYPE" INTEGER NOT NULL,
 "CUSTOMER_ID" INTEGER NOT NULL,
 "SHIPPING_TYPE" INTEGER NOT NULL,
 "CREATED_ON" DATE NOT NULL,
 "UPDATED_ON" DATE NOT NULL
);

CREATE OR REPLACE TABLE "VBI"."REPORTING"."RP_ODR_ITEM_SRC" 
("ORDER_NUMBER" INTEGER NOT NULL,
 "ITEM_NO" INTEGER NOT NULL,
 "PRODUCT_ID" INTEGER NOT NULL,
 "QUANTITY" INTEGER NOT NULL,
 "PRICE" INTEGER NOT NULL,
 "CREATED_ON" DATE NOT NULL,
 "UPDATED_ON" DATE NOT NULL
);



CREATE STAGE IF NOT EXISTS "VBI"."DATA_LAKE"."VBI_ASSI_1";


CREATE FILE FORMAT IF NOT EXISTS "VBI"."DATA_LAKE"."VBI_ASSI_1"
TYPE = 'CSV'
COMPRESSION = 'AUTO'
FIELD_DELIMITER = ','
RECORD_DELIMITER = '\n'
SKIP_HEADER = 0
FIELD_OPTIONALLY_ENCLOSED_BY = 'NONE'
TRIM_SPACE = FALSE
ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE
ESCAPE = 'NONE'
ESCAPE_UNENCLOSED_FIELD = '\134'
DATE_FORMAT = 'AUTO'
TIMESTAMP_FORMAT = 'AUTO'
NULL_IF = ('\\N');






