
CREATE FUNCTION [fn].[CCur](	
	@value VARCHAR(MAX)
)
RETURNS MONEY
AS
BEGIN
/*
USAGE: select [fn].[CCur]('¥1000.66')
*/
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




