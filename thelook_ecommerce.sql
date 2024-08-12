WITH customer_info AS (
  SELECT
    id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    age,
    IF(gender = 'F', 'Female', IF(gender = 'M', 'Male', gender)) AS gender,
    state,
    street_address,
    postal_code,
    -- handling null value
    CASE
        WHEN postal_code = '69980-000' AND (city IS NULL OR city = 'null') THEN 'Cruzeiro do Sul'
        WHEN postal_code = '57360-000' AND (city IS NULL OR city = 'null') THEN 'Girau do Ponciano'
        WHEN postal_code = '68924-000' AND (city IS NULL OR city = 'null') THEN 'Vitoria do Jari'
        WHEN postal_code = '69630-000' AND (city IS NULL OR city = 'null') THEN 'Benjamin Constant'
        WHEN postal_code = '69880-000' AND (city IS NULL OR city = 'null') THEN 'Eirunepe'
        WHEN postal_code = '69600-000' AND (city IS NULL OR city = 'null') THEN 'Sao Paulo de Olivenca'
        WHEN postal_code = '69830-000' AND (city IS NULL OR city = 'null') THEN 'Labrea'
        WHEN postal_code = '69460-000' AND (city IS NULL OR city = 'null') THEN 'Coari'
        WHEN postal_code = '69800-000' AND (city IS NULL OR city = 'null') THEN 'Humaita'
        WHEN postal_code = '69280-000' AND (city IS NULL OR city = 'null') THEN 'Manicore'
        WHEN postal_code = '69435-000' AND (city IS NULL OR city = 'null') THEN 'Manquiri'
        WHEN postal_code = '69250-000' AND (city IS NULL OR city = 'null') THEN 'Careiro'
        WHEN postal_code = '69735-000' AND (city IS NULL OR city = 'null') THEN 'Presidente Figueiredo'
        WHEN postal_code = '69200-000' AND (city IS NULL OR city = 'null') THEN 'Borba'
        WHEN postal_code = '69230-000' AND (city IS NULL OR city = 'null') THEN 'Nova Olinda Do Norte'
        WHEN postal_code = '69190-000' AND (city IS NULL OR city = 'null') THEN 'Maues'
        WHEN postal_code = '41130' AND (city IS NULL OR city = 'null') THEN 'Mardwal'
        WHEN postal_code = '29140' AND (city IS NULL OR city = 'null') THEN 'Malaga'
        WHEN postal_code = '50197' AND (city IS NULL OR city = 'null') THEN 'Plataforma Logistica Plaza'
        WHEN postal_code = '50191' AND (city IS NULL OR city = 'null') THEN 'Barrio De Juslibol'
        WHEN postal_code = '50016' AND (city IS NULL OR city = 'null') THEN 'Zaragoza'
        WHEN postal_code = '47240-000' AND (city IS NULL OR city = 'null') THEN 'Pilao Arcado'
        WHEN postal_code = '47350-000' AND (city IS NULL OR city = 'null') THEN 'Sento Se'
        WHEN postal_code = '48760-000' AND (city IS NULL OR city = 'null') THEN 'Araci'
        WHEN postal_code = '44330-000' AND (city IS NULL OR city = 'null') THEN 'Sao Goncalo dos Campos'
        WHEN postal_code = '48790-000' AND (city IS NULL OR city = 'null') THEN 'Tucano'
        WHEN postal_code = '48475-000' AND (city IS NULL OR city = 'null') THEN 'Itapicuru'
        WHEN postal_code = '38300' AND (city IS NULL OR city = 'null') THEN 'Las Cañadas Del Teide'
        WHEN postal_code = '38297' AND (city IS NULL OR city = 'null') THEN 'Aeropuerto De Los Rodeos'
        WHEN postal_code = '25191' AND (city IS NULL OR city = 'null') THEN 'Calle C'
        WHEN postal_code = '62150-000' AND (city IS NULL OR city = 'null') THEN 'Santana do Acarau'
        WHEN postal_code = '63610-000' AND (city IS NULL OR city = 'null') THEN 'Mombaca'
        WHEN postal_code = '63560-000' AND (city IS NULL OR city = 'null') THEN 'Acopiara'
        WHEN postal_code = '63540-000' AND (city IS NULL OR city = 'null') THEN 'Varzea Alegre'
        WHEN postal_code = '46394' AND (city IS NULL OR city = 'null') THEN 'Ventas De Poyo'
        WHEN postal_code = '46988' AND (city IS NULL OR city = 'null') THEN 'Poligono Fuente Del Jarro'
        WHEN postal_code = '3581' AND (city IS NULL OR city = 'null') THEN 'Sant Pere'
        WHEN postal_code = '28946' AND (city IS NULL OR city = 'null') THEN 'Fuenlabrada'
        WHEN postal_code = '28947' AND (city IS NULL OR city = 'null') THEN 'Fuenlabrada'
        WHEN postal_code = '28909' AND (city IS NULL OR city = 'null') THEN 'Getafe'
        WHEN postal_code = '28524' AND (city IS NULL OR city = 'null') THEN 'Rivas-Vaciamadrid'
        WHEN postal_code = '19803' AND (city IS NULL OR city = 'null') THEN 'Northwest Delaware'
        WHEN postal_code = '72016-190' AND (city IS NULL OR city = 'null') THEN 'Taguatinga Sul'
        WHEN postal_code = '72110-600' AND (city IS NULL OR city = 'null') THEN 'Colônia Agrícola Samambaia'
        WHEN postal_code = '72025-065' AND (city IS NULL OR city = 'null') THEN 'CSE 6'
        WHEN postal_code = '29142' AND (city IS NULL OR city = 'null') THEN 'Cariacica'
        WHEN postal_code = '32060' AND (city IS NULL OR city = 'null') THEN 'Live Oak'
        WHEN postal_code = '33579' AND (city IS NULL OR city = 'null') THEN 'Riverview'
        WHEN postal_code = '34476' AND (city IS NULL OR city = 'null') THEN 'Ocala'
        WHEN postal_code = '32092' AND (city IS NULL OR city = 'null') THEN 'St. Johns'
        WHEN postal_code = '32826' AND (city IS NULL OR city = 'null') THEN 'Saint Augustine'
        WHEN postal_code = '32828' AND (city IS NULL OR city = 'null') THEN 'Orlando'
        WHEN postal_code = '32940' AND (city IS NULL OR city = 'null') THEN 'Melbourne'
        WHEN postal_code = '33437' AND (city IS NULL OR city = 'null') THEN 'Boynton Beach'
        WHEN postal_code = '15174' AND (city IS NULL OR city = 'null') THEN 'Acea Da Ma'
        WHEN postal_code = '30102' AND (city IS NULL OR city = 'null') THEN 'Acworth'
        WHEN postal_code = '30028' AND (city IS NULL OR city = 'null') THEN 'Cumming'
        WHEN postal_code = '30093' AND (city IS NULL OR city = 'null') THEN 'Norcross'
        WHEN postal_code = '30044' AND (city IS NULL OR city = 'null') THEN 'Lawrenceville'
        WHEN postal_code = '30016' AND (city IS NULL OR city = 'null') THEN 'Covington'
        WHEN postal_code = '30045' AND (city IS NULL OR city = 'null') THEN 'Lawrenceville'
        WHEN postal_code = '75370-000' AND (city IS NULL OR city = 'null') THEN 'Goianira'
        WHEN postal_code = '73900-000' AND (city IS NULL OR city = 'null') THEN 'Posse'
        WHEN postal_code IN ('69980-000', '57360-000', '68924-000', '69630-000', '69880-000', '69600-000', 
                         '69830-000', '69460-000', '69800-000', '69280-000', '69435-000', '69250-000', 
                         '69735-000', '69200-000', '69230-000', '69190-000', '41130', '29140', 
                         '50197', '50191', '50016', '47240-000', '47350-000', '48760-000', 
                         '44330-000', '48790-000', '48475-000', '38300', '38297', '25191', 
                         '62150-000', '63610-000', '63560-000', '63540-000', '46394', '46988', 
                         '3581', '28946', '28947', '28909', '28524', '19803', '72016-190', 
                         '72110-600', '72025-065', '29142', '32060', '33579', '34476', 
                         '32092', '32826', '32828', '32940', '33437', '15174', '30102', 
                         '30028', '30093', '30044', '30016', '30045', '75370-000', 
                         '73900-000', '631-830', '631-820', '631-810', '630-850', 
                         '630-857', '630-856', '630-040', '630-520', '630-492', 
                         '630-490', '641-870', '630-500', '642-370', '641-465', 
                         '641-860', '642-315', '641-920')
        AND (city IS NULL OR city = 'null') THEN 'Jeju-si'
        ELSE city
    END AS city,
    country,
    latitude,
    longitude,
    traffic_source,
    created_at,
    EXTRACT(YEAR FROM created_at) AS year,
    EXTRACT(MONTH FROM created_at) AS month
  FROM
    `bigquery-public-data.thelook_ecommerce.users`
),
report_monthly_orders_product_agg AS (
  SELECT
    year,
    month,
    state,
    country,
    traffic_source,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT id) AS new_customers,
    ROUND(AVG(age), 2) AS avg_age
  FROM
    customer_info
  GROUP BY
    year, month, state, country, traffic_source
)
--SELECT * FROM customer_info
SELECT * FROM report_monthly_orders_product_agg
ORDER BY
  year DESC, month DESC