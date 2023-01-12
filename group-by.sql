-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*) as `num_iscritti`, YEAR(`enrolment_date`) as `anno`
FROM `students`
GROUP BY `anno`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*) as `indirizzo_ufficio`, `office_address` as `ufficio`
FROM `teachers`
GROUP BY `ufficio`;

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT COUNT(*) as `media_voto`, AVG(`vote`) as `media_voto`
FROM `exam_student`;

-- 4 Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id`, COUNT(*) as `numero_corsi` 
FROM `degrees` 
GROUP BY `department_id`;