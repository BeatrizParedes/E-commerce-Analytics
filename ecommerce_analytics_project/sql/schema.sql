-- schema.sql — Star schema for the ecommerce project (DuckDB/Postgres compatible)
-- Create dimensions
CREATE TABLE IF NOT EXISTS DIM_Customer (
    Id BIGINT PRIMARY KEY,
    Customer_Id VARCHAR NOT NULL UNIQUE,
    Customer_Name VARCHAR,
    City VARCHAR,
    State VARCHAR,
    Region VARCHAR
);

CREATE TABLE IF NOT EXISTS DIM_Delivery (
    Id BIGINT PRIMARY KEY,
    Delivery_Id VARCHAR NOT NULL UNIQUE,
    Services VARCHAR,        -- Standard / Same-Day / Scheduled
    P_Sevice DOUBLE,         -- Freight price paid
    D_Forecast TIMESTAMP,    -- Promised delivery date
    D_Date TIMESTAMP,        -- Actual delivery date
    Status VARCHAR           -- Delivered / In_Transit / etc.
);

CREATE TABLE IF NOT EXISTS DIM_Products (
    Id BIGINT PRIMARY KEY,
    Product_Id VARCHAR NOT NULL UNIQUE,
    Product_Name VARCHAR,
    Price DOUBLE,
    Category VARCHAR,
    Subcategory VARCHAR
);

CREATE TABLE IF NOT EXISTS DIM_Shopping (
    Id BIGINT PRIMARY KEY,
    Item_Id VARCHAR NOT NULL,
    Product VARCHAR,
    Quantity INTEGER,
    Price DOUBLE
    -- If your source has Order_Id per item, keep it to aggregate later
);

-- Fact table
CREATE TABLE IF NOT EXISTS FACT_Orders (
    Id BIGINT PRIMARY KEY,
    Order_Date TIMESTAMP,
    Discount DOUBLE,      -- If in %, store as 0..1
    Subtotal DOUBLE,
    Total DOUBLE,
    payment VARCHAR,      -- PIX, Crédito, Débito, Boleto, etc.
    Purchase_Status VARCHAR, -- Confirmado / Cancelado
    Delivery_Id VARCHAR,
    Customer_Id VARCHAR
);

-- Recommended foreign keys (soft-checked in DuckDB; enforce in Postgres)
-- ALTER TABLE FACT_Orders ADD CONSTRAINT fk_customer FOREIGN KEY (Customer_Id) REFERENCES DIM_Customer(Customer_Id);
-- ALTER TABLE FACT_Orders ADD CONSTRAINT fk_delivery FOREIGN KEY (Delivery_Id) REFERENCES DIM_Delivery(Delivery_Id);

-- Loading CSVs (DuckDB example)
-- COPY DIM_Customer FROM 'data/DIM_Customer.csv' (AUTO_DETECT TRUE, HEADER TRUE);
-- COPY DIM_Delivery FROM 'data/DIM_Delivery.csv' (AUTO_DETECT TRUE, HEADER TRUE);
-- COPY DIM_Products FROM 'data/DIM_Products.csv' (AUTO_DETECT TRUE, HEADER TRUE);
-- COPY DIM_Shopping FROM 'data/DIM_Shopping.csv' (AUTO_DETECT TRUE, HEADER TRUE);
-- COPY FACT_Orders FROM 'data/FACT_Orders.csv' (AUTO_DETECT TRUE, HEADER TRUE);
