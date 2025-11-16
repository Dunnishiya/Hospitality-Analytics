-- KPI
CREATE VIEW v_kpi_summary AS
SELECT
  concat(round(SUM(fb.revenue_realized)/1000000.0,2),'M') AS total_revenue,
  concat(round(COUNT(fb.booking_id)/1000,2),'K') AS total_bookings,
  concat(round(SUM(fa.successful_bookings)/1000,2),'K') AS total_successful,
  concat(round(SUM(fa.capacity)/1000000.0,2),'M') AS total_capacity,
 concat(ROUND(SUM(fa.successful_bookings)/SUM(fa.capacity)*100,2),'%') AS occupancy_rate
FROM fact_bookings fb
LEFT JOIN fact_aggregated_bookings fa
ON fb.property_id = fa.property_id
AND fb.check_in_date = fa.check_in_date;

select * from v_kpi_summary;

-- Average daily rate
SELECT t2.city,
    concat(round(SUM(t1.revenue_realized)/1000000,2),'M') AS Total_Revenue,
    concat(round(COUNT(t1.booking_id)/1000,1),'K') AS Total_Bookings, 
    concat(round(SUM(t1.revenue_realized) / COUNT(t1.booking_id)/1000,2),'K') AS `Average Daily Rate`
FROM
    fact_bookings t1
JOIN dim_hotels t2 ON t1.property_id = t2.property_id
GROUP BY t2.city;
    
-- Revenue per room class
SELECT t2.room_class,
    concat(round(SUM(t1.revenue_realized)/1000000,1),'M') AS Total_Revenue
FROM fact_bookings t1
JOIN dim_rooms t2 ON t1.room_category = t2.room_id
GROUP BY t2.room_class order by Total_Revenue desc;
    
-- weekly revenue-procedure call. give property id and Week no as argument
CALL Get_Weekly_Revenue(16558,'W 23');

-- Total Revenue by City
SELECT
t2.city,concat(round(SUM(t1.revenue_realized)/1000000.0,2),'M') AS total_revenue
  FROM fact_bookings t1
JOIN dim_hotels t2 ON t1.property_id = t2.property_id
GROUP BY t2.city order by SUM(t1.revenue_realized) desc;

-- Revenue by Booking status
SELECT 
    booking_status AS Booking_Status,
    concat(round(SUM(revenue_realized)/1000000.0,2),'M') AS total_revenue
FROM fact_bookings
GROUP BY booking_status
ORDER BY SUM(revenue_realized) DESC;

-- Cities with Above-Average Revenue- Subquery
SELECT 
    h.city,
    ROUND(SUM(fb.revenue_realized)/1000000,2) AS Total_Revenue_Million
FROM fact_bookings fb
JOIN dim_hotels h ON fb.property_id = h.property_id
GROUP BY h.city
HAVING SUM(fb.revenue_realized) > 
       (SELECT AVG(revenue_realized) FROM fact_bookings);

-- Categorize Hotels Based on Revenue Performance
SELECT 
    h.property_name,
    h.city,
    SUM(fb.revenue_realized) AS Total_Revenue,
    CASE 
        WHEN SUM(fb.revenue_realized) > 100000000 THEN 'High Revenue Hotel'
        WHEN SUM(fb.revenue_realized) BETWEEN 50000000 AND 100000000 THEN 'Medium Revenue Hotel'
        ELSE 'Low Revenue Hotel'
    END AS Revenue_Category
FROM fact_bookings fb
JOIN dim_hotels h ON fb.property_id = h.property_id
GROUP BY h.property_name, h.city
ORDER BY Total_Revenue DESC;

