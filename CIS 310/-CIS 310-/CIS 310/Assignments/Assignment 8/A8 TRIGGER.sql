-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<LESLIE DAWSON>
-- Create date: <3/29/2011>
-- Description:	<A8 TRIGGER>
-- =============================================
ALTER TRIGGER A8
   ON  CHARTER
   AFTER INSERT,DELETE,UPDATE
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for trigger here

    	DECLARE @DIST_CHANGE DEC
	DECLARE @CHAR_TRIP VARCHAR(5)
	
    IF(EXISTS (SELECT * FROM INSERTED) AND
       EXISTS (SELECT * FROM DELETED))
    BEGIN
        SELECT	@CHAR_TRIP = I.CHAR_TRIP, @DIST_CHANGE = (I.CHAR_DISTANCE-D.CHAR_DISTANCE)
        FROM	INSERTED I INNER JOIN DELETED D ON I.CHAR_TRIP = D.CHAR_TRIP
        
        UPDATE	CHARTER
        SET		CHAR_DISTANCE = @DIST_CHANGE
        WHERE	CHAR_TRIP = @CHAR_TRIP
    END
    
    IF(EXISTS (SELECT * FROM INSERTED) AND
       NOT EXISTS (SELECT * FROM DELETED))
    BEGIN
        SELECT	@CHAR_TRIP = I.CHAR_TRIP, @DIST_CHANGE =  I.CHAR_DISTANCE
        FROM	INSERTED I INNER JOIN DELETED D ON I.CHAR_TRIP = D.CHAR_TRIP
        
        UPDATE	CHARTER
        SET		CHAR_DISTANCE = @DIST_CHANGE
        WHERE	CHAR_TRIP = @CHAR_TRIP
    END
  
    IF(NOT EXISTS (SELECT * FROM INSERTED) AND
       EXISTS (SELECT * FROM DELETED))
    BEGIN
        SELECT 'DELETION'
    END
  
    SELECT    'INSERTED TABLE CONTENT'
    SELECT    *
    FROM    INSERTED

    SELECT    'DELETED TABLE CONTENT'  
    SELECT    *
    FROM    DELETED
END


--TEST CODE

UPDATE	CHARTER
SET		CHAR_DISTANCE = CHAR_DISTANCE / 2
WHERE	CHAR_TRIP = 10001

SELECT *
FROM CUSTOMER