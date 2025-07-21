use c0225l1;
CREATE TABLE subject (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    credit INT
);
INSERT INTO subject (name, credit) VALUES
('Toán rời rạc', 3),
('Cấu trúc dữ liệu', 4),
('Cơ sở dữ liệu', 3),
('Lập trình Java', 5),
('Thiết kế web', 2);

CREATE TABLE mark (
    student_id INT,
    subject_id INT,
    score FLOAT,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

INSERT INTO mark (student_id, subject_id, score) VALUES
(1, 1, 7.5), (1, 2, 8.0), (1, 3, 9.0),
(2, 1, 5.5), (2, 2, 6.0),
(3, 1, 9.5), (3, 3, 8.5),
(4, 2, 7.0), (4, 4, 8.0),
(5, 1, 6.5), (5, 5, 7.5),
(6, 3, 9.2), (6, 4, 8.5), (6, 5, 8.0),
(7, 1, 4.0), (7, 2, 5.0),
(8, 3, 3.0), (8, 4, 5.0),
(9, 1, 7.0), (9, 3, 8.0),
(10, 1, 7.5), (10, 2, 7.0);

SELECT * 
FROM subject 
WHERE credit = (SELECT MAX(credit) FROM subject);

SELECT s.*
FROM subject s
JOIN mark m ON s.id = m.subject_id
WHERE m.score = (SELECT MAX(score) FROM mark);

SELECT 
    st.id,
    st.name,
    st.birthday,
    st.gender,
    st.email,
    AVG(m.score) AS average_score
FROM 
    student st
JOIN 
    mark m ON st.id = m.student_id
GROUP BY 
    st.id, st.name, st.birthday, st.gender, st.email
ORDER BY 
    average_score DESC;

