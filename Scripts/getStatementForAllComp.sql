SELECT [Name]
	,'
	TRUNCATE TABLE [DevDatabase].[dbo].['+Name+'$VAT Statement Line]' as TrucateSQLStatement
	
	,'
	INSERT INTO [DevDatabase].[dbo].['+Name+'$VAT Statement Line]
([Statement Template Name]
      ,[Statement Name]
      ,[Line No_]
      ,[Row No_]
      ,[Description]
      ,[Type]
      ,[Account Totaling]
      ,[Gen_ Posting Type]
      ,[VAT Bus_ Posting Group]
      ,[VAT Prod_ Posting Group]
      ,[Row Totaling]
      ,[Amount Type]
      ,[Calculate with]
      ,[Print]
      ,[Print with]
      ,[New Page]
      ,[Tax Jurisdiction Code]
      ,[Use Tax])
SELECT 
	   [Statement Template Name]
      ,[Statement Name]
      ,[Line No_]
      ,[Row No_]
      ,[Description]
      ,[Type]
      ,[Account Totaling]
      ,[Gen_ Posting Type]
      ,[VAT Bus_ Posting Group]
      ,[VAT Prod_ Posting Group]
      ,[Row Totaling]
      ,[Amount Type]
      ,[Calculate with]
      ,[Print]
      ,[Print with]
      ,[New Page]
      ,[Tax Jurisdiction Code]
      ,[Use Tax]
      FROM [LiveDatabase].[dbo].[ProCom Technologie GmbH$VAT Statement Line];
	' as FillFromLiveSQL

	,'
	SELECT [timestamp]
      ,[Statement Template Name]
      ,[Statement Name]
      ,[Line No_]
      ,[Row No_]
      ,[Description]
      ,[Type]
      ,[Account Totaling]
      ,[Gen_ Posting Type]
      ,[VAT Bus_ Posting Group]
      ,[VAT Prod_ Posting Group]
      ,[Row Totaling]
      ,[Amount Type]
      ,[Calculate with]
      ,[Print]
      ,[Print with]
      ,[New Page]
      ,[Tax Jurisdiction Code]
      ,[Use Tax]
  FROM [DevDatabase].[dbo].['+[Name]+'$VAT Statement Line]
	' as SelectSQL
		
FROM [dbo].[Company]
  WHERE [Name] <> 'CurrentCompanyName'
GO
