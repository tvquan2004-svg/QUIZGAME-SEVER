-- Sửa CHAR(1) thành VARCHAR(1) để khớp với Hibernate mapping
ALTER TABLE answer_logs MODIFY COLUMN selected_ans VARCHAR(1) NOT NULL;
ALTER TABLE quiz_cards MODIFY COLUMN correct_ans VARCHAR(1) NOT NULL;
ALTER TABLE duel_answers MODIFY COLUMN selected_ans VARCHAR(1);
