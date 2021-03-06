USE [master]
GO
/****** Object:  Database [Construction]    Script Date: 11/7/2018 9:10:19 PM ******/
CREATE DATABASE [Construction]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Construction', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Construction.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Construction_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Construction_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Construction] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Construction].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Construction] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Construction] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Construction] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Construction] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Construction] SET ARITHABORT OFF 
GO
ALTER DATABASE [Construction] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Construction] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Construction] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Construction] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Construction] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Construction] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Construction] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Construction] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Construction] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Construction] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Construction] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Construction] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Construction] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Construction] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Construction] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Construction] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Construction] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Construction] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Construction] SET RECOVERY FULL 
GO
ALTER DATABASE [Construction] SET  MULTI_USER 
GO
ALTER DATABASE [Construction] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Construction] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Construction] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Construction] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Construction', N'ON'
GO
USE [Construction]
GO
/****** Object:  Table [dbo].[cmsContent]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [ntext] NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL,
	[templateId] [int] NULL,
	[newest] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMedia]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMedia](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[mediaPath] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMedia] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDecimal] [decimal](38, 6) NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTask]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](14) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoMigration]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMigration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[version] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_umbracoMigration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL,
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 11/7/2018 9:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON 

INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (42, 1141, 1140)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (43, 1146, 1144)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (44, 1147, 1145)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (45, 1155, 1152)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (46, 1203, 1202)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (547, 1140, N'home', N'icon-home color-green', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (548, 1144, N'services', N'icon-server-alt color-green', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (549, 1145, N'whyChooseUs', N'icon-wall-plug color-green', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (550, 1150, N'introductionContent', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (551, 1152, N'details', N'icon-info color-green', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (552, 1154, N'detailsContent', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (553, 1182, N'section2Content', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (554, 1190, N'section3Content', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (556, 1202, N'contactUs', N'icon-user color-green', N'folder.png', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1150, 1140)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1154, 1152)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1182, 1140)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1182, 1145)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1190, 1140)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1190, 1144)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1140, 1144, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1140, 1145, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1140, 1152, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1140, 1202, 3)
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON 

INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (115, 1141, N'071aa6b2-3b75-4f9a-bab0-e74e6a460334', CAST(0x0000A99100D3EEA5 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (116, 1141, N'32c70ee8-f099-4457-b92c-6e79bf303691', CAST(0x0000A99100D4D296 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (117, 1146, N'500c21a4-b43f-4815-8a00-0e358e386c82', CAST(0x0000A99100EDDAC5 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (118, 1147, N'd0ce4299-0afe-4ed5-aba2-1578c5aade75', CAST(0x0000A99100EDF267 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (119, 1141, N'4a2d7964-e018-413b-b0ff-36c14886c251', CAST(0x0000A99101008797 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (120, 1141, N'22d94fe7-aa75-4f4d-9284-37673e8da695', CAST(0x0000A99101013C61 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (121, 1141, N'5b12cf82-7a8c-4a63-9845-724921d1d5ec', CAST(0x0000A9910101925E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (122, 1155, N'7e224a50-1dd6-4802-818e-9383735f20a5', CAST(0x0000A991010915B8 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (123, 1141, N'1e5304a9-86a6-4a25-93ef-6f0741a9c478', CAST(0x0000A991010F5A6B AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (124, 1141, N'a3e6e330-7825-4946-a3a1-0695f8d64e45', CAST(0x0000A99101145217 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (125, 1155, N'0fd5c699-380d-4df1-af43-113e47706d3d', CAST(0x0000A9910114E08C AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (126, 1155, N'ab104ece-8989-4982-8870-b5ced9f0642d', CAST(0x0000A9910114FD9A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (127, 1155, N'56703709-a403-4054-bc24-fa327d7696ee', CAST(0x0000A99101151853 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (128, 1155, N'f8b5b384-6ae6-4d92-af24-801de7f1f2e4', CAST(0x0000A991011559B5 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (129, 1141, N'6138b445-02ff-4c47-976c-05638cda94d9', CAST(0x0000A991011638E6 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (130, 1141, N'309ea8c2-4a37-45a9-8ae7-94296fbf1745', CAST(0x0000A99101165AB1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (131, 1141, N'652f54f1-7070-4cd8-b3d3-a0cf4348d83b', CAST(0x0000A9910116CE5D AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (132, 1141, N'6ed37780-97a5-45db-b996-722ce593e534', CAST(0x0000A9910116F48F AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (133, 1141, N'315bd6d6-ca74-4372-a108-1e316aa1fd9d', CAST(0x0000A991011795C4 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (134, 1155, N'c26605c0-e3b0-4b2d-bad2-7a0e50873587', CAST(0x0000A9910117BC26 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (135, 1141, N'86a09f70-ab60-47e2-ac18-b5301f63f8e3', CAST(0x0000A9910117E896 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (136, 1141, N'cb563609-2db5-4204-84ca-865fbaa62dae', CAST(0x0000A9910118308E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (137, 1141, N'b36019b9-0eb1-4b50-bff1-b07f74f9ee0c', CAST(0x0000A99101186296 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (138, 1155, N'd49cfb26-61a2-440e-a38c-05ea8bcb9566', CAST(0x0000A9910118903D AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (139, 1141, N'2ace33e8-72fc-4731-a24b-8db8d84cc374', CAST(0x0000A9910118F2CC AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (140, 1141, N'02372a53-b4da-4c3a-85ef-f3eb35fa96a8', CAST(0x0000A99101197130 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (141, 1141, N'251fb1c2-4dd6-4e12-b2a3-761281154e05', CAST(0x0000A991011B9B01 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (142, 1141, N'624849ba-6ff4-4eee-a4ae-743768109790', CAST(0x0000A991011DFCE7 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (143, 1141, N'51d8c4e3-c489-4801-83c7-baafa4ff6484', CAST(0x0000A991011FBEF7 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (144, 1141, N'e5ebf3ed-7b4f-4b34-a0c3-27ed71d30c49', CAST(0x0000A99101203857 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (145, 1141, N'e86a5413-446e-46a2-8f0c-ecbfeef707f4', CAST(0x0000A9910122B040 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (146, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', CAST(0x0000A9910129FD36 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (147, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', CAST(0x0000A991012ABEFC AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (148, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', CAST(0x0000A991012B7849 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (149, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', CAST(0x0000A991012BB49B AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (150, 1146, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', CAST(0x0000A991012CA656 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (151, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', CAST(0x0000A991012D01B7 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (152, 1203, N'2943fe9e-e9f0-482e-843e-639da37cb0db', CAST(0x0000A9910131EEFF AS DateTime))
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1141, N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T18:11:11" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="true"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><section2Feature4Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.]]></section2Feature4Summary><section2Feature2Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature2Summary><section2Feature1Summary><![CDATA[Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.]]></section2Feature1Summary><section2Feature4Heading><![CDATA[WE ARE EXPERIENCED]]></section2Feature4Heading><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Feature2Heading><![CDATA[WE DELIVER QUALITY]]></section2Feature2Heading><section2Feature3Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.]]></section2Feature3Summary><section2Feature1Heading><![CDATA[ HONEST & DEPENDABLE]]></section2Feature1Heading><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><section2Feature3Heading><![CDATA[ALWAYS ON TIME]]></section2Feature3Heading><section3Feature1Heading><![CDATA[CONSTRUCTION MANAGEMENT]]></section3Feature1Heading><section3Feature3Heading><![CDATA[SUSTAINABLE DESIGN]]></section3Feature3Heading><section3Feature3Summary><![CDATA[Ecosense believes that sustainable design makes sense and it is our responsibility to implement green practices. Sustainable designs can offer a significant operating cost-savings to owners while having a positive impact on the environment. The LEED® rating system is made up of five main credit designations.]]></section3Feature3Summary><section3Feature2Heading><![CDATA[DESIGN-BUILD]]></section3Feature2Heading><section3Feature1Summary><![CDATA[Ecosense Construction Management process exceeds project and
Owner objectives through structured and consistent systems and procedures as applied by a highly-talented Project Team especially selected for each project based on their relevant experience and capabilities.]]></section3Feature1Summary><section3Heading><![CDATA[OUR SERVICES]]></section3Heading><section3Feature2Summary><![CDATA[Ecosense collaborative approach to Design-Build brings the design firm and the subcontractors together in a focused, team-oriented relationship offering Owners a single source of contact and responsibility. Ecosense has consistently demonstrated its successful Design-Build capabilities.]]></section3Feature2Summary><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1146, N'<services id="1146" key="caafa9fb-861a-4694-930c-b86c17a2dd67" parentID="1141" level="2" creatorID="0" sortOrder="0" createDate="2018-11-07T14:26:00" updateDate="2018-11-07T18:14:37" nodeName="Services" urlName="services" path="-1,1141,1146" isDoc="" nodeType="1144" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1142" nodeTypeAlias="services" isPublished="true"><section3Feature1Heading><![CDATA[CONSTRUCTION MANAGEMENT]]></section3Feature1Heading><section3Feature3Heading><![CDATA[ SUSTAINABLE DESIGN]]></section3Feature3Heading><section3Feature3Summary><![CDATA[Ecosense believes that sustainable design makes sense and it is our responsibility to implement green practices. Sustainable designs can offer a significant operating cost-savings to owners while having a positive impact on the environment. The LEED® rating system is made up of five main credit designations.]]></section3Feature3Summary><section3Feature2Heading><![CDATA[DESIGN-BUILD]]></section3Feature2Heading><section3Feature1Summary><![CDATA[Ecosense Construction Management process exceeds project and
Owner objectives through structured and consistent systems and procedures as applied by a highly-talented Project Team especially selected for each project based on their relevant experience and capabilities.]]></section3Feature1Summary><section3Heading><![CDATA[OUR SERVICES]]></section3Heading><section3Feature2Summary><![CDATA[Ecosense collaborative approach to Design-Build brings the design firm and the subcontractors together in a focused, team-oriented relationship offering Owners a single source of contact and responsibility. Ecosense has consistently demonstrated its successful Design-Build capabilities.]]></section3Feature2Summary></services>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1147, N'<whyChooseUs id="1147" key="5fd32e93-ca45-4b9f-8aa2-23f0c9eb5901" parentID="1141" level="2" creatorID="0" sortOrder="1" createDate="2018-11-07T14:26:12" updateDate="2018-11-07T18:15:55" nodeName="WhyChooseUs" urlName="whychooseus" path="-1,1141,1147" isDoc="" nodeType="1145" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1143" nodeTypeAlias="whyChooseUs" isPublished="true"><section2Feature4Summary><![CDATA[Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.]]></section2Feature4Summary><section2Feature2Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.]]></section2Feature2Summary><section2Feature1Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature1Summary><section2Feature4Heading><![CDATA[HONEST & DEPENDABLE ]]></section2Feature4Heading><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Feature2Heading><![CDATA[ALWAYS ON TIME]]></section2Feature2Heading><section2Feature3Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.]]></section2Feature3Summary><section2Feature1Heading><![CDATA[ WE DELIVER QUALITY]]></section2Feature1Heading><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><section2Feature3Heading><![CDATA[WE ARE EXPERIENCED]]></section2Feature3Heading></whyChooseUs>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1155, N'<details id="1155" key="360fa90e-c7b7-4508-9dd2-ef7073ff429a" parentID="1141" level="2" creatorID="0" sortOrder="2" createDate="2018-11-07T16:05:08" updateDate="2018-11-07T17:01:30" nodeName="Details" urlName="details" path="-1,1141,1155" isDoc="" nodeType="1152" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1151" nodeTypeAlias="details" isPublished="true"><details><![CDATA[<h2>About Us</h2>
<p>Ecosense Construction was founded in 1946 by my father Cecil. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk</p>]]></details></details>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1203, N'<contactUs id="1203" key="a7efd5ea-36ec-4a01-843e-b0a15aee4461" parentID="1141" level="2" creatorID="0" sortOrder="3" createDate="2018-11-07T18:33:46" updateDate="2018-11-07T18:33:52" nodeName="ContactUs" urlName="contactus" path="-1,1141,1203" isDoc="" nodeType="1202" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1201" nodeTypeAlias="contactUs" isPublished="true" />')
SET IDENTITY_INSERT [dbo].[cmsDataType] ON 

INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-28, -97, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-27, -96, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-26, -95, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (1, -49, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (2, -51, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (3, -87, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (4, -88, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (5, -89, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (6, -90, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (7, -92, N'Umbraco.NoEdit', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (8, -36, N'Umbraco.DateTime', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (9, -37, N'Umbraco.ColorPickerAlias', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (11, -39, N'Umbraco.DropDownMultiple', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (12, -40, N'Umbraco.RadioButtonList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (13, -41, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (14, -42, N'Umbraco.DropDown', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (15, -43, N'Umbraco.CheckBoxList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (22, 1041, N'Umbraco.Tags', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (24, 1043, N'Umbraco.ImageCropper', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (26, 1046, N'Umbraco.ContentPicker2', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (27, 1047, N'Umbraco.MemberPicker2', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (28, 1048, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (29, 1049, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (30, 1050, N'Umbraco.RelatedLinks2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (31, 1061, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (32, 1062, N'Umbraco.ContentPicker2', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (33, 1063, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (34, 1064, N'Umbraco.Grid', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (35, 1065, N'Umbraco.DropDown', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (36, 1066, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (37, 1067, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (38, 1068, N'Terratype', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (39, 1069, N'Umbraco.MultiNodeTreePicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (40, 1070, N'Umbraco.RadioButtonList', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (41, 1071, N'Umbraco.RadioButtonList', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (42, 1072, N'Umbraco.Grid', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (43, 1073, N'Umbraco.Tags', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (44, 1074, N'Umbraco.Tags', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (45, 1075, N'Umbraco.Tags', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (46, 1076, N'Umbraco.Tags', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (47, 1077, N'Umbraco.NestedContent', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (48, 1078, N'Umbraco.Decimal', N'Decimal')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (49, 1079, N'Umbraco.Slider', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (50, 1080, N'Umbraco.MultiNodeTreePicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (51, 1081, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (52, 1082, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (53, 1083, N'UmbracoForms.FormPicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (54, 1149, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (55, 1153, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (56, 1156, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (57, 1157, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (58, 1158, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (59, 1159, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (60, 1160, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (61, 1161, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (62, 1162, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (63, 1163, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (64, 1164, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (65, 1165, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (66, 1166, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (67, 1167, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (68, 1168, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (69, 1169, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (70, 1170, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (71, 1171, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (72, 1172, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (73, 1173, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (74, 1174, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (75, 1175, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (76, 1176, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (77, 1177, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (78, 1178, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (79, 1179, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (80, 1180, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (81, 1181, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (82, 1183, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (83, 1184, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (84, 1185, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (85, 1186, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (86, 1187, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (87, 1188, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (88, 1189, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (89, 1191, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (90, 1192, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (91, 1193, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (92, 1194, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (93, 1195, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (94, 1196, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (95, 1197, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (96, 1199, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (97, 1200, N'Umbraco.TextboxMultiple', N'Ntext')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON 

INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-9, -96, N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]', 5, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-8, -96, N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]', 4, N'layouts')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-7, -96, N'desc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-6, -96, N'updateDate', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-5, -96, N'100', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-4, -97, N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]', 4, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-3, -97, N'asc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-2, -97, N'username', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-1, -97, N'10', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (5, 1041, N'Json', 0, N'storageType')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (6, 1049, N'1', 0, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (7, 1061, N'{
  "toolbar": [
    "code",
    "undo",
    "redo",
    "bold",
    "italic",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (8, 1061, N'', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (9, 1062, N'0', 1, N'showOpenButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (10, 1062, N'-1', 2, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (11, 1063, N'', 1, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (12, 1063, N'1', 2, N'onlyImages')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (13, 1063, N'1', 3, N'disableFolderSelect')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (14, 1063, N'umb://media/b6f11172373f4473af0f0b0e5aefd21c', 4, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (15, 1064, N'{
  "styles": [],
  "config": [],
  "columns": 12,
  "templates": [
    {
      "name": "1 column layout",
      "sections": [
        {
          "grid": 12
        }
      ]
    }
  ],
  "layouts": [
    {
      "name": "Full Width",
      "areas": [
        {
          "grid": 12,
          "editors": [
            "headline"
          ],
          "allowAll": false,
          "allowed": [
            "media",
            "embed",
            "headline",
            "rte",
            "macro"
          ]
        }
      ]
    },
    {
      "name": "Article",
      "areas": [
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "quote",
            "embed",
            "macro",
            "media",
            "rte"
          ]
        },
        {
          "grid": 8,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "macro",
            "embed",
            "headline",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Three Columns",
      "areas": [
        {
          "grid": 4,
          "allowAll": true
        },
        {
          "grid": 4
        },
        {
          "grid": 4
        }
      ]
    }
  ]
}', 1, N'items')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (16, 1064, N'{
  "toolbar": [
    "code",
    "undo",
    "redo",
    "styleselect",
    "bold",
    "italic",
    "strikethrough",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "table"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 2, N'rte')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (17, 1065, N'€', 1, N'0')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (18, 1065, N'£', 2, N'1')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (19, 1065, N'$', 3, N'2')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (20, 1065, N'DKK', 4, N'3')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (21, 1066, N'', 1, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (22, 1066, N'1', 2, N'onlyImages')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (23, 1066, N'1', 3, N'disableFolderSelect')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (24, 1066, N'umb://media/1fd2ecaff3714c009306867fa4585e7a', 4, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (25, 1067, N'{
  "toolbar": [
    "undo",
    "redo",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (26, 1067, N'', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (27, 1068, N'{
  "config": {
    "height": 400,
    "gridHeight": 400,
    "debug": 0,
    "icon": {
      "id": "redmarker",
      "url": "https://mt.google.com/vt/icon/name=icons/spotlight/spotlight-poi.png",
      "size": {
        "width": 22,
        "height": 40
      },
      "anchor": {
        "horizontal": "center",
        "vertical": "bottom"
      }
    },
    "label": {
      "enable": false,
      "editPosition": "0",
      "id": "standard"
    },
    "provider": {
      "id": "Terratype.GoogleMapsV3",
      "version": 3,
      "forceHttps": true,
      "language": "",
      "predefineStyling": "hotel",
      "showRoads": true,
      "showLandmarks": true,
      "showLabels": true,
      "variety": {
        "basic": true,
        "satellite": false,
        "terrain": false,
        "selector": {
          "type": 1,
          "position": 0
        }
      },
      "streetView": {
        "enable": false,
        "position": 0
      },
      "fullscreen": {
        "enable": false,
        "position": 0
      },
      "scale": {
        "enable": false,
        "position": 0
      },
      "zoomControl": {
        "enable": true,
        "position": 0
      },
      "panControl": {
        "enable": false
      },
      "draggable": true,
      "styles": [
        {
          "featureType": "landscape.man_made",
          "elementType": "geometry.fill",
          "stylers": [
            {
              "lightness": "-5"
            }
          ]
        },
        {
          "featureType": "landscape.man_made",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "saturation": "21"
            }
          ]
        },
        {
          "featureType": "landscape.natural",
          "elementType": "geometry.fill",
          "stylers": [
            {
              "saturation": "1"
            },
            {
              "color": "#eae2d3"
            },
            {
              "lightness": "20"
            }
          ]
        },
        {
          "featureType": "road.highway",
          "elementType": "labels.icon",
          "stylers": [
            {
              "saturation": "39"
            },
            {
              "lightness": "7"
            },
            {
              "gamma": "1.06"
            },
            {
              "hue": "#00b8ff"
            },
            {
              "weight": "1.44"
            }
          ]
        },
        {
          "featureType": "road.arterial",
          "elementType": "geometry.stroke",
          "stylers": [
            {
              "lightness": "100"
            },
            {
              "weight": "1.16"
            },
            {
              "color": "#e0e0e0"
            }
          ]
        },
        {
          "featureType": "road.arterial",
          "elementType": "labels.icon",
          "stylers": [
            {
              "saturation": "-16"
            },
            {
              "lightness": "28"
            },
            {
              "gamma": "0.87"
            }
          ]
        },
        {
          "featureType": "water",
          "elementType": "geometry.fill",
          "stylers": [
            {
              "saturation": "-75"
            },
            {
              "lightness": "-15"
            },
            {
              "gamma": "1.35"
            },
            {
              "weight": "1.45"
            },
            {
              "hue": "#00dcff"
            }
          ]
        },
        {
          "featureType": "water",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#626262"
            }
          ]
        },
        {
          "featureType": "water",
          "elementType": "labels.text.stroke",
          "stylers": [
            {
              "saturation": "19"
            },
            {
              "weight": "1.84"
            }
          ]
        }
      ],
      "apiKey": "AIzaSyBSjIm2tkaskXtivVDbvlXcWkP6JDCoqA4"
    },
    "grid": {
      "enable": true,
      "name": "Default Map"
    },
    "search": {
      "enable": 0,
      "limit": {
        "countries": []
      }
    }
  },
  "position": {
    "id": "WGS84",
    "precision": 6,
    "datum": "55.406321,10.387015"
  },
  "zoom": 12
}', 1, N'definition')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (28, 1069, N'{
  "type": "content",
  "query": "$current"
}', 1, N'startNode')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (29, 1069, N'person', 2, N'filter')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (30, 1069, N'0', 3, N'minNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (31, 1069, N'9', 4, N'maxNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (32, 1069, N'1', 5, N'showOpenButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (33, 1070, N'water', 1, N'0')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (34, 1070, N'earth', 2, N'1')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (35, 1070, N'sun', 3, N'2')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (36, 1071, N'standard', 1, N'0')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (37, 1071, N'serif', 2, N'1')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (38, 1071, N'mono', 3, N'2')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (39, 1072, N'{
  "styles": [],
  "config": [],
  "columns": 12,
  "templates": [
    {
      "name": "1 column layout",
      "sections": [
        {
          "grid": 12
        }
      ]
    }
  ],
  "layouts": [
    {
      "name": "Full Width",
      "areas": [
        {
          "grid": 12,
          "editors": [
            "headline"
          ],
          "allowAll": false,
          "allowed": [
            "media",
            "macro",
            "embed",
            "headline"
          ]
        }
      ]
    },
    {
      "name": "Half and half",
      "areas": [
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "macro",
            "embed",
            "headline",
            "quote"
          ]
        },
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "macro",
            "embed",
            "headline",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Testimonials",
      "areas": [
        {
          "grid": 4,
          "allowAll": true,
          "allowed": [
            "docType"
          ]
        },
        {
          "grid": 4,
          "allowAll": true,
          "allowed": [
            "docType"
          ]
        },
        {
          "grid": 4,
          "allowAll": true,
          "allowed": [
            "docType"
          ]
        }
      ]
    }
  ]
}', 1, N'items')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (40, 1072, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 2, N'rte')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (41, 1073, N'default', 1, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (42, 1073, N'Csv', 2, N'storageType')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (43, 1074, N'department', 1, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (44, 1074, N'Csv', 2, N'storageType')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (45, 1075, N'default', 1, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (46, 1075, N'Csv', 2, N'storageType')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (47, 1076, N'default', 1, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (48, 1076, N'Csv', 2, N'storageType')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (49, 1077, N'[
  {
    "ncAlias": "feature",
    "ncTabAlias": "Feature",
    "nameTemplate": "{{featureName}}"
  }
]', 1, N'contentTypes')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (50, 1077, N'0', 2, N'minItems')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (51, 1077, N'0', 3, N'maxItems')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (52, 1077, N'1', 4, N'confirmDeletes')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (53, 1077, N'1', 5, N'showIcons')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (54, 1077, N'', 6, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (55, 1078, N'', 1, N'min')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (56, 1078, N'', 2, N'step')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (57, 1078, N'', 3, N'max')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (58, 1079, N'', 1, N'enableRange')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (59, 1079, N'horizontal', 2, N'orientation')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (60, 1079, N'3', 3, N'initVal1')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (61, 1079, N'', 4, N'initVal2')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (62, 1079, N'1', 5, N'minVal')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (63, 1079, N'20', 6, N'maxVal')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (64, 1079, N'1', 7, N'step')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (65, 1079, N'', 8, N'precision')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (66, 1079, N'round', 9, N'handle')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (67, 1079, N'always', 10, N'tooltip')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (68, 1079, N'', 11, N'tooltipSplit')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (69, 1079, N'', 12, N'tooltipFormat')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (70, 1079, N'', 13, N'tooltipPosition')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (71, 1079, N'', 14, N'reversed')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (72, 1079, N'', 15, N'ticks')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (73, 1079, N'', 16, N'ticksPositions')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (74, 1079, N'', 17, N'ticksLabels')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (75, 1079, N'', 18, N'ticksSnapBounds')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (76, 1080, N'{
  "type": "content",
  "query": "$current"
}', 1, N'startNode')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (77, 1080, N'product', 2, N'filter')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (78, 1080, N'0', 3, N'minNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (79, 1080, N'9', 4, N'maxNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (80, 1080, N'1', 5, N'showOpenButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (81, 1081, N'1', 1, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (82, 1081, N'1', 2, N'onlyImages')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (83, 1081, N'1', 3, N'disableFolderSelect')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (84, 1081, N'umb://media/6d5bf746cb8245c5bd15dd3798209b87', 4, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (85, 1082, N'1', 1, N'displayAtTabNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (86, 1082, N'10', 2, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (87, 1082, N'[
  {
    "name": "Grid",
    "path": "views/propertyeditors/listview/layouts/grid/grid.html",
    "icon": "icon-thumbnails-small",
    "isSystem": 1,
    "selected": true
  },
  {
    "name": "List",
    "path": "views/propertyeditors/listview/layouts/list/list.html",
    "icon": "icon-list",
    "isSystem": 1,
    "selected": true
  }
]', 3, N'layouts')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (88, 1082, N'[
  {
    "alias": "photos",
    "isSystem": 0,
    "header": "Photo"
  },
  {
    "alias": "updateDate",
    "header": "Last edited",
    "isSystem": 1
  },
  {
    "alias": "owner",
    "header": "Created by",
    "isSystem": 1
  }
]', 4, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (89, 1082, N'sortOrder', 5, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (90, 1082, N'asc', 6, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (91, 1082, N'{
  "allowBulkPublish": true,
  "allowBulkUnpublish": true,
  "allowBulkCopy": true,
  "allowBulkMove": true,
  "allowBulkDelete": true
}', 7, N'bulkActionPermissions')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (92, 1083, N'[]', 1, N'allowedForms')
GO
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (93, 1149, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (94, 1149, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (95, 1153, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (96, 1153, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (97, 1156, N'{
  "toolbar": [
    "code",
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (98, 1156, N'0', 2, N'hideLabel')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (99, 1157, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (100, 1158, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (101, 1159, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (102, 1160, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (103, 1161, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (104, 1162, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (105, 1163, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (106, 1164, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (107, 1165, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (108, 1166, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (109, 1167, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (110, 1168, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (111, 1169, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (112, 1170, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (113, 1171, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (114, 1172, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (115, 1173, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (116, 1174, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (117, 1175, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (118, 1176, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (119, 1177, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (120, 1178, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (121, 1179, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (122, 1180, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (123, 1181, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (124, 1183, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (125, 1184, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (126, 1185, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (127, 1186, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (128, 1187, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (129, 1188, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (130, 1189, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (131, 1191, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (132, 1192, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (133, 1193, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (134, 1194, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (135, 1195, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (136, 1196, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (137, 1197, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (138, 1199, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (139, 1200, NULL, 1, N'maxChars')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'6138b445-02ff-4c47-976c-05638cda94d9', N'Home', NULL, NULL, CAST(0x0000A991011638E6 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1155, 1, 0, N'd49cfb26-61a2-440e-a38c-05ea8bcb9566', N'Details', NULL, NULL, CAST(0x0000A9910118903D AS DateTime), 1151, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'a3e6e330-7825-4946-a3a1-0695f8d64e45', N'Home', NULL, NULL, CAST(0x0000A99101145217 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1146, 0, 0, N'500c21a4-b43f-4815-8a00-0e358e386c82', N'Services', NULL, NULL, CAST(0x0000A99100EDDAC5 AS DateTime), 1142, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1155, 0, 0, N'0fd5c699-380d-4df1-af43-113e47706d3d', N'Details', NULL, NULL, CAST(0x0000A9910114E08C AS DateTime), 1151, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1147, 0, 0, N'd0ce4299-0afe-4ed5-aba2-1578c5aade75', N'WhyChooseUs', NULL, NULL, CAST(0x0000A99100EDF267 AS DateTime), 1143, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', N'Home', NULL, NULL, CAST(0x0000A991012ABEFC AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'315bd6d6-ca74-4372-a108-1e316aa1fd9d', N'Home', NULL, NULL, CAST(0x0000A991011795C4 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'e5ebf3ed-7b4f-4b34-a0c3-27ed71d30c49', N'Home', NULL, NULL, CAST(0x0000A99101203857 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'4a2d7964-e018-413b-b0ff-36c14886c251', N'Home', NULL, NULL, CAST(0x0000A99101008797 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'22d94fe7-aa75-4f4d-9284-37673e8da695', N'Home', NULL, NULL, CAST(0x0000A99101013C61 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1146, 1, 0, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', N'Services', NULL, NULL, CAST(0x0000A991012CA656 AS DateTime), 1142, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 1, 0, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', N'Home', NULL, NULL, CAST(0x0000A991012BB49B AS DateTime), 1139, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'a4e5b737-217a-4776-94ca-56d4077e3245', N'Home', NULL, NULL, CAST(0x0000A9910129FD36 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1203, 1, 0, N'2943fe9e-e9f0-482e-843e-639da37cb0db', N'ContactUs', NULL, NULL, CAST(0x0000A9910131EEFF AS DateTime), 1201, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', N'Home', NULL, NULL, CAST(0x0000A991012B7849 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'32c70ee8-f099-4457-b92c-6e79bf303691', N'Home', NULL, NULL, CAST(0x0000A99100D4D296 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'1e5304a9-86a6-4a25-93ef-6f0741a9c478', N'Home', NULL, NULL, CAST(0x0000A991010F5A6B AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'6ed37780-97a5-45db-b996-722ce593e534', N'Home', NULL, NULL, CAST(0x0000A9910116F48F AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'5b12cf82-7a8c-4a63-9845-724921d1d5ec', N'Home', NULL, NULL, CAST(0x0000A9910101925E AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'624849ba-6ff4-4eee-a4ae-743768109790', N'Home', NULL, NULL, CAST(0x0000A991011DFCE7 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'251fb1c2-4dd6-4e12-b2a3-761281154e05', N'Home', NULL, NULL, CAST(0x0000A991011B9B01 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1155, 0, 0, N'c26605c0-e3b0-4b2d-bad2-7a0e50873587', N'Details', NULL, NULL, CAST(0x0000A9910117BC26 AS DateTime), 1151, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1155, 0, 0, N'f8b5b384-6ae6-4d92-af24-801de7f1f2e4', N'Details', NULL, NULL, CAST(0x0000A991011559B5 AS DateTime), 1151, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'cb563609-2db5-4204-84ca-865fbaa62dae', N'Home', NULL, NULL, CAST(0x0000A9910118308E AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'2ace33e8-72fc-4731-a24b-8db8d84cc374', N'Home', NULL, NULL, CAST(0x0000A9910118F2CC AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1155, 0, 0, N'7e224a50-1dd6-4802-818e-9383735f20a5', N'Details', NULL, NULL, CAST(0x0000A991010915B8 AS DateTime), 1151, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'309ea8c2-4a37-45a9-8ae7-94296fbf1745', N'Home', NULL, NULL, CAST(0x0000A99101165AB1 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'652f54f1-7070-4cd8-b3d3-a0cf4348d83b', N'Home', NULL, NULL, CAST(0x0000A9910116CE5D AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'b36019b9-0eb1-4b50-bff1-b07f74f9ee0c', N'Home', NULL, NULL, CAST(0x0000A99101186296 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'86a09f70-ab60-47e2-ac18-b5301f63f8e3', N'Home', NULL, NULL, CAST(0x0000A9910117E896 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1155, 0, 0, N'ab104ece-8989-4982-8870-b5ced9f0642d', N'About Us', NULL, NULL, CAST(0x0000A9910114FD9A AS DateTime), 1151, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'51d8c4e3-c489-4801-83c7-baafa4ff6484', N'Home', NULL, NULL, CAST(0x0000A991011FBEF7 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'071aa6b2-3b75-4f9a-bab0-e74e6a460334', N'Home', NULL, NULL, CAST(0x0000A99100D3EEA5 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'e86a5413-446e-46a2-8f0c-ecbfeef707f4', N'Home', NULL, NULL, CAST(0x0000A9910122B040 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1147, 1, 0, N'517b8e6b-2d3d-4304-8376-f13472a275ac', N'WhyChooseUs', NULL, NULL, CAST(0x0000A991012D01B7 AS DateTime), 1143, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1141, 0, 0, N'02372a53-b4da-4c3a-85ef-f3eb35fa96a8', N'Home', NULL, NULL, CAST(0x0000A99101197130 AS DateTime), 1139, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1155, 0, 0, N'56703709-a403-4054-bc24-fa327d7696ee', N'About Us', NULL, NULL, CAST(0x0000A99101151853 AS DateTime), 1151, 0)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1140, 1139, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1144, 1142, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1145, 1143, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1152, 1151, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1202, 1201, 1)
SET IDENTITY_INSERT [dbo].[cmsMacro] ON 

INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroScriptType], [macroScriptAssembly], [macroXSLT], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroPython]) VALUES (1, N'e90a32ca-b64e-4cd1-b276-d9ba6b152b3e', 1, 0, N'featuredProducts', N'Select Featured Products', N'', N'', N'', 0, 0, 0, N'~/Views/MacroPartials/featuredProducts.cshtml')
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroScriptType], [macroScriptAssembly], [macroXSLT], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroPython]) VALUES (2, N'1d0cef1e-bdc9-4be9-9011-8da2a9cb6928', 1, 0, N'latestBlogposts', N'Get Latest Blogposts', N'', N'', N'', 0, 0, 0, N'~/Views/MacroPartials/latestBlogposts.cshtml')
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroScriptType], [macroScriptAssembly], [macroXSLT], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroPython]) VALUES (3, N'8ca5166b-2a60-40f1-943e-227676ba48d7', 1, 0, N'featuredProduct', N'Showcase Product', N'', N'', N'', 0, 0, 0, N'~/Views/MacroPartials/featuredProducts.cshtml')
SET IDENTITY_INSERT [dbo].[cmsMacro] OFF
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] ON 

INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (1, N'534b1d47-3f5e-442e-8e2f-34f0d6ec53df', N'contentType', 1, 0, N'products', N'Choose Products')
INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (2, N'e753614e-12a9-480d-bf39-4cdfb78572d1', N'Umbraco.Integer', 2, 0, N'numberOfPosts', N'How many posts should be shown')
INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (3, N'534289e3-a070-437d-aa89-bb89fe1df9cf', N'Umbraco.ContentPicker2', 2, 0, N'startNodeId', N'Where to get blog posts from')
INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (4, N'2d92af97-ea21-4657-9a10-1c0b1976473b', N'Umbraco.ContentPickerAlias', 3, 0, N'product', N'Choose Product')
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] OFF
SET IDENTITY_INSERT [dbo].[cmsMemberType] ON 

INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (1, 1044, 88, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (2, 1044, 89, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (3, 1044, 28, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (4, 1044, 29, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (5, 1044, 30, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (6, 1044, 31, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (7, 1044, 32, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (8, 1044, 33, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (9, 1044, 34, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsMemberType] OFF
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'6138b445-02ff-4c47-976c-05638cda94d9', CAST(0x0000A99101163A80 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T16:52:58" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome to The Construction]]></welcomeTitle><welcomeSummary><![CDATA[ACC (Arabian Construction Company) is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East and India’s most iconic and sophisticated construction masterpieces

For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'a3e6e330-7825-4946-a3a1-0695f8d64e45', CAST(0x0000A99101149873 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T16:46:03" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome to The Construction]]></welcomeTitle><welcomeSummary><![CDATA[This is the welcome summary]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', CAST(0x0000A991012ABF0E AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T18:07:42" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="true"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><section2Feature4Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.]]></section2Feature4Summary><section2Feature2Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature2Summary><section2Feature4Heading><![CDATA[WE ARE EXPERIENCED]]></section2Feature4Heading><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Feature2Heading><![CDATA[WE DELIVER QUALITY]]></section2Feature2Heading><section2Feature3Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.]]></section2Feature3Summary><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><section2Feature3Heading><![CDATA[ALWAYS ON TIME]]></section2Feature3Heading><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'315bd6d6-ca74-4372-a108-1e316aa1fd9d', CAST(0x0000A991011795D3 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T16:57:56" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="true"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<h2>Ecosense Construction</h2>
<p>is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'e5ebf3ed-7b4f-4b34-a0c3-27ed71d30c49', CAST(0x0000A991012038BC AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T17:29:22" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="true"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary><section2Feature1Heading><![CDATA[WE DELIVER QUALITY]]></section2Feature1Heading><feature3Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.]]></feature3Summary><feature4Summary><![CDATA[Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.]]></feature4Summary><feature4Heading><![CDATA[HONEST & DEPENDABLE]]></feature4Heading><feature2Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.]]></feature2Summary><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><feature3Heading><![CDATA[WE ARE EXPERIENCED]]></feature3Heading><section2Feature1Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature1Summary><feature2Heading><![CDATA[ALWAYS ON TIME]]></feature2Heading></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'4a2d7964-e018-413b-b0ff-36c14886c251', CAST(0x0000A99101008A05 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T15:33:59" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
<p><a class="btn know_btn">know more</a> <a class="btn know_btn">view project</a></p>]]></introduction></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'22d94fe7-aa75-4f4d-9284-37673e8da695', CAST(0x0000A9910101477B AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T15:36:34" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on.</p>
<p><a class="btn know_btn">know more</a></p>]]></introduction></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', CAST(0x0000A991012BB5F1 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T18:11:11" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><section2Feature4Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.]]></section2Feature4Summary><section2Feature2Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature2Summary><section2Feature1Summary><![CDATA[Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.]]></section2Feature1Summary><section2Feature4Heading><![CDATA[WE ARE EXPERIENCED]]></section2Feature4Heading><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Feature2Heading><![CDATA[WE DELIVER QUALITY]]></section2Feature2Heading><section2Feature3Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.]]></section2Feature3Summary><section2Feature1Heading><![CDATA[ HONEST & DEPENDABLE]]></section2Feature1Heading><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><section2Feature3Heading><![CDATA[ALWAYS ON TIME]]></section2Feature3Heading><section3Feature1Heading><![CDATA[CONSTRUCTION MANAGEMENT]]></section3Feature1Heading><section3Feature3Heading><![CDATA[SUSTAINABLE DESIGN]]></section3Feature3Heading><section3Feature3Summary><![CDATA[Ecosense believes that sustainable design makes sense and it is our responsibility to implement green practices. Sustainable designs can offer a significant operating cost-savings to owners while having a positive impact on the environment. The LEED® rating system is made up of five main credit designations.]]></section3Feature3Summary><section3Feature2Heading><![CDATA[DESIGN-BUILD]]></section3Feature2Heading><section3Feature1Summary><![CDATA[Ecosense Construction Management process exceeds project and
Owner objectives through structured and consistent systems and procedures as applied by a highly-talented Project Team especially selected for each project based on their relevant experience and capabilities.]]></section3Feature1Summary><section3Heading><![CDATA[OUR SERVICES]]></section3Heading><section3Feature2Summary><![CDATA[Ecosense collaborative approach to Design-Build brings the design firm and the subcontractors together in a focused, team-oriented relationship offering Owners a single source of contact and responsibility. Ecosense has consistently demonstrated its successful Design-Build capabilities.]]></section3Feature2Summary><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', CAST(0x0000A9910129FD60 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T18:04:56" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="true"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary><section3Feature3Heading><![CDATA[SUSTAINABLE DESIGN]]></section3Feature3Heading><section3Heading><![CDATA[OUR SERVICES]]></section3Heading><section3Feature1Summary><![CDATA[Ecosense Construction Management process exceeds project and
Owner objectives through structured and consistent systems and procedures as applied by a highly-talented Project Team especially selected for each project based on their relevant experience and capabilities.]]></section3Feature1Summary><section3Feature1Heading><![CDATA[CONSTRUCTION MANAGEMENT]]></section3Feature1Heading><section3Feature3Summary><![CDATA[Ecosense believes that sustainable design makes sense and it is our responsibility to implement green practices. Sustainable designs can offer a significant operating cost-savings to owners while having a positive impact on the environment. The LEED® rating system is made up of five main credit designations.]]></section3Feature3Summary><section3Feature2Summary><![CDATA[Ecosense collaborative approach to Design-Build brings the design firm and the subcontractors together in a focused, team-oriented relationship offering Owners a single source of contact and responsibility. Ecosense has consistently demonstrated its successful Design-Build capabilities.]]></section3Feature2Summary><section3Feature2Heading><![CDATA[DESIGN-BUILD]]></section3Feature2Heading></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', CAST(0x0000A991012B7854 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T18:10:20" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="true"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><section2Feature4Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.]]></section2Feature4Summary><section2Feature2Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature2Summary><section2Feature1Summary><![CDATA[Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.]]></section2Feature1Summary><section2Feature4Heading><![CDATA[WE ARE EXPERIENCED]]></section2Feature4Heading><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Feature2Heading><![CDATA[WE DELIVER QUALITY]]></section2Feature2Heading><section2Feature3Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.]]></section2Feature3Summary><section2Feature1Heading><![CDATA[ HONEST & DEPENDABLE]]></section2Feature1Heading><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><section2Feature3Heading><![CDATA[ALWAYS ON TIME]]></section2Feature3Heading><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'32c70ee8-f099-4457-b92c-6e79bf303691', CAST(0x0000A99100D4D6A0 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T12:54:51" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'1e5304a9-86a6-4a25-93ef-6f0741a9c478', CAST(0x0000A991010F6B90 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T16:27:58" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'6ed37780-97a5-45db-b996-722ce593e534', CAST(0x0000A99101170492 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T16:55:38" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[Ecosense Construction is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces

For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'5b12cf82-7a8c-4a63-9845-724921d1d5ec', CAST(0x0000A991010194D4 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T15:37:47" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a class="btn know_btn">know more</a></p>]]></introduction></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'624849ba-6ff4-4eee-a4ae-743768109790', CAST(0x0000A991011F1749 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T17:21:15" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary><section2Feature1Heading><![CDATA[WE DELIVER QUALITY]]></section2Feature1Heading><feature3Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism. They also use only proven and reputable subcontractors and material suppliers. Their staff also includes a licensed professional engineer and four licensed residential building contractors.]]></feature3Summary><feature4Summary><![CDATA[Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy. The Owners and Employees of Ecosense Construction are in the building business because they love it. They are dedicated to each project and take much pride in the final product.]]></feature4Summary><feature4Heading><![CDATA[HONEST & DEPENDABLE]]></feature4Heading><feature2Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly. By doing their own site work, concrete, masonry, rough carpentry work, exterior finish work, and interior finish work they have better control of the project schedule and can expedite the project.]]></feature2Summary><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><feature3Heading><![CDATA[WE ARE EXPERIENCED]]></feature3Heading><section2Feature1Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature1Summary><feature2Heading><![CDATA[ALWAYS ON TIME]]></feature2Heading></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'251fb1c2-4dd6-4e12-b2a3-761281154e05', CAST(0x0000A991011B9D43 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T17:12:34" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary><section2Feature1Heading><![CDATA[WE DELIVER QUALITY]]></section2Feature1Heading><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><section2Feature1Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature1Summary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'cb563609-2db5-4204-84ca-865fbaa62dae', CAST(0x0000A99101185501 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T17:00:08" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><span>Ecosense Construction</span></p>
<p>is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'2ace33e8-72fc-4731-a24b-8db8d84cc374', CAST(0x0000A99101191A27 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T17:02:54" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<h1 class="second_heading">Nationality Recognized</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'309ea8c2-4a37-45a9-8ae7-94296fbf1745', CAST(0x0000A99101165ABC AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T16:53:27" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="true"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[ACC (Arabian Construction Company) is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East and India’s most iconic and sophisticated construction masterpieces

For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'652f54f1-7070-4cd8-b3d3-a0cf4348d83b', CAST(0x0000A9910116CE69 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T16:55:06" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[Ecosense Construction is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East and India’s most iconic and sophisticated construction masterpieces

For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'b36019b9-0eb1-4b50-bff1-b07f74f9ee0c', CAST(0x0000A9910118640D AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T17:00:51" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'86a09f70-ab60-47e2-ac18-b5301f63f8e3', CAST(0x0000A9910117EA7C AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T16:59:06" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<h4>Ecosense Construction</h4>
<p>is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'51d8c4e3-c489-4801-83c7-baafa4ff6484', CAST(0x0000A991011FC071 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T17:27:39" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary><section2Feature1Heading><![CDATA[WE DELIVER QUALITY]]></section2Feature1Heading><feature3Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism. They also use only proven and reputable subcontractors and material suppliers.]]></feature3Summary><feature4Summary><![CDATA[Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy. The Owners and Employees of Ecosense Construction are in the building business because they love it.]]></feature4Summary><feature4Heading><![CDATA[HONEST & DEPENDABLE]]></feature4Heading><feature2Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.]]></feature2Summary><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><feature3Heading><![CDATA[WE ARE EXPERIENCED]]></feature3Heading><section2Feature1Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature1Summary><feature2Heading><![CDATA[ALWAYS ON TIME]]></feature2Heading></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'071aa6b2-3b75-4f9a-bab0-e74e6a460334', CAST(0x0000A99100D48FDC AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T12:51:37" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="0" nodeTypeAlias="home" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'e86a5413-446e-46a2-8f0c-ecbfeef707f4', CAST(0x0000A99101231012 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T17:38:21" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary><section2Feature1Heading><![CDATA[WE DELIVER QUALITY]]></section2Feature1Heading><feature3Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.]]></feature3Summary><feature4Summary><![CDATA[Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.]]></feature4Summary><feature4Heading><![CDATA[HONEST & DEPENDABLE]]></feature4Heading><feature2Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.]]></feature2Summary><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><feature3Heading><![CDATA[WE ARE EXPERIENCED]]></feature3Heading><section2Feature1Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature1Summary><feature2Heading><![CDATA[ALWAYS ON TIME]]></feature2Heading><section3Feature3Heading><![CDATA[SUSTAINABLE DESIGN]]></section3Feature3Heading><section3Heading><![CDATA[OUR SERVICES]]></section3Heading><section3Feature1Summary><![CDATA[Ecosense Construction Management process exceeds project and
Owner objectives through structured and consistent systems and procedures as applied by a highly-talented Project Team especially selected for each project based on their relevant experience and capabilities.]]></section3Feature1Summary><section3Feature1Heading><![CDATA[CONSTRUCTION MANAGEMENT]]></section3Feature1Heading><section3Feature3Summary><![CDATA[Ecosense believes that sustainable design makes sense and it is our responsibility to implement green practices. Sustainable designs can offer a significant operating cost-savings to owners while having a positive impact on the environment. The LEED® rating system is made up of five main credit designations: Sustainable Sites, Water Efficiency, Energy & Atmosphere, Materials & Resources, and Indoor Environmental Quality.]]></section3Feature3Summary><section3Feature2Summary><![CDATA[Ecosense collaborative approach to Design-Build brings the design firm and the subcontractors together in a focused, team-oriented relationship offering Owners a single source of contact and responsibility. Ecosense has consistently demonstrated its successful Design-Build capabilities and approach as a delivery system in both the industrial and commercial sectors in private and public industries.]]></section3Feature2Summary><section3Feature2Heading><![CDATA[DESIGN-BUILD]]></section3Feature2Heading></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1141, N'02372a53-b4da-4c3a-85ef-f3eb35fa96a8', CAST(0x0000A99101197253 AS DateTime), N'<home id="1141" key="342d4e10-138d-473e-a234-36799e38909b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-11-07T12:51:37" updateDate="2018-11-07T17:04:41" nodeName="Home" urlName="home" path="-1,1141" isDoc="" nodeType="1140" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1139" nodeTypeAlias="home" isPublished="false"><introduction><![CDATA[<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>]]></introduction><welcomeTitle><![CDATA[Welcome]]></welcomeTitle><welcomeSummary><![CDATA[<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>]]></welcomeSummary></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1146, N'500c21a4-b43f-4815-8a00-0e358e386c82', CAST(0x0000A99100EDDAF0 AS DateTime), N'<services id="1146" key="caafa9fb-861a-4694-930c-b86c17a2dd67" parentID="1141" level="2" creatorID="0" sortOrder="0" createDate="2018-11-07T14:26:00" updateDate="2018-11-07T14:26:00" nodeName="Services" urlName="services" path="-1,1141,1146" isDoc="" nodeType="1144" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1142" nodeTypeAlias="services" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1146, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', CAST(0x0000A991012CA66A AS DateTime), N'<services id="1146" key="caafa9fb-861a-4694-930c-b86c17a2dd67" parentID="1141" level="2" creatorID="0" sortOrder="0" createDate="2018-11-07T14:26:00" updateDate="2018-11-07T18:14:37" nodeName="Services" urlName="services" path="-1,1141,1146" isDoc="" nodeType="1144" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1142" nodeTypeAlias="services" isPublished="true"><section3Feature1Heading><![CDATA[CONSTRUCTION MANAGEMENT]]></section3Feature1Heading><section3Feature3Heading><![CDATA[ SUSTAINABLE DESIGN]]></section3Feature3Heading><section3Feature3Summary><![CDATA[Ecosense believes that sustainable design makes sense and it is our responsibility to implement green practices. Sustainable designs can offer a significant operating cost-savings to owners while having a positive impact on the environment. The LEED® rating system is made up of five main credit designations.]]></section3Feature3Summary><section3Feature2Heading><![CDATA[DESIGN-BUILD]]></section3Feature2Heading><section3Feature1Summary><![CDATA[Ecosense Construction Management process exceeds project and
Owner objectives through structured and consistent systems and procedures as applied by a highly-talented Project Team especially selected for each project based on their relevant experience and capabilities.]]></section3Feature1Summary><section3Heading><![CDATA[OUR SERVICES]]></section3Heading><section3Feature2Summary><![CDATA[Ecosense collaborative approach to Design-Build brings the design firm and the subcontractors together in a focused, team-oriented relationship offering Owners a single source of contact and responsibility. Ecosense has consistently demonstrated its successful Design-Build capabilities.]]></section3Feature2Summary></services>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1147, N'd0ce4299-0afe-4ed5-aba2-1578c5aade75', CAST(0x0000A99100EDF290 AS DateTime), N'<whyChooseUs id="1147" key="5fd32e93-ca45-4b9f-8aa2-23f0c9eb5901" parentID="1141" level="2" creatorID="0" sortOrder="1" createDate="2018-11-07T14:26:12" updateDate="2018-11-07T14:26:20" nodeName="WhyChooseUs" urlName="whychooseus" path="-1,1141,1147" isDoc="" nodeType="1145" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1143" nodeTypeAlias="whyChooseUs" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', CAST(0x0000A991012D0481 AS DateTime), N'<whyChooseUs id="1147" key="5fd32e93-ca45-4b9f-8aa2-23f0c9eb5901" parentID="1141" level="2" creatorID="0" sortOrder="1" createDate="2018-11-07T14:26:12" updateDate="2018-11-07T18:15:55" nodeName="WhyChooseUs" urlName="whychooseus" path="-1,1141,1147" isDoc="" nodeType="1145" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1143" nodeTypeAlias="whyChooseUs" isPublished="false"><section2Feature4Summary><![CDATA[Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.]]></section2Feature4Summary><section2Feature2Summary><![CDATA[When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.]]></section2Feature2Summary><section2Feature1Summary><![CDATA[Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.]]></section2Feature1Summary><section2Feature4Heading><![CDATA[HONEST & DEPENDABLE ]]></section2Feature4Heading><section2Summary><![CDATA[We deliver the best results.]]></section2Summary><section2Feature2Heading><![CDATA[ALWAYS ON TIME]]></section2Feature2Heading><section2Feature3Summary><![CDATA[The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.]]></section2Feature3Summary><section2Feature1Heading><![CDATA[ WE DELIVER QUALITY]]></section2Feature1Heading><section2Heading><![CDATA[WHY CHOOSE US ?]]></section2Heading><section2Feature3Heading><![CDATA[WE ARE EXPERIENCED]]></section2Feature3Heading></whyChooseUs>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1155, N'd49cfb26-61a2-440e-a38c-05ea8bcb9566', CAST(0x0000A9910118904D AS DateTime), N'<details id="1155" key="360fa90e-c7b7-4508-9dd2-ef7073ff429a" parentID="1141" level="2" creatorID="0" sortOrder="2" createDate="2018-11-07T16:05:08" updateDate="2018-11-07T17:01:30" nodeName="Details" urlName="details" path="-1,1141,1155" isDoc="" nodeType="1152" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1151" nodeTypeAlias="details" isPublished="true"><details><![CDATA[<h2>About Us</h2>
<p>Ecosense Construction was founded in 1946 by my father Cecil. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk</p>]]></details></details>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1155, N'0fd5c699-380d-4df1-af43-113e47706d3d', CAST(0x0000A9910114E09B AS DateTime), N'<details id="1155" key="360fa90e-c7b7-4508-9dd2-ef7073ff429a" parentID="1141" level="2" creatorID="0" sortOrder="2" createDate="2018-11-07T16:05:08" updateDate="2018-11-07T16:48:04" nodeName="Details" urlName="details" path="-1,1141,1155" isDoc="" nodeType="1152" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1151" nodeTypeAlias="details" isPublished="true"><details><![CDATA[<h2>About Us</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>]]></details></details>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1155, N'c26605c0-e3b0-4b2d-bad2-7a0e50873587', CAST(0x0000A9910117BDE9 AS DateTime), N'<details id="1155" key="360fa90e-c7b7-4508-9dd2-ef7073ff429a" parentID="1141" level="2" creatorID="0" sortOrder="2" createDate="2018-11-07T16:05:08" updateDate="2018-11-07T16:58:29" nodeName="Details" urlName="details" path="-1,1141,1155" isDoc="" nodeType="1152" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1151" nodeTypeAlias="details" isPublished="false"><details><![CDATA[<h2>About Us</h2>
<p>Ecosense Construction was founded in 1946 by my father Cecil. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>]]></details></details>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1155, N'f8b5b384-6ae6-4d92-af24-801de7f1f2e4', CAST(0x0000A99101156251 AS DateTime), N'<details id="1155" key="360fa90e-c7b7-4508-9dd2-ef7073ff429a" parentID="1141" level="2" creatorID="0" sortOrder="2" createDate="2018-11-07T16:05:08" updateDate="2018-11-07T16:49:48" nodeName="Details" urlName="details" path="-1,1141,1155" isDoc="" nodeType="1152" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1151" nodeTypeAlias="details" isPublished="false"><details><![CDATA[<h2>About Us</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>]]></details></details>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1155, N'7e224a50-1dd6-4802-818e-9383735f20a5', CAST(0x0000A99101091E91 AS DateTime), N'<details id="1155" key="360fa90e-c7b7-4508-9dd2-ef7073ff429a" parentID="1141" level="2" creatorID="0" sortOrder="2" createDate="2018-11-07T16:05:08" updateDate="2018-11-07T16:05:08" nodeName="Details" urlName="details" path="-1,1141,1155" isDoc="" nodeType="1152" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1151" nodeTypeAlias="details" isPublished="false"><details><![CDATA[<h2>Welcome to Our Company</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>]]></details></details>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1155, N'ab104ece-8989-4982-8870-b5ced9f0642d', CAST(0x0000A9910114FDC2 AS DateTime), N'<details id="1155" key="360fa90e-c7b7-4508-9dd2-ef7073ff429a" parentID="1141" level="2" creatorID="0" sortOrder="2" createDate="2018-11-07T16:05:08" updateDate="2018-11-07T16:48:29" nodeName="About Us" urlName="about-us" path="-1,1141,1155" isDoc="" nodeType="1152" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1151" nodeTypeAlias="details" isPublished="false"><details><![CDATA[<h2>About Us</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>]]></details></details>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1155, N'56703709-a403-4054-bc24-fa327d7696ee', CAST(0x0000A99101151860 AS DateTime), N'<details id="1155" key="360fa90e-c7b7-4508-9dd2-ef7073ff429a" parentID="1141" level="2" creatorID="0" sortOrder="2" createDate="2018-11-07T16:05:08" updateDate="2018-11-07T16:48:52" nodeName="About Us" urlName="about-us" path="-1,1141,1155" isDoc="" nodeType="1152" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1151" nodeTypeAlias="details" isPublished="true"><details><![CDATA[<h2>About Us</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>]]></details></details>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1203, N'2943fe9e-e9f0-482e-843e-639da37cb0db', CAST(0x0000A9910131EF0E AS DateTime), N'<contactUs id="1203" key="a7efd5ea-36ec-4a01-843e-b0a15aee4461" parentID="1141" level="2" creatorID="0" sortOrder="3" createDate="2018-11-07T18:33:46" updateDate="2018-11-07T18:33:52" nodeName="ContactUs" urlName="contactus" path="-1,1141,1203" isDoc="" nodeType="1202" creatorName="Rabin Maharjan" writerName="Rabin Maharjan" writerID="0" template="1201" nodeTypeAlias="contactUs" isPublished="true" />')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON 

INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (869, 1141, N'4a2d7964-e018-413b-b0ff-36c14886c251', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
<p><a class="btn know_btn">know more</a> <a class="btn know_btn">view project</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (870, 1141, N'22d94fe7-aa75-4f4d-9284-37673e8da695', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on.</p>
<p><a class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (871, 1141, N'5b12cf82-7a8c-4a63-9845-724921d1d5ec', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (872, 1155, N'7e224a50-1dd6-4802-818e-9383735f20a5', 91, NULL, NULL, NULL, NULL, N'<h2>Welcome to Our Company</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (873, 1141, N'1e5304a9-86a6-4a25-93ef-6f0741a9c478', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (874, 1141, N'a3e6e330-7825-4946-a3a1-0695f8d64e45', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (875, 1141, N'a3e6e330-7825-4946-a3a1-0695f8d64e45', 92, NULL, NULL, NULL, N'Welcome to The Construction', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (876, 1141, N'a3e6e330-7825-4946-a3a1-0695f8d64e45', 93, NULL, NULL, NULL, NULL, N'This is the welcome summary')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (877, 1155, N'0fd5c699-380d-4df1-af43-113e47706d3d', 91, NULL, NULL, NULL, NULL, N'<h2>About Us</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (878, 1155, N'ab104ece-8989-4982-8870-b5ced9f0642d', 91, NULL, NULL, NULL, NULL, N'<h2>About Us</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (879, 1155, N'56703709-a403-4054-bc24-fa327d7696ee', 91, NULL, NULL, NULL, NULL, N'<h2>About Us</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (880, 1155, N'f8b5b384-6ae6-4d92-af24-801de7f1f2e4', 91, NULL, NULL, NULL, NULL, N'<h2>About Us</h2>
<p>Construction Company was founded in 1946 by my father Cecil Malone. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (881, 1141, N'6138b445-02ff-4c47-976c-05638cda94d9', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (882, 1141, N'6138b445-02ff-4c47-976c-05638cda94d9', 92, NULL, NULL, NULL, N'Welcome to The Construction', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (883, 1141, N'6138b445-02ff-4c47-976c-05638cda94d9', 93, NULL, NULL, NULL, NULL, N'ACC (Arabian Construction Company) is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East and India’s most iconic and sophisticated construction masterpieces

For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (884, 1141, N'309ea8c2-4a37-45a9-8ae7-94296fbf1745', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (885, 1141, N'309ea8c2-4a37-45a9-8ae7-94296fbf1745', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (886, 1141, N'309ea8c2-4a37-45a9-8ae7-94296fbf1745', 93, NULL, NULL, NULL, NULL, N'ACC (Arabian Construction Company) is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East and India’s most iconic and sophisticated construction masterpieces

For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (887, 1141, N'652f54f1-7070-4cd8-b3d3-a0cf4348d83b', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (888, 1141, N'652f54f1-7070-4cd8-b3d3-a0cf4348d83b', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (889, 1141, N'652f54f1-7070-4cd8-b3d3-a0cf4348d83b', 93, NULL, NULL, NULL, NULL, N'Ecosense Construction is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East and India’s most iconic and sophisticated construction masterpieces

For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (890, 1141, N'6ed37780-97a5-45db-b996-722ce593e534', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (891, 1141, N'6ed37780-97a5-45db-b996-722ce593e534', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (892, 1141, N'6ed37780-97a5-45db-b996-722ce593e534', 93, NULL, NULL, NULL, NULL, N'Ecosense Construction is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces

For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (893, 1141, N'315bd6d6-ca74-4372-a108-1e316aa1fd9d', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (894, 1141, N'315bd6d6-ca74-4372-a108-1e316aa1fd9d', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (895, 1141, N'315bd6d6-ca74-4372-a108-1e316aa1fd9d', 93, NULL, NULL, NULL, NULL, N'<h2>Ecosense Construction</h2>
<p>is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (896, 1155, N'c26605c0-e3b0-4b2d-bad2-7a0e50873587', 91, NULL, NULL, NULL, NULL, N'<h2>About Us</h2>
<p>Ecosense Construction was founded in 1946 by my father Cecil. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk Malone</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (897, 1141, N'86a09f70-ab60-47e2-ac18-b5301f63f8e3', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (898, 1141, N'86a09f70-ab60-47e2-ac18-b5301f63f8e3', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (899, 1141, N'86a09f70-ab60-47e2-ac18-b5301f63f8e3', 93, NULL, NULL, NULL, NULL, N'<h4>Ecosense Construction</h4>
<p>is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (900, 1141, N'cb563609-2db5-4204-84ca-865fbaa62dae', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (901, 1141, N'cb563609-2db5-4204-84ca-865fbaa62dae', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (902, 1141, N'cb563609-2db5-4204-84ca-865fbaa62dae', 93, NULL, NULL, NULL, NULL, N'<p><span>Ecosense Construction</span></p>
<p>is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (903, 1141, N'b36019b9-0eb1-4b50-bff1-b07f74f9ee0c', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (904, 1141, N'b36019b9-0eb1-4b50-bff1-b07f74f9ee0c', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (905, 1141, N'b36019b9-0eb1-4b50-bff1-b07f74f9ee0c', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (906, 1155, N'd49cfb26-61a2-440e-a38c-05ea8bcb9566', 91, NULL, NULL, NULL, NULL, N'<h2>About Us</h2>
<p>Ecosense Construction was founded in 1946 by my father Cecil. The leadership reigns were passed on to me in 1997. We hold true to the values established by my father and remain committed to craftsmanship and customer service. We know that our success in providing quality general contracting services has always been dependent on the talent and commitment of our employees. Malone has been fortunate to acquire and retain many talented people who are committed to our company and our clients.</p>
<p>Over the decades, we have grown and changed with the construction and real estate industries in Atlanta. We have succeeded in establishing ourselves as one of the most prominent commercial interiors firms in Atlanta and have utilized our resources to become one of the premiere builders of luxury residences for some of the most influential Atlanta families. We are also growing our company by expanding into the base building construction market. We believe that the attention to detail established over the years in our interiors market will enable us to bring a higher level of service and craftsmanship to the base building market.</p>
<p>Thank you for visiting our website and your interest in Construction Company. Please review the many projects we are proud to have completed. I look forward to getting to know you and work with you on your construction projects.</p>
<p>Sincerely,<br />J. Kirk</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (907, 1141, N'2ace33e8-72fc-4731-a24b-8db8d84cc374', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<h1 class="second_heading">Nationality Recognized</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (908, 1141, N'2ace33e8-72fc-4731-a24b-8db8d84cc374', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (909, 1141, N'2ace33e8-72fc-4731-a24b-8db8d84cc374', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (910, 1141, N'02372a53-b4da-4c3a-85ef-f3eb35fa96a8', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (911, 1141, N'02372a53-b4da-4c3a-85ef-f3eb35fa96a8', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (912, 1141, N'02372a53-b4da-4c3a-85ef-f3eb35fa96a8', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (913, 1141, N'251fb1c2-4dd6-4e12-b2a3-761281154e05', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (914, 1141, N'251fb1c2-4dd6-4e12-b2a3-761281154e05', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (915, 1141, N'251fb1c2-4dd6-4e12-b2a3-761281154e05', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (920, 1141, N'624849ba-6ff4-4eee-a4ae-743768109790', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (921, 1141, N'624849ba-6ff4-4eee-a4ae-743768109790', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (922, 1141, N'624849ba-6ff4-4eee-a4ae-743768109790', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (933, 1141, N'51d8c4e3-c489-4801-83c7-baafa4ff6484', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (934, 1141, N'51d8c4e3-c489-4801-83c7-baafa4ff6484', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (935, 1141, N'51d8c4e3-c489-4801-83c7-baafa4ff6484', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (946, 1141, N'e5ebf3ed-7b4f-4b34-a0c3-27ed71d30c49', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (947, 1141, N'e5ebf3ed-7b4f-4b34-a0c3-27ed71d30c49', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (948, 1141, N'e5ebf3ed-7b4f-4b34-a0c3-27ed71d30c49', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (959, 1141, N'e86a5413-446e-46a2-8f0c-ecbfeef707f4', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (960, 1141, N'e86a5413-446e-46a2-8f0c-ecbfeef707f4', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (961, 1141, N'e86a5413-446e-46a2-8f0c-ecbfeef707f4', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (979, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (980, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (981, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (999, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 118, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1000, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 114, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1001, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 117, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1002, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 112, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1003, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 113, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1004, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 116, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1005, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 111, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1006, 1141, N'a4e5b737-217a-4776-94ca-56d4077e3245', 115, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1007, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1008, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 118, NULL, NULL, NULL, NULL, N'The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1009, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 114, NULL, NULL, NULL, NULL, N'Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1010, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 117, NULL, NULL, NULL, N'WE ARE EXPERIENCED', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1011, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 112, NULL, NULL, NULL, NULL, N'We deliver the best results.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1012, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 113, NULL, NULL, NULL, N'WE DELIVER QUALITY', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1013, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 116, NULL, NULL, NULL, NULL, N'When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1014, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 111, NULL, NULL, NULL, N'WHY CHOOSE US ?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1015, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 115, NULL, NULL, NULL, N'ALWAYS ON TIME', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1016, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 120, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1017, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 124, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1018, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 125, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1019, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 122, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1020, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 121, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1021, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 119, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1022, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 123, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1023, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1024, 1141, N'4aac37b7-0aff-4c80-8117-18b9ca8196db', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1025, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1026, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 118, NULL, NULL, NULL, NULL, N'The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1027, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 114, NULL, NULL, NULL, NULL, N'Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1028, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 134, NULL, NULL, NULL, NULL, N'Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1029, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 117, NULL, NULL, NULL, N'WE ARE EXPERIENCED', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1030, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 112, NULL, NULL, NULL, NULL, N'We deliver the best results.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1031, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 113, NULL, NULL, NULL, N'WE DELIVER QUALITY', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1032, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 116, NULL, NULL, NULL, NULL, N'When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1033, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 133, NULL, NULL, NULL, N' HONEST & DEPENDABLE', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1034, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 111, NULL, NULL, NULL, N'WHY CHOOSE US ?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1035, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 115, NULL, NULL, NULL, N'ALWAYS ON TIME', NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1036, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 120, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1037, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 124, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1038, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 125, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1039, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 122, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1040, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 121, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1041, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 119, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1042, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 123, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1043, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1044, 1141, N'cd4bae77-3255-466a-b5a0-6610f3a9a70b', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1045, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 90, NULL, NULL, NULL, NULL, N'<h3>We are Certified Engineers</h3>
<h1>Construction Services</h1>
<h1 class="second_heading">Creative &amp; Professional</h1>
<h1 class="second_heading">Award Winning Projects</h1>
<p>Construction you can count on. We''ll get it done, like us there are none. We''ll nail your next project, because nobody wants a screw up!</p>
<p><a href="/details" class="btn know_btn">know more</a></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1046, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 118, NULL, NULL, NULL, NULL, N'The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1047, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 114, NULL, NULL, NULL, NULL, N'Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1048, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 134, NULL, NULL, NULL, NULL, N'Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1049, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 117, NULL, NULL, NULL, N'WE ARE EXPERIENCED', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1050, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 112, NULL, NULL, NULL, NULL, N'We deliver the best results.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1051, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 113, NULL, NULL, NULL, N'WE DELIVER QUALITY', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1052, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 116, NULL, NULL, NULL, NULL, N'When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1053, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 133, NULL, NULL, NULL, N' HONEST & DEPENDABLE', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1054, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 111, NULL, NULL, NULL, N'WHY CHOOSE US ?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1055, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 115, NULL, NULL, NULL, N'ALWAYS ON TIME', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1056, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 120, NULL, NULL, NULL, N'CONSTRUCTION MANAGEMENT', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1057, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 124, NULL, NULL, NULL, N'SUSTAINABLE DESIGN', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1058, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 125, NULL, NULL, NULL, NULL, N'Ecosense believes that sustainable design makes sense and it is our responsibility to implement green practices. Sustainable designs can offer a significant operating cost-savings to owners while having a positive impact on the environment. The LEED® rating system is made up of five main credit designations.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1059, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 122, NULL, NULL, NULL, N'DESIGN-BUILD', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1060, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 121, NULL, NULL, NULL, NULL, N'Ecosense Construction Management process exceeds project and
Owner objectives through structured and consistent systems and procedures as applied by a highly-talented Project Team especially selected for each project based on their relevant experience and capabilities.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1061, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 119, NULL, NULL, NULL, N'OUR SERVICES', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1062, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 123, NULL, NULL, NULL, N'Ecosense collaborative approach to Design-Build brings the design firm and the subcontractors together in a focused, team-oriented relationship offering Owners a single source of contact and responsibility. Ecosense has consistently demonstrated its successful Design-Build capabilities.', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1063, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 92, NULL, NULL, NULL, N'Welcome', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1064, 1141, N'a3fa47ee-970e-4f87-87f0-476cd9e731ed', 93, NULL, NULL, NULL, NULL, N'<p><strong>Ecosense Construction</strong> is a leading construction contractor in the MENA region with a portfolio that includes some of the Middle East, India’s and Nepal''s most iconic and sophisticated construction masterpieces</p>
<p>For almost 50 years, we have shaped the skylines of major cities, set the infrastructure for large industrial facilities and built landmark projects in healthcare, hospitality, commercial and residential. We focus on delivering quality while maintaining the highest health and safety standards.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1065, 1146, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', 120, NULL, NULL, NULL, N'CONSTRUCTION MANAGEMENT', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1066, 1146, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', 124, NULL, NULL, NULL, N' SUSTAINABLE DESIGN', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1067, 1146, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', 125, NULL, NULL, NULL, NULL, N'Ecosense believes that sustainable design makes sense and it is our responsibility to implement green practices. Sustainable designs can offer a significant operating cost-savings to owners while having a positive impact on the environment. The LEED® rating system is made up of five main credit designations.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1068, 1146, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', 122, NULL, NULL, NULL, N'DESIGN-BUILD', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1069, 1146, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', 121, NULL, NULL, NULL, NULL, N'Ecosense Construction Management process exceeds project and
Owner objectives through structured and consistent systems and procedures as applied by a highly-talented Project Team especially selected for each project based on their relevant experience and capabilities.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1070, 1146, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', 119, NULL, NULL, NULL, N'OUR SERVICES', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1071, 1146, N'ae0be1bb-a902-4b82-8b0b-37d8590f4efe', 123, NULL, NULL, NULL, N'Ecosense collaborative approach to Design-Build brings the design firm and the subcontractors together in a focused, team-oriented relationship offering Owners a single source of contact and responsibility. Ecosense has consistently demonstrated its successful Design-Build capabilities.', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1072, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 118, NULL, NULL, NULL, NULL, N'Integrity and fairness are the basis of Ecosense Construction business ethics, whether dealing with customers, suppliers or fellow team members. Honesty is not the best policy, but the only policy.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1073, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 114, NULL, NULL, NULL, NULL, N'When Ecosense Construction starts a project they commit themselves to get it done in the timeliest manner as possible. They use the latest tools, techniques, and technology to do the job more quickly.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1074, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 134, NULL, NULL, NULL, NULL, N'Ecosense Construction prides themselves with having a strong dedication to the principle that a quality product is its own best form of advertising. Their employees are the best craftsman in the area. Quality construction continues after the close of the project.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1075, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 117, NULL, NULL, NULL, N'HONEST & DEPENDABLE ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1076, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 112, NULL, NULL, NULL, NULL, N'We deliver the best results.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1077, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 113, NULL, NULL, NULL, N'ALWAYS ON TIME', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1078, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 116, NULL, NULL, NULL, NULL, N'The Owners of Ecosense Construction and their Employees have many years of experience and a proven track record. Their experience ensures that their projects will be done right and with the upmost professionalism.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1079, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 133, NULL, NULL, NULL, N' WE DELIVER QUALITY', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1080, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 111, NULL, NULL, NULL, N'WHY CHOOSE US ?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1081, 1147, N'517b8e6b-2d3d-4304-8376-f13472a275ac', 115, NULL, NULL, NULL, N'WE ARE EXPERIENCED', NULL)
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 0, NULL, NULL, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 0, NULL, NULL, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (27, -96, 1031, 5, N'contents', N'Contents:', 0, 0, NULL, NULL, N'0000001b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (29, -92, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (32, -92, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (33, -92, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (34, -92, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (88, -92, 1044, NULL, N'umbracoMemberPasswordRetrievalAnswer', N'Password Answer', 0, 0, NULL, NULL, N'5336bae4-bc1e-455d-852b-aa56b7c38776')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (89, -92, 1044, NULL, N'umbracoMemberPasswordRetrievalQuestion', N'Password Question', 1, 0, NULL, NULL, N'f08591ab-c4c6-49a5-9a03-b59f14560644')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (90, 1149, 1150, 30, N'introduction', N'Introduction', 0, 0, NULL, N'Enter your introduction text.', N'cebc7a98-d6f7-41f6-8d37-c8a852018b0b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (91, 1153, 1154, 31, N'details', N'Details', 0, 0, NULL, N'Enter your details', N'09f034c5-f65b-4fcb-8ce6-0a50aca6083e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (92, -88, 1140, 32, N'welcomeTitle', N'Welcome Title', 0, 0, NULL, N'Enter welcome title', N'585b87e6-e1c0-4b21-9531-6c7051cb6902')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (93, 1156, 1140, 32, N'welcomeSummary', N'Welcome Summary', 1, 0, NULL, N'Enter Welcome Summary', N'3109007b-b130-4c64-a194-e13d9f9aeaa3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (111, 1173, 1182, 35, N'section2Heading', N'Section 2 Heading', 0, 0, NULL, N'Enter Section 2 Heading', N'dc8fde6d-9af5-4488-a76e-de46d9f4a1e4')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (112, 1174, 1182, 35, N'section2Summary', N'Section 2 Summary', 1, 0, NULL, N'Enter Section 2 Summary', N'9379c4de-d46c-4d65-b854-995955b3aae7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (113, 1177, 1182, 35, N'section2Feature2Heading', N'Section 2 Feature 2 Heading', 4, 0, NULL, N'Enter Section 2 Feature 2 Heading', N'e091b210-5848-4684-9542-ae1dd4d397eb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (114, 1176, 1182, 35, N'section2Feature2Summary', N'Section 2 Feature 2 Summary', 5, 0, NULL, N'Enter Section 2 Feature 2 Summary', N'714265b7-4025-4f48-8565-03d9aa0dfcba')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (115, 1178, 1182, 35, N'section2Feature3Heading', N'Section 2 Feature 3 Heading', 6, 0, NULL, N'Enter Section 2 Feature 3 Heading', N'dcad497d-1e21-4fe1-b710-ee00e47cd96a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (116, 1179, 1182, 35, N'section2Feature3Summary', N'Section 2 Feature 3 Summary', 7, 0, NULL, N'Enter Section 2 Feature 3 Summary', N'50f24754-74f5-4d47-adf3-bb68e267deae')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (117, 1180, 1182, 35, N'section2Feature4Heading', N'Section 2 Feature 4 Heading', 8, 0, NULL, N'Enter Section 2 Feature 4 Heading', N'757eeaf5-6661-4a35-b553-8e914398b273')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (118, 1181, 1182, 35, N'section2Feature4Summary', N'Section 2 Feature 4 Summary', 9, 0, NULL, N'Enter Section 2 Feature 4 Summary', N'2f616a4e-b9ef-489e-ae1c-0309c16e3b39')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (119, 1183, 1190, 36, N'section3Heading', N'Section 3 Heading', 0, 0, NULL, N'Enter Section 3 Heading', N'115e309e-f1bd-4623-88c4-d39ca009c3bc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (120, 1184, 1190, 36, N'section3Feature1Heading', N'Section 3 Feature 1 Heading', 1, 0, NULL, N'Section 3 Feature 1 Heading', N'3a73d159-f937-44a8-8f1a-0333a8681a2e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (121, 1185, 1190, 36, N'section3Feature1Summary', N'Section 3 Feature 1 Summary', 2, 0, NULL, N'Section 3 Feature 1 Summary', N'ffefcdca-b7dd-4fd9-af57-b8e30f265c13')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (122, 1186, 1190, 36, N'section3Feature2Heading', N'Section 3 Feature 2 Heading', 3, 0, NULL, N'Section 3 Feature 2 Heading', N'7a8fba5e-a5bd-4b97-91a6-a4b23db644d7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (123, 1187, 1190, 36, N'section3Feature2Summary', N'Section 3 Feature 2 Summary', 4, 0, NULL, N'Section 3 Feature 2 Summary', N'5ef497a7-e9e1-4545-8d9a-feee5b44764d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (124, 1188, 1190, 36, N'section3Feature3Heading', N'Section 3 Feature 3 Heading', 5, 0, NULL, N'Section 3 Feature 3 Heading', N'6c4668da-ce2c-4c8e-b16a-120171837d10')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (125, 1189, 1190, 36, N'section3Feature3Summary', N'Section 3 Feature 3 Summary', 6, 0, NULL, N'Section 3 Feature 3 Summary', N'8d8c25cf-3d51-4673-830e-8cbcb0f30444')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (133, 1199, 1182, 35, N'section2Feature1Heading', N'Section 2 Feature 1 Heading', 2, 0, NULL, N'Section 2 Feature 1 Heading', N'd7296cbf-2f8a-4b5d-9209-c85004b0c613')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (134, 1200, 1182, 35, N'section2Feature1Summary', N'Section 2 Feature 1 Summary', 3, 0, NULL, N'Section 2 Feature 1 Summary', N'6ad2db20-bd5a-4ac8-83b4-513e99cd1edd')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (5, 1031, N'Contents', 1, N'79995fa2-63ee-453c-a29b-2e66f324cdbe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (30, 1150, N'Content', 0, N'5c9f2a64-a500-46c7-86e0-361207544c07')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (31, 1154, N'Content', 0, N'627b34e4-eb6f-4b7c-beaf-f4d158346f58')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (32, 1140, N'WelcomeSection', 1, N'f5ad2ceb-619e-4b48-9d94-097c7ac0e296')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (35, 1182, N'Section 2', 0, N'eba8e477-6260-4679-b6e4-84f6795df4dc')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (36, 1190, N'Section 3', 0, N'03e2ba46-ca12-4dbe-a36d-fe596dc644ef')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
SET IDENTITY_INSERT [dbo].[cmsTags] ON 

INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (1, N'demo', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (2, N'starter kit', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (3, N'umbraco', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (4, N'Denmark', NULL, N'department')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (5, N'mvp', NULL, N'department')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (6, N'bingo', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (7, N'clothing', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (8, N'cg16', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (9, N'codegarden', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (10, N'United Kingdom', NULL, N'department')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (11, N'dedication', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (12, N'tattoo', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (13, N'great', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (14, N'animals', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (15, N'sports', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (16, N'Netherlands', NULL, N'department')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (17, N'fashion', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (18, N'music', NULL, N'default')
SET IDENTITY_INSERT [dbo].[cmsTags] OFF
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON 

INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (11, 1138, N'ConstructionTemplate', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = null;
}

@* the fun starts here *@

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
 <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>Construction - Free HTML Bootstrap Template</title>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Custom Fonts -->
    <link href="~/custom-font/fonts.css" rel="stylesheet" />
    <!-- Bootstrap -->
    <link href="~/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="~/css/font-awesome.min.css" />
    <!-- Bootsnav -->
    <link rel="stylesheet" href="~/css/bootsnav.css">
    <!-- Fancybox -->
    <link rel="stylesheet" type="text/css" href="~/css/jquery.fancybox.css?v=2.1.5" media="screen" />
    <!-- Custom stylesheet -->
    <link rel="stylesheet" href="~/css/custom.css" />
    <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>

    <!-- Preloader -->

    <div id="loading">
        <div id="loading-center">
            <div id="loading-center-absolute">
                <div class="object"></div>
                <div class="object"></div>
                <div class="object"></div>
                <div class="object"></div>
                <div class="object"></div>
                <div class="object"></div>
                <div class="object"></div>
                <div class="object"></div>
                <div class="object"></div>
                <div class="object"></div>
            </div>
        </div>
    </div>

    <!--End off Preloader -->
    <!-- Header -->
    <header>
        <!-- Top Navbar -->
        <div class="top_nav">
            <div class="container">
                <ul class="list-inline info">
                    <li><a href="#"><span class="fa fa-phone"></span> 1234 - 5678 - 9012</a></li>
                    <li><a href="#"><span class="fa fa-envelope"></span> support@Construct.com</a></li>
                    <li><a href="#"><span class="fa fa-clock-o"></span> Mon - Sat 9:00 - 19:00</a></li>
                </ul>
                <ul class="list-inline social_icon">
                    <li><a href=""><span class="fa fa-facebook"></span></a></li>
                    <li><a href=""><span class="fa fa-twitter"></span></a></li>
                    <li><a href=""><span class="fa fa-behance"></span></a></li>
                    <li><a href=""><span class="fa fa-dribbble"></span></a></li>
                    <li><a href=""><span class="fa fa-linkedin"></span></a></li>
                    <li><a href=""><span class="fa fa-youtube"></span></a></li>
                </ul>
            </div>
        </div><!-- Top Navbar end -->
        <!-- Navbar -->
        <nav class="navbar bootsnav">
            <!-- Top Search -->
            <div class="top-search">
                <div class="container">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-search"></i></span>
                        <input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                    </div>
                </div>
            </div>
        @RenderBody()
            <div class="container">
                <!-- Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                    </ul>
                </div>
                <!-- Header Navigation -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href=""><img class="logo" src="images/logo.png" alt=""></a>
                </div>
                <!-- Navigation -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav menu">
                        <li><a href="">Home</a></li>
                        <li><a href="#about">About Us</a></li>
                        <li><a href="#services">Services</a></li>
                        <li><a href="#portfolio">Portfolio</a></li>
                        <li><a href="#contact_form">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </nav><!-- Navbar end -->
    </header><!-- Header end -->


    <section id="home" class="home">
        <!-- Carousel -->
        <div id="carousel" class="carousel slide" data-ride="carousel">
            <!-- Carousel-inner -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="images/slider_img.jpg" alt="Construction">
                    <div class="overlay">
                        <div class="carousel-caption">
                            <h3>We are Certified Engineers</h3>
                            <h1>Construction Services</h1>
                            <h1 class="second_heading">Creative & Professional</h1>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                            <a class="btn know_btn">know more</a>
                            <a class="btn know_btn">view project</a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="images/slider_img2.jpg" alt="Construction">
                    <div class="overlay">
                        <div class="carousel-caption">
                            <h3>We are Certified Engineers</h3>
                            <h1>Construction Services</h1>
                            <h1 class="second_heading">Creative & Professional</h1>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                            <a class="btn know_btn">know more</a>
                            <a class="btn know_btn">view project</a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="images/slider_img3.jpg" alt="Construction">
                    <div class="overlay">
                        <div class="carousel-caption">
                            <h3>We are Certified Engineers</h3>
                            <h1>Construction Services</h1>
                            <h1 class="second_heading">Creative & Professional</h1>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                            <a class="btn know_btn">know more</a>
                            <a class="btn know_btn">view project</a>
                        </div>
                    </div>
                </div>
            </div><!-- Carousel-inner end -->
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
                <span class="fa fa-angle-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
                <span class="fa fa-angle-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div><!-- Carousel end-->

    </section>


    <!-- About -->
    <section id="about">
        <div class="container about_bg">
            <div class="row">
                <div class="col-lg-7 col-md-6">
                    <div class="about_content">
                        <h2>Welcome to Our Company</h2>
                        <h3>Aliquam lacus purus, auctor malesuada</h3>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                        <p>sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? </p>
                        <a class="btn know_btn">know more</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-lg-offset-1">
                    <div class="about_banner">
                        <img src="images/man.png" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </section><!-- About end -->
    <!-- Why us -->
    <section id="why_us">
        <div class="container text-center">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="head_title">
                        <h2>WHY CHOOSE US?</h2>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="why_us_item">
                        <span class="fa fa-leaf"></span>
                        <h4>We deliver quality</h4>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="why_us_item">
                        <span class="fa fa-futbol-o"></span>
                        <h4>Always on time</h4>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="why_us_item">
                        <span class="fa fa-group"></span>
                        <h4>We are pasionate</h4>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="why_us_item">
                        <span class="fa fa-line-chart"></span>
                        <h4>Professional Services</h4>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni</p>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- Why us end -->
    <!-- Services -->
    <section id="services">
        <div class="container">
            <h2>OUR SERVICES</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="service_item">
                        <img src="images/service_img1.jpg" alt="Our Services" />
                        <h3>CONSTRUCTION MANAGEMENT</h3>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                        <a href="#services" class="btn know_btn">know more</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service_item">
                        <img src="images/service_img2.jpg" alt="Our Services" />
                        <h3>RENOVATION</h3>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                        <a href="#services" class="btn know_btn">know more</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service_item">
                        <img src="images/service_img3.jpg" alt="Our Services" />
                        <h3>ARCHITECTURE</h3>
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                        <a href="#services" class="btn know_btn">know more</a>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- Services end -->
    <!-- Portfolio -->
    <section id="portfolio">
        <div class="container portfolio_area text-center">
            <h2>Made with love</h2>
            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>

            <div id="filters">
                <button class="button is-checked" data-filter="*">Show All</button>
                <button class="button" data-filter=".buildings">Buildings</button>
                <button class="button" data-filter=".interior">Interior Design</button>
                <button class="button" data-filter=".isolation">Isolation</button>
                <button class="button" data-filter=".plumbing">Plumbing</button>
            </div>
            <!-- Portfolio grid -->
            <div class="grid">
                <div class="grid-sizer"></div>
                <div class="grid-item grid-item--width2 grid-item--height2 buildings plumbing interior">
                    <img alt="" src="images/highligh_img.jpg">
                    <div class="portfolio_hover_area">
                        <a class="fancybox" href="images/highligh_img.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><span class="fa fa-search"></span></a>
                        <a href="#"><span class="fa fa-link"></span></a>
                    </div>
                </div>

                <div class="grid-item buildings interior isolation">
                    <img alt="" src="images/portfolio1.jpg">
                    <div class="portfolio_hover_area">
                        <a class="fancybox" href="images/portfolio1.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><span class="fa fa-search"></span></a>
                        <a href="#"><span class="fa fa-link"></span></a>
                    </div>
                </div>

                <div class="grid-item interior plumbing isolation">
                    <img alt="" src="images/portfolio2.jpg">
                    <div class="portfolio_hover_area">
                        <a class="fancybox" href="images/portfolio2.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><span class="fa fa-search"></span></a>
                        <a href="#"><span class="fa fa-link"></span></a>
                    </div>
                </div>

                <div class="grid-item isolation buildings">
                    <img alt="" src="images/portfolio3.jpg">
                    <div class="portfolio_hover_area">
                        <a class="fancybox" href="images/portfolio3.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><span class="fa fa-search"></span></a>
                        <a href="#"><span class="fa fa-link"></span></a>
                    </div>
                </div>

                <div class="grid-item plumbing isolation">
                    <img alt="" src="images/portfolio4.jpg">
                    <div class="portfolio_hover_area">
                        <a class="fancybox" href="images/portfolio4.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><span class="fa fa-search"></span></a>
                        <a href="#"><span class="fa fa-link"></span></a>
                    </div>
                </div>
            </div><!-- Portfolio grid end -->
        </div>
    </section><!-- Portfolio end -->
    <!-- Testimonial -->
    <section id="testimonial">
        <div class="container text-center testimonial_area">
            <h2>Customer Reviews</h2>
            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>

            <div class="row">
                <div class="col-md-4">
                    <div class="testimonial_item">
                        <div class="testimonial_content text-left">
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                        </div>
                        <img src="images/testimonial_img1.png" alt="Testimonial" />
                        <p class="worker_name">john smith</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial_item">
                        <div class="testimonial_content">
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                        </div>
                        <img src="images/testimonial_img2.png" alt="Testimonial" />
                        <p class="worker_name">john smith</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial_item">
                        <div class="testimonial_content">
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>
                        </div>
                        <img src="images/testimonial_img1.png" alt="Testimonial" />
                        <p class="worker_name">john smith</p>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- Testimonial end -->
    <!-- Contact form -->
    <section id="contact_form">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>Do you have any questions?</h2>
                    <h2 class="second_heading">Feel free to contact us!</h2>
                </div>
                <form role="form" class="form-inline text-right col-md-6">
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" placeholder="Name">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" id="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" rows="5" id="msg" placeholder="Message"></textarea>
                    </div>
                    <button type="submit" class="btn submit_btn">Submit</button>
                </form>
            </div>
        </div>
    </section><!-- Contact form end -->
    <!-- Footer -->
    <footer>
        <!-- Footer top -->
        <div class="container footer_top">
            <div class="row">
                <div class="col-lg-4 col-sm-7">
                    <div class="footer_item">
                        <h4>About Company</h4>
                        <img class="logo" src="images/logo.png" alt="Construction" />
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem</p>

                        <ul class="list-inline footer_social_icon">
                            <li><a href=""><span class="fa fa-facebook"></span></a></li>
                            <li><a href=""><span class="fa fa-twitter"></span></a></li>
                            <li><a href=""><span class="fa fa-youtube"></span></a></li>
                            <li><a href=""><span class="fa fa-google-plus"></span></a></li>
                            <li><a href=""><span class="fa fa-linkedin"></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-5">
                    <div class="footer_item">
                        <h4>Explore link</h4>
                        <ul class="list-unstyled footer_menu">
                            <li><a href=""><span class="fa fa-play"></span> Our services</a>
                            <li><a href=""><span class="fa fa-play"></span> Meet our team</a>
                            <li><a href=""><span class="fa fa-play"></span> Forum</a>
                            <li><a href=""><span class="fa fa-play"></span> Help center</a>
                            <li><a href=""><span class="fa fa-play"></span> Contact Cekas</a>
                            <li><a href=""><span class="fa fa-play"></span> Privacy Policy</a>
                            <li><a href=""><span class="fa fa-play"></span> Cekas terms</a>
                            <li><a href=""><span class="fa fa-play"></span> Site map</a>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-7">
                    <div class="footer_item">
                        <h4>Latest post</h4>
                        <ul class="list-unstyled post">
                            <li><a href=""><span class="date">20 <small>AUG</small></span>  Luptatum omittantur duo ne mpetus indoctum</a></li>
                            <li><a href=""><span class="date">20 <small>AUG</small></span>  Luptatum omittantur duo ne mpetus indoctum</a></li>
                            <li><a href=""><span class="date">20 <small>AUG</small></span>  Luptatum omittantur duo ne mpetus indoctum</a></li>
                            <li><a href=""><span class="date">20 <small>AUG</small></span>  Luptatum omittantur duo ne mpetus indoctum</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-5">
                    <div class="footer_item">
                        <h4>Contact us</h4>
                        <ul class="list-unstyled footer_contact">
                            <li><a href=""><span class="fa fa-map-marker"></span> 124 New Line, London UK</a></li>
                            <li><a href=""><span class="fa fa-envelope"></span> hello@psdfreebies.com</a></li>
                            <li><a href=""><span class="fa fa-mobile"></span><p>+44 00 00 1234 <br />+44 00 00 1234</p></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div><!-- Footer top end -->
        <!-- Footer bottom -->
        <div class="footer_bottom text-center">
            <p class="wow fadeInRight">
                Made with
                <i class="fa fa-heart"></i>
                by
                <a target="_blank" href="http://bootstrapthemes.co">Bootstrap Themes</a>
                2016. All Rights Reserved
            </p>
        </div><!-- Footer bottom end -->
    </footer><!-- Footer end -->
    <!-- JavaScript -->
    <script src="~/scripts/jquery-1.12.1.min.js"></script>
    <script src="~/scripts/bootstrap.min.js"></script>

    <!-- Bootsnav js -->
    <script src="~/scripts/bootsnav.js"></script>

    <!-- JS Implementing Plugins -->
    <script src="~/scripts/isotope.js"></script>
    <script src="~/scripts/isotope-active.js"></script>
    <script src="~/scripts/jquery.fancybox.js?v=2.1.5"></script>

    <script src="~/scripts/jquery.scrollUp.min.js"></script>

    <script src="~/scripts/main.js"></script>
</body>
</html>	')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (12, 1139, N'Home', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "ConstructionTemplate.cshtml";
}

@* the fun starts here *@

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (13, 1142, N'Services', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "ConstructionTemplate.cshtml";
}

@* the fun starts here *@

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (14, 1143, N'WhyChooseUs', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "ConstructionTemplate.cshtml";
}

@* the fun starts here *@

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (15, 1151, N'Details', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "ConstructionTemplate.cshtml";
}

@* the fun starts here *@

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (16, 1201, N'ContactUs', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "ConstructionTemplate.cshtml";
}

@* the fun starts here *@

')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
SET IDENTITY_INSERT [dbo].[umbracoAudit] ON 

INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A991006ABC6D AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (2, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A991006ABCB3 AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (3, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A991007422B7 AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (4, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A991007422C9 AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (5, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A991008DC01C AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (6, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A991008DC123 AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (7, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A991009EAD08 AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (8, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A991009EADC9 AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (9, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A99100B4E520 AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (10, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A99100B4E6B4 AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (11, 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'::1', CAST(0x0000A99100B4EFE2 AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (12, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A99100D276AF AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (13, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A99100D276BE AS DateTime), 0, N'User "Rabin Maharjan" <rabbz123@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
SET IDENTITY_INSERT [dbo].[umbracoAudit] OFF
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (1, CAST(0x0000A99100652B42 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1097]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1097]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P6072/D12] D8DF1C20D82D47A8A78FB28AA8509490', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2, CAST(0x0000A991006C2B10 AS DateTime), N'[{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1097,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1120,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1116,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1113,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1107,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1098,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1106,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1105,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1104,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1103,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1112,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1102,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1111,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1101,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1110,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1119,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1100,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1109,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1115,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1118,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1099,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1108,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1114,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1117,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1097,1120,1116,1113,1107,1098,1106,1105,1104,1103,1112,1102,1111,1101,1110,1119,1100,1109,1115,1118,1099,1108,1114,1117]","JsonIdCount":24,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 48)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (3, CAST(0x0000A991006C3732 AS DateTime), N'[{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1120,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1119,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1118,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1117,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1116,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1115,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1114,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1113,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1112,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1111,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1110,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1109,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1108,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1107,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1106,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1105,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1104,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1103,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1102,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1101,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1100,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1099,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1098,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1097,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 24)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (4, CAST(0x0000A991006C419E AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1121\",\"Id\":1121,\"Operation\":1},{\"Path\":\"-1,1121,1124\",\"Id\":1124,\"Operation\":1}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (5, CAST(0x0000A991006C47E9 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1122\",\"Id\":1122,\"Operation\":1},{\"Path\":\"-1,1122,1133\",\"Id\":1133,\"Operation\":1},{\"Path\":\"-1,1122,1134\",\"Id\":1134,\"Operation\":1},{\"Path\":\"-1,1122,1135\",\"Id\":1135,\"Operation\":1},{\"Path\":\"-1,1122,1136\",\"Id\":1136,\"Operation\":1},{\"Path\":\"-1,1122,1137\",\"Id\":1137,\"Operation\":1}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (6, CAST(0x0000A991006C4DC2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1123\",\"Id\":1123,\"Operation\":1},{\"Path\":\"-1,1123,1125\",\"Id\":1125,\"Operation\":1},{\"Path\":\"-1,1123,1126\",\"Id\":1126,\"Operation\":1},{\"Path\":\"-1,1123,1127\",\"Id\":1127,\"Operation\":1},{\"Path\":\"-1,1123,1128\",\"Id\":1128,\"Operation\":1},{\"Path\":\"-1,1123,1129\",\"Id\":1129,\"Operation\":1},{\"Path\":\"-1,1123,1130\",\"Id\":1130,\"Operation\":1},{\"Path\":\"-1,1123,1131\",\"Id\":1131,\"Operation\":1},{\"Path\":\"-1,1123,1132\",\"Id\":1132,\"Operation\":1}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (7, CAST(0x0000A991006C635F AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1124,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1121,\"Operation\":2}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (8, CAST(0x0000A991006C638C AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1133,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1134,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1135,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1136,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1137,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1122,\"Operation\":2}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 6)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (9, CAST(0x0000A991006C63D3 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1125,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1126,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1127,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1128,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1129,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1130,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1131,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1132,\"Operation\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":null,\"Id\":1123,\"Operation\":2}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 9)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (10, CAST(0x0000A991006C9F86 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1051,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (11, CAST(0x0000A991006CA3E7 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1052,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (12, CAST(0x0000A991006CA72A AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1053,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (13, CAST(0x0000A991006CAAE4 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1054,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (14, CAST(0x0000A991006CAE2A AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1055,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (15, CAST(0x0000A991006CB181 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1057,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (16, CAST(0x0000A991006CB4EB AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1058,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (17, CAST(0x0000A991006CB93A AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1059,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (18, CAST(0x0000A991006CBC80 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1060,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (19, CAST(0x0000A991006CBF8E AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1056,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (20, CAST(0x0000A991006E4581 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1138]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (21, CAST(0x0000A991006E57AC AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1139]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (22, CAST(0x0000A991006E9B98 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"blog\",\"Id\":1089,\"PropertyTypeIds\":[58,57],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (23, CAST(0x0000A991006EA07D AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"blogpost\",\"Id\":1090,\"PropertyTypeIds\":[59,62,61,60],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (24, CAST(0x0000A991006EA4D2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"contact\",\"Id\":1091,\"PropertyTypeIds\":[65,64,63,66,69,67,68],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (25, CAST(0x0000A991006EA932 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"contentPage\",\"Id\":1092,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (26, CAST(0x0000A991006EAF5D AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1087,\"PropertyTypeIds\":[39,43,41,44,42,40,48,46,45,49,47,50,51,52,53],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (27, CAST(0x0000A991006EB5B9 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"people\",\"Id\":1093,\"PropertyTypeIds\":[70],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (28, CAST(0x0000A991006EBA74 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"person\",\"Id\":1094,\"PropertyTypeIds\":[73,72,71,77,74,76,75],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (29, CAST(0x0000A991006EC09A AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"product\",\"Id\":1095,\"PropertyTypeIds\":[78,79,80,82,83,84,81,85],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (30, CAST(0x0000A991006EC68F AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"products\",\"Id\":1096,\"PropertyTypeIds\":[86,87],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (31, CAST(0x0000A991006ED76C AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"contentBase\",\"Id\":1085,\"PropertyTypeIds\":[36,35],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (32, CAST(0x0000A991006EDB8E AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"feature\",\"Id\":1086,\"PropertyTypeIds\":[37,38],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (33, CAST(0x0000A991006EDFCB AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"navigationBase\",\"Id\":1088,\"PropertyTypeIds\":[55,54,56],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (34, CAST(0x0000A991006EFEE8 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (35, CAST(0x0000A99100750A13 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (36, CAST(0x0000A991007531A7 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (37, CAST(0x0000A99100753556 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (38, CAST(0x0000A99100759FE4 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1139]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (39, CAST(0x0000A9910075A8A9 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1138]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (40, CAST(0x0000A9910075B101 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (41, CAST(0x0000A9910075CE22 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (42, CAST(0x0000A99100760272 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (43, CAST(0x0000A991007610F7 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (44, CAST(0x0000A991007614DA AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D2] A8D245FE327746228F955681A52F6129', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (45, CAST(0x0000A991008E0A42 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1142]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D6] 9B3B8D70BAE040698965F9282C2C35BE', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (46, CAST(0x0000A991008E1BA8 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D6] 9B3B8D70BAE040698965F9282C2C35BE', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (47, CAST(0x0000A991008E5E6D AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"services\",\"Id\":1144,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D6] 9B3B8D70BAE040698965F9282C2C35BE', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (48, CAST(0x0000A991008E727E AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"whyChooseUs\",\"Id\":1145,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D6] 9B3B8D70BAE040698965F9282C2C35BE', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (49, CAST(0x0000A991008EBE31 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D6] 9B3B8D70BAE040698965F9282C2C35BE', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (50, CAST(0x0000A991008F1A65 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1146]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D6] 9B3B8D70BAE040698965F9282C2C35BE', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (51, CAST(0x0000A991008F2839 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D6] 9B3B8D70BAE040698965F9282C2C35BE', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (52, CAST(0x0000A991008F3104 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D6] 9B3B8D70BAE040698965F9282C2C35BE', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (53, CAST(0x0000A991009FFDA0 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"826c1486-8760-43e8-8342-ff80844fc1f4\",\"Id\":1149}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (54, CAST(0x0000A99100A008A5 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"introductionContent\",\"Id\":1150,\"PropertyTypeIds\":[90],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (55, CAST(0x0000A99100A025ED AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (56, CAST(0x0000A99100A0E7CA AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (57, CAST(0x0000A99100A1C61F AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (58, CAST(0x0000A99100A1C841 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (59, CAST(0x0000A99100A26BD7 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (60, CAST(0x0000A99100A27ABB AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (61, CAST(0x0000A99100A285C8 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (62, CAST(0x0000A99100A2D0BB AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (63, CAST(0x0000A99100A2D323 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (64, CAST(0x0000A99100A669EA AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1151]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (65, CAST(0x0000A99100A6AEA8 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"details\",\"Id\":1152,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (66, CAST(0x0000A99100A6F4E3 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"0d95bd84-467e-40b0-bd00-211647ca1161\",\"Id\":1153}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (67, CAST(0x0000A99100A6FA01 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"detailsContent\",\"Id\":1154,\"PropertyTypeIds\":[91],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (68, CAST(0x0000A99100A711D6 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"details\",\"Id\":1152,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (69, CAST(0x0000A99100A79560 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (70, CAST(0x0000A99100A7A313 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"details\",\"Id\":1152,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (71, CAST(0x0000A99100AA5480 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (72, CAST(0x0000A99100AA5CFF AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D7] C9BA8130979B44FE8BDEB64BC779B9DC', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (73, CAST(0x0000A99100B09984 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D8] C94E715C75E34E78AA7EC82A29AC25E2', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (74, CAST(0x0000A99100B0A9D4 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P2516/D8] C94E715C75E34E78AA7EC82A29AC25E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (75, CAST(0x0000A99100B55A7F AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (76, CAST(0x0000A99100B5918A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (77, CAST(0x0000A99100B5D6C0 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (78, CAST(0x0000A99100B61F01 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (79, CAST(0x0000A99100B63C24 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (80, CAST(0x0000A99100B656C1 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (81, CAST(0x0000A99100B6984F AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (82, CAST(0x0000A99100B6A099 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (83, CAST(0x0000A99100B77756 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (84, CAST(0x0000A99100B778C2 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (85, CAST(0x0000A99100B79903 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (86, CAST(0x0000A99100B80CAA AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (87, CAST(0x0000A99100B832E3 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (88, CAST(0x0000A99100B842DA AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (89, CAST(0x0000A99100B8788E AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"935829ae-543a-4d73-8879-34501c9e019c\",\"Id\":1156}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (90, CAST(0x0000A99100B89C7E AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (91, CAST(0x0000A99100B8D41A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (92, CAST(0x0000A99100B8FA97 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (93, CAST(0x0000A99100B8FC34 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (94, CAST(0x0000A99100B926EF AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (95, CAST(0x0000A99100B928F4 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (96, CAST(0x0000A99100B96EFA AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (97, CAST(0x0000A99100B975C4 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (98, CAST(0x0000A99100B99340 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (99, CAST(0x0000A99100B9A0FF AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
GO
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (100, CAST(0x0000A99100B9A259 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (101, CAST(0x0000A99100B9CE93 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1155]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (102, CAST(0x0000A99100BA31A3 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (103, CAST(0x0000A99100BA5888 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (104, CAST(0x0000A99100BAAF96 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (105, CAST(0x0000A99100BAB0B4 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (106, CAST(0x0000A99100BB6F9A AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"bf02b13e-c1b5-4d1d-910a-5adf02074f98\",\"Id\":1157}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (107, CAST(0x0000A99100BB8413 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93,94,95],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (108, CAST(0x0000A99100BBBAB0 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"98dca063-fc54-4893-8467-fc7853691c76\",\"Id\":1158}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (109, CAST(0x0000A99100BBD91A AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"c5ce2c85-60b1-4145-9a6e-28daf2afb703\",\"Id\":1159}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (110, CAST(0x0000A99100BBDF66 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93,94,95,96,97],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (111, CAST(0x0000A99100BCD97E AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (112, CAST(0x0000A99100BCDB95 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (113, CAST(0x0000A99100BDA3A7 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93,94,95,96,97,98],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (114, CAST(0x0000A99100BDCD6B AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"c3580165-cf1c-440e-a031-a7420e686078\",\"Id\":1160}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (115, CAST(0x0000A99100BDE44D AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"a45599fb-0b6b-49b1-94ba-3f40f0229c8d\",\"Id\":1161}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (116, CAST(0x0000A99100BE0CA4 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"1dc39ae2-37fc-469c-b62e-760c2eb6f18e\",\"Id\":1162}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (117, CAST(0x0000A99100BE24F9 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"7c5ca79b-074a-41a6-a23a-e97483d1cbf3\",\"Id\":1163}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (118, CAST(0x0000A99100BE3BF3 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"093aa033-046f-450b-9f28-a65796f68edd\",\"Id\":1164}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (119, CAST(0x0000A99100BE3FBF AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93,94,95,96,97,98,99,100,101,102,103],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (120, CAST(0x0000A99100BF3B6A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (121, CAST(0x0000A99100C0560A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (122, CAST(0x0000A99100C0FD4E AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (123, CAST(0x0000A99100C0FF02 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (124, CAST(0x0000A99100C11FAD AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (125, CAST(0x0000A99100C12139 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (126, CAST(0x0000A99100C1771F AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (127, CAST(0x0000A99100C1A6D2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"15b69ffb-1ea3-4ba8-9845-978f41b6c662\",\"Id\":1165}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (128, CAST(0x0000A99100C1D52F AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"8dcb0361-bed0-4aa8-a34f-1c9c56ad72df\",\"Id\":1166}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (129, CAST(0x0000A99100C1E92D AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"de1d77b0-0dc0-4ae8-9490-e916633405bb\",\"Id\":1167}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (130, CAST(0x0000A99100C1FC2D AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"2d0c3740-5660-4da4-bd42-1dd600df9b34\",\"Id\":1168}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (131, CAST(0x0000A99100C22672 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"149d2119-6ee6-4e5d-9db2-2a3e215d1ed4\",\"Id\":1169}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (132, CAST(0x0000A99100C23895 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"4ccbb5bd-9dd7-4bbd-bdbd-cd8e6f3cabe0\",\"Id\":1170}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (133, CAST(0x0000A99100C24FB5 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"7316a6a7-86ac-430f-b5d2-41aeada76d7f\",\"Id\":1171}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (134, CAST(0x0000A99100C26422 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"ad054e39-af02-47da-b648-1060a6001fbc\",\"Id\":1172}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (135, CAST(0x0000A99100C268C3 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (136, CAST(0x0000A99100C3AFF8 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (137, CAST(0x0000A99100C3EEAA AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (138, CAST(0x0000A99100C44E67 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (139, CAST(0x0000A99100C482FA AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (140, CAST(0x0000A99100C4845E AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (141, CAST(0x0000A99100C50698 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (142, CAST(0x0000A99100C62CCA AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"f9dea5a7-26da-4aef-826f-7dedbcf0d42b\",\"Id\":1173}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (143, CAST(0x0000A99100C64407 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"005f0706-ed61-43ac-a25a-3dfee263f59d\",\"Id\":1174}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (144, CAST(0x0000A99100C66551 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"a1b04119-cd4d-4127-9ce8-65abc4282ef3\",\"Id\":1175}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (145, CAST(0x0000A99100C688C7 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"b1d3c75c-d8e5-47a6-89d4-043579855f1f\",\"Id\":1176}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (146, CAST(0x0000A99100C6AFB8 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"ba152140-2825-4650-ad3f-4665716b7448\",\"Id\":1177}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (147, CAST(0x0000A99100C6D0E8 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"4061fdaa-059d-45b8-ab73-afb51728428d\",\"Id\":1178}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (148, CAST(0x0000A99100C6E998 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"dc3d4941-c955-4b03-b4f6-a80321b8d1b4\",\"Id\":1179}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (149, CAST(0x0000A99100C6FDE2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"50a8d6df-e3cc-4c56-b62c-8ce92ea8dc19\",\"Id\":1180}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (150, CAST(0x0000A99100C7129A AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"b6c0a00d-3130-4977-88f1-a4bedd17753a\",\"Id\":1181}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (151, CAST(0x0000A99100C73453 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"section2Content\",\"Id\":1182,\"PropertyTypeIds\":[111,112,113,114,115,116,117,118],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (152, CAST(0x0000A99100C7F9F3 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (153, CAST(0x0000A99100C805CC AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"section2Content\",\"Id\":1182,\"PropertyTypeIds\":[111,112,113,114,115,116,117,118],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (154, CAST(0x0000A99100C86690 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"33f7197b-50b2-452d-90d4-40158901885d\",\"Id\":1183}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (155, CAST(0x0000A99100C87C16 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"9a0f220c-dcbf-4c56-9c28-b4c93329618d\",\"Id\":1184}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (156, CAST(0x0000A99100C89033 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"4b98f403-f72d-43b9-9145-f2d05694f77b\",\"Id\":1185}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (157, CAST(0x0000A99100C8A862 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"7504aa08-83fa-4dd1-9b90-87a39b7489df\",\"Id\":1186}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (158, CAST(0x0000A99100C8BA48 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"f7958b4c-5c57-4501-910b-19e5d45a38cb\",\"Id\":1187}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (159, CAST(0x0000A99100C8DA3B AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"3110d339-b497-4669-bf7f-71f85701d9e4\",\"Id\":1188}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (160, CAST(0x0000A99100C8F1E4 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"6f3db12b-a49f-4827-a878-5af3c773ee31\",\"Id\":1189}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (161, CAST(0x0000A99100C8FBA2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"section3Content\",\"Id\":1190,\"PropertyTypeIds\":[119,120,121,122,123,124,125],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (162, CAST(0x0000A99100CA019B AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"e79074da-ec79-4971-a263-d19ef1fdb919\",\"Id\":1191}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (163, CAST(0x0000A99100CA1354 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"474a4db5-7de0-4c6d-ba6d-22087758e99b\",\"Id\":1192}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (164, CAST(0x0000A99100CA22A4 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"5772fe5f-f554-41aa-9e65-25705e0f647d\",\"Id\":1193}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (165, CAST(0x0000A99100CA34AE AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"beb10efa-a301-4c73-b2b3-b3e74f6dc2e6\",\"Id\":1194}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (166, CAST(0x0000A99100CA43F5 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"415c6bb2-2257-4987-9ccf-e4352e25df15\",\"Id\":1195}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (167, CAST(0x0000A99100CA5B97 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"aa85fc74-6565-423a-a553-6bf337446af1\",\"Id\":1196}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (168, CAST(0x0000A99100CA71F0 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"45fe6de2-557e-497e-8699-aa6964b842fc\",\"Id\":1197}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (169, CAST(0x0000A99100CA7792 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"section3\",\"Id\":1198,\"PropertyTypeIds\":[126,127,128,129,130,131,132],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (170, CAST(0x0000A99100CA8C21 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"section3\",\"Id\":1198,\"PropertyTypeIds\":[132,129,131,126,128,127,130],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":true,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (171, CAST(0x0000A99100CAEBDE AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93,104,105,106,107,108,109,110],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (172, CAST(0x0000A99100CB3BAD AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (173, CAST(0x0000A99100CB85A4 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (174, CAST(0x0000A99100CBFD56 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (175, CAST(0x0000A99100CC1C51 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"a48ebb97-c25e-49b5-bfd5-d7b58f390d90\",\"Id\":1199}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (176, CAST(0x0000A99100CC2B74 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"4f7cf823-64d8-482c-a444-efb4c67ca701\",\"Id\":1200}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (177, CAST(0x0000A99100CC3DD0 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"section2Content\",\"Id\":1182,\"PropertyTypeIds\":[111,112,133,134,113,114,115,116,117,118],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (178, CAST(0x0000A99100CC6509 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (179, CAST(0x0000A99100CC67DF AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (180, CAST(0x0000A99100CCB69B AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (181, CAST(0x0000A99100CCF2FB AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (182, CAST(0x0000A99100CCF469 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1141]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (183, CAST(0x0000A99100CD1CF2 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"services\",\"Id\":1144,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (184, CAST(0x0000A99100CD2E00 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"whyChooseUs\",\"Id\":1145,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (185, CAST(0x0000A99100CD7839 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"whyChooseUs\",\"Id\":1145,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (186, CAST(0x0000A99100CD8B3A AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"services\",\"Id\":1144,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (187, CAST(0x0000A99100CDE4D0 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1146]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1146]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (188, CAST(0x0000A99100CE401F AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (189, CAST(0x0000A99100CE42D3 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (190, CAST(0x0000A99100D28C38 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1201]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (191, CAST(0x0000A99100D2BD73 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"contactUs\",\"Id\":1202,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (192, CAST(0x0000A99100D2DB28 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (193, CAST(0x0000A99100D3084B AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"home\",\"Id\":1140,\"PropertyTypeIds\":[92,93],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (194, CAST(0x0000A99100D32922 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1203]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (195, CAST(0x0000A99100D32D5E AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1203]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1203]","JsonIdCount":1,"JsonPayload":null}]', N'BHUYU-PC//LM/W3SVC/2/ROOT [P1756/D2] 976569278FE5464EB7256562E7BB1022', 2)
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
SET IDENTITY_INSERT [dbo].[umbracoLock] ON 

INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-331, -1, N'Servers')
SET IDENTITY_INSERT [dbo].[umbracoLock] OFF
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, -1, CAST(0x0000A99100C267D3 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, -1, CAST(0x0000A99100C26903 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, -1, CAST(0x0000A99100C26A23 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, -1, CAST(0x0000A99100C26A54 AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, -1, CAST(0x0000A99100C26A67 AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, -1, CAST(0x0000A99100C26A6A AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, -1, CAST(0x0000A99100C26CAA AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, -1, CAST(0x0000A99100C26E74 AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, -1, CAST(0x0000A99100C27082 AS DateTime), N'Save', N'Bulk Save content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, 1091, CAST(0x0000A99100C270A6 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, 1053, CAST(0x0000A99100C270C9 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (12, 0, 1051, CAST(0x0000A99100C270D5 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (13, 0, 1052, CAST(0x0000A99100C270DB AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (14, 0, 1053, CAST(0x0000A99100C270E1 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (15, 0, 1054, CAST(0x0000A99100C270E6 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (16, 0, 1055, CAST(0x0000A99100C270EA AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (17, 0, 1057, CAST(0x0000A99100C270F0 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (18, 0, 1058, CAST(0x0000A99100C270F4 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (19, 0, 1059, CAST(0x0000A99100C270F9 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (20, 0, 1060, CAST(0x0000A99100C270FE AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (21, 0, 1097, CAST(0x0000A99100C27202 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (22, 0, 1098, CAST(0x0000A99100C2726A AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (23, 0, 0, CAST(0x0000A99100C272E0 AS DateTime), N'New', N'Media ''Design'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (24, 0, 0, CAST(0x0000A99100C272FB AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (25, 0, 0, CAST(0x0000A99100C27339 AS DateTime), N'New', N'Media ''People'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (26, 0, 0, CAST(0x0000A99100C2734E AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (27, 0, 0, CAST(0x0000A99100C27373 AS DateTime), N'New', N'Media ''Products'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (28, 0, 0, CAST(0x0000A99100C27382 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (29, 0, 0, CAST(0x0000A99100C273A9 AS DateTime), N'New', N'Media ''Umbraco Campari Meeting Room'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (30, 0, 0, CAST(0x0000A99100C273C2 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (31, 0, 0, CAST(0x0000A99100C273C9 AS DateTime), N'New', N'Media ''Biker Jacket'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (32, 0, 0, CAST(0x0000A99100C273DE AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (33, 0, 0, CAST(0x0000A99100C273E6 AS DateTime), N'New', N'Media ''Tattoo'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (34, 0, 0, CAST(0x0000A99100C273FC AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (35, 0, 0, CAST(0x0000A99100C27403 AS DateTime), N'New', N'Media ''Unicorn'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (36, 0, 0, CAST(0x0000A99100C27413 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (37, 0, 0, CAST(0x0000A99100C27415 AS DateTime), N'New', N'Media ''Ping Pong Ball'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (38, 0, 0, CAST(0x0000A99100C27430 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (39, 0, 0, CAST(0x0000A99100C27439 AS DateTime), N'New', N'Media ''Bowling Ball'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (40, 0, 0, CAST(0x0000A99100C2744E AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (41, 0, 0, CAST(0x0000A99100C27454 AS DateTime), N'New', N'Media ''Jumpsuit'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (42, 0, 0, CAST(0x0000A99100C2745D AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (43, 0, 0, CAST(0x0000A99100C27460 AS DateTime), N'New', N'Media ''Banjo'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (44, 0, 0, CAST(0x0000A99100C27475 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (45, 0, 0, CAST(0x0000A99100C2747D AS DateTime), N'New', N'Media ''Knitted West'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (46, 0, 0, CAST(0x0000A99100C27492 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (47, 0, 0, CAST(0x0000A99100C27498 AS DateTime), N'New', N'Media ''Jan Skovgaard'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (48, 0, 0, CAST(0x0000A99100C274A5 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (49, 0, 0, CAST(0x0000A99100C274A8 AS DateTime), N'New', N'Media ''Matt Brailsford'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (50, 0, 0, CAST(0x0000A99100C274AE AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (51, 0, 0, CAST(0x0000A99100C274B5 AS DateTime), N'New', N'Media ''Lee Kelleher'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (52, 0, 0, CAST(0x0000A99100C274CE AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (53, 0, 0, CAST(0x0000A99100C274D4 AS DateTime), N'New', N'Media ''Jeavon Leopold'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (54, 0, 0, CAST(0x0000A99100C274E6 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (55, 0, 0, CAST(0x0000A99100C274EB AS DateTime), N'New', N'Media ''Jeroen Breuer'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (56, 0, 0, CAST(0x0000A99100C274F6 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (57, 0, 1118, CAST(0x0000A99100C27552 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (58, 0, 1113, CAST(0x0000A99100C275B7 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (59, 0, 1097, CAST(0x0000A99100C27979 AS DateTime), N'Publish', N'Publish with Children performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (60, 0, 1097, CAST(0x0000A99100C3EA96 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (61, 0, 1097, CAST(0x0000A99100CAEAF4 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (62, 0, 1120, CAST(0x0000A99100CAEAFB AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (63, 0, 1116, CAST(0x0000A99100CAEB00 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (64, 0, 1113, CAST(0x0000A99100CAEB05 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (65, 0, 1107, CAST(0x0000A99100CAEB0A AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (66, 0, 1098, CAST(0x0000A99100CAEB0F AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (67, 0, 1106, CAST(0x0000A99100CAEB16 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (68, 0, 1105, CAST(0x0000A99100CAEB1D AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (69, 0, 1104, CAST(0x0000A99100CAEB22 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (70, 0, 1103, CAST(0x0000A99100CAEB26 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (71, 0, 1112, CAST(0x0000A99100CAEB2B AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (72, 0, 1102, CAST(0x0000A99100CAEB30 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (73, 0, 1111, CAST(0x0000A99100CAEB35 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (74, 0, 1101, CAST(0x0000A99100CAEB3A AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (75, 0, 1110, CAST(0x0000A99100CAEB3E AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (76, 0, 1119, CAST(0x0000A99100CAEB42 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (77, 0, 1100, CAST(0x0000A99100CAEB47 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (78, 0, 1109, CAST(0x0000A99100CAEB4B AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (79, 0, 1115, CAST(0x0000A99100CAEB50 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (80, 0, 1118, CAST(0x0000A99100CAEB58 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (81, 0, 1099, CAST(0x0000A99100CAEB5C AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (82, 0, 1108, CAST(0x0000A99100CAEB60 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (83, 0, 1114, CAST(0x0000A99100CAEB6F AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (84, 0, 1117, CAST(0x0000A99100CAEB73 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (85, 0, 1097, CAST(0x0000A99100CAEBDB AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (86, 0, 1097, CAST(0x0000A99100CAEC6A AS DateTime), N'Delete', N'Trashed content with Id: 1097 related to original parent content with Id: -1')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (87, 0, 1120, CAST(0x0000A99100CAEC6B AS DateTime), N'Delete', N'Trashed content with Id: 1120 related to original parent content with Id: 1097')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (88, 0, 1116, CAST(0x0000A99100CAEC6D AS DateTime), N'Delete', N'Trashed content with Id: 1116 related to original parent content with Id: 1097')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (89, 0, 1113, CAST(0x0000A99100CAEC6E AS DateTime), N'Delete', N'Trashed content with Id: 1113 related to original parent content with Id: 1097')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (90, 0, 1107, CAST(0x0000A99100CAEC73 AS DateTime), N'Delete', N'Trashed content with Id: 1107 related to original parent content with Id: 1097')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (91, 0, 1098, CAST(0x0000A99100CAEC75 AS DateTime), N'Delete', N'Trashed content with Id: 1098 related to original parent content with Id: 1097')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (92, 0, 1106, CAST(0x0000A99100CAEC76 AS DateTime), N'Delete', N'Trashed content with Id: 1106 related to original parent content with Id: 1098')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (93, 0, 1105, CAST(0x0000A99100CAEC77 AS DateTime), N'Delete', N'Trashed content with Id: 1105 related to original parent content with Id: 1098')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (94, 0, 1104, CAST(0x0000A99100CAEC78 AS DateTime), N'Delete', N'Trashed content with Id: 1104 related to original parent content with Id: 1098')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (95, 0, 1103, CAST(0x0000A99100CAEC79 AS DateTime), N'Delete', N'Trashed content with Id: 1103 related to original parent content with Id: 1098')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (96, 0, 1112, CAST(0x0000A99100CAEC7B AS DateTime), N'Delete', N'Trashed content with Id: 1112 related to original parent content with Id: 1107')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (97, 0, 1102, CAST(0x0000A99100CAEC7C AS DateTime), N'Delete', N'Trashed content with Id: 1102 related to original parent content with Id: 1098')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (98, 0, 1111, CAST(0x0000A99100CAEC7D AS DateTime), N'Delete', N'Trashed content with Id: 1111 related to original parent content with Id: 1107')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (99, 0, 1101, CAST(0x0000A99100CAEC7E AS DateTime), N'Delete', N'Trashed content with Id: 1101 related to original parent content with Id: 1098')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (100, 0, 1110, CAST(0x0000A99100CAEC7F AS DateTime), N'Delete', N'Trashed content with Id: 1110 related to original parent content with Id: 1107')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (101, 0, 1119, CAST(0x0000A99100CAEC81 AS DateTime), N'Delete', N'Trashed content with Id: 1119 related to original parent content with Id: 1116')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (102, 0, 1100, CAST(0x0000A99100CAEC81 AS DateTime), N'Delete', N'Trashed content with Id: 1100 related to original parent content with Id: 1098')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (103, 0, 1109, CAST(0x0000A99100CAEC82 AS DateTime), N'Delete', N'Trashed content with Id: 1109 related to original parent content with Id: 1107')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (104, 0, 1115, CAST(0x0000A99100CAEC84 AS DateTime), N'Delete', N'Trashed content with Id: 1115 related to original parent content with Id: 1113')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (105, 0, 1118, CAST(0x0000A99100CAEC85 AS DateTime), N'Delete', N'Trashed content with Id: 1118 related to original parent content with Id: 1116')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (106, 0, 1099, CAST(0x0000A99100CAEC86 AS DateTime), N'Delete', N'Trashed content with Id: 1099 related to original parent content with Id: 1098')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (107, 0, 1108, CAST(0x0000A99100CAEC87 AS DateTime), N'Delete', N'Trashed content with Id: 1108 related to original parent content with Id: 1107')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (108, 0, 1114, CAST(0x0000A99100CAEC88 AS DateTime), N'Delete', N'Trashed content with Id: 1114 related to original parent content with Id: 1113')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (109, 0, 1117, CAST(0x0000A99100CAEC8A AS DateTime), N'Delete', N'Trashed content with Id: 1117 related to original parent content with Id: 1116')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (110, 0, 1120, CAST(0x0000A99100CAF788 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (111, 0, 1119, CAST(0x0000A99100CAF794 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (112, 0, 1118, CAST(0x0000A99100CAF798 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (113, 0, 1117, CAST(0x0000A99100CAF79C AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (114, 0, 1116, CAST(0x0000A99100CAF79F AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (115, 0, 1115, CAST(0x0000A99100CAF7A5 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (116, 0, 1114, CAST(0x0000A99100CAF7A9 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (117, 0, 1113, CAST(0x0000A99100CAF7AB AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (118, 0, 1112, CAST(0x0000A99100CAF7B4 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (119, 0, 1111, CAST(0x0000A99100CAF7B8 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (120, 0, 1110, CAST(0x0000A99100CAF7BC AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (121, 0, 1109, CAST(0x0000A99100CAF7C0 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (122, 0, 1108, CAST(0x0000A99100CAF7C4 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (123, 0, 1107, CAST(0x0000A99100CAF7E9 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (124, 0, 1106, CAST(0x0000A99100CAF7FF AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (125, 0, 1105, CAST(0x0000A99100CAF828 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (126, 0, 1104, CAST(0x0000A99100CAF830 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (127, 0, 1103, CAST(0x0000A99100CAF84B AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (128, 0, 1102, CAST(0x0000A99100CAF851 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (129, 0, 1101, CAST(0x0000A99100CAF855 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (130, 0, 1100, CAST(0x0000A99100CAF85A AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (131, 0, 1099, CAST(0x0000A99100CAF877 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (132, 0, 1098, CAST(0x0000A99100CAF899 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (133, 0, 1097, CAST(0x0000A99100CAF89C AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (134, 0, 1121, CAST(0x0000A99100CB035C AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (135, 0, 1121, CAST(0x0000A99100CB0368 AS DateTime), N'Delete', N'Trashed media with Id: 1121 related to original parent media item with Id: -1')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (136, 0, 1124, CAST(0x0000A99100CB0369 AS DateTime), N'Delete', N'Trashed media with Id: 1124 related to original parent media item with Id: 1121')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (137, 0, 1122, CAST(0x0000A99100CB099B AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (138, 0, 1122, CAST(0x0000A99100CB09A6 AS DateTime), N'Delete', N'Trashed media with Id: 1122 related to original parent media item with Id: -1')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (139, 0, 1133, CAST(0x0000A99100CB09A7 AS DateTime), N'Delete', N'Trashed media with Id: 1133 related to original parent media item with Id: 1122')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (140, 0, 1134, CAST(0x0000A99100CB09A8 AS DateTime), N'Delete', N'Trashed media with Id: 1134 related to original parent media item with Id: 1122')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (141, 0, 1135, CAST(0x0000A99100CB09AA AS DateTime), N'Delete', N'Trashed media with Id: 1135 related to original parent media item with Id: 1122')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (142, 0, 1136, CAST(0x0000A99100CB09AF AS DateTime), N'Delete', N'Trashed media with Id: 1136 related to original parent media item with Id: 1122')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (143, 0, 1137, CAST(0x0000A99100CB09B0 AS DateTime), N'Delete', N'Trashed media with Id: 1137 related to original parent media item with Id: 1122')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (144, 0, 1123, CAST(0x0000A99100CB0F68 AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (145, 0, 1123, CAST(0x0000A99100CB0F77 AS DateTime), N'Delete', N'Trashed media with Id: 1123 related to original parent media item with Id: -1')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (146, 0, 1125, CAST(0x0000A99100CB0F78 AS DateTime), N'Delete', N'Trashed media with Id: 1125 related to original parent media item with Id: 1123')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (147, 0, 1126, CAST(0x0000A99100CB0F7A AS DateTime), N'Delete', N'Trashed media with Id: 1126 related to original parent media item with Id: 1123')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (148, 0, 1127, CAST(0x0000A99100CB0F7B AS DateTime), N'Delete', N'Trashed media with Id: 1127 related to original parent media item with Id: 1123')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (149, 0, 1128, CAST(0x0000A99100CB0F7C AS DateTime), N'Delete', N'Trashed media with Id: 1128 related to original parent media item with Id: 1123')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (150, 0, 1129, CAST(0x0000A99100CB0F84 AS DateTime), N'Delete', N'Trashed media with Id: 1129 related to original parent media item with Id: 1123')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (151, 0, 1130, CAST(0x0000A99100CB0F85 AS DateTime), N'Delete', N'Trashed media with Id: 1130 related to original parent media item with Id: 1123')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (152, 0, 1131, CAST(0x0000A99100CB0F86 AS DateTime), N'Delete', N'Trashed media with Id: 1131 related to original parent media item with Id: 1123')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (153, 0, 1132, CAST(0x0000A99100CB0F87 AS DateTime), N'Delete', N'Trashed media with Id: 1132 related to original parent media item with Id: 1123')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (154, 0, 1124, CAST(0x0000A99100CB2520 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (155, 0, 1121, CAST(0x0000A99100CB2521 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (156, 0, 1133, CAST(0x0000A99100CB253D AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (157, 0, 1134, CAST(0x0000A99100CB253E AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (158, 0, 1135, CAST(0x0000A99100CB253F AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (159, 0, 1136, CAST(0x0000A99100CB2541 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (160, 0, 1137, CAST(0x0000A99100CB2542 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (161, 0, 1122, CAST(0x0000A99100CB2543 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (162, 0, 1125, CAST(0x0000A99100CB256D AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (163, 0, 1126, CAST(0x0000A99100CB256F AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (164, 0, 1127, CAST(0x0000A99100CB2570 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (165, 0, 1128, CAST(0x0000A99100CB2571 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (166, 0, 1129, CAST(0x0000A99100CB2572 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (167, 0, 1130, CAST(0x0000A99100CB2573 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (168, 0, 1131, CAST(0x0000A99100CB2575 AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (169, 0, 1132, CAST(0x0000A99100CB257E AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (170, 0, 1123, CAST(0x0000A99100CB257E AS DateTime), N'Delete', N'Delete Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (171, 0, 1051, CAST(0x0000A99100CB6153 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (172, 0, 1052, CAST(0x0000A99100CB65B5 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (173, 0, 1053, CAST(0x0000A99100CB68F8 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (174, 0, 1054, CAST(0x0000A99100CB6C81 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (175, 0, 1055, CAST(0x0000A99100CB6FC6 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (176, 0, 1057, CAST(0x0000A99100CB734E AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (177, 0, 1058, CAST(0x0000A99100CB76B9 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (178, 0, 1059, CAST(0x0000A99100CB7B08 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (179, 0, 1060, CAST(0x0000A99100CB7E4E AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (180, 0, 1056, CAST(0x0000A99100CB815C AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (181, 0, 0, CAST(0x0000A99100CD074D AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (182, 0, 0, CAST(0x0000A99100CD196C AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (183, 0, -1, CAST(0x0000A99100CD5D17 AS DateTime), N'Delete', N'Delete Content of Types 1089 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (184, 0, 1089, CAST(0x0000A99100CD5D3A AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (185, 0, -1, CAST(0x0000A99100CD622A AS DateTime), N'Delete', N'Delete Content of Types 1090 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (186, 0, 1090, CAST(0x0000A99100CD622E AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (187, 0, -1, CAST(0x0000A99100CD6686 AS DateTime), N'Delete', N'Delete Content of Types 1091 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (188, 0, 1091, CAST(0x0000A99100CD668A AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (189, 0, -1, CAST(0x0000A99100CD6AE7 AS DateTime), N'Delete', N'Delete Content of Types 1092 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (190, 0, 1092, CAST(0x0000A99100CD6AEB AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (191, 0, -1, CAST(0x0000A99100CD7114 AS DateTime), N'Delete', N'Delete Content of Types 1087 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (192, 0, 1087, CAST(0x0000A99100CD7118 AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (193, 0, -1, CAST(0x0000A99100CD7777 AS DateTime), N'Delete', N'Delete Content of Types 1093 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (194, 0, 1093, CAST(0x0000A99100CD777A AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (195, 0, -1, CAST(0x0000A99100CD7C24 AS DateTime), N'Delete', N'Delete Content of Types 1094 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (196, 0, 1094, CAST(0x0000A99100CD7C28 AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (197, 0, -1, CAST(0x0000A99100CD8250 AS DateTime), N'Delete', N'Delete Content of Types 1095 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (198, 0, 1095, CAST(0x0000A99100CD8253 AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (199, 0, -1, CAST(0x0000A99100CD8855 AS DateTime), N'Delete', N'Delete Content of Types 1096 performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (200, 0, 1096, CAST(0x0000A99100CD8858 AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (201, 0, -1, CAST(0x0000A99100CD990B AS DateTime), N'Delete', N'Delete Content of Types 1085 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (202, 0, 1085, CAST(0x0000A99100CD990F AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (203, 0, -1, CAST(0x0000A99100CD9D48 AS DateTime), N'Delete', N'Delete Content of Types 1086 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (204, 0, 1086, CAST(0x0000A99100CD9D4B AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (205, 0, -1, CAST(0x0000A99100CDA192 AS DateTime), N'Delete', N'Delete Content of Types 1088 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (206, 0, 1088, CAST(0x0000A99100CDA195 AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (207, 0, 1140, CAST(0x0000A99100CDC0B2 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (208, 0, 1140, CAST(0x0000A99100D3CBDD AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (209, 0, 0, CAST(0x0000A99100D3EEC6 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (210, 0, 1141, CAST(0x0000A99100D3F71E AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (211, 0, 1139, CAST(0x0000A99100D461B2 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (212, 0, 1138, CAST(0x0000A99100D46A78 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (213, 0, 1140, CAST(0x0000A99100D472CB AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (214, 0, 1141, CAST(0x0000A99100D48FDE AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (215, 0, 1140, CAST(0x0000A99100D4C43B AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (216, 0, 1141, CAST(0x0000A99100D4D2B4 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (217, 0, 1141, CAST(0x0000A99100D4D6A0 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (218, 0, 0, CAST(0x0000A99100ECCBD8 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (219, 0, 0, CAST(0x0000A99100ECDD6F AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (220, 0, 1144, CAST(0x0000A99100ED1FFA AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (221, 0, 1145, CAST(0x0000A99100ED343D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (222, 0, 1140, CAST(0x0000A99100ED7FF5 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (223, 0, 0, CAST(0x0000A99100EDDB42 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (224, 0, 0, CAST(0x0000A99100EDE9EF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (225, 0, 1147, CAST(0x0000A99100EDF2B1 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (226, 0, -1, CAST(0x0000A99100EEB26E AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (227, 0, 0, CAST(0x0000A99100FEBEEA AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (228, 0, 1150, CAST(0x0000A99100FEC9F4 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (229, 0, 1140, CAST(0x0000A99100FEE7B5 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (230, 0, 1141, CAST(0x0000A99100FFA80A AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (231, 0, 1141, CAST(0x0000A991010087CC AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (232, 0, 1141, CAST(0x0000A99101008A0A AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (233, 0, 1141, CAST(0x0000A99101012D96 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (234, 0, 1141, CAST(0x0000A99101013C79 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (235, 0, 1141, CAST(0x0000A9910101477C AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (236, 0, 1141, CAST(0x0000A99101019273 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (237, 0, 1141, CAST(0x0000A991010194D5 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (238, 0, 0, CAST(0x0000A99101052BAD AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (239, 0, 1152, CAST(0x0000A99101057062 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (240, 0, 0, CAST(0x0000A9910105B6AE AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (241, 0, 1154, CAST(0x0000A9910105BBB4 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (242, 0, 1152, CAST(0x0000A9910105D39F AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (243, 0, 1140, CAST(0x0000A99101065714 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (244, 0, 1152, CAST(0x0000A991010664DB AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (245, 0, 0, CAST(0x0000A991010915F2 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (246, 0, 1155, CAST(0x0000A99101091EA5 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (247, 0, 1141, CAST(0x0000A991010F5ABF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (248, 0, 1141, CAST(0x0000A991010F6B92 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (249, 0, 1140, CAST(0x0000A99101141C08 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (250, 0, 1141, CAST(0x0000A9910114528C AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (251, 0, 1141, CAST(0x0000A99101149875 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (252, 0, 1155, CAST(0x0000A9910114E0AC AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (253, 0, 1155, CAST(0x0000A9910114FDC5 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (254, 0, 1155, CAST(0x0000A99101151877 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (255, 0, 1155, CAST(0x0000A991011559CA AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (256, 0, 1155, CAST(0x0000A99101156253 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (257, 0, 1141, CAST(0x0000A991011638F3 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (258, 0, 1141, CAST(0x0000A99101163A82 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (259, 0, 1141, CAST(0x0000A99101165ABF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (260, 0, 1141, CAST(0x0000A9910116CE6B AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (261, 0, 1141, CAST(0x0000A9910116F4A3 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (262, 0, 1141, CAST(0x0000A99101170495 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (263, 0, 0, CAST(0x0000A99101173A51 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (264, 0, 1140, CAST(0x0000A99101175E44 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (265, 0, 1141, CAST(0x0000A991011795D5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (266, 0, 1155, CAST(0x0000A9910117BC4B AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (267, 0, 1155, CAST(0x0000A9910117BDEB AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (268, 0, 1141, CAST(0x0000A9910117E8AB AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (269, 0, 1141, CAST(0x0000A9910117EA80 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (270, 0, 1141, CAST(0x0000A991011830A5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (271, 0, 1141, CAST(0x0000A99101183733 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (272, 0, 1141, CAST(0x0000A99101185502 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (273, 0, 1141, CAST(0x0000A991011862B2 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (274, 0, 1141, CAST(0x0000A99101186410 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (275, 0, 1155, CAST(0x0000A9910118904F AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (276, 0, 1141, CAST(0x0000A9910118F358 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (277, 0, 1141, CAST(0x0000A99101191A2C AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (278, 0, 1141, CAST(0x0000A99101197144 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (279, 0, 1141, CAST(0x0000A99101197253 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (280, 0, 0, CAST(0x0000A991011A3149 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (281, 0, 1140, CAST(0x0000A991011A45C3 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (282, 0, 0, CAST(0x0000A991011A7C75 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (283, 0, 0, CAST(0x0000A991011A9AE6 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (284, 0, 1140, CAST(0x0000A991011AA12D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (285, 0, 1141, CAST(0x0000A991011B9B19 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (286, 0, 1141, CAST(0x0000A991011B9D45 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (287, 0, 1140, CAST(0x0000A991011C655A AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (288, 0, 0, CAST(0x0000A991011C8F37 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (289, 0, 0, CAST(0x0000A991011CA617 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (290, 0, 0, CAST(0x0000A991011CCE6F AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (291, 0, 0, CAST(0x0000A991011CE6C6 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (292, 0, 0, CAST(0x0000A991011CFDB1 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (293, 0, 1140, CAST(0x0000A991011D0183 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (294, 0, 1141, CAST(0x0000A991011DFD06 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (295, 0, 1141, CAST(0x0000A991011F176A AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (296, 0, 1141, CAST(0x0000A991011FBF07 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (297, 0, 1141, CAST(0x0000A991011FC074 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (298, 0, 1141, CAST(0x0000A991011FE164 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (299, 0, 1141, CAST(0x0000A991011FE2F5 AS DateTime), N'Save', N'Save Content performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (300, 0, 1141, CAST(0x0000A991012038BE AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (301, 0, 0, CAST(0x0000A9910120689D AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (302, 0, 0, CAST(0x0000A991012096F8 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (303, 0, 0, CAST(0x0000A9910120AAF9 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (304, 0, 0, CAST(0x0000A9910120BDF9 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (305, 0, 0, CAST(0x0000A9910120E83D AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (306, 0, 0, CAST(0x0000A9910120FA5E AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (307, 0, 0, CAST(0x0000A99101211181 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (308, 0, 0, CAST(0x0000A991012125ED AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (309, 0, 1140, CAST(0x0000A99101212A89 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (310, 0, 1141, CAST(0x0000A991012271A7 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (311, 0, 1141, CAST(0x0000A9910122B050 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (312, 0, 1141, CAST(0x0000A99101231014 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (313, 0, 1141, CAST(0x0000A9910123449B AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (314, 0, 1141, CAST(0x0000A99101234613 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (315, 0, 1141, CAST(0x0000A9910123C84B AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (316, 0, 0, CAST(0x0000A9910124EE95 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (317, 0, 0, CAST(0x0000A991012505CF AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (318, 0, 0, CAST(0x0000A9910125271C AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (319, 0, 0, CAST(0x0000A99101254A92 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (320, 0, 0, CAST(0x0000A99101257184 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (321, 0, 0, CAST(0x0000A991012592A4 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (322, 0, 0, CAST(0x0000A9910125AB64 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (323, 0, 0, CAST(0x0000A9910125BFA8 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (324, 0, 0, CAST(0x0000A9910125D465 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (325, 0, 1182, CAST(0x0000A9910125F5F4 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (326, 0, 1141, CAST(0x0000A9910126BB7A AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (327, 0, 1182, CAST(0x0000A9910126C710 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (328, 0, 0, CAST(0x0000A9910127285D AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (329, 0, 0, CAST(0x0000A99101273DD9 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (330, 0, 0, CAST(0x0000A991012751FD AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (331, 0, 0, CAST(0x0000A99101276A28 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (332, 0, 0, CAST(0x0000A99101277C12 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (333, 0, 0, CAST(0x0000A99101279C08 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (334, 0, 0, CAST(0x0000A9910127B3AA AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (335, 0, 1190, CAST(0x0000A9910127BD51 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (336, 0, 0, CAST(0x0000A9910128C363 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (337, 0, 0, CAST(0x0000A9910128D51E AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (338, 0, 0, CAST(0x0000A9910128E46E AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (339, 0, 0, CAST(0x0000A9910128F663 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (340, 0, 0, CAST(0x0000A991012905BE AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (341, 0, 0, CAST(0x0000A99101291D5F AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (342, 0, 0, CAST(0x0000A991012933B7 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (343, 0, 1198, CAST(0x0000A99101293949 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (344, 0, -1, CAST(0x0000A99101294C7B AS DateTime), N'Delete', N'Delete Content of Types 1198 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (345, 0, 1198, CAST(0x0000A99101294D1F AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (346, 0, 1140, CAST(0x0000A9910129ADA6 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (347, 0, 1141, CAST(0x0000A9910129FD63 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (348, 0, 1140, CAST(0x0000A991012A476B AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (349, 0, 1141, CAST(0x0000A991012ABF10 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (350, 0, 0, CAST(0x0000A991012ADE1E AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (351, 0, 0, CAST(0x0000A991012AED3F AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (352, 0, 1182, CAST(0x0000A991012AFF88 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (353, 0, 1141, CAST(0x0000A991012B26BC AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (354, 0, 1141, CAST(0x0000A991012B2989 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (355, 0, 1141, CAST(0x0000A991012B7857 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (356, 0, 1141, CAST(0x0000A991012BB4B3 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (357, 0, 1141, CAST(0x0000A991012BB5F8 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (358, 0, 1144, CAST(0x0000A991012BDEA6 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (359, 0, 1145, CAST(0x0000A991012BEFC3 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (360, 0, 1145, CAST(0x0000A991012C39FC AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (361, 0, 1144, CAST(0x0000A991012C4D02 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (362, 0, 1146, CAST(0x0000A991012CA66C AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (363, 0, 1147, CAST(0x0000A991012D01D5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (364, 0, 1147, CAST(0x0000A991012D0482 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (365, 0, 0, CAST(0x0000A99101314DE7 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (366, 0, 1202, CAST(0x0000A99101317F3C AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (367, 0, 1140, CAST(0x0000A99101319CED AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (368, 0, 1140, CAST(0x0000A9910131CA10 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (369, 0, 0, CAST(0x0000A9910131E8A1 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (370, 0, 1203, CAST(0x0000A9910131EF10 AS DateTime), N'Publish', N'Save and Publish performed by user')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
SET IDENTITY_INSERT [dbo].[umbracoMigration] ON 

INSERT [dbo].[umbracoMigration] ([id], [name], [createDate], [version]) VALUES (1, N'Umbraco', CAST(0x0000A99100C1DDB0 AS DateTime), N'7.12.4')
SET IDENTITY_INSERT [dbo].[umbracoMigration] OFF
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-97, 0, -1, 0, 1, N'-1,-97', 2, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3A9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-96, 0, -1, 0, 1, N'-1,-96', 2, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3A8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-95, 0, -1, 0, 1, N'-1,-95', 2, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3A8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D398 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D399 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D399 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D39A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D39A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D39B AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'Checkbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D39C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'fbaf13a8-4036-41f2-93a3-974f678c312a', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D39C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D39D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D39E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D39F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D39F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3A0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3A5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(0x0000A99100C1D398 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(0x0000A99100C1D397 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(0x0000A99100C1D277 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A99100C1D3A9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A99100C1D3C4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A99100C1D3C4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3C4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1043, 0, -1, 0, 1, N'-1,1043', 2, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3C5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'd59be02f-1df9-4228-aa1e-01917d806cda', N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(0x0000A99100C1D3C5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1046, 0, -1, 0, 1, N'-1,1046', 2, N'fd1e0da5-5606-4862-b679-5d0cf3a52a59', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3C5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 0, -1, 0, 1, N'-1,1047', 2, N'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3C6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, -1, 0, 1, N'-1,1048', 2, N'135d60e0-64d9-49ed-ab08-893c9ba44ae5', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3C6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 0, -1, 0, 1, N'-1,1049', 2, N'9dbbcbbb-2327-434a-b355-af1b84e5010a', N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3C6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, -1, 0, 1, N'-1,1050', 2, N'b4e3535a-1753-47e2-8568-602cf8cfee6f', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C1D3C6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1061, 0, -1, 0, 1, N'-1,1061', 24, N'11ca5aeb-b315-4225-9cec-1130ee28ddea', N'Home - Description - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C26831 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1062, 0, -1, 0, 1, N'-1,1062', 25, N'e449f1bd-2664-4e0d-a7b8-439196b96eda', N'Home - Call To Action Link - Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C26865 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1063, 0, -1, 0, 1, N'-1,1063', 26, N'f5264d17-afc1-4070-a0b6-c0b205890bfe', N'Home - Design - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C2686B AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1064, 0, -1, 0, 1, N'-1,1064', 27, N'1cd1f7c5-f2ed-4aa2-ac7c-fb2ab363a743', N'Content Base - Content - Grid layout', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C2686E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1065, 0, -1, 0, 1, N'-1,1065', 28, N'4d7ef8eb-0e2f-4847-8025-9570aae43544', N'Products - Default Currency - Dropdown list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C26870 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1066, 0, -1, 0, 1, N'-1,1066', 29, N'c63ba300-f879-40e9-86cb-2e9401f64e16', N'Person - Photo - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C26874 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1067, 0, -1, 0, 1, N'-1,1067', 30, N'6cb46f55-a79a-43b9-adf4-324eded44723', N'Contact - Contact Intro - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C26884 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1068, 0, -1, 0, 1, N'-1,1068', 31, N'018e0ec8-d804-4874-a655-91cb72d5efb2', N'Contact - Your Address - Terratype', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C2688F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1069, 0, -1, 0, 1, N'-1,1069', 32, N'dfab9a27-67d3-4dba-ac91-3a70f9faadfe', N'People - Featured People - Multinode Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C2689C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1070, 0, -1, 0, 1, N'-1,1070', 33, N'14f884bf-e8f7-481b-a0ba-88b132ab97e8', N'Home - Color Theme - Radio button list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268A7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1071, 0, -1, 0, 1, N'-1,1071', 34, N'28e0c92d-3547-4346-99c4-8287d8a541b9', N'Home - Font - Radio button list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268AD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1072, 0, -1, 0, 1, N'-1,1072', 35, N'f4084ca6-fc6c-40c7-ab0e-64888d7d869c', N'Home - Content - Grid layout', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268AE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1073, 0, -1, 0, 1, N'-1,1073', 36, N'4ec829ac-b986-4432-bc03-99649a4a552d', N'Blogpost - Categories - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268B0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1074, 0, -1, 0, 1, N'-1,1074', 37, N'71e1e182-da10-4280-aa35-800a8de19a32', N'Employee - Department - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268B2 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1075, 0, -1, 0, 1, N'-1,1075', 38, N'b25cef38-11c1-4b1c-8db6-234bd699621d', N'Navigation Base - Keywords - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268B4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1076, 0, -1, 0, 1, N'-1,1076', 39, N'613731e6-f82e-4e94-8d1c-34253019f03c', N'Product - Category - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268B6 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1077, 0, -1, 0, 1, N'-1,1077', 40, N'2b806d03-d9f7-41a3-8226-4abc870585c4', N'Product - Features - Nested Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268B9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1078, 0, -1, 0, 1, N'-1,1078', 41, N'68e8fef5-9761-426e-b7d4-f4d5435cf41f', N'Product - Price - Decimal', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268C9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1079, 0, -1, 0, 1, N'-1,1079', 42, N'889bac09-6ea1-428e-914e-80f0b0dd9ee9', N'Blog - How many posts should be shown - Slider', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268E4 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1080, 0, -1, 0, 1, N'-1,1080', 43, N'd865637a-829e-47b9-a9ca-b19a0bb4d3ee', N'Products - Featured Products - Multinode Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268F1 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1081, 0, -1, 0, 1, N'-1,1081', 44, N'67758eb3-51c7-4742-9958-97bc66e4e635', N'Product - Photos - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268F8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1082, 0, -1, 0, 1, N'-1,1082', 45, N'ca547f1f-e30a-420a-8e3b-81b661cf0f49', N'List View - products', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268FB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1083, 0, -1, 0, 1, N'-1,1083', 46, N'c535b55f-78dc-48c5-ac18-52f47e6d09af', N'Contact - Pick a Contact Form - Form Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100C268FD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1138, 0, -1, NULL, 1, N'-1,1138', 0, N'827c52e6-57b0-40b8-8ad7-20790d61fe4b', N'ConstructionTemplate', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A99100CD0747 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1139, 0, 1138, NULL, 1, N'-1,1138,1139', 0, N'40a8cc2a-a64f-424c-af9b-88acf79685a8', N'Home', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A99100CD196C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1140, 0, -1, 0, 1, N'-1,1140', 23, N'852f9666-8a1d-4443-a142-3d56b73b60eb', N'Home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A99100CDC0A9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1141, 0, -1, 0, 1, N'-1,1141', 0, N'342d4e10-138d-473e-a234-36799e38909b', N'Home', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A99100D3EEA5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1142, 0, 1138, NULL, 1, N'-1,1138,1142', 0, N'1210d94d-95df-4252-a339-996bec832c04', N'Services', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A99100ECCB0E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1143, 0, 1138, NULL, 1, N'-1,1138,1143', 0, N'7f0a6175-2bd4-4e94-b680-2dbb6d0e9296', N'WhyChooseUs', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A99100ECDD65 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1144, 0, -1, 0, 1, N'-1,1144', 21, N'8beccd1e-ffc1-45d6-b510-7ddaad81c903', N'Services', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A99100ED1F9F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1145, 0, -1, 0, 1, N'-1,1145', 20, N'6527d463-f3d9-45e6-a155-c55838107c51', N'WhyChooseUs', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A99100ED3432 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1146, 0, 1141, 0, 2, N'-1,1141,1146', 0, N'caafa9fb-861a-4694-930c-b86c17a2dd67', N'Services', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A99100EDDAC5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1147, 0, 1141, 0, 2, N'-1,1141,1147', 1, N'5fd32e93-ca45-4b9f-8aa2-23f0c9eb5901', N'WhyChooseUs', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A99100EDE9D8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1148, 0, -1, 0, 1, N'-1,1148', 0, N'48537bc5-5273-429f-b7e7-38a52b7dfbd0', N'Custom Types', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(0x0000A99100FD81D8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1149, 0, -1, 0, 1, N'-1,1149', 47, N'826c1486-8760-43e8-8342-ff80844fc1f4', N'Introduction Content - Introduction - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99100FEBE26 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1150, 0, 1148, 0, 2, N'-1,1148,1150', 0, N'c0a67704-5bfb-4265-86f2-4ebb43e507e6', N'Introduction Content', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A99100FEC9B9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1151, 0, 1138, NULL, 1, N'-1,1138,1151', 0, N'fa6acbdc-2688-4a93-98ed-31e5018508f4', N'Details', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A99101052B70 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1152, 0, -1, 0, 1, N'-1,1152', 8, N'1b2507ec-f0cb-427e-973b-7488f71253a2', N'Details', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A99101057058 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1153, 0, -1, 0, 1, N'-1,1153', 48, N'0d95bd84-467e-40b0-bd00-211647ca1161', N'Details Content - Details - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910105B69E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1154, 0, 1148, 0, 2, N'-1,1148,1154', 1, N'eb15ee88-e154-43db-9b45-608845df7085', N'Details Content', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A9910105BBAA AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1155, 0, 1141, 0, 2, N'-1,1141,1155', 2, N'360fa90e-c7b7-4508-9dd2-ef7073ff429a', N'Details', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A991010915B8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1156, 0, -1, 0, 1, N'-1,1156', 49, N'935829ae-543a-4d73-8879-34501c9e019c', N'Home - Welcome Summary - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101173A1D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1157, 0, -1, 0, 1, N'-1,1157', 50, N'bf02b13e-c1b5-4d1d-910a-5adf02074f98', N'Home - Section 2 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991011A3136 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1158, 0, -1, 0, 1, N'-1,1158', 51, N'98dca063-fc54-4893-8467-fc7853691c76', N'Home - Section 2 Feature 1 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991011A7C66 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1159, 0, -1, 0, 1, N'-1,1159', 52, N'c5ce2c85-60b1-4145-9a6e-28daf2afb703', N'Home - Section 2 Feature 1 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991011A9ADD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1160, 0, -1, 0, 1, N'-1,1160', 53, N'c3580165-cf1c-440e-a031-a7420e686078', N'Home - Feature 2 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991011C8F2E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1161, 0, -1, 0, 1, N'-1,1161', 54, N'a45599fb-0b6b-49b1-94ba-3f40f0229c8d', N'Home - Feature 3 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991011CA600 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1162, 0, -1, 0, 1, N'-1,1162', 55, N'1dc39ae2-37fc-469c-b62e-760c2eb6f18e', N'Home - Feature 3 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991011CCE65 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1163, 0, -1, 0, 1, N'-1,1163', 56, N'7c5ca79b-074a-41a6-a23a-e97483d1cbf3', N'Home - Feature 4 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991011CE6BB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1164, 0, -1, 0, 1, N'-1,1164', 57, N'093aa033-046f-450b-9f28-a65796f68edd', N'Home - Feature 4 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991011CFDA2 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1165, 0, -1, 0, 1, N'-1,1165', 58, N'15b69ffb-1ea3-4ba8-9845-978f41b6c662', N'Home - Section 3 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910120688F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1166, 0, -1, 0, 1, N'-1,1166', 59, N'8dcb0361-bed0-4aa8-a34f-1c9c56ad72df', N'Home - Section 3 Feature 1 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991012096EC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1167, 0, -1, 0, 1, N'-1,1167', 60, N'de1d77b0-0dc0-4ae8-9490-e916633405bb', N'Home - Section 3 Feature 1 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910120AAF0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1168, 0, -1, 0, 1, N'-1,1168', 61, N'2d0c3740-5660-4da4-bd42-1dd600df9b34', N'Home - Section 3 Feature 1 Heading - Textbox (1)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910120BDEF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1169, 0, -1, 0, 1, N'-1,1169', 62, N'149d2119-6ee6-4e5d-9db2-2a3e215d1ed4', N'Home - Section 3 Feature 2 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910120E832 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1170, 0, -1, 0, 1, N'-1,1170', 63, N'4ccbb5bd-9dd7-4bbd-bdbd-cd8e6f3cabe0', N'Home - Section 3 Feature 2 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910120FA4E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1171, 0, -1, 0, 1, N'-1,1171', 64, N'7316a6a7-86ac-430f-b5d2-41aeada76d7f', N'Home - Section 3 Feature 3 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101211177 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1172, 0, -1, 0, 1, N'-1,1172', 65, N'ad054e39-af02-47da-b648-1060a6001fbc', N'Home - Section 3 Feature 3 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991012125DB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1173, 0, -1, 0, 1, N'-1,1173', 66, N'f9dea5a7-26da-4aef-826f-7dedbcf0d42b', N'Section 2 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910124EE73 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1174, 0, -1, 0, 1, N'-1,1174', 67, N'005f0706-ed61-43ac-a25a-3dfee263f59d', N'Section 2 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991012505BC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1175, 0, -1, 0, 1, N'-1,1175', 68, N'a1b04119-cd4d-4127-9ce8-65abc4282ef3', N'Section 2 Feature 1 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101252713 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1176, 0, -1, 0, 1, N'-1,1176', 69, N'b1d3c75c-d8e5-47a6-89d4-043579855f1f', N'Section 2 Feature 2 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101254A89 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1177, 0, -1, 0, 1, N'-1,1177', 70, N'ba152140-2825-4650-ad3f-4665716b7448', N'Section 2 Feature 2 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101257164 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1178, 0, -1, 0, 1, N'-1,1178', 71, N'4061fdaa-059d-45b8-ab73-afb51728428d', N'Section 2 Feature 3 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101259295 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1179, 0, -1, 0, 1, N'-1,1179', 72, N'dc3d4941-c955-4b03-b4f6-a80321b8d1b4', N'Section 2 Feature 3 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910125AB58 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1180, 0, -1, 0, 1, N'-1,1180', 73, N'50a8d6df-e3cc-4c56-b62c-8ce92ea8dc19', N'Section 2 Feature 4 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910125BF7D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1181, 0, -1, 0, 1, N'-1,1181', 74, N'b6c0a00d-3130-4977-88f1-a4bedd17753a', N'Section 2 Feature 4 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910125D457 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1182, 0, 1148, 0, 2, N'-1,1148,1182', 4, N'3ee52efd-dbcc-4e92-a880-305e52e35b60', N'Section 2 Content', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A9910125F572 AS DateTime))
GO
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1183, 0, -1, 0, 1, N'-1,1183', 75, N'33f7197b-50b2-452d-90d4-40158901885d', N'Section 3 Content - Section 3 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101272827 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1184, 0, -1, 0, 1, N'-1,1184', 76, N'9a0f220c-dcbf-4c56-9c28-b4c93329618d', N'Section 3 Content - Section 3 Feature 1 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101273DCC AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1185, 0, -1, 0, 1, N'-1,1185', 77, N'4b98f403-f72d-43b9-9145-f2d05694f77b', N'Section 3 Content - Section 3 Feature 1 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991012751F2 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1186, 0, -1, 0, 1, N'-1,1186', 78, N'7504aa08-83fa-4dd1-9b90-87a39b7489df', N'Section 3 Content - Section 3 Feature 2 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991012769E3 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1187, 0, -1, 0, 1, N'-1,1187', 79, N'f7958b4c-5c57-4501-910b-19e5d45a38cb', N'Section 3 Content - Section 3 Feature 2 Summary - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101277C09 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1188, 0, -1, 0, 1, N'-1,1188', 80, N'3110d339-b497-4669-bf7f-71f85701d9e4', N'Section 3 Content - Section 3 Feature 3 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101279BE9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1189, 0, -1, 0, 1, N'-1,1189', 81, N'6f3db12b-a49f-4827-a878-5af3c773ee31', N'Section 3 Content - Section 3 Feature 3 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910127B396 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1190, 0, 1148, 0, 2, N'-1,1148,1190', 3, N'3075ce03-dc57-47d8-bf4b-fb3e7fd3704f', N'Section 3 Content', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A9910127BD40 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1191, 0, -1, 0, 1, N'-1,1191', 82, N'e79074da-ec79-4971-a263-d19ef1fdb919', N'Section 3 - Section 3 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910128C356 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1192, 0, -1, 0, 1, N'-1,1192', 83, N'474a4db5-7de0-4c6d-ba6d-22087758e99b', N'Section 3 - Section 3 Feature 1 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910128D514 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1193, 0, -1, 0, 1, N'-1,1193', 84, N'5772fe5f-f554-41aa-9e65-25705e0f647d', N'Section 3 - Section 3 Feature 1 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910128E463 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1194, 0, -1, 0, 1, N'-1,1194', 85, N'beb10efa-a301-4c73-b2b3-b3e74f6dc2e6', N'Section 3 - Section 3 Feature 2 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A9910128F659 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1195, 0, -1, 0, 1, N'-1,1195', 86, N'415c6bb2-2257-4987-9ccf-e4352e25df15', N'Section 3 - Section 3 Feature 2 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991012905AF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1196, 0, -1, 0, 1, N'-1,1196', 87, N'aa85fc74-6565-423a-a553-6bf337446af1', N'Section 3 - Section 3 Feature 3 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A99101291D4C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1197, 0, -1, 0, 1, N'-1,1197', 88, N'45fe6de2-557e-497e-8699-aa6964b842fc', N'Section 3 - Section 3 Feature 3 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991012933AF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1199, 0, -1, 0, 1, N'-1,1199', 89, N'a48ebb97-c25e-49b5-bfd5-d7b58f390d90', N'Section 2 Content - Section 2 Feature 1 Heading - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991012ADE00 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1200, 0, -1, 0, 1, N'-1,1200', 90, N'4f7cf823-64d8-482c-a444-efb4c67ca701', N'Section 2 Content - Section 2 Feature 1 Summary - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A991012AED32 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1201, 0, 1138, NULL, 1, N'-1,1138,1201', 0, N'ef2cc09b-8914-4746-bc97-8c0f3d20e04a', N'ContactUs', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A99101314DAB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1202, 0, -1, 0, 1, N'-1,1202', 4, N'2955804b-02b5-426e-b7ad-02707625ea65', N'ContactUs', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A99101317F32 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1203, 0, 1141, 0, 2, N'-1,1141,1203', 3, N'a7efd5ea-36ec-4a01-843e-b0a15aee4461', N'ContactUs', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A9910131E881 AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
INSERT [dbo].[umbracoRedirectUrl] ([id], [contentKey], [createDateUtc], [url], [urlHash]) VALUES (N'9893d6ce-68e3-4975-a0cd-eb475f6a1ee5', N'360fa90e-c7b7-4508-9dd2-ef7073ff429a', CAST(0x0000A99100B69813 AS DateTime), N'/about-us', N'0af561420591d14d8f459e5c505aa610aeb43e83')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, N'4cbeb612-e689-3563-b755-bf3ede295433', 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, N'0cc3507c-66ab-3091-8913-3d998148e423', 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (3, N'8307994f-faf2-3844-bab9-72d34514edf2', 0, N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'Relate Parent Media Folder On Delete', N'relateParentMediaFolderOnDelete')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:51653/umbraco', N'BHUYU-PC//LM/W3SVC/2/ROOT', CAST(0x0000A99100C2AE33 AS DateTime), CAST(0x0000A991015CC483 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (0, 0, 0, N'Rabin Maharjan', N'rabbz123@gmail.com', N'k6K2toxME/geLQGFifp3AQ==aCqpNrvbIUGMHKCHhrkPqrPuM9uvU2H6fI6DgZM/8YM=', N'{"hashAlgorithm":"HMACSHA256"}', N'rabbz123@gmail.com', N'en-US', N'5068fc3e-c002-4d66-b946-e36becb6eca2', NULL, NULL, CAST(0x0000A99100C1EA19 AS DateTime), CAST(0x0000A99101313876 AS DateTime), NULL, NULL, CAST(0x0000A99100C1DCCD AS DateTime), CAST(0x0000A99101313877 AS DateTime), NULL, N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true}]')
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (0, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (0, 5)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] ON 

INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7ï', CAST(0x0000A99100C1DDCA AS DateTime), CAST(0x0000A99100C1DDCA AS DateTime), N'icon-medal', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (2, N'writer', N'Writers', N'CAH:F', CAST(0x0000A99100C1DDCA AS DateTime), CAST(0x0000A99100C1DDCA AS DateTime), N'icon-edit', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5Fï', CAST(0x0000A99100C1DDCB AS DateTime), CAST(0x0000A99100C1DDCB AS DateTime), N'icon-tools', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (4, N'translator', N'Translators', N'AF', CAST(0x0000A99100C1DDCB AS DateTime), CAST(0x0000A99100C1DDCB AS DateTime), N'icon-globe', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (5, N'sensitiveData', N'Sensitive data', N'', CAST(0x0000A99100C1DDCB AS DateTime), CAST(0x0000A99100C1DDCB AS DateTime), N'icon-lock', -1, -1)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] OFF
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'developer')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'users')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (2, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (4, N'translation')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'a91675e5-b27f-4a36-ac6b-01b811a3eaff', 0, CAST(0x0000A991006ABCEA AS DateTime), CAST(0x0000A991006ED737 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'f7cc5c5b-9d7b-49ba-875e-0e849329e526', 0, CAST(0x0000A991009EB088 AS DateTime), CAST(0x0000A99100B07F1B AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'6204c184-790d-4a28-aec7-2e819a2f6a34', 0, CAST(0x0000A991008DC358 AS DateTime), CAST(0x0000A991008FB93A AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'4d5d71a7-e748-4e3d-9421-2f30f2e9f246', 0, CAST(0x0000A991007422E0 AS DateTime), CAST(0x0000A991007614C8 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'0c904b7e-9ebc-4402-9c14-362a04412677', 0, CAST(0x0000A99100D276D7 AS DateTime), CAST(0x0000A99100D30826 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'81ee6622-d540-4240-ab1e-7448de2e909e', 0, CAST(0x0000A99100B4E94C AS DateTime), CAST(0x0000A99100CE8AB5 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'65dec3c3-c7ec-4f76-a2fe-bdfce1172ac2', 0, CAST(0x0000A9910063CB8C AS DateTime), CAST(0x0000A99100651031 AS DateTime), NULL, N'::1')
/****** Object:  Index [IX_cmsContent]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContent] ON [dbo].[cmsContent]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentType]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_ContentId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentVersion_ContentId] ON [dbo].[cmsContentVersion]
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_VersionId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentVersion_VersionId] ON [dbo].[cmsContentVersion]
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDataType_nodeId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDataType_nodeId] ON [dbo].[cmsDataType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsDictionary_key]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_key] ON [dbo].[cmsDictionary]
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDocument] ON [dbo].[cmsDocument]
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_newest]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_newest] ON [dbo].[cmsDocument]
(
	[newest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_published]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_published] ON [dbo].[cmsDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacro_UniqueId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacro_UniqueId] ON [dbo].[cmsMacro]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacroProperty_UniquePropertyId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [dbo].[cmsMacroProperty]
(
	[uniquePropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMedia]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMedia] ON [dbo].[cmsMedia]
(
	[nodeId] ASC,
	[versionId] ASC,
	[mediaPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMember_LoginName]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsMember_LoginName] ON [dbo].[cmsMember]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_1]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyData_1] ON [dbo].[cmsPropertyData]
(
	[contentNodeId] ASC,
	[versionId] ASC,
	[propertytypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_2]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_2] ON [dbo].[cmsPropertyData]
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_3]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_3] ON [dbo].[cmsPropertyData]
(
	[propertytypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsPropertyTypeAlias]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyTypeAlias] ON [dbo].[cmsPropertyType]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTags]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[tag] ASC,
	[group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTaskType_alias]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTaskType_alias] ON [dbo].[cmsTaskType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoMigration]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMigration] ON [dbo].[umbracoMigration]
(
	[name] ASC,
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeObjectType]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeParentId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeParentId] ON [dbo].[umbracoNode]
(
	[parentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoNodePath]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodePath] ON [dbo].[umbracoNode]
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeTrashed]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeTrashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeUniqueID]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNodeUniqueID] ON [dbo].[umbracoNode]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl]
(
	[urlHash] ASC,
	[contentKey] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelation_parentChildType]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelation_parentChildType] ON [dbo].[umbracoRelation]
(
	[parentId] ASC,
	[childId] ASC,
	[relType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoRelationType_alias]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_alias] ON [dbo].[umbracoRelationType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoRelationType_name]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_name] ON [dbo].[umbracoRelationType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelationType_UniqueId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_UniqueId] ON [dbo].[umbracoRelationType]
(
	[typeUniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_computerName]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupAlias]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupAlias] ON [dbo].[umbracoUserGroup]
(
	[userGroupAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupName]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupName] ON [dbo].[umbracoUserGroup]
(
	[userGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUser2NodePermission_nodeId]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser2NodePermission_nodeId] ON [dbo].[umbracoUserGroup2NodePermission]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserStartNode_startNodeType]    Script Date: 11/7/2018 9:10:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserStartNode_startNodeType] ON [dbo].[umbracoUserStartNode]
(
	[startNodeType] ASC,
	[startNode] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsContentVersion] ADD  CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()) FOR [VersionDate]
GO
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0') FOR [newest]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_isSensitive]  DEFAULT ('0') FOR [isSensitive]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAudit] ADD  CONSTRAINT [DF_umbracoAudit_eventDateUtc]  DEFAULT (getdate()) FOR [eventDateUtc]
GO
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  CONSTRAINT [DF_umbracoCacheInstruction_instructionCount]  DEFAULT ('1') FOR [instructionCount]
GO
ALTER TABLE [dbo].[umbracoConsent] ADD  CONSTRAINT [DF_umbracoConsent_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoMigration] ADD  CONSTRAINT [DF_umbracoMigration_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_cmsContentType_nodeId] FOREIGN KEY([contentType])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentVersion] CHECK CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentXml] CHECK CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDataTypePreValues]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId] FOREIGN KEY([datatypeNodeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDataTypePreValues] CHECK CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMedia]  WITH CHECK ADD  CONSTRAINT [FK_cmsMedia_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMedia] CHECK CONSTRAINT [FK_cmsMedia_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMedia]  WITH CHECK ADD  CONSTRAINT [FK_cmsMedia_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMedia] CHECK CONSTRAINT [FK_cmsMedia_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId] FOREIGN KEY([versionId])
REFERENCES [dbo].[cmsContentVersion] ([VersionId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY([ParentId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_cmsTags]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueID])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
GO
USE [master]
GO
ALTER DATABASE [Construction] SET  READ_WRITE 
GO
