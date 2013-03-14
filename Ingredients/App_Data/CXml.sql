USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[CXml]    Script Date: 06/15/2012 17:31:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [fn].[CXml](	
	@var VARCHAR(MAX)
)
RETURNS XML
AS
BEGIN

	RETURN CAST( CAST( @var AS NTEXT ) AS XML )

END


GO

