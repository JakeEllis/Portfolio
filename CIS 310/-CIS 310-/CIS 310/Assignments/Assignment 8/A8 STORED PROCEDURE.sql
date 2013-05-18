  -- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
-- -- Use the Specify Values for Template Parameters
-- command (Ctrl-Shift-M) to fill in the parameter
-- values below.
-- -- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:                <LESLIE DAWSON>
-- Create date:			  <MARCH 30, 2011>
-- Description:           <A8 STORED PROCEDURE>
-- =============================================
ALTER PROCEDURE UPDATEDCUSTBAL              
       -- Add the parameters for the stored procedure here
AS
BEGIN
   -- Insert statements for procedure here
BEGIN
 DECLARE @CUS_CODE VARCHAR(5)
 DECLARE @CUS_BALANCE MONEY
 
 DECLARE	A8_CURSOR CURSOR FOR
 SELECT		C.CUS_CODE, SUM(CH.CHAR_DISTANCE * M.MOD_CHG_MILE) AS [CUSTOMER BALANCE]
 FROM		CUSTOMER C INNER JOIN CHARTER CH ON C.CUS_CODE = CH.CUS_CODE
            INNER JOIN AIRCRAFT A ON CH.AC_NUMBER = A.AC_NUMBER
            INNER JOIN MODEL M ON A.MOD_CODE = M.MOD_CODE
 GROUP BY	C.CUS_CODE
  
 OPEN A8_CURSOR
 FETCH NEXT FROM A8_CURSOR INTO @CUS_CODE, @CUS_BALANCE
 WHILE(@@FETCH_STATUS = 0)
 BEGIN
      UPDATE CUSTOMER
      SET CUS_BALANCE = @CUS_BALANCE
      WHERE CUS_CODE = @CUS_CODE
      FETCH NEXT FROM A8_CURSOR INTO @CUS_CODE, @CUS_BALANCE
 END
 
CLOSE A8_CURSOR
DEALLOCATE A8_CURSOR
END
	BEGIN
	SELECT	CUS_CODE, CUS_BALANCE AS [CUSTOMER BALANCE]
	FROM	CUSTOMER
    END
END

EXEC UPDATEDCUSTBAL

