USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[CCur]    Script Date: 06/19/2012 14:56:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [fn].[CCur](	
	@value VARCHAR(MAX)
)
RETURNS MONEY
AS
BEGIN

	DECLARE @var AS VARCHAR(MAX)
	SET @var = ''
	DECLARE @i int,  @iLast int, @char VARCHAR(1), @dec BIT
	SET @dec = 0
	SET @i = 1
	SET @iLast = 0
	
	WHILE @i < LEN(@value)+1
		BEGIN
			SET @char = SUBSTRING( @value, @i, 1 )
			IF ASCII ( @char ) >=48 AND ASCII ( @char ) <= 57  
			SET @var = @var + @char 

			IF  ASCII ( @char ) = 46 AND @dec = 0
			BEGIN
				SET @var = @var + @char 
				SET @dec =1
			END 

			SET @i = @i + 1
		END 
		

	DECLARE @retval AS MONEY
	IF ISNUMERIC( @var ) = 1 
		SET @retval = CAST( @var AS MONEY) 

	RETURN @retval
END





GO

