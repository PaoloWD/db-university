-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name` AS `nome`,
        `students`.`surname` AS `cognome`,
           `degrees`.`name` AS `nome_corso` 
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` LIKE `%economia%`;

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `degrees`.*
FROM `degrees`
INNER JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` LIKE '%Neuroscienze%' AND `degrees`.`level` LIKE '%magistrale%';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `course_teacher`.* 
FROM `course_teacher` 
INNER JOIN `degrees` ON `degrees`.`id` = `course_teacher`.`teacher_id` 
WHERE `course_teacher`.`teacher_id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
--    relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname` AS `cognome_studente`, `students`.`name` AS `nome_studente`, `degrees`.`name` AS `corso`, `departments`.`name` AS `dipartimento`
FROM `students`
INNER JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`, `students`.`name`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT *
FROM `degrees`
INNER JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers` ON `teachers`.`id `= `course_teacher`.`teacher_id`;


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT CONCAT(`teachers`.`name`, " ", `teachers`.`surname`) AS `formatted_name`
FROM `teachers`
INNER JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses` ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees` ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica";


