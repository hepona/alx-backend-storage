-- stored procedure that computes and store the average weighted score for all student.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
    UPDATE users
    SET
        average_score = (
            SELECT
                IF(SUM(score * weight) > 0, SUM(score * weight) / SUM(weight), 0)
            FROM
                corrections
            JOIN projects ON corrections.project_id  = projects.id;
        )
END //
DELIMITER;
