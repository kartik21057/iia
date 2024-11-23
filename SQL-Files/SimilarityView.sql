use ViewDB;

-- SELECT 
--     (1 - (LEVENSHTEIN('string1', 'string2') / GREATEST(LENGTH('string1'), LENGTH('string2')))) AS jaro_winkler_similarity;


SELECT * FROM  
(
  SELECT v1.customer_id , v1.Type
   , (0.3 * jaro_winkler_similarity("Ashwin", v1.f_name) + 0.7 * jaro_winkler_similarity("Sheoran", v1.l_name)) as sim
  FROM customer_search v1 
-- 	WHERE (0.3 * jaro_winkler_similarity("Ashwin", v1.f_name) + 0.7 * jaro_winkler_similarity("Sheoran", v1.l_name)) > 0.99 
) as T
 Join Customer_Search on Customer_Search.customer_id= T.customer_id AND  T.Type = Customer_Search.Type
where  T.sim > 0.99 ;

SELECT (0.5 * jaro_winkler_similarity( "Ashwin" , v1.f_name) + 0.5 * jaro_winkler_similarity( "Sheoran"  , v1.l_name)) as value1
  FROM customer_search v1;
  
-- Select * from Customer_search;