DECLARE @SelectedKnowledgeID INT = 35;  -- пример значения

SELECT
    cm.Comment_ID,
    u.Full_Name      AS CommentAuthor,
    cm.Comment_Text,
    cm.Created_At
FROM Comments AS cm
JOIN Users    AS u  ON cm.User_ID      = u.User_ID
WHERE cm.Knowledge_ID = @SelectedKnowledgeID;