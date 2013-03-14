USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[DateToString]    Script Date: 06/19/2012 14:48:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [fn].[DateToString](	
	@value VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @date AS  DATETIME
	DECLARE @retval AS VARCHAR(MAX) 
IF ISDATE( @value ) = 1 
	BEGIN
		SET @date = CAST( @value AS DATETIME) 
		IF  CAST( @date AS FLOAT) -FLOOR( CAST( @date AS FLOAT) ) = 0 
		SET @retval = CONVERT( VARCHAR(10), @date, 101 )
		ELSE
		BEGIN 
		SET @retval = CONVERT( VARCHAR(10), @date, 101 ) + ' ' 
			+ SUBSTRING( 
				CONVERT( VARCHAR(20), @date, 100 )
				, 11
				, 9
				)
		END
	END 
	ELSE
	BEGIN
	SET @retval = NULL
	END
	RETURN @retval
END





GO

