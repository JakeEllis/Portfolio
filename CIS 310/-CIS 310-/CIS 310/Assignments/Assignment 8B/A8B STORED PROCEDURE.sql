-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Leslie Dawson
-- Create date: 4/13/2011
-- Description:	A8B - STORED PROCEDURE TO POPULATE CUS_TOTAL_DISTANCE IN CUSTOMER TABLE
-- =============================================
ALTER PROCEDURE A8B_UPDATE_CUS_TOTAL_DISTANCE
AS
BEGIN
	DECLARE		CUS_TOTAL_DISTANCE CURSOR FOR
	SELECT		CUS_CODE, SUM(CHAR_DISTANCE) AS [CUS_TOTAL_DISTANCE]
	FROM		CHARTER
	GROUP BY	CUS_CODE
	
	DECLARE	@CUS_CODE INT
	DECLARE	@CUS_TOTAL_DISTANCE REAL
	
	OPEN	CUS_TOTAL_DISTANCE
	FETCH NEXT FROM CUS_TOTAL_DISTANCE INTO @CUS_CODE, @CUS_TOTAL_DISTANCE
	WHILE(@@FETCH_STATUS = 0)
	BEGIN
			UPDATE	CUSTOMER 
			SET		CUS_TOTAL_DISTANCE = @CUS_TOTAL_DISTANCE
			WHERE	CUS_CODE = @CUS_CODE
			FETCH NEXT FROM CUS_TOTAL_DISTANCE INTO @CUS_CODE, @CUS_TOTAL_DISTANCE
	END
	CLOSE		CUS_TOTAL_DISTANCE
	DEALLOCATE	CUS_TOTAL_DISTANCE
END

exec A8B_UPDATE_CUS_TOTAL_DISTANCE
SELECT *
FROM CUSTOMER