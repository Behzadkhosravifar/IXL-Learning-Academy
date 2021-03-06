USE [xomorodc_ixl]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Parents', N'COLUMN',N'Sex'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parents', @level2type=N'COLUMN',@level2name=N'Sex'

GO
/****** Object:  StoredProcedure [dbo].[sp_TrafficRankings_Insert]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_TrafficRankings_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_NewsletterSubscribeEmails]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Insert_NewsletterSubscribeEmails]
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_ContactMe]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Insert_ContactMe]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRankingUpdatesInfo]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_GetRankingUpdatesInfo]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRankingUpdateInfo]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_GetRankingUpdateInfo]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[ELMAH_LogError]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[ELMAH_GetErrorXml]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[ELMAH_GetErrorsXml]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[UserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.UserLogins_dbo.Users_IdentityUser_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserInRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[UserInRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.UserInRoles_dbo.Users_IdentityUser_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserInRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[UserInRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.UserInRoles_dbo.UserRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[UserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.UserClaims_dbo.Users_IdentityUser_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentsAnswers]') AND type in (N'U'))
ALTER TABLE [dbo].[StudentsAnswers] DROP CONSTRAINT IF EXISTS [FK_StudentsAnswers_Students]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentsAnswers]') AND type in (N'U'))
ALTER TABLE [dbo].[StudentsAnswers] DROP CONSTRAINT IF EXISTS [FK_StudentsAnswers_QuestionsAboutStudents]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [FK_Students_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [FK_Students_Parents1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [FK_Students_Parents]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrafficRankings]') AND type in (N'U'))
ALTER TABLE [dbo].[TrafficRankings] DROP CONSTRAINT IF EXISTS [DF__TrafficRa__IsAct__5A4F643B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrafficRankings]') AND type in (N'U'))
ALTER TABLE [dbo].[TrafficRankings] DROP CONSTRAINT IF EXISTS [DF__TrafficRa__Modif__595B4002]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [DF_Students_TongueTie]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [DF_Students_HearingImpairments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [DF_Students_PoorVision]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [DF_Students_LeftHand]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sitemap]') AND type in (N'U'))
ALTER TABLE [dbo].[Sitemap] DROP CONSTRAINT IF EXISTS [DF_Sitemap_LastModified]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sitemap]') AND type in (N'U'))
ALTER TABLE [dbo].[Sitemap] DROP CONSTRAINT IF EXISTS [DF_Sitemap_LangId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Parents]') AND type in (N'U'))
ALTER TABLE [dbo].[Parents] DROP CONSTRAINT IF EXISTS [DF_Parents_Sex]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NewsletterSubscribeEmails]') AND type in (N'U'))
ALTER TABLE [dbo].[NewsletterSubscribeEmails] DROP CONSTRAINT IF EXISTS [DF_NewsletterSubscribeEmails_Enable]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Languages]') AND type in (N'U'))
ALTER TABLE [dbo].[Languages] DROP CONSTRAINT IF EXISTS [DF_Languages_IsActive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND type in (N'U'))
ALTER TABLE [dbo].[ELMAH_Error] DROP CONSTRAINT IF EXISTS [DF_ELMAH_Error_ErrorId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactMe]') AND type in (N'U'))
ALTER TABLE [dbo].[ContactMe] DROP CONSTRAINT IF EXISTS [DF_ContactMe_IsRead]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactMe]') AND type in (N'U'))
ALTER TABLE [dbo].[ContactMe] DROP CONSTRAINT IF EXISTS [DF_ContactMe_ModifyTime]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[UserRoles]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[UserLogins]
GO
/****** Object:  Table [dbo].[UserInRoles]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[UserInRoles]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[UserClaims]
GO
/****** Object:  Table [dbo].[StudentsAnswers]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[StudentsAnswers]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[Students]
GO
/****** Object:  Table [dbo].[Sitemap]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[Sitemap]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[Setting]
GO
/****** Object:  Table [dbo].[QuestionsAboutStudents]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[QuestionsAboutStudents]
GO
/****** Object:  Table [dbo].[Parents]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[Parents]
GO
/****** Object:  Table [dbo].[NewsletterSubscribeEmails]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[NewsletterSubscribeEmails]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[ELMAH_Error]
GO
/****** Object:  Table [dbo].[ContactMe]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[ContactMe]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  UserDefinedFunction [dbo].[udfv_LanguagesView]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP FUNCTION IF EXISTS [dbo].[udfv_LanguagesView]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[Languages]
GO
/****** Object:  UserDefinedFunction [dbo].[udft_TrafficRankings]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP FUNCTION IF EXISTS [dbo].[udft_TrafficRankings]
GO
/****** Object:  Table [dbo].[TrafficRankings]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP TABLE IF EXISTS [dbo].[TrafficRankings]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSettingByKey]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP FUNCTION IF EXISTS [dbo].[GetSettingByKey]
GO
/****** Object:  Schema [xomorodc_xomorod]    Script Date: 5/31/2018 2:06:56 PM ******/
DROP SCHEMA IF EXISTS [xomorodc_xomorod]
GO
/****** Object:  Schema [xomorodc_xomorod]    Script Date: 5/31/2018 2:06:56 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'xomorodc_xomorod')
EXEC sys.sp_executesql N'CREATE SCHEMA [xomorodc_xomorod]'

GO
/****** Object:  UserDefinedFunction [dbo].[GetSettingByKey]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSettingByKey]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[GetSettingByKey]
(
	@Key NVARCHAR(256)
)
RETURNS NVARCHAR(MAX)
AS


BEGIN
	DECLARE @result NVARCHAR(MAX) = ''''; 
	
	SELECT @result = as1.[Value]
	FROM   [xomorod.com_xomorod].dbo.Setting as1
	WHERE  LOWER(as1.[Key]) = LOWER(@Key)
	
	RETURN @result;
END

' 
END

GO
/****** Object:  Table [dbo].[TrafficRankings]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrafficRankings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TrafficRankings](
	[RankID] [int] IDENTITY(1,1) NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
	[GlobalRanking] [int] NULL,
	[IranRanking] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__TrafficR__B37AFB96CB2473E2] PRIMARY KEY CLUSTERED 
(
	[RankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  UserDefinedFunction [dbo].[udft_TrafficRankings]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udft_TrafficRankings]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[udft_TrafficRankings]
(
)
RETURNS TABLE
AS


RETURN 
(
    WITH MyCTE AS
    (
        SELECT d.ModifyDate       AS MDate,
               MAX(d.ModifyTime)  AS MTime
        FROM   (
                   SELECT CONVERT(DATE, tr.ModifyDate) AS ModifyDate,
                          CONVERT(TIME, tr.ModifyDate) AS ModifyTime
                   FROM   TrafficRankings tr
               )                     d
        GROUP BY d.ModifyDate
    )
    SELECT RankID,
    ModifyDate,
    GlobalRanking,
    IranRanking
    FROM dbo.TrafficRankings
    INNER JOIN MyCTE
    ON MyCTE.MDate = CONVERT(DATE, dbo.TrafficRankings.ModifyDate)
    AND MyCTE.MTime = CONVERT(TIME, dbo.TrafficRankings.ModifyDate)
    AND IsActive = 1
)

' 
END

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Languages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Languages](
	[LangID] [int] IDENTITY(1,1) NOT NULL,
	[LangFullName] [nvarchar](50) NOT NULL,
	[Culture] [varchar](5) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  UserDefinedFunction [dbo].[udfv_LanguagesView]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udfv_LanguagesView]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[udfv_LanguagesView] ( )
RETURNS TABLE
AS


RETURN
    ( SELECT    [LangID] ,
                [Culture] ,
                [LangFullName]
      FROM      dbo.Languages
      WHERE     IsActive = 1
    )

' 
END

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ContactMe]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactMe]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContactMe](
	[ContactMeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[ModifyUTC] [datetime] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_ContactMe] PRIMARY KEY CLUSTERED 
(
	[ContactMeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] NOT NULL,
 CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NewsletterSubscribeEmails]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NewsletterSubscribeEmails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NewsletterSubscribeEmails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](128) NOT NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK_NewsletterSubscribeEmails_Email] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Parents]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Parents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Parents](
	[ParentId] [int] IDENTITY(1,1) NOT NULL,
	[Sex] [bit] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[EducationDegree] [nvarchar](50) NULL,
	[Job] [nvarchar](100) NULL,
	[WorkTelephone] [numeric](14, 0) NULL,
	[WorkAddress] [nvarchar](max) NULL,
	[MobileNo] [numeric](14, 0) NULL,
 CONSTRAINT [PK_Parents] PRIMARY KEY CLUSTERED 
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QuestionsAboutStudents]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionsAboutStudents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuestionsAboutStudents](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_QuestionsAboutStudents] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Setting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Setting](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sitemap]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sitemap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sitemap](
	[Id] [bigint] NOT NULL,
	[LangId] [int] NOT NULL,
	[Title] [nvarchar](4000) NULL,
	[Frequency] [varchar](10) NULL,
	[LastModified] [datetime] NOT NULL,
	[Priority] [numeric](18, 2) NULL,
	[Url] [varchar](4000) NULL,
	[ParentId] [bigint] NULL,
 CONSTRAINT [PK_Sitemap_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[LangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[BirthCertificateId] [numeric](12, 0) NULL,
	[FatherId] [int] NULL,
	[MotherId] [int] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Birthday] [datetime] NULL,
	[BirthPlace] [nvarchar](100) NULL,
	[HomeAddress] [nvarchar](max) NULL,
	[HomeTelephone] [numeric](14, 0) NULL,
	[LeftHand] [bit] NOT NULL,
	[PoorVision] [bit] NOT NULL,
	[HearingImpairments] [bit] NOT NULL,
	[TongueTie] [bit] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StudentsAnswers]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentsAnswers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudentsAnswers](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Answer] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentsAnswers] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserInRoles]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserInRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.UserInRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ContactMe_ModifyTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ContactMe] ADD  CONSTRAINT [DF_ContactMe_ModifyTime]  DEFAULT (getutcdate()) FOR [ModifyUTC]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ContactMe_IsRead]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ContactMe] ADD  CONSTRAINT [DF_ContactMe_IsRead]  DEFAULT ((0)) FOR [IsRead]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ELMAH_Error_ErrorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Languages_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Languages] ADD  CONSTRAINT [DF_Languages_IsActive]  DEFAULT ((1)) FOR [IsActive]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NewsletterSubscribeEmails_Enable]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NewsletterSubscribeEmails] ADD  CONSTRAINT [DF_NewsletterSubscribeEmails_Enable]  DEFAULT ((1)) FOR [Enable]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Parents_Sex]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Parents] ADD  CONSTRAINT [DF_Parents_Sex]  DEFAULT ((0)) FOR [Sex]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sitemap_LangId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sitemap] ADD  CONSTRAINT [DF_Sitemap_LangId]  DEFAULT ((1)) FOR [LangId]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Sitemap_LastModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sitemap] ADD  CONSTRAINT [DF_Sitemap_LastModified]  DEFAULT (getutcdate()) FOR [LastModified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Students_LeftHand]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_LeftHand]  DEFAULT ((0)) FOR [LeftHand]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Students_PoorVision]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_PoorVision]  DEFAULT ((0)) FOR [PoorVision]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Students_HearingImpairments]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_HearingImpairments]  DEFAULT ((0)) FOR [HearingImpairments]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Students_TongueTie]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_TongueTie]  DEFAULT ((0)) FOR [TongueTie]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TrafficRa__Modif__595B4002]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TrafficRankings] ADD  CONSTRAINT [DF__TrafficRa__Modif__595B4002]  DEFAULT (getdate()) FOR [ModifyDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TrafficRa__IsAct__5A4F643B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TrafficRankings] ADD  CONSTRAINT [DF__TrafficRa__IsAct__5A4F643B]  DEFAULT ((1)) FOR [IsActive]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_Parents]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Parents] FOREIGN KEY([FatherId])
REFERENCES [dbo].[Parents] ([ParentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_Parents]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Parents]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_Parents1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Parents1] FOREIGN KEY([MotherId])
REFERENCES [dbo].[Parents] ([ParentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_Parents1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Parents1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentsAnswers_QuestionsAboutStudents]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentsAnswers]'))
ALTER TABLE [dbo].[StudentsAnswers]  WITH CHECK ADD  CONSTRAINT [FK_StudentsAnswers_QuestionsAboutStudents] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[QuestionsAboutStudents] ([QuestionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentsAnswers_QuestionsAboutStudents]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentsAnswers]'))
ALTER TABLE [dbo].[StudentsAnswers] CHECK CONSTRAINT [FK_StudentsAnswers_QuestionsAboutStudents]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentsAnswers_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentsAnswers]'))
ALTER TABLE [dbo].[StudentsAnswers]  WITH CHECK ADD  CONSTRAINT [FK_StudentsAnswers_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentsAnswers_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentsAnswers]'))
ALTER TABLE [dbo].[StudentsAnswers] CHECK CONSTRAINT [FK_StudentsAnswers_Students]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UserClaims_dbo.Users_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserClaims]'))
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClaims_dbo.Users_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UserClaims_dbo.Users_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserClaims]'))
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_dbo.UserClaims_dbo.Users_IdentityUser_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UserInRoles_dbo.UserRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserInRoles]'))
ALTER TABLE [dbo].[UserInRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserInRoles_dbo.UserRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UserInRoles_dbo.UserRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserInRoles]'))
ALTER TABLE [dbo].[UserInRoles] CHECK CONSTRAINT [FK_dbo.UserInRoles_dbo.UserRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UserInRoles_dbo.Users_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserInRoles]'))
ALTER TABLE [dbo].[UserInRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserInRoles_dbo.Users_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UserInRoles_dbo.Users_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserInRoles]'))
ALTER TABLE [dbo].[UserInRoles] CHECK CONSTRAINT [FK_dbo.UserInRoles_dbo.Users_IdentityUser_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UserLogins_dbo.Users_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserLogins]'))
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserLogins_dbo.Users_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UserLogins_dbo.Users_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserLogins]'))
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_dbo.UserLogins_dbo.Users_IdentityUser_Id]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorsXml]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml] AS' 
END
GO

ALTER PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

    SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO



GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorXml]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml] AS' 
END
GO

ALTER PROCEDURE [dbo].[ELMAH_GetErrorXml]
(
    @Application NVARCHAR(60),
    @ErrorId UNIQUEIDENTIFIER
)
AS

    SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application



GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_LogError]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_LogError] AS' 
END
GO

ALTER PROCEDURE [dbo].[ELMAH_LogError]
(
    @ErrorId UNIQUEIDENTIFIER,
    @Application NVARCHAR(60),
    @Host NVARCHAR(30),
    @Type NVARCHAR(100),
    @Source NVARCHAR(60),
    @Message NVARCHAR(500),
    @User NVARCHAR(50),
    @AllXml NTEXT,
    @StatusCode INT,
    @TimeUtc DATETIME
)
AS

    SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )



GO
/****** Object:  StoredProcedure [dbo].[sp_GetRankingUpdateInfo]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetRankingUpdateInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetRankingUpdateInfo] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_GetRankingUpdateInfo]
	@DayDate DATETIME
AS
BEGIN
	SELECT tr.RankID,
	       tr.ModifyDate,
	       CONVERT(TIME, tr2.ModifyDate),
	       tr.GlobalRanking,
	       tr.IranRanking,
	       tr.IsActive,
	       DATEDIFF(second, tr2.ModifyDate, tr.ModifyDate) AS TimerDurSec,
	       DATEDIFF(MINUTE, tr2.ModifyDate, tr.ModifyDate) AS TimerDurMin
	FROM   dbo.TrafficRankings tr,
	       dbo.TrafficRankings tr2
	WHERE  tr.ModifyDate > @DayDate
	       AND tr2.ModifyDate > @DayDate
	       AND tr.RankID = tr2.RankID + 1
	ORDER BY
	       tr2.ModifyDate DESC
END




GO
/****** Object:  StoredProcedure [dbo].[sp_GetRankingUpdatesInfo]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetRankingUpdatesInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetRankingUpdatesInfo] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_GetRankingUpdatesInfo]
	@DayDate DATETIME
AS
BEGIN
	DECLARE @temp TABLE (
	            RankID BIGINT,
	            ModifyDate DATETIME,
	            NextTime TIME,
	            GlobalRanking INT,
	            IranRanking INT,
	            IsActive BIT,
	            TimerDurSec INT,
	            TimerDurMin INT
	        )
	
	INSERT INTO @temp
	SELECT tr.RankID,
	       tr.ModifyDate,
	       tr2.ModifyDate AS PreviewsDate,
	       tr.GlobalRanking,
	       tr.IranRanking,
	       tr.IsActive,
	       DATEDIFF(second, tr2.ModifyDate, tr.ModifyDate) AS TimerDurSec,
	       DATEDIFF(MINUTE, tr2.ModifyDate, tr.ModifyDate) AS TimerDurMin
	FROM   [xomorod.com_xomorod].dbo.TrafficRankings tr,
	       [xomorod.com_xomorod].dbo.TrafficRankings tr2
	WHERE  tr.ModifyDate > @DayDate
	       AND tr2.ModifyDate > @DayDate
	       AND tr.RankID = tr2.RankID + 1
	ORDER BY
	       tr2.ModifyDate DESC
	
	SELECT * FROM @temp
	
	SELECT SUM(t.TimerDurSec) / COUNT(1)  AS AverageTimeDurSec
	FROM   @temp                             t
	WHERE  t.TimerDurSec > 2 -- less lower bound
END




GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_ContactMe]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Insert_ContactMe]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Insert_ContactMe] AS' 
END
GO
-- =============================================
-- Author:		Behzad Khosravifar
-- Create date: 2016/06/07
-- Description:	Insert data in to ContactMe table
-- =============================================
ALTER PROCEDURE [dbo].[sp_Insert_ContactMe]
    @name NVARCHAR(MAX) ,
    @email NVARCHAR(MAX) ,
    @subject NVARCHAR(MAX) ,
    @message NVARCHAR(MAX)
AS
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION
            INSERT  INTO [dbo].[ContactMe]
                    ( [Name] ,
                      [Email] ,
                      [Subject] ,
                      [Message],
					  [UserId]
                    )
            VALUES  ( @name ,
                      @email ,
                      @subject ,
                      @message,
					  dbo.fn_GetFirstAdminUserID()
                    )

            COMMIT TRANSACTION
        END TRY 
        BEGIN CATCH
		-- IF @@TRANCOUNT > 0
            IF XACT_STATE() <> 0
                ROLLBACK TRANSACTION	
			
            DECLARE @err_msg NVARCHAR(MAX) = ERROR_MESSAGE();

            RAISERROR(@err_msg, 18, 255);
        END CATCH
    END




GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_NewsletterSubscribeEmails]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Insert_NewsletterSubscribeEmails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Insert_NewsletterSubscribeEmails] AS' 
END
GO
-- =============================================
-- Author:		Behzad Khosravifar
-- Create date: 2016.06.09
-- Description:	Insert into NewsletterSubscribeEmails table's
-- =============================================
ALTER PROCEDURE [dbo].[sp_Insert_NewsletterSubscribeEmails]
	@Email NVARCHAR(128)
AS
BEGIN
	IF EXISTS (
	       SELECT 1
	       FROM   [dbo].[NewsletterSubscribeEmails]
	       WHERE  EmailAddress = LOWER(@Email)
	   )
	    RAISERROR(N'DuplicateEmailError', 18, 1)
	ELSE
	BEGIN
	    INSERT INTO [dbo].[NewsletterSubscribeEmails]
	      (
	        [EmailAddress]
	      )
	    VALUES
	      (
	        LOWER(@Email)
	      )
	END
END




GO
/****** Object:  StoredProcedure [dbo].[sp_TrafficRankings_Insert]    Script Date: 5/31/2018 2:06:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TrafficRankings_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_TrafficRankings_Insert] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_TrafficRankings_Insert]
    @GlobalRank INT ,
    @IranRank INT
AS
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION
		
            IF NOT EXISTS ( SELECT TOP ( 1 )
                                    1
                            FROM    TrafficRankings tr
                            WHERE   CONVERT(DATE, tr.ModifyDate) = CONVERT(DATE, GETDATE())
                                    AND tr.GlobalRanking = @GlobalRank
                                    AND tr.IranRanking = @IranRank
                                    AND tr.IsActive = 1 )
                BEGIN
                    INSERT  INTO TrafficRankings
                            ( -- RankID -- this column value is auto-generated
                              GlobalRanking ,
                              IranRanking ,
                              IsActive
		                    )
                    VALUES  ( @GlobalRank ,
                              @IranRank ,
                              1
		                    )
                END
		
            COMMIT TRANSACTION
        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION
		
            DECLARE @err_msg NVARCHAR(MAX) = ERROR_MESSAGE();

            RAISERROR(@err_msg, 18, 255);
        END CATCH
    END




GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Parents', N'COLUMN',N'Sex'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 is Man and 0 is Woman' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parents', @level2type=N'COLUMN',@level2name=N'Sex'
GO
