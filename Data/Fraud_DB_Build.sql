-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Card_Holder" (
    "id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Card_Holder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Credit_Card" (
    "card" VARCHAR(20)   NOT NULL,
    "chardholder_id" INT   NOT NULL,
    CONSTRAINT "pk_Credit_Card" PRIMARY KEY (
        "card"
     )
);

CREATE TABLE "Merchant_Category" (
    "id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Merchant_Category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Merchant" (
    "id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Transaction" (
    "id" INT   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" MONEY   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    "id_merchant" INT   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Credit_Card" ADD CONSTRAINT "fk_Credit_Card_chardholder_id" FOREIGN KEY("chardholder_id")
REFERENCES "Card_Holder" ("id");

ALTER TABLE "Merchant" ADD CONSTRAINT "fk_Merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "Merchant_Category" ("id");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_card" FOREIGN KEY("card")
REFERENCES "Credit_Card" ("card");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "Merchant" ("id");

