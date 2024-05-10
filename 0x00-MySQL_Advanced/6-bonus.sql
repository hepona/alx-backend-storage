-- stored procedure AddBonus that adds a new correction for a student.
CREATE PROCEDURE AddBonus  @user_id, @project_name ,@score
AS
INSERT INTO corrections (user_id, project_name, score)
VALUES (@user_id, @project_name, @score)