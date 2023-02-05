SELECT t.id,
    t.first_name,
    t.last_name,
    t.school,
    t.hire_date,
    t.salary,
    c.id,
    c.name,
    c.teachers_id,
    c.total_students
FROM courses c
    JOIN teachers t ON c.teachers_id = t.id
WHERE t.salary = (
        SELECT MAX(t2.salary)
        FROM teachers t2
        WHERE t2.id IN (
                SELECT teachers_id
                FROM courses c2
                WHERE c2.name = c.name
            )
    )
order by c.name ASC