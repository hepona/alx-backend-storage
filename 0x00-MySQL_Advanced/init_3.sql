-- Initial
DROP TABLE IF EXISTS corrections;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS projects;

CREATE TABLE IF NOT EXISTS users (
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    average_score float default 0,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS projects (
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    weight int default 1,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS corrections (
    user_id int not null,
    project_id int not null,
    score float default 0,
    KEY `user_id` (`user_id`),
    KEY `project_id` (`project_id`),
    CONSTRAINT fk_user_id FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT fk_project_id FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
);

INSERT INTO users (name) VALUES ("User 1");
SET @user_1 = LAST_INSERT_ID();

INSERT INTO projects (name, weight) VALUES ("Project 1", 1);
SET @project_1 = LAST_INSERT_ID();

INSERT INTO projects (name, weight) VALUES ("Project 2", 1);
SET @project_2 = LAST_INSERT_ID();

INSERT INTO projects (name, weight) VALUES ("Project 3", 2);
SET @project_3 = LAST_INSERT_ID();

INSERT INTO projects (name, weight) VALUES ("Project 4", 5);
SET @project_4 = LAST_INSERT_ID();

INSERT INTO projects (name, weight) VALUES ("Project 5", 5);
SET @project_5 = LAST_INSERT_ID();

INSERT INTO projects (name, weight) VALUES ("Project 6", 5);
SET @project_6 = LAST_INSERT_ID();

INSERT INTO projects (name, weight) VALUES ("Project 7", 9);
SET @project_7 = LAST_INSERT_ID();

INSERT INTO corrections (user_id, project_id, score) VALUES (@user_1, @project_1, 89);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_1, @project_2, 102);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_1, @project_3, 130);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_1, @project_4, 81);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_1, @project_5, 94);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_1, @project_6, 121);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_1, @project_7, 112);