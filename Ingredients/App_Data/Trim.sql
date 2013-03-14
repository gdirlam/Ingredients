USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[Trim]    Script Date: 06/15/2012 15:47:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [fn].[Trim](	
	@var VARCHAR(MAX)
)
RETURNS INT
AS
BEGIN

	RETURN LTRIM(RTRIM( @var ) )

END

GO

