--BY DEFAULT, THE ISOLATION IS "READ COMMITED" --> TABLE LOCK
SET TRANSACTION ISOLATION LEVEL SNAPSHOT; -- ROW-LEVEL LOCK 

BEGIN TRANSACTION;
-- Opens a new transaction in the RBDMS

--Everything here happens in the context of the transaction
SELECT * FROM dbo.Dummy;

DELETE FROM dbo.Dummy WHERE LTRIM(RTRIM(UPPER(ColumnB))) LIKE UPPER('guys%');
					-- ColumnC IS NULL (NULL COMPARAISON WITH IS / IS NOT, not = or <>)

SELECT * FROM dbo.Dummy;

ROLLBACK; -- This ends the transaction (COMMIT ends it too)