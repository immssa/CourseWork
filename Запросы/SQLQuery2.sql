SELECT
    c.Category_Name,
    COUNT(k.Knowledge_ID) AS MaterialsCount
FROM Categories AS c
LEFT JOIN Knowledges AS k ON k.Category_ID = c.Category_ID
GROUP BY c.Category_Name
ORDER BY MaterialsCount DESC;