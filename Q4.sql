CREATE TABLE `final-exercise-386809.european_soccer_data.PlayerBMI` AS (
 SELECT
   *,
   ROUND (weight / 2.205) AS kg_peso,
   height / 100 AS m_height,
   (weight / 2.205) / POWER(height / 100, 2) AS bmi
 FROM
   `final-exercise-386809.european_soccer_data.player`
);


SELECT *
FROM `final-exercise-386809.european_soccer_data.PlayerBMI`
WHERE bmi BETWEEN 18.5 AND 24.9;
