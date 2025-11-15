-- analysis.sql — Helper views & KPIs in SQL (DuckDB/Postgres compatible where possible)

-- 1) Data quality: key checks
-- Uniqueness by order
SELECT COUNT(*) AS total_orders, COUNT(DISTINCT Id) AS distinct_orders FROM FACT_Orders;

-- Orphans (Customer_Id without DIM match)
SELECT COUNT(*) AS orphan_customers
FROM FACT_Orders f
LEFT JOIN DIM_Customer c ON f.Customer_Id = c.Customer_Id
WHERE c.Customer_Id IS NULL;

-- 2) Feature engineering in SQL
CREATE OR REPLACE VIEW v_orders AS
SELECT
  f.*,
  d.Services,
  d.P_Sevice,
  d.D_Forecast,
  d.D_Date,
  DATE_DIFF('day', d.D_Forecast, d.D_Date) AS delivery_delay_days,
  DATE_DIFF('day', f.Order_Date, d.D_Date) AS delivery_lead_time,
  CASE WHEN d.D_Date > d.D_Forecast THEN 1 ELSE 0 END AS is_late,
  CASE WHEN f.Purchase_Status = 'Confirmado' THEN 1 ELSE 0 END AS is_confirmed,
  CASE WHEN f.Total > 0 THEN d.P_Sevice / f.Total ELSE NULL END AS freight_share,
  (f.Discount * f.Subtotal) AS discount_abs
FROM FACT_Orders f
LEFT JOIN DIM_Delivery d ON f.Delivery_Id = d.Delivery_Id;

-- 3) KPIs
-- Receita total e ticket médio
SELECT SUM(Total) AS revenue, AVG(Total) AS avg_ticket FROM v_orders WHERE is_confirmed=1;

-- Prazo médio e atraso médio
SELECT AVG(delivery_lead_time) AS avg_lead_time, AVG(delivery_delay_days) AS avg_delay FROM v_orders WHERE is_confirmed=1;

-- Taxa de atraso por serviço
SELECT Services, AVG(is_late)::DOUBLE AS late_rate, COUNT(*) AS n
FROM v_orders WHERE is_confirmed=1
GROUP BY Services ORDER BY late_rate DESC;

-- Conversão por método de pagamento
SELECT payment, AVG(is_confirmed)::DOUBLE AS conversion, COUNT(*) AS n
FROM v_orders GROUP BY payment ORDER BY conversion DESC;

-- Sazonalidade mensal por região (receita confirmada)
SELECT DATE_TRUNC('month', Order_Date) AS month, Region, SUM(Total) AS revenue
FROM v_orders v
LEFT JOIN DIM_Customer c ON v.Customer_Id = c.Customer_Id
WHERE is_confirmed=1
GROUP BY month, Region
ORDER BY month, Region;
