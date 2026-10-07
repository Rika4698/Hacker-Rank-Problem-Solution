SELECT
    ei.employee_ID,
    ei.name
FROM employee_information ei
JOIN last_quarter_bonus lqb
    ON ei.employee_ID = lqb.employee_ID
WHERE ei.division = 'HR'
  AND lqb.bonus >= 5000;



            --  employee_information
            --            +
            --   last_quarter_bonus
            --            ↓
            --          JOIN
            --            ↓
            --   Match employee_ID
            --            ↓
            --     Filter division
            --       division = HR
            --            ↓
            --     Filter bonus
            --       bonus >= 5000
            --            ↓
            --   employee_ID + name