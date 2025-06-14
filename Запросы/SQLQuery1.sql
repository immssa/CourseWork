SELECT
    k.Knowledge_ID,
    k.Title,
    u.Login        AS AuthorLogin,
    c.Category_Name,
    k.Created_At
FROM Knowledges AS k
JOIN Users       AS u ON k.User_ID     = u.User_ID
JOIN Categories  AS c ON k.Category_ID = c.Category_ID
ORDER BY k.Created_At DESC;