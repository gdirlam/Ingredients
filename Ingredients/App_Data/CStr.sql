USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[CStr]    Script Date: 06/15/2012 15:16:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [fn].[CStr](	
	@var VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN

	DECLARE @retval AS VARCHAR(MAX)
	SELECT @retval = COALESCE( @var, '')
	RETURN @retval

END



GO

