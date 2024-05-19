insert into REFERENCE (CODE, TITLE, REF_TYPE)
-- TASK
values ('task', 'Task', 2),
       ('story', 'Story', 2),
       ('bug', 'Bug', 2),
       ('epic', 'Epic', 2),
-- SPRINT_STATUS
       ('planning', 'Planning', 4),
       ('active', 'Active', 4),
       ('finished', 'Finished', 4),
-- USER_TYPE
       ('author', 'Author', 5),
       ('developer', 'Developer', 5),
       ('reviewer', 'Reviewer', 5),
       ('tester', 'Tester', 5),
-- PROJECT
       ('scrum', 'Scrum', 1),
       ('task_tracker', 'Task tracker', 1),
-- CONTACT
       ('skype', 'Skype', 0),
       ('tg', 'Telegram', 0),
       ('mobile', 'Mobile', 0),
       ('phone', 'Phone', 0),
       ('website', 'Website', 0),
       ('linkedin', 'LinkedIn', 0),
       ('github', 'GitHub', 0),
-- PRIORITY
       ('critical', 'Critical', 7),
       ('high', 'High', 7),
       ('normal', 'Normal', 7),
       ('low', 'Low', 7),
       ('neutral', 'Neutral', 7);

insert into  REFERENCE (CODE, TITLE, REF_TYPE, AUX)
-- MAIL_NOTIFICATION
values ('assigned', 'Assigned', 6, '1'),
       ('three_days_before_deadline', 'Three days before deadline', 6, '2'),
       ('two_days_before_deadline', 'Two days before deadline', 6, '4'),
       ('one_day_before_deadline', 'One day before deadline', 6, '8'),
       ('deadline', 'Deadline', 6, '16'),
       ('overdue', 'Overdue', 6, '32'),
-- TASK_STATUS
       ('todo', 'ToDo', 3, 'in_progress,canceled'),
       ('in_progress', 'In progress', 3, 'ready_for_review,canceled'),
       ('ready_for_review', 'Ready for review', 3, 'review,canceled'),
       ('review', 'Review', 3, 'in_progress,ready_for_test,canceled'),
       ('ready_for_test', 'Ready for test', 3, 'test,canceled'),
       ('test', 'Test', 3, 'done,in_progress,canceled'),
       ('done', 'Done', 3, 'canceled'),
       ('canceled', 'Canceled', 3, null);

CREATE TABLE IF NOT EXISTS USERS (
                                     ID BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     DISPLAY_NAME VARCHAR(32) NOT NULL UNIQUE,
                                     EMAIL VARCHAR(128) NOT NULL UNIQUE,
                                     FIRST_NAME VARCHAR(32) NOT NULL,
                                     LAST_NAME VARCHAR(32),
                                     PASSWORD VARCHAR(128) NOT NULL,
                                     ENDPOINT TIMESTAMP,
                                     STARTPOINT TIMESTAMP
);



insert into USERS (EMAIL, PASSWORD, FIRST_NAME, LAST_NAME, DISPLAY_NAME)
values ('user@gmail.com', 'testPassword', 'userFirstName', 'userLastName', 'userDisplayName'),
       ('admin@gmail.com', 'testPassword', 'adminFirstName', 'adminLastName', 'adminDisplayName'),
       ('guest@gmail.com', 'testPassword', 'guestFirstName', 'guestLastName', 'guestDisplayName'),
       ('manager@gmail.com', 'testPassword', 'managerFirstName', 'managerLastName', 'managerDisplayName'),
       ('taras@gmail.com', 'testPassword', 'Тарас', 'Шевченко', '@taras'),
       ('petlura@gmail.com', 'testPassword', 'Симон', 'Петлюра', '@epetl'),
       ('moroz_a@gmail.com', 'testPassword', 'Александр', 'Мороз', '@Moroz93'),
       ('antonio.nest@gmail.com', 'testPassword', 'Антон', 'Нестеров', '@antonio_nest'),
       ('i.franko@gmail.com', 'testPassword', 'Иван', 'Франко', '@ifranko'),
       ('g.skovoroda@gmail.com', 'testPassword', 'Григорий', 'Сковорода', '@Gregory24'),
       ('arsh.and@gmail.com', 'testPassword', 'Андрей', 'Арш', '@arsh01'),
       ('squirrel2011@gmail.com', 'testPassword', 'Леся', 'Иванюк', '@SmallSquirrel'),
       ('nikk24@gmail.com', 'testPassword', 'Николай', 'Никулин', '@nikk'),
       ('artem711@gmail.com', 'testPassword', 'Артем', 'Запорожец', '@Artt'),
       ('max.pain@gmail.com', 'testPassword', 'Максим', 'Дудник', '@MaxPain'),
       ('admin@aws.co', 'testPassword', 'test', 'admin', '@testAdmin');



CREATE TABLE IF NOT EXISTS PROFILE (
                                       ID BIGINT PRIMARY KEY,
                                       LAST_LOGIN TIMESTAMP,
                                       LAST_FAILED_LOGIN TIMESTAMP,
                                       MAIL_NOTIFICATIONS BIGINT,
                                       CONSTRAINT FK_PROFILE_USERS FOREIGN KEY (ID) REFERENCES USERS (ID) ON DELETE CASCADE
);

insert into PROFILE (ID, LAST_FAILED_LOGIN, LAST_LOGIN, MAIL_NOTIFICATIONS)
values (1, null, null, 49),
       (2, null, null, 14);
