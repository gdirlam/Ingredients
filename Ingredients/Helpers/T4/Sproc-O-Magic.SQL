









 


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.IngredientsGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.IngredientsGet 
GO 

CREATE PROCEDURE Products.IngredientsGet ( 
	@Ingredient_pk AS int  = NULL  OUTPUT 
	, @CommonName AS nvarchar (250)  = NULL  
	, @Type_fk AS int  = NULL  
	, @Details AS nvarchar (MAX)  = NULL  
	, @MediaURL AS nvarchar (250)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.IngredientsGet:', @ErrSeverity int = 16


	 SELECT 
			[Ingredients].[Ingredient_pk] 
 			, [Ingredients].[CommonName] 
 			, [Ingredients].[Type_fk] 
 			, [Ingredients].[Details] 
 			, [Ingredients].[MediaURL] 
 	 FROM [Products].[Ingredients] 
	 WHERE 
			 ( [Ingredients].[Ingredient_pk] = @Ingredient_pk OR @Ingredient_pk IS NULL ) 
 			AND  ( [Ingredients].[CommonName] = @CommonName OR @CommonName IS NULL ) 
 			AND  ( [Ingredients].[Type_fk] = @Type_fk OR @Type_fk IS NULL ) 
 			AND  ( [Ingredients].[Details] = @Details OR @Details IS NULL ) 
 			AND  ( [Ingredients].[MediaURL] = @MediaURL OR @MediaURL IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Ingredient_pk=SCOPE_IDENTITY()


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.IngredientsCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.IngredientsCreate 
GO 

CREATE PROCEDURE Products.IngredientsCreate ( 
	@Ingredient_pk AS int  = NULL  OUTPUT 
	, @CommonName AS nvarchar (250)  = NULL  
	, @Type_fk AS int  = NULL  
	, @Details AS nvarchar (MAX)  = NULL  
	, @MediaURL AS nvarchar (250)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.IngredientsCreate:', @ErrSeverity int = 16

		 INSERT INTO [Products].[Ingredients] ( 
			CommonName 
			, Type_fk 
			, Details 
			, MediaURL 
		 ) 
		 VALUES ( 
			 @CommonName 
			,  @Type_fk 
			,  @Details 
			,  @MediaURL 
		 ) 

		SET  @Ingredient_pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.IngredientsUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.IngredientsUpdate 
GO 

CREATE PROCEDURE Products.IngredientsUpdate ( 
	@Ingredient_pk AS int  = NULL  OUTPUT 
	, @CommonName AS nvarchar (250)  = NULL  
	, @Type_fk AS int  = NULL  
	, @Details AS nvarchar (MAX)  = NULL  
	, @MediaURL AS nvarchar (250)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.IngredientsUpdate:', @ErrSeverity int = 16

		 UPDATE [Products].[Ingredients] 
	 SET 
		 CommonName = CASE 
	 WHEN NOT @CommonName IS NULL THEN @CommonName 
	 ELSE CommonName 
	 END 
	,  Type_fk = CASE 
	 WHEN NOT @Type_fk IS NULL THEN @Type_fk 
	 ELSE Type_fk 
	 END 
	,  Details = CASE 
	 WHEN NOT @Details IS NULL THEN @Details 
	 ELSE Details 
	 END 
	,  MediaURL = CASE 
	 WHEN NOT @MediaURL IS NULL THEN @MediaURL 
	 ELSE MediaURL 
	 END 
	 WHERE Ingredient_pk = @Ingredient_pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.IngredientsDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.IngredientsDelete 
GO 

CREATE PROCEDURE Products.IngredientsDelete ( 
	@Ingredient_pk AS int  = NULL  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.IngredientsDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Products].[Ingredients] WHERE ( Ingredient_pk= @Ingredient_pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



 


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.PairingsGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.PairingsGet 
GO 

CREATE PROCEDURE Products.PairingsGet ( 
	@Pairing_Pk AS int  = NULL  OUTPUT 
	, @PrimeIngredient_fk AS int  = NULL  
	, @MatchingIngredient_fk AS int  = NULL  
	, @Proximity_Fk AS int  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.PairingsGet:', @ErrSeverity int = 16


	 SELECT 
			[Pairings].[Pairing_Pk] 
 			, [Pairings].[PrimeIngredient_fk] 
 			, [Pairings].[MatchingIngredient_fk] 
 			, [Pairings].[Proximity_Fk] 
 	 FROM [Products].[Pairings] 
	 WHERE 
			 ( [Pairings].[Pairing_Pk] = @Pairing_Pk OR @Pairing_Pk IS NULL ) 
 			AND  ( [Pairings].[PrimeIngredient_fk] = @PrimeIngredient_fk OR @PrimeIngredient_fk IS NULL ) 
 			AND  ( [Pairings].[MatchingIngredient_fk] = @MatchingIngredient_fk OR @MatchingIngredient_fk IS NULL ) 
 			AND  ( [Pairings].[Proximity_Fk] = @Proximity_Fk OR @Proximity_Fk IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Pairing_Pk=SCOPE_IDENTITY()


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.PairingsCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.PairingsCreate 
GO 

CREATE PROCEDURE Products.PairingsCreate ( 
	@Pairing_Pk AS int  = NULL  OUTPUT 
	, @PrimeIngredient_fk AS int  = NULL  
	, @MatchingIngredient_fk AS int  = NULL  
	, @Proximity_Fk AS int  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.PairingsCreate:', @ErrSeverity int = 16

		 INSERT INTO [Products].[Pairings] ( 
			PrimeIngredient_fk 
			, MatchingIngredient_fk 
			, Proximity_Fk 
		 ) 
		 VALUES ( 
			 @PrimeIngredient_fk 
			,  @MatchingIngredient_fk 
			,  @Proximity_Fk 
		 ) 

		SET  @Pairing_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.PairingsUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.PairingsUpdate 
GO 

CREATE PROCEDURE Products.PairingsUpdate ( 
	@Pairing_Pk AS int  = NULL  OUTPUT 
	, @PrimeIngredient_fk AS int  = NULL  
	, @MatchingIngredient_fk AS int  = NULL  
	, @Proximity_Fk AS int  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.PairingsUpdate:', @ErrSeverity int = 16

		 UPDATE [Products].[Pairings] 
	 SET 
		 PrimeIngredient_fk = CASE 
	 WHEN NOT @PrimeIngredient_fk IS NULL THEN @PrimeIngredient_fk 
	 ELSE PrimeIngredient_fk 
	 END 
	,  MatchingIngredient_fk = CASE 
	 WHEN NOT @MatchingIngredient_fk IS NULL THEN @MatchingIngredient_fk 
	 ELSE MatchingIngredient_fk 
	 END 
	,  Proximity_Fk = CASE 
	 WHEN NOT @Proximity_Fk IS NULL THEN @Proximity_Fk 
	 ELSE Proximity_Fk 
	 END 
	 WHERE Pairing_Pk = @Pairing_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.PairingsDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.PairingsDelete 
GO 

CREATE PROCEDURE Products.PairingsDelete ( 
	@Pairing_Pk AS int  = NULL  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.PairingsDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Products].[Pairings] WHERE ( Pairing_Pk= @Pairing_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



 


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.ProximityGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.ProximityGet 
GO 

CREATE PROCEDURE Products.ProximityGet ( 
	@Proximity_Pk AS int  = NULL  OUTPUT 
	, @Closeness AS nvarchar (250)  = NULL  
	, @Markup AS nvarchar (250)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.ProximityGet:', @ErrSeverity int = 16


	 SELECT 
			[Proximity].[Proximity_Pk] 
 			, [Proximity].[Closeness] 
 			, [Proximity].[Markup] 
 	 FROM [Products].[Proximity] 
	 WHERE 
			 ( [Proximity].[Proximity_Pk] = @Proximity_Pk OR @Proximity_Pk IS NULL ) 
 			AND  ( [Proximity].[Closeness] = @Closeness OR @Closeness IS NULL ) 
 			AND  ( [Proximity].[Markup] = @Markup OR @Markup IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Proximity_Pk=SCOPE_IDENTITY()


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.ProximityCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.ProximityCreate 
GO 

CREATE PROCEDURE Products.ProximityCreate ( 
	@Proximity_Pk AS int  = NULL  OUTPUT 
	, @Closeness AS nvarchar (250)  = NULL  
	, @Markup AS nvarchar (250)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.ProximityCreate:', @ErrSeverity int = 16

		 INSERT INTO [Products].[Proximity] ( 
			Closeness 
			, Markup 
		 ) 
		 VALUES ( 
			 @Closeness 
			,  @Markup 
		 ) 

		SET  @Proximity_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.ProximityUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.ProximityUpdate 
GO 

CREATE PROCEDURE Products.ProximityUpdate ( 
	@Proximity_Pk AS int  = NULL  OUTPUT 
	, @Closeness AS nvarchar (250)  = NULL  
	, @Markup AS nvarchar (250)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.ProximityUpdate:', @ErrSeverity int = 16

		 UPDATE [Products].[Proximity] 
	 SET 
		 Closeness = CASE 
	 WHEN NOT @Closeness IS NULL THEN @Closeness 
	 ELSE Closeness 
	 END 
	,  Markup = CASE 
	 WHEN NOT @Markup IS NULL THEN @Markup 
	 ELSE Markup 
	 END 
	 WHERE Proximity_Pk = @Proximity_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.ProximityDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.ProximityDelete 
GO 

CREATE PROCEDURE Products.ProximityDelete ( 
	@Proximity_Pk AS int  = NULL  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.ProximityDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Products].[Proximity] WHERE ( Proximity_Pk= @Proximity_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



 


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.TypesGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.TypesGet 
GO 

CREATE PROCEDURE Products.TypesGet ( 
	@Type_pk AS int  = NULL  OUTPUT 
	, @Classification AS nvarchar (250)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.TypesGet:', @ErrSeverity int = 16


	 SELECT 
			[Types].[Type_pk] 
 			, [Types].[Classification] 
 	 FROM [Products].[Types] 
	 WHERE 
			 ( [Types].[Type_pk] = @Type_pk OR @Type_pk IS NULL ) 
 			AND  ( [Types].[Classification] = @Classification OR @Classification IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Type_pk=SCOPE_IDENTITY()


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.TypesCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.TypesCreate 
GO 

CREATE PROCEDURE Products.TypesCreate ( 
	@Type_pk AS int  = NULL  OUTPUT 
	, @Classification AS nvarchar (250)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.TypesCreate:', @ErrSeverity int = 16

		 INSERT INTO [Products].[Types] ( 
			Classification 
		 ) 
		 VALUES ( 
			 @Classification 
		 ) 

		SET  @Type_pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.TypesUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.TypesUpdate 
GO 

CREATE PROCEDURE Products.TypesUpdate ( 
	@Type_pk AS int  = NULL  OUTPUT 
	, @Classification AS nvarchar (250)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.TypesUpdate:', @ErrSeverity int = 16

		 UPDATE [Products].[Types] 
	 SET 
		 Classification = CASE 
	 WHEN NOT @Classification IS NULL THEN @Classification 
	 ELSE Classification 
	 END 
	 WHERE Type_pk = @Type_pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.TypesDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.TypesDelete 
GO 

CREATE PROCEDURE Products.TypesDelete ( 
	@Type_pk AS int  = NULL  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.TypesDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Products].[Types] WHERE ( Type_pk= @Type_pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 


GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



 
