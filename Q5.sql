SELECT COUNT(*) AS non_optimal_bmi_count
FROM `final-exercise-386809.european_soccer_data.PlayerBMI`
WHERE bmi < 18.5 OR bmi > 24.9;
