-- 2 projects of weight 1, 1 project of weight 2, 3 projects of weight 5 and 1 project of weight 9
SELECT * FROM users;
SELECT * FROM projects;
SELECT * FROM corrections;

CALL ComputeAverageWeightedScoreForUser((SELECT id FROM users WHERE name = "User 1"));

SELECT "--";
SELECT * FROM users;