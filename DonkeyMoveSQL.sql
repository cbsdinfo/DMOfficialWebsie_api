USE [donkeymoveDB]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[AppSecret] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Icon] [nvarchar](255) NULL,
	[Disable] [bit] NOT NULL,
	[CreateTime] [date] NOT NULL,
	[CreateUser] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuilderTable]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuilderTable](
	[Id] [nvarchar](50) NOT NULL,
	[TableName] [nvarchar](200) NOT NULL,
	[Comment] [nvarchar](500) NULL,
	[DetailTableName] [nvarchar](255) NULL,
	[DetailComment] [nvarchar](500) NULL,
	[ClassName] [nvarchar](100) NOT NULL,
	[Namespace] [nvarchar](100) NULL,
	[ModuleCode] [nvarchar](255) NULL,
	[ModuleName] [nvarchar](300) NULL,
	[Folder] [nvarchar](300) NULL,
	[Options] [nvarchar](1000) NULL,
	[TypeId] [nvarchar](50) NULL,
	[TypeName] [nvarchar](20) NULL,
	[ForeignKey] [nvarchar](50) NULL,
	[IsDynamicHeader] [bit] NULL,
	[ParentTableId] [nvarchar](50) NULL,
	[CreateTime] [datetime2](0) NOT NULL,
	[CreateUserId] [nvarchar](50) NULL,
	[CreateUserName] [nvarchar](50) NULL,
	[UpdateTime] [datetime2](0) NULL,
	[UpdateUserId] [nvarchar](50) NULL,
	[UpdateUserName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuilderTableColumn]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuilderTableColumn](
	[Id] [nvarchar](50) NOT NULL,
	[TableId] [nvarchar](50) NOT NULL,
	[TableName] [nvarchar](255) NULL,
	[ColumnName] [nvarchar](200) NULL,
	[Comment] [nvarchar](500) NULL,
	[ColumnType] [nvarchar](100) NULL,
	[EntityType] [nvarchar](500) NULL,
	[EntityName] [nvarchar](200) NULL,
	[IsKey] [bit] NOT NULL,
	[IsIncrement] [bit] NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[IsInsert] [bit] NOT NULL,
	[IsEdit] [bit] NOT NULL,
	[IsList] [bit] NOT NULL,
	[IsQuery] [bit] NOT NULL,
	[QueryType] [nvarchar](200) NULL,
	[HtmlType] [nvarchar](200) NULL,
	[EditType] [nvarchar](200) NULL,
	[Sort] [int] NOT NULL,
	[CreateTime] [datetime2](0) NOT NULL,
	[CreateUserId] [nvarchar](50) NULL,
	[UpdateTime] [datetime2](0) NULL,
	[UpdateUserId] [nvarchar](50) NULL,
	[EditRow] [int] NULL,
	[EditCol] [int] NULL,
	[UpdateUserName] [nvarchar](50) NULL,
	[CreateUserName] [nvarchar](50) NULL,
	[MaxLength] [int] NULL,
	[DataSource] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[DtCode] [nvarchar](50) NOT NULL,
	[DtValue] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[TypeId] [nvarchar](50) NULL,
	[TypeName] [nvarchar](50) NULL,
	[Enable] [bit] NOT NULL,
	[SortNo] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUserId] [nvarchar](50) NOT NULL,
	[CreateUserName] [nvarchar](200) NOT NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateUserId] [nvarchar](50) NULL,
	[UpdateUserName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryType]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryType](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataPrivilegeRule]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataPrivilegeRule](
	[Id] [nvarchar](50) NOT NULL,
	[SourceCode] [nvarchar](50) NOT NULL,
	[SubSourceCode] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NOT NULL,
	[SortNo] [int] NOT NULL,
	[PrivilegeRules] [nvarchar](1000) NOT NULL,
	[Enable] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateUserId] [nvarchar](50) NOT NULL,
	[CreateUserName] [nvarchar](200) NOT NULL,
	[UpdateTime] [datetime2](7) NULL,
	[UpdateUserId] [nvarchar](50) NULL,
	[UpdateUserName] [nvarchar](200) NULL,
 CONSTRAINT [PK__DATAPRIVILEGERULE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlowInstance]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlowInstance](
	[Id] [nvarchar](50) NOT NULL,
	[InstanceSchemeId] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](200) NULL,
	[CustomName] [nvarchar](200) NULL,
	[ActivityId] [nvarchar](50) NULL,
	[ActivityType] [int] NULL,
	[ActivityName] [nvarchar](200) NULL,
	[PreviousId] [nvarchar](50) NULL,
	[SchemeContent] [nvarchar](max) NULL,
	[SchemeId] [nvarchar](50) NULL,
	[DbName] [nvarchar](50) NULL,
	[FrmData] [text] NULL,
	[FrmType] [int] NOT NULL,
	[FrmContentData] [text] NULL,
	[FrmContentParse] [text] NULL,
	[FrmId] [nvarchar](50) NULL,
	[SchemeType] [nvarchar](50) NULL,
	[Disabled] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [nvarchar](50) NULL,
	[CreateUserName] [nvarchar](50) NULL,
	[FlowLevel] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[IsFinish] [int] NOT NULL,
	[MakerList] [nvarchar](1000) NULL,
	[OrgId] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlowInstanceOperationHistory]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlowInstanceOperationHistory](
	[Id] [nvarchar](50) NOT NULL,
	[InstanceId] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](200) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [nvarchar](50) NULL,
	[CreateUserName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlowInstanceTransitionHistory]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlowInstanceTransitionHistory](
	[Id] [nvarchar](50) NOT NULL,
	[InstanceId] [nvarchar](50) NOT NULL,
	[FromNodeId] [nvarchar](50) NULL,
	[FromNodeType] [int] NULL,
	[FromNodeName] [nvarchar](200) NULL,
	[ToNodeId] [nvarchar](50) NULL,
	[ToNodeType] [int] NULL,
	[ToNodeName] [nvarchar](200) NULL,
	[TransitionSate] [int] NOT NULL,
	[IsFinish] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [nvarchar](50) NULL,
	[CreateUserName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlowScheme]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlowScheme](
	[Id] [nvarchar](50) NOT NULL,
	[SchemeCode] [nvarchar](50) NULL,
	[SchemeName] [nvarchar](200) NULL,
	[SchemeType] [nvarchar](50) NULL,
	[SchemeVersion] [nvarchar](50) NULL,
	[SchemeCanUser] [nvarchar](max) NULL,
	[SchemeContent] [nvarchar](max) NULL,
	[FrmId] [nvarchar](50) NULL,
	[FrmType] [int] NOT NULL,
	[AuthorizeType] [int] NOT NULL,
	[SortCode] [int] NOT NULL,
	[DeleteMark] [int] NOT NULL,
	[Disabled] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [nvarchar](50) NULL,
	[CreateUserName] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [nvarchar](50) NULL,
	[ModifyUserName] [nvarchar](50) NULL,
	[OrgId] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Form]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[FrmType] [int] NOT NULL,
	[WebId] [nvarchar](200) NULL,
	[Fields] [int] NOT NULL,
	[ContentData] [text] NULL,
	[ContentParse] [text] NULL,
	[Content] [text] NULL,
	[SortCode] [int] NOT NULL,
	[DeleteMark] [int] NOT NULL,
	[DbName] [nvarchar](50) NULL,
	[Disabled] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [nvarchar](50) NULL,
	[CreateUserName] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [nvarchar](50) NULL,
	[ModifyUserName] [nvarchar](50) NULL,
	[OrgId] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[Id] [nvarchar](50) NOT NULL,
	[CascadeId] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Url] [nvarchar](255) NOT NULL,
	[HotKey] [nvarchar](255) NOT NULL,
	[IsLeaf] [bit] NOT NULL,
	[IsAutoExpand] [bit] NOT NULL,
	[IconName] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[ParentName] [nvarchar](255) NOT NULL,
	[Vector] [nvarchar](255) NOT NULL,
	[SortNo] [int] NOT NULL,
	[ParentId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[IsSys] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleElement]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleElement](
	[Id] [nvarchar](50) NOT NULL,
	[DomId] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Attr] [nvarchar](500) NOT NULL,
	[Script] [nvarchar](500) NOT NULL,
	[Icon] [nvarchar](255) NOT NULL,
	[Class] [nvarchar](255) NOT NULL,
	[Remark] [nvarchar](200) NOT NULL,
	[Sort] [int] NOT NULL,
	[ModuleId] [nvarchar](50) NOT NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpenJob]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpenJob](
	[Id] [nvarchar](50) NOT NULL,
	[JobName] [nvarchar](200) NOT NULL,
	[RunCount] [int] NOT NULL,
	[ErrorCount] [int] NOT NULL,
	[NextRunTime] [datetime] NULL,
	[LastRunTime] [datetime] NULL,
	[LastErrorTime] [datetime] NULL,
	[JobType] [int] NOT NULL,
	[JobCall] [nvarchar](500) NOT NULL,
	[JobCallParams] [nvarchar](500) NULL,
	[Cron] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Remark] [nvarchar](128) NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUserId] [nvarchar](50) NOT NULL,
	[CreateUserName] [nvarchar](200) NOT NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateUserId] [nvarchar](50) NULL,
	[UpdateUserName] [nvarchar](200) NULL,
	[OrgId] [nvarchar](50) NULL,
 CONSTRAINT [PK_OPENJOB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Org]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Org](
	[Id] [nvarchar](50) NOT NULL,
	[CascadeId] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[HotKey] [nvarchar](255) NOT NULL,
	[ParentName] [nvarchar](255) NOT NULL,
	[IsLeaf] [bit] NOT NULL,
	[IsAutoExpand] [bit] NOT NULL,
	[IconName] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[BizCode] [nvarchar](255) NOT NULL,
	[CustomCode] [nvarchar](4000) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [int] NOT NULL,
	[SortNo] [int] NOT NULL,
	[ParentId] [nvarchar](50) NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [nvarchar](50) NULL,
 CONSTRAINT [PK_ORG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relevance]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relevance](
	[Id] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[OperateTime] [datetime] NOT NULL,
	[OperatorId] [nvarchar](50) NULL,
	[FirstId] [nvarchar](50) NOT NULL,
	[SecondId] [nvarchar](50) NOT NULL,
	[ThirdId] [nvarchar](50) NULL,
	[ExtendInfo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Relevance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [nvarchar](50) NOT NULL,
	[CascadeId] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[SortNo] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ParentName] [nvarchar](50) NULL,
	[ParentId] [nvarchar](50) NULL,
	[AppId] [nvarchar](50) NULL,
	[AppName] [nvarchar](50) NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [nvarchar](50) NULL,
	[Disable] [bit] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[CreateUserId] [nvarchar](50) NOT NULL,
	[CreateUserName] [nvarchar](200) NOT NULL,
	[UpdateTime] [datetime2](7) NULL,
	[UpdateUserId] [nvarchar](50) NULL,
	[UpdateUserName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [nvarchar](50) NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysLog]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysLog](
	[Id] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](1000) NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [nvarchar](50) NULL,
	[Href] [nvarchar](200) NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [nvarchar](50) NOT NULL,
	[CreateName] [nvarchar](200) NULL,
	[Ip] [nvarchar](20) NULL,
	[Result] [int] NOT NULL,
	[Application] [nvarchar](50) NULL,
 CONSTRAINT [PK_SysLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysMessage]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMessage](
	[Id] [nvarchar](50) NOT NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [nvarchar](50) NULL,
	[FromId] [nvarchar](50) NULL,
	[ToId] [nvarchar](50) NOT NULL,
	[FromName] [nvarchar](50) NULL,
	[ToName] [nvarchar](50) NULL,
	[FromStatus] [int] NOT NULL,
	[ToStatus] [int] NOT NULL,
	[Href] [nvarchar](200) NULL,
	[Title] [nvarchar](200) NULL,
	[Content] [nvarchar](1000) NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [nvarchar](50) NULL,
 CONSTRAINT [PK_SysMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadFile]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadFile](
	[Id] [nvarchar](50) NOT NULL,
	[FileName] [nvarchar](200) NOT NULL,
	[FilePath] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[FileType] [nvarchar](20) NULL,
	[FileSize] [int] NULL,
	[Extension] [nvarchar](20) NULL,
	[Enable] [bit] NOT NULL,
	[SortCode] [int] NOT NULL,
	[DeleteMark] [bit] NOT NULL,
	[CreateUserId] [uniqueidentifier] NULL,
	[CreateUserName] [nvarchar](50) NULL,
	[CreateTime] [datetime] NOT NULL,
	[Thumbnail] [nvarchar](500) NULL,
	[BelongApp] [nvarchar](200) NULL,
	[BelongAppId] [nvarchar](50) NULL,
 CONSTRAINT [PK_UploadFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2022/8/24 下午 05:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Sex] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[BizCode] [nvarchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [nvarchar](50) NULL,
	[TypeName] [nvarchar](20) NULL,
	[TypeId] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BuilderTable] ([Id], [TableName], [Comment], [DetailTableName], [DetailComment], [ClassName], [Namespace], [ModuleCode], [ModuleName], [Folder], [Options], [TypeId], [TypeName], [ForeignKey], [IsDynamicHeader], [ParentTableId], [CreateTime], [CreateUserId], [CreateUserName], [UpdateTime], [UpdateUserId], [UpdateUserName]) VALUES (N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'', N'', N'', N'DataPrivilegeRule', N'donkeymove.Repository.Domain', N'DataPrivilegeRuleApp', N'數據權限', N'', NULL, NULL, NULL, N'', 0, N'', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'超級管理員', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', N'')
GO
INSERT [dbo].[BuilderTable] ([Id], [TableName], [Comment], [DetailTableName], [DetailComment], [ClassName], [Namespace], [ModuleCode], [ModuleName], [Folder], [Options], [TypeId], [TypeName], [ForeignKey], [IsDynamicHeader], [ParentTableId], [CreateTime], [CreateUserId], [CreateUserName], [UpdateTime], [UpdateUserId], [UpdateUserName]) VALUES (N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'', N'', N'', N'Resource', N'donkeymove.Repository.Domain', N'ResourceApp', N'資源管理', N'', NULL, NULL, NULL, N'', 0, N'', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'超級管理員', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', N'')
GO
INSERT [dbo].[BuilderTable] ([Id], [TableName], [Comment], [DetailTableName], [DetailComment], [ClassName], [Namespace], [ModuleCode], [ModuleName], [Folder], [Options], [TypeId], [TypeName], [ForeignKey], [IsDynamicHeader], [ParentTableId], [CreateTime], [CreateUserId], [CreateUserName], [UpdateTime], [UpdateUserId], [UpdateUserName]) VALUES (N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'', N'', N'', N'Category', N'donkeymove.Repository.Domain', N'CategoryApp', N'類別管理', N'', NULL, NULL, NULL, N'', 0, N'', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', N'超級管理員', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', N'')
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'3b02c286-9269-4926-a0df-c5ae9da5d82a', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'Id', N'序號', N'nvarchar', N'string', N'Id', 1, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'044e64c4-1689-4c16-b025-f160100a6a70', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'Name', N'名稱', N'nvarchar', N'string', N'Name', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 510, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'9088388a-a069-47b6-a225-e57e6ba08fb1', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'DtCode', N'代碼', N'nvarchar', N'string', N'DtCode', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'27315b78-f0f2-48e5-8487-75b37138ed30', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'DtValue', N'值', N'nvarchar', N'string', N'DtValue', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'75add47d-2e58-4707-85d3-1b054c692839', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'Description', N'說明', N'nvarchar', N'string', N'Description', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 1000, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'2fa8083d-280f-4ec1-90a1-bc1a7640f722', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'TypeId', N'類別序號', N'nvarchar', N'string', N'TypeId', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'63ffec1a-3cc4-40c3-aa03-e19b8b723f28', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'TypeName', N'類別名稱', N'nvarchar', N'string', N'TypeName', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'09385168-42e8-4907-8c3d-972e83ded096', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'Enable', N'啟用', N'bit', N'bool', N'Enable', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 1, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'07a509ff-d992-47c1-804d-ee91ee220ab7', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'SortNo', N'排序', N'int', N'int', N'SortNo', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 4, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'c626e434-e670-44d5-ba98-cf333e56d531', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'CreateTime', N'創建時間', N'datetime', N'DateTime', N'CreateTime', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 8, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'f245e79c-5165-45ba-a16e-2f1f372ee214', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'CreateUserId', N'創建人序號', N'nvarchar', N'string', N'CreateUserId', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'ca8fbf59-5f23-4d6a-8115-1289d1e35b2b', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'CreateUserName', N'創建人名稱', N'nvarchar', N'string', N'CreateUserName', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 400, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'5c4b52ff-e064-451b-986a-e93f262cab44', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'UpdateTime', N'修改時間', N'datetime', N'DateTime', N'UpdateTime', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 8, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'36d47e26-b6ae-4cff-9796-0b637e73e21e', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'UpdateUserId', N'修改人序號', N'nvarchar', N'string', N'UpdateUserId', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'3e06ae85-8630-406f-980b-98022b7772ae', N'4f7b886c-61f1-4c0b-9469-0532dd21aade', N'Category', N'UpdateUserName', N'修改人名稱', N'nvarchar', N'string', N'UpdateUserName', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T13:04:40.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 400, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'f024c9d9-d093-46cd-a946-847b1cd0dcf7', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'Id', N'數據ID', N'nvarchar', N'string', N'Id', 1, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'04c1a5dc-bfd8-4435-89e8-27883779264c', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'SourceCode', N'資源標識（模塊編號）', N'nvarchar', N'string', N'SourceCode', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'5ffb1abb-de7c-4308-9c5e-cf7eb81cb7fb', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'SortNo', N'排序號', N'int', N'int', N'SortNo', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 4, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'041f79e2-c68c-4c00-bad7-f628cc1d03cb', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'Enable', N'是否可用', N'bit', N'bool', N'Enable', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 1, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'a4fcfb43-a7d6-4545-b5b7-575757acc39b', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'UpdateTime', N'最後更新時間', N'datetime2', N'string', N'UpdateTime', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 8, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'283e2c36-d309-483a-b7b6-75c172e38fc2', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'CreateUserName', N'創建人', N'nvarchar', N'string', N'CreateUserName', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 400, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'696bc70c-6831-4d04-af9f-91f91c600815', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'SubSourceCode', N'二級資源標識', N'nvarchar', N'string', N'SubSourceCode', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'661f2506-5732-47e6-b2e3-ecd4a61387d5', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'Description', N'權限描述', N'nvarchar', N'string', N'Description', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 510, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'7b577464-714c-45ae-9d3e-fca52f6b0ac2', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'PrivilegeRules', N'權限規則', N'nvarchar', N'string', N'PrivilegeRules', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 2000, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'baaac706-6f54-454b-8933-8aa573befabc', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'CreateTime', N'創建時間', N'datetime2', N'string', N'CreateTime', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 8, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'9cf665cd-a5f3-49ef-8219-217473c32b62', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'CreateUserId', N'創建人ID', N'nvarchar', N'string', N'CreateUserId', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'2ae67e79-161b-4060-ac02-8ef204cb0739', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'CreateUserName', N'創建人', N'nvarchar', N'string', N'CreateUserName', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 400, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'fc898a62-003b-415b-ba44-8b2c3d9e2b7d', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'UpdateTime', N'最後更新時間', N'datetime2', N'string', N'UpdateTime', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 8, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'addfb33d-1b01-4787-b89b-e8b8cb32e11a', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'UpdateUserId', N'最後更新人ID', N'nvarchar', N'string', N'UpdateUserId', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'00ab21df-a39a-4be4-a38c-82a8e5311ee3', N'2e681352-7be7-45ad-9a10-1bb7be41bf2a', N'DataPrivilegeRule', N'UpdateUserName', N'最後更新人', N'nvarchar', N'string', N'UpdateUserName', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:54:58.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 400, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'5f34000d-8731-4b5e-ad86-a3cae494eafe', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'CreateUserId', N'創建人ID', N'nvarchar', N'string', N'CreateUserId', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'b8931f63-1f09-4700-bd69-878d9efeb854', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'CreateTime', N'創建時間', N'datetime2', N'string', N'CreateTime', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 8, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'3337f1d9-83d8-422d-b7a7-39c60574a609', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'Disable', N'是否可用', N'bit', N'bool', N'Disable', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 1, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'0b7ac7a9-5910-488a-b684-29196ecb3821', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'TypeId', N'分類ID', N'nvarchar', N'string', N'TypeId', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'25cda2bd-1201-45b1-9e5b-71105b3c7a5c', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'TypeName', N'分類名稱', N'nvarchar', N'string', N'TypeName', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 40, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'7e06bfc0-6094-43ba-9156-624f25f526ca', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'UpdateUserId', N'最後更新人ID', N'nvarchar', N'string', N'UpdateUserId', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'fb204ce8-ab67-431f-8d39-3c7e9d2b8e33', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'AppName', N'所屬應用名稱', N'nvarchar', N'string', N'AppName', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'4115905a-0305-4bf1-bb25-b72e251e1fd7', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'ParentId', N'父節點流ID', N'nvarchar', N'string', N'ParentId', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'c075c0a7-71f7-4509-90c1-eaa51dace40c', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'ParentName', N'父節點名稱', N'nvarchar', N'string', N'ParentName', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'54230c19-e3f1-496d-ae9d-57dcc728279c', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'Description', N'描述', N'nvarchar', N'string', N'Description', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 1000, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'f4292df4-7964-4a1e-901c-00434a1b6e43', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'SortNo', N'排序號', N'int', N'int', N'SortNo', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 4, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'49dc392d-3d6f-4a2f-9c2f-5d379db49b74', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'Name', N'名稱', N'nvarchar', N'string', N'Name', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 510, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'b1ede1fc-9eec-4199-b32f-fe5f38d766a8', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'CascadeId', N'節點語義ID', N'nvarchar', N'string', N'CascadeId', 0, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 510, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'ecc88bb6-45c3-4026-94aa-bae2f95c2aed', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'Id', N'資源標識', N'nvarchar', N'string', N'Id', 1, 0, 1, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'ec4dda54-acd5-43a5-a23e-a2c2133276d3', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'AppId', N'資源所屬應用ID', N'nvarchar', N'string', N'AppId', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 100, NULL)
GO
INSERT [dbo].[BuilderTableColumn] ([Id], [TableId], [TableName], [ColumnName], [Comment], [ColumnType], [EntityType], [EntityName], [IsKey], [IsIncrement], [IsRequired], [IsInsert], [IsEdit], [IsList], [IsQuery], [QueryType], [HtmlType], [EditType], [Sort], [CreateTime], [CreateUserId], [UpdateTime], [UpdateUserId], [EditRow], [EditCol], [UpdateUserName], [CreateUserName], [MaxLength], [DataSource]) VALUES (N'c48206ec-28f5-45c9-b040-668b446ef8e9', N'519e06ec-9bad-490c-9938-f4f88fe9752e', N'Resource', N'UpdateUserName', N'最後更新人', N'nvarchar', N'string', N'UpdateUserName', 0, 0, 0, 1, 1, 1, 0, N'', N'', N'', 0, CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'2022-08-10T12:42:07.0000000' AS DateTime2), N'', NULL, NULL, N'', N'超級管理員', 400, NULL)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255237522911301', N'.0.10.44.', N'流程設計', N'/flowSchemes/index', N'', 0, 0, N'liuchengsheji', 0, N'基礎配置', N'', 8, N'255236948213829', N'FlowScheme', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255240197148741', N'.0.12.', N'流程中心', N'/', N'', 0, 0, N'liuchengsheji', 0, N'根節點', N'', 5, NULL, NULL, 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255240998436933', N'.0.11.', N'倉儲中心', N'/', N'', 0, 0, N'cangchuzhongxin-', 0, N'根節點', N'', 4, NULL, N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255240513343557', N'.0.12.8.', N'已處理流程', N'/flowInstances/disposed', N'', 0, 0, N'23yichuliliucheng', 0, N'流程中心', N'', 3, N'255240197148741', N'FlowInstanceDisposed', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255241211035717', N'.0.13.', N'附件管理', N'/uploadfiles/index', N'', 0, 0, N'data-dictionary-type', 0, N'根節點', N'', 6, NULL, N'UploadFile', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255240623296581', N'.0.12.9.', N'待處理流程', N'/flowInstances/wait', N'', 0, 0, N'liuchengsheji', 0, N'流程中心', N'', 1, N'255240197148741', N'FlowInstanceWait', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255241225584709', N'.0.8.', N'API文件', N'https://donkeymove.cbsdinfo.com.tw/service/swagger/index.html', N'', 0, 0, N'liuchengsheji', 0, N'根節點', N'', 1, NULL, N'swagger', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255241194623045', N'.0.9.', N'代碼生成', N'/buildertables/index', N'', 0, 0, N'23yichuliliucheng', 0, N'根節點', N'', 2, NULL, N'BuilderTable', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255238721601605', N'.0.21.', N'基本設定', N'/OrgManager/Index', N'', 0, 0, N'bumenguanli', 0, N'根節點', N'', 8, NULL, N'Org', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255236948213829', N'.0.10.', N'基礎配置', N' /', N'', 0, 0, N'jichupeizhi', 0, N'根節點', N'', 3, NULL, NULL, 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255240863068229', N'.0.14.3.', N'系統日誌', N'/SysLogs/Index', N'', 0, 0, N'xiaoxipingtai-xiaoxirizhi', 0, N'消息日誌', N'', 1, N'255240741507141', N'SysLog', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255240863068230', N'.0.14.4.', N'我的消息', N'/SysMessages/Index', N'', 0, 0, N'xiaoxi', 0, N'消息日誌', N'', 2, N'255240741507141', N'SysMessage', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255238907945029', N'.0.10.45.', N'定時任務', N'/OpenJobs/Index', N'', 0, 0, N'dingshirenwu', 0, N'基礎配置', N'', 9, N'255236948213829', N'OpenJob', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255239041228869', N'.0.10.42.', N'表單設計', N'/forms/index', N'', 0, 0, N'biaodansheji-xuanxiangqia', 0, N'基礎配置', N'', 7, N'255236948213829', N'Form', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255240356986949', N'.0.12.10.', N'我的流程', N'/flowInstances/Index', N'', 0, 0, N'jiaoseguanli', 0, N'流程中心', N'', 2, N'255240197148741', N'FlowInstance', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255241100890181', N'.0.11.1.', N'入庫訂單', N'/wmsinboundordertbls/index', N'', 0, 0, N'cangchuzhongxin-', 0, N'倉儲中心', N'', 1, N'255240998436933', N'WmsInboundOrderTbl', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255239223332933', N'.0.10.43.', N'數據權限', N'/dataprivilegerules/index', N'', 0, 0, N'shujuquanxian', 0, N'基礎配置', N'', 6, N'255236948213829', N'DataPrivilegeRule', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255239318081605', N'.0.10.37.', N'類別管理', N'/Categories/Index', N'', 0, 0, N'data-dictionary-type', 0, N'基礎配置', N'', 5, N'255236948213829', N'Category', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255240741507141', N'.0.14.', N'消息日誌', N' /', N'', 0, 0, N'chaxun1', 0, N'根節點', N'', 7, NULL, NULL, 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255239589728325', N'.0.10.38.', N'菜單管理', N'/ModuleManager/Index', N'', 0, 0, N'liuchengzhongxin', 0, N'基礎配置', N'', 1, N'255236948213829', N'Module', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255239750688837', N'.0.10.39.', N'角色管理', N'/RoleManager/Index', N'', 0, 0, N'bumenguanli', 0, N'基礎配置', N'', 3, N'255236948213829', N'Role', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255239891812421', N'.0.10.40.', N'資源管理', N'/Resources/Index', N'', 0, 0, N'ziyuanguanli', 0, N'基礎配置', N'', 10, N'255236948213829', N'Resource', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'255240001843269', N'.0.10.41.', N'用戶管理', N'/UserManager/Index', N'', 0, 0, N'yonghuguanli', 0, N'基礎配置', N'', 4, N'255236948213829', N'User', 1)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'321361423208517', N'.0.23.', N'外部稽核下載', N'/', N'', 0, 0, N'xiangmu_xiangmuguanli', 0, N'根節點', N'', 14, NULL, N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'54f931fc-71cb-49cd-9609-c316daab058e', N'.0.15.1.', N'公司資料設定', N'/', N'', 0, 0, N'cangchuzhongxin-', 0, N'基本設定', N'', 1, N'd38a2887-fd2b-48b9-a35f-82f839977af3', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'321361576087624', N'.0.23.3.', N'檔案下載', N'/exportfile/download', N'', 0, 0, N'xiazaier', 0, N'外部稽核下載', N'', 1, N'321361423208517', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'321361673318472', N'.0.23.4.', N'檔案上傳', N'/exportfile/uploadfile', N'', 0, 0, N'huidaodingbu', 0, N'外部稽核下載', N'', 2, N'321361423208517', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'ca1c16ca-f45d-4381-b259-cf56dbbf7b56', N'.0.15.2.', N'部門/單位設定', N'/', N'', 0, 0, N'huiyuan', 0, N'基本設定', N'', 2, N'd38a2887-fd2b-48b9-a35f-82f839977af3', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'ceab5f73-7e44-4487-a339-c731f5b9bd52', N'.0.24.', N'現場檢核員建立', N'/personalprofile/index', N'', 0, 0, N'xiangmujingliguanli_renyuanguanli', 0, N'根節點', N'', 9, NULL, N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'70b6095e-74f9-4227-ab9f-1f6e46221bc0', N'.0.17.', N'題庫建立模組', N'/', N'', 0, 0, N'zhuanyelingyuweihu', 0, N'根節點', N'', 10, NULL, N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'6b5a9942-7f55-45bf-837c-1f559f3f1e5f', N'.0.17.5.', N'模組建立', N'/questions/category', N'', 0, 0, N'jifen', 0, N'題庫建立模組', N'', 1, N'70b6095e-74f9-4227-ab9f-1f6e46221bc0', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'.0.17.4.', N'題目建立', N'/questions/index', N'', 0, 0, N'xiangmuwenjianmobanku_mobanku', 0, N'題庫建立模組', N'', 2, N'70b6095e-74f9-4227-ab9f-1f6e46221bc0', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'9d5963e6-b22b-4fb5-822a-06ce1a23afce', N'.0.18.', N'檢核表模組', N'/', N'', 0, 0, N'yanqishenhe', 0, N'根節點', N'', 11, NULL, N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'e5ba2b37-fe6b-4132-ad79-f70abcc5c982', N'.0.18.3.', N'檢核表建立', N'/checkforms/index', N'', 0, 0, N'wendang_wenjian', 0, N'檢核表模組', N'', 1, N'9d5963e6-b22b-4fb5-822a-06ce1a23afce', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'4a6ed6c4-7845-44fd-b74a-e082d5e30d1b', N'.0.18.4.', N'檢核表派發', N'/orgcheckforms/index', N'', 0, 0, N'zhuanjiaku_tuandui', 0, N'檢核表模組', N'', 2, N'9d5963e6-b22b-4fb5-822a-06ce1a23afce', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'd53d1cae-4bb1-4753-871f-420ddc042df0', N'.0.19.', N'追踪查核模組', N'/', N'', 0, 0, N'fenxianger', 0, N'根節點', N'', 12, NULL, N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'aeb5de56-2725-43b7-adcb-50a2657ae60c', N'.0.20.', N'報表審閱', N'/', N'', 0, 0, N'tongjier', 0, N'根節點', N'', 13, NULL, N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'618767eb-c248-4f17-b8e9-912c0d0fb064', N'.0.20.5.', N'未填單記錄', N'/', N'', 0, 0, N'naozhong', 0, N'報表審閱', N'', 2, N'aeb5de56-2725-43b7-adcb-50a2657ae60c', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'89a56852-6f94-48f8-b57e-83174e811bcb', N'.0.20.4.', N'檢核記錄列表', N'/checkformresults/index', N'', 0, 0, N'liebiao', 0, N'報表審閱', N'', 1, N'aeb5de56-2725-43b7-adcb-50a2657ae60c', N'', 0)
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId], [Code], [IsSys]) VALUES (N'48d0f1d8-feb3-45c7-b26c-24ecf5994cb1', N'.0.20.3.', N'列印', N'/', N'', 0, 0, N'dayinji', 0, N'報表審閱', N'', 3, N'aeb5de56-2725-43b7-adcb-50a2657ae60c', N'', 0)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241100890182', N'btnEdit', N'編輯', N'false', N'', N'bianji-copy', N'primary', N'', 2, N'255241100890181', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241100890183', N'btnDel', N'撤銷訂單', N'false', N'', N'shanchu', N'danger', N'', 3, N'255241100890181', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239750688838', N'btnRoleAccessUser', N'新增角色用戶', N'false', N'assignRoleUser(this)', N'yonghuguanli', N'warning', N'添加角色用戶', 4, N'255239750688837', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239750688839', N'btnAccessModule', N'為角色分配模塊', N'false', N'assignRoleModule(this)', N'xiaoxipingtai-xiaoxirizhi', N'warning', N'為角色分配模塊', 4, N'255239750688837', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240356986950', N'btnStart', N'啟動', N'false', N'', N'zhengque_chenggong_shibai', N'success', N'', 4, N'255240356986949', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239318081606', N'btnDelCategory', N'刪除分類', N'false', N'', N'shanchu', N'danger', N'', 0, N'255239318081605', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239750688840', N'btnAssignReource', N'為角色分配資源', N'false', N'openRoleReourceAccess(this)', N'module', N'warning', N'為角色分配資源', 3, N'255239750688837', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255237529919557', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'', 2, N'255237522911301', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255237531992133', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'', 1, N'255237522911301', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239318081607', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'編輯分類', 2, N'255239318081605', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255238721601606', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'添加部門', 0, N'255238721601605', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255238721601607', N'btnAssignOrgUser', N'分配用戶', N'false', N'assignOrgUser(this)', N'yonghuguanli', N'warning', N'分配用戶', 0, N'255238721601605', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239750688841', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'編輯角色', 1, N'255239750688837', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239318081608', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'添加分類', 1, N'255239318081605', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255238907945030', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'添加定時任務', 1, N'255238907945029', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240001843270', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除用戶', 2, N'255240001843269', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255238907945031', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除定時任務', 3, N'255238907945029', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240001843271', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'編輯用戶', 1, N'255240001843269', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255238907945032', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'編輯定時任務', 2, N'255238907945029', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241194623056', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'', 1, N'255241194623045', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239041228870', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'', 1, N'255239041228869', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239589728326', N'btnEdit', N'編輯菜單', N'false', N'edit()', N'bianji-copy', N'primary', N'編輯菜單', 2, N'255239589728325', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239891812422', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'編輯資源', 2, N'255239891812421', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241194623055', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'', 2, N'255241194623045', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239041228871', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'', 2, N'255239041228869', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239891812423', N'btnExport', N'導出', N'false', N'export()', N'bianji-copy', N'info', N'導出資源', 10, N'255239891812421', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241100890184', N'btnExport', N'導出', N'false', N'export()', N'bianji-copy', N'info', N'導出訂單', 10, N'255241100890181', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240356986951', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'編輯流程', 1, N'255240356986949', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240001843272', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'添加用戶', 0, N'255240001843269', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240356986952', N'btnRecall', N'撤銷', N'false', N'', N'chexiao_', N'danger', N'', 5, N'255240356986949', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240356986953', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'', 3, N'255240356986949', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239589728327', N'btnAddMenu', N'新增功能', N'false', N'assignButton()', N'xinzeng', N'success', N'新增功能', 4, N'255239589728325', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239589728328', N'btnEditMenu', N'編輯功能', N'false', N'', N'bianji-copy', N'primary', N'編輯功能', 5, N'255239589728325', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239589728329', N'btnDelMenu', N'刪除功能', N'false', N'', N'shanchu', N'danger', N'刪除功能', 6, N'255239589728325', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239750688842', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'添加角色', 0, N'255239750688837', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240356986954', N'btnAdd', N'新的申請', N'false', N'add()', N'xinzeng', N'success', N'申請物品', 0, N'255240356986949', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239750688843', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除角色', 2, N'255239750688837', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255237533556805', N'btnAdd', N'新增模版', N'false', N'add()', N'xinzeng', N'success', N'', 0, N'255237522911301', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240623296582', N'btnVerification', N'處理', N'false', N'verificationForm()', N'chaxun1', N'warning', N'', 1, N'255240623296581', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255238721601608', N'btnDel', N'刪除', N'true', N'del()', N'', N'', N'刪除部門', 2, N'255238721601605', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240001843273', N'btnAccessRole', N'為用戶分配角色', N'false', N'openUserRoleAccess(this)', N'yonghuguanli', N'warning', N'為用戶分配角色', 5, N'255240001843269', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240356986955', N'btnDetail', N'進度詳情', N'false', N'', N'chaxun1', N'info', N'', 4, N'255240356986949', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239223332934', N'btnAdd', N'新增', N'false', N'', N'xinzeng', N'success', N'', 1, N'255239223332933', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240623296583', N'btnDetail', N'進度詳情', N'false', N'', N'chaxun1', N'info', N'', 2, N'255240623296581', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239589728330', N'btnAdd', N'新增菜單', N'false', N'add()', N'xinzeng', N'success', N'新增菜單', 1, N'255239589728325', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239318081609', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除分類', 3, N'255239318081605', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241194623052', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'', 3, N'255241194623045', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239041228872', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'', 3, N'255239041228869', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239223332935', N'btnDel', N'刪除', N'false', N'', N'shanchu', N'danger', N'', 1, N'255239223332933', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241194623051', N'btnCreateEntity', N'生成實體', N'false', N'createEntity()', N'chaxun1', N'info', N'生成實體', 4, N'255241194623045', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239041228873', N'btnPreview', N'預覽', N'false', N'preview()', N'chaxun1', N'info', N'', 4, N'255239041228869', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239891812424', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'添加資源', 0, N'255239891812421', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239318081610', N'btnAddCategory', N'新增分類', N'false', N'', N'xinzeng', N'success', N'', 0, N'255239318081605', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241194623050', N'btnCreateVue', N'生成VUE頁面', N'false', N'', N'zhuyeicon', N'info', N'生成VUE頁面', 6, N'255241194623045', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240513343558', N'btnDetail', N'查看詳情', N'false', N'', N'chaxun1', N'info', N'', 0, N'255240513343557', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241100890185', N'btnAdd', N'新訂單', N'false', N'', N'xinzeng', N'success', N'', 1, N'255241100890181', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239318081611', N'btnRefresh', N'刷新', N'false', N'refresh()', N'chaxun1', N'info', N'刷新分類', 0, N'255239318081605', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239891812425', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除資源', 3, N'255239891812421', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255240001843274', N'btnRefresh', N'刷新', N'false', N'refresh()', N'chaxun1', N'info', N'刷新用戶', 3, N'255240001843269', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255237535002693', N'btnPreview', N'預覽', N'false', N'preview()', N'chaxun1', N'info', N'', 3, N'255237522911301', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241211035719', N'btnAdd', N'上傳附件', N'false', N'add()', N'xinzeng', N'success', N'新增文件管理', 1, N'255241211035717', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241194623046', N'btnCreateBusiness', N'生成業務代碼', N'false', N'', N'biaodansheji-xuanxiangqia', N'info', N'生成業務代碼', 5, N'255241194623045', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255239589728331', N'btnDel', N'刪除菜單', N'false', N'del()', N'shanchu', N'danger', N'刪除菜單', 3, N'255239589728325', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255238721601609', N'btnEdit', N'編輯', N'true', N'edit()', N'', N'', N'編輯部門', 1, N'255238721601605', NULL, NULL)
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'255241211035718', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除文件管理', 3, N'255241211035717', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'321108717523016', N'btnDisable', N'停用', N'true', N'', N'', N'', N'', 4, N'ceab5f73-7e44-4487-a339-c731f5b9bd52', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'ae37eb19-090d-4243-a061-65b096614c0f', N'btnDisable', N'停用', N'true', N'', N'', N'', N'', 4, N'255238721601605', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'321108753502281', N'btnEnable', N'啟用', N'true', N'', N'', N'', N'', 5, N'ceab5f73-7e44-4487-a339-c731f5b9bd52', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'321361673384005', N'btnUpload', N'上傳', N'false', N'add()', N'shangchuan', N'info', N'新增檔案上傳', 1, N'321361673318472', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'1c9f9af1-2ed3-4c2a-af51-ae4181552f9b', N'btnAdd', N'添加', N'false', N'add()', N'xinzeng', N'success', N'新增公司資料設定', 1, N'54f931fc-71cb-49cd-9609-c316daab058e', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'f689b908-dc8b-490a-8c39-34fa081d795c', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'修改公司資料設定', 2, N'54f931fc-71cb-49cd-9609-c316daab058e', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'96d3aa71-3217-4adc-841f-d9592a9eb82f', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除公司資料設定', 3, N'54f931fc-71cb-49cd-9609-c316daab058e', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'372bd5a0-810a-47fd-929c-d786f5080258', N'btnAdd', N'添加', N'false', N'add()', N'xinzeng', N'success', N'新增部門/單位設定', 1, N'ca1c16ca-f45d-4381-b259-cf56dbbf7b56', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'a405010f-675b-4ba9-ba3b-bbc425b93995', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'修改部門/單位設定', 2, N'ca1c16ca-f45d-4381-b259-cf56dbbf7b56', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'4da13b06-b3ac-468f-a4c9-5d77325d34e6', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除部門/單位設定', 3, N'ca1c16ca-f45d-4381-b259-cf56dbbf7b56', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'1441b3fe-5300-42e7-a2a8-feb4d1ac9f05', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'新增人員資料設定', 1, N'ceab5f73-7e44-4487-a339-c731f5b9bd52', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'0ea4571e-9eb7-4677-b779-e8a744b867b9', N'btnEdit', N'編輯', N'true', N'edit()', N'', N'', N'修改人員資料設定', 2, N'ceab5f73-7e44-4487-a339-c731f5b9bd52', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'6c9dd328-c2d3-4632-b83d-00f62fbf1aa8', N'btnDel', N'刪除', N'true', N'del()', N'', N'', N'刪除人員資料設定', 3, N'ceab5f73-7e44-4487-a339-c731f5b9bd52', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'bc4bb9bb-fe78-4906-be89-4cf3970aa586', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'新增模組建立', 1, N'6b5a9942-7f55-45bf-837c-1f559f3f1e5f', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'2125d489-7de9-4af3-854e-b3b215030199', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'修改模組建立', 2, N'6b5a9942-7f55-45bf-837c-1f559f3f1e5f', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'75b79490-fced-4897-848e-eb483ea31e2a', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除模組建立', 3, N'6b5a9942-7f55-45bf-837c-1f559f3f1e5f', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'eca36614-3351-489b-a788-9a8d61743e19', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'新增題目建立', 1, N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'8fe59c0c-f260-439e-a8fd-c8a9fd4b14f6', N'btnEdit', N'編輯', N'true', N'edit()', N'', N'', N'修改題目建立', 2, N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'8802141f-0e00-4528-ae57-d5543714929a', N'btnDel', N'刪除', N'true', N'del()', N'', N'', N'刪除題目建立', 3, N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'2dced496-97ca-4aa3-9744-02d6bbbb5849', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'新增未填單記錄', 1, N'618767eb-c248-4f17-b8e9-912c0d0fb064', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'62a656d2-fbc8-411a-883c-33386ce8ef2c', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'修改未填單記錄', 2, N'618767eb-c248-4f17-b8e9-912c0d0fb064', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'947bcc54-f508-456e-a586-81cfd86bd978', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除未填單記錄', 3, N'618767eb-c248-4f17-b8e9-912c0d0fb064', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'961879a9-bbc0-4a63-a7d7-9d44fba5b473', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'新增檢核表建立', 1, N'e5ba2b37-fe6b-4132-ad79-f70abcc5c982', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'd46f4e6f-8e91-4a8c-866e-0342316e52dd', N'btnEdit', N'編輯', N'true', N'edit()', N'', N'', N'修改檢核表建立', 2, N'e5ba2b37-fe6b-4132-ad79-f70abcc5c982', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'd158e8f9-aa7f-48a9-9e97-e70254b8d725', N'btnDel', N'刪除', N'true', N'del()', N'', N'', N'刪除檢核表建立', 3, N'e5ba2b37-fe6b-4132-ad79-f70abcc5c982', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'83bf455f-b904-458a-8005-8dd7fc206e30', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'新增檢核表派發', 1, N'4a6ed6c4-7845-44fd-b74a-e082d5e30d1b', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'1b459d63-0c15-4b8a-884e-4f7f09b2afaa', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'修改檢核表派發', 2, N'4a6ed6c4-7845-44fd-b74a-e082d5e30d1b', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'0a42699b-2544-44e0-b020-35f00f12d3ad', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除檢核表派發', 3, N'4a6ed6c4-7845-44fd-b74a-e082d5e30d1b', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'2d49b70e-9427-4dd6-852c-e58c59b714d6', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'新增追踪查核模組', 1, N'd53d1cae-4bb1-4753-871f-420ddc042df0', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'be0ce18a-b998-4925-b85e-dc24faff8b35', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'修改追踪查核模組', 2, N'd53d1cae-4bb1-4753-871f-420ddc042df0', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'c7ff13f3-00a9-4ea1-a3d1-bc9acf12e77f', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除追踪查核模組', 3, N'd53d1cae-4bb1-4753-871f-420ddc042df0', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'a8e307b6-04bf-45ca-a2d7-6c232d19b9eb', N'btnView', N'檢視', N'true', N'add()', N'', N'', N'檢視檢核記錄列表', 1, N'89a56852-6f94-48f8-b57e-83174e811bcb', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'45116ff3-7a7f-49b0-be96-68aa90027224', N'btnAdd', N'新增', N'false', N'add()', N'xinzeng', N'success', N'新增列印', 1, N'48d0f1d8-feb3-45c7-b26c-24ecf5994cb1', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'81c290f1-c2e0-44b0-a01d-e987d4c3add5', N'btnEdit', N'編輯', N'false', N'edit()', N'bianji-copy', N'primary', N'修改列印', 2, N'48d0f1d8-feb3-45c7-b26c-24ecf5994cb1', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'd9049bb2-1670-42cb-a321-08a76910f347', N'btnDel', N'刪除', N'false', N'del()', N'shanchu', N'danger', N'刪除列印', 3, N'48d0f1d8-feb3-45c7-b26c-24ecf5994cb1', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'87afa6cc-5ad5-4a8f-8720-3997b3e96850', N'btnDisable', N'停用', N'true', N'', N'', N'', N'', 4, N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'', N'')
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId], [TypeName], [TypeId]) VALUES (N'e0df403b-50c1-493d-a054-1d72c24b5888', N'btnEnable', N'啟用', N'true', N'', N'', N'', N'', 5, N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'', N'')
GO
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId], [TypeName], [TypeId]) VALUES (N'321089205329989', N'.0.1.', N'總公司', N'', N'根節點', 0, 0, N'', 0, N'', N'', CAST(N'2022-08-12T10:22:21.000' AS DateTime), 0, 0, NULL, N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'00e118b5-571a-496b-af90-3b6814e44ccb', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239589728329', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'045287cc-4eea-48a2-ae41-22ce4aff2eb2', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:40:59.720' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'6b5a9942-7f55-45bf-837c-1f559f3f1e5f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'047d3de9-9a20-41e8-88b2-3ca2396a3398', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239318081609', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'096013ec-64ed-4e94-8715-f079458022e4', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255238721601608', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'0aab020a-f49b-4008-8bcf-8995503ba269', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:41:44.183' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'54e270b5-36ec-4ee5-9bc3-265112b251c8', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'0c1e5db2-ea2f-4ab2-9d2b-75e4f6174a83', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240356986954', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'0cc02f28-57bb-4d48-81a7-c2c79f9a48e5', N'', N'RoleModule', 0, CAST(N'2022-08-10T12:28:14.863' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239750688837', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'0d2f9454-b784-4b92-80c5-71aa866c0a3d', N'', N'RoleElement', 0, CAST(N'2022-08-12T11:31:23.177' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'87afa6cc-5ad5-4a8f-8720-3997b3e96850', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'0e96d9af-1026-403a-b74f-113db4f9e530', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'62a656d2-fbc8-411a-883c-33386ce8ef2c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'0f55691a-02ac-4511-856b-1fda6c28f9d5', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239318081605', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'0ff64831-bdae-475a-9fba-2d53b1326f09', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'1c9f9af1-2ed3-4c2a-af51-ae4181552f9b', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'11315662-6337-4916-8cca-354a48250178', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239589728329', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1286eaa9-62cc-4a97-9b48-adc92959da45', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255238721601605', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1389bcf0-18ea-465c-a669-e405cc328d8b', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239750688838', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'14fd7eec-7597-4cbb-b201-0f74aa137449', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240356986950', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'15d731aa-dd80-42d7-9f4d-752ea922c95e', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:33:04.463' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'f689b908-dc8b-490a-8c39-34fa081d795c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1648b86e-c684-4ce4-bba6-c154e37df581', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:40:59.717' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'75b79490-fced-4897-848e-eb483ea31e2a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'16fba2ee-f48d-4670-8c65-dba1d91b15ca', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:34:14.977' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'a405010f-675b-4ba9-ba3b-bbc425b93995', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'188f5998-6144-431c-968c-4f33d56ff13c', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241100890185', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'18fc74d2-984c-4a02-a173-c8cc66e5e63b', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'd38a2887-fd2b-48b9-a35f-82f839977af3', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1a857a80-2270-4487-88d7-44654beb5dc3', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'89a56852-6f94-48f8-b57e-83174e811bcb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1abd17d2-07a8-4bc7-b69a-7787a6eff92f', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240356986951', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1c3f3b6f-87dd-405d-8a36-29d645b795de', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239589728327', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1ce447f0-68cd-4765-9edb-aa66764b47ea', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'0a42699b-2544-44e0-b020-35f00f12d3ad', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1e1c8abd-c96b-4a08-9641-7e13808482b1', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:43:38.877' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'83bf455f-b904-458a-8005-8dd7fc206e30', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1e1d259f-8af1-40be-a817-58bcc3da033f', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255238907945030', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'1f3a42f4-9ad5-470b-bcea-6c480423e185', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239750688842', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'25e29d4a-db02-48b9-8a34-1558cf468150', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239041228872', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'25e5070a-549b-4413-bff6-b95400c79d37', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:40:08.317' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'1441b3fe-5300-42e7-a2a8-feb4d1ac9f05', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'2648c29d-8ab1-4083-9017-ad79fd1dc64e', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:34:14.987' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'ca1c16ca-f45d-4381-b259-cf56dbbf7b56', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'28e0d433-1f20-43d7-89de-00e94e81c911', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:41:17.930' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'eca36614-3351-489b-a788-9a8d61743e19', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'2932ae9c-40a9-4d3a-947b-5b8123281fd2', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'4da13b06-b3ac-468f-a4c9-5d77325d34e6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'29b0683f-d9af-42f2-bbec-9fdc6cdf07a3', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'ceab5f73-7e44-4487-a339-c731f5b9bd52', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'2a3366f4-0af9-4d4b-908c-8037d525f1e3', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239318081610', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'2b677149-b3f2-47c5-b9e4-df91f9e402a0', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'be0ce18a-b998-4925-b85e-dc24faff8b35', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'2ba4ad7e-5773-4395-875b-ec8f6660592b', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239318081610', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'2e56ff27-3e4e-4406-badc-84844dd01c17', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'aeb5de56-2725-43b7-adcb-50a2657ae60c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'2eaa8fde-6c67-42bd-b26f-96c9eebf4b5b', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240513343558', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'2f50d1a0-0865-4ba3-a67c-75c1785267b0', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'30448046-ce8e-45ca-8253-f284241a03fe', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:44:14.067' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'c7ff13f3-00a9-4ea1-a3d1-bc9acf12e77f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'30cff485-654a-4502-ae50-5eec7125346d', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:45:25.620' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'87419fa1-29a1-448c-8abe-e74805f392be', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'315e3a5b-3e83-4aeb-b03a-93d2977a6da5', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240356986955', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'318df576-f242-41dc-94df-9ca746c6acd2', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239318081611', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'320ee9f6-97db-4edf-b850-6ea06a20f221', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:47:01.427' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'2dced496-97ca-4aa3-9744-02d6bbbb5849', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382021', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'255238721601605', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382022', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'255240001843269', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382023', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'70b6095e-74f9-4227-ab9f-1f6e46221bc0', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382024', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'6b5a9942-7f55-45bf-837c-1f559f3f1e5f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382025', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382026', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'4a6ed6c4-7845-44fd-b74a-e082d5e30d1b', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382027', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'd53d1cae-4bb1-4753-871f-420ddc042df0', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382028', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'aeb5de56-2725-43b7-adcb-50a2657ae60c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382029', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'618767eb-c248-4f17-b8e9-912c0d0fb064', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382030', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'89a56852-6f94-48f8-b57e-83174e811bcb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087088382031', N'', N'RoleModule', 0, CAST(N'2022-08-15T17:26:44.457' AS DateTime), N'', N'321084224278598', N'48d0f1d8-feb3-45c7-b26c-24ecf5994cb1', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372677', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'255238721601606', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372678', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'255238721601607', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372679', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'255240001843270', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372680', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'255240001843271', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372681', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'255240001843272', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372682', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'255238721601608', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372683', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'255240001843273', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372684', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'255240001843274', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372685', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'255238721601609', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372686', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'ae37eb19-090d-4243-a061-65b096614c0f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372687', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'bc4bb9bb-fe78-4906-be89-4cf3970aa586', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372688', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'2125d489-7de9-4af3-854e-b3b215030199', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372689', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'75b79490-fced-4897-848e-eb483ea31e2a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372690', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'eca36614-3351-489b-a788-9a8d61743e19', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372691', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'8fe59c0c-f260-439e-a8fd-c8a9fd4b14f6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372692', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'8802141f-0e00-4528-ae57-d5543714929a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372693', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'2dced496-97ca-4aa3-9744-02d6bbbb5849', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372694', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'62a656d2-fbc8-411a-883c-33386ce8ef2c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372695', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'947bcc54-f508-456e-a586-81cfd86bd978', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372696', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'83bf455f-b904-458a-8005-8dd7fc206e30', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372697', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'1b459d63-0c15-4b8a-884e-4f7f09b2afaa', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372698', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'0a42699b-2544-44e0-b020-35f00f12d3ad', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372699', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'2d49b70e-9427-4dd6-852c-e58c59b714d6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090372700', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'be0ce18a-b998-4925-b85e-dc24faff8b35', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090376773', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'c7ff13f3-00a9-4ea1-a3d1-bc9acf12e77f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090376774', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'a8e307b6-04bf-45ca-a2d7-6c232d19b9eb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090376775', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'4f63ecd6-7616-4c51-83c9-542740138f4d', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090376776', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'1670d9f1-38d4-4cf0-8d3d-390ce2945a3a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090376777', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'45116ff3-7a7f-49b0-be96-68aa90027224', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090376778', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'81c290f1-c2e0-44b0-a01d-e987d4c3add5', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090376779', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'd9049bb2-1670-42cb-a321-08a76910f347', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090376780', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'87afa6cc-5ad5-4a8f-8720-3997b3e96850', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321087090376781', N'', N'RoleElement', 0, CAST(N'2022-08-15T17:26:44.943' AS DateTime), N'', N'321084224278598', N'e0df403b-50c1-493d-a054-1d72c24b5888', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108717551692', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:45.017' AS DateTime), N'', N'321084224278598', N'321108717523016', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108717580357', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:45.023' AS DateTime), N'', N'321101619281990', N'321108717523016', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108717584453', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:45.023' AS DateTime), N'', N'321103295987782', N'321108717523016', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108717592645', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:45.027' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321108717523016', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108717596741', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:45.027' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321108717523016', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108753522764', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:53.800' AS DateTime), N'', N'321084224278598', N'321108753502281', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108753547333', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:53.803' AS DateTime), N'', N'321101619281990', N'321108753502281', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108753551429', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:53.807' AS DateTime), N'', N'321103295987782', N'321108753502281', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108753555525', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:53.807' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321108753502281', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321108753563717', N'', N'RoleElement', 0, CAST(N'2022-08-15T18:54:53.810' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321108753502281', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423753291', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.867' AS DateTime), N'', N'321084224278598', N'321361423568965', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423794245', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.877' AS DateTime), N'', N'321101619281990', N'321361423568965', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423802437', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.877' AS DateTime), N'', N'321103295987782', N'321361423568965', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423806533', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.880' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361423568965', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423810629', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.880' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361423568965', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423831116', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.887' AS DateTime), N'', N'321084224278598', N'321361423827013', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423851589', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.890' AS DateTime), N'', N'321101619281990', N'321361423827013', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423859781', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.893' AS DateTime), N'', N'321103295987782', N'321361423827013', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423867973', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.893' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361423827013', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423872069', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.897' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361423827013', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423892556', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.900' AS DateTime), N'', N'321084224278598', N'321361423884357', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423917125', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.907' AS DateTime), N'', N'321101619281990', N'321361423884357', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423921221', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.907' AS DateTime), N'', N'321103295987782', N'321361423884357', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423929413', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.910' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361423884357', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423937605', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:00.910' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361423884357', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361423962181', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:00.917' AS DateTime), N'', N'321084224278598', N'321361423208517', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361424003141', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:00.927' AS DateTime), N'', N'321101619281990', N'321361423208517', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361424019525', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:00.930' AS DateTime), N'', N'321103295987782', N'321361423208517', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361424031813', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:00.933' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361423208517', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361424044101', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:00.937' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361423208517', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576235084', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.093' AS DateTime), N'', N'321084224278598', N'321361576226885', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576255557', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.100' AS DateTime), N'', N'321101619281990', N'321361576226885', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576263749', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.100' AS DateTime), N'', N'321103295987782', N'321361576226885', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576267845', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.100' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361576226885', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576271941', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.103' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361576226885', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576292428', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.107' AS DateTime), N'', N'321084224278598', N'321361576284229', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576312901', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.113' AS DateTime), N'', N'321101619281990', N'321361576284229', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576321093', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.113' AS DateTime), N'', N'321103295987782', N'321361576284229', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576325189', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.117' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361576284229', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576333381', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.117' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361576284229', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576349772', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.123' AS DateTime), N'', N'321084224278598', N'321361576345669', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576374341', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.127' AS DateTime), N'', N'321101619281990', N'321361576345669', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576382533', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.130' AS DateTime), N'', N'321103295987782', N'321361576345669', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576390725', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.130' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361576345669', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576398917', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:03:38.133' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361576345669', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576415308', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:38.137' AS DateTime), N'', N'321084224278598', N'321361576087624', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576456261', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:38.147' AS DateTime), N'', N'321101619281990', N'321361576087624', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576468549', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:38.150' AS DateTime), N'', N'321103295987782', N'321361576087624', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576484933', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:38.153' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361576087624', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361576497221', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:03:38.157' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361576087624', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673392199', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.813' AS DateTime), N'', N'321084224278598', N'321361673384005', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673408581', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.817' AS DateTime), N'', N'321101619281990', N'321361673384005', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673412677', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.820' AS DateTime), N'', N'321103295987782', N'321361673384005', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673416773', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.820' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361673384005', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673420869', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.820' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361673384005', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673437260', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.823' AS DateTime), N'', N'321084224278598', N'321361673433157', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673457733', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.830' AS DateTime), N'', N'321101619281990', N'321361673433157', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673461829', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.830' AS DateTime), N'', N'321103295987782', N'321361673433157', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673465925', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.833' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361673433157', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673474117', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.833' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361673433157', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673490508', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.837' AS DateTime), N'', N'321084224278598', N'321361673486405', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673515077', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.843' AS DateTime), N'', N'321101619281990', N'321361673486405', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673519173', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.843' AS DateTime), N'', N'321103295987782', N'321361673486405', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673527365', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.847' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361673486405', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673531461', N'', N'RoleElement', 0, CAST(N'2022-08-16T12:04:01.847' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361673486405', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673551947', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:04:01.853' AS DateTime), N'', N'321084224278598', N'321361673318472', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673584709', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:04:01.860' AS DateTime), N'', N'321101619281990', N'321361673318472', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673596997', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:04:01.863' AS DateTime), N'', N'321103295987782', N'321361673318472', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673609285', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:04:01.867' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'321361673318472', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'321361673625669', N'', N'RoleModule', 0, CAST(N'2022-08-16T12:04:01.870' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'321361673318472', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622917', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'255236948213829', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622918', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'255240001843269', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622919', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'321361423208517', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622920', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'321361576087624', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622921', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'321361673318472', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622922', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'ceab5f73-7e44-4487-a339-c731f5b9bd52', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622923', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'70b6095e-74f9-4227-ab9f-1f6e46221bc0', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622924', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'6b5a9942-7f55-45bf-837c-1f559f3f1e5f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622925', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622926', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'9d5963e6-b22b-4fb5-822a-06ce1a23afce', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622927', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'e5ba2b37-fe6b-4132-ad79-f70abcc5c982', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622928', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'4a6ed6c4-7845-44fd-b74a-e082d5e30d1b', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622929', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'd53d1cae-4bb1-4753-871f-420ddc042df0', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622930', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'aeb5de56-2725-43b7-adcb-50a2657ae60c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622931', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'618767eb-c248-4f17-b8e9-912c0d0fb064', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622932', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'89a56852-6f94-48f8-b57e-83174e811bcb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572622933', N'', N'RoleModule', 0, CAST(N'2022-08-18T16:53:22.760' AS DateTime), N'', N'321084257284166', N'48d0f1d8-feb3-45c7-b26c-24ecf5994cb1', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848197', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'255240001843270', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848198', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'255240001843271', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848199', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'255240001843272', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848200', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'255240001843273', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848201', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'255240001843274', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848202', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'321108717523016', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848203', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'321108753502281', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848204', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'321361673384005', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848205', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'1441b3fe-5300-42e7-a2a8-feb4d1ac9f05', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848206', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'0ea4571e-9eb7-4677-b779-e8a744b867b9', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848207', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'6c9dd328-c2d3-4632-b83d-00f62fbf1aa8', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848208', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'bc4bb9bb-fe78-4906-be89-4cf3970aa586', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848209', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'2125d489-7de9-4af3-854e-b3b215030199', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848210', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'75b79490-fced-4897-848e-eb483ea31e2a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848211', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'eca36614-3351-489b-a788-9a8d61743e19', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848212', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'8fe59c0c-f260-439e-a8fd-c8a9fd4b14f6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848213', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'8802141f-0e00-4528-ae57-d5543714929a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848214', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'2dced496-97ca-4aa3-9744-02d6bbbb5849', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848215', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'62a656d2-fbc8-411a-883c-33386ce8ef2c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848216', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'947bcc54-f508-456e-a586-81cfd86bd978', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848217', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'961879a9-bbc0-4a63-a7d7-9d44fba5b473', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848218', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'd46f4e6f-8e91-4a8c-866e-0342316e52dd', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848219', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'd158e8f9-aa7f-48a9-9e97-e70254b8d725', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848220', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'83bf455f-b904-458a-8005-8dd7fc206e30', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848221', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'1b459d63-0c15-4b8a-884e-4f7f09b2afaa', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848222', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'0a42699b-2544-44e0-b020-35f00f12d3ad', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848223', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'2d49b70e-9427-4dd6-852c-e58c59b714d6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848224', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'be0ce18a-b998-4925-b85e-dc24faff8b35', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848225', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'c7ff13f3-00a9-4ea1-a3d1-bc9acf12e77f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848226', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'a8e307b6-04bf-45ca-a2d7-6c232d19b9eb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848227', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'45116ff3-7a7f-49b0-be96-68aa90027224', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848228', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'81c290f1-c2e0-44b0-a01d-e987d4c3add5', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848229', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'd9049bb2-1670-42cb-a321-08a76910f347', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848230', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'87afa6cc-5ad5-4a8f-8720-3997b3e96850', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322140572848231', N'', N'RoleElement', 0, CAST(N'2022-08-18T16:53:22.813' AS DateTime), N'', N'321084257284166', N'e0df403b-50c1-493d-a054-1d72c24b5888', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278136389', N'', N'RoleModule', 0, CAST(N'2022-08-19T17:37:22.190' AS DateTime), N'', N'321084303351878', N'321361423208517', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278136390', N'', N'RoleModule', 0, CAST(N'2022-08-19T17:37:22.190' AS DateTime), N'', N'321084303351878', N'321361576087624', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278136391', N'', N'RoleModule', 0, CAST(N'2022-08-19T17:37:22.190' AS DateTime), N'', N'321084303351878', N'321361673318472', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278136392', N'', N'RoleModule', 0, CAST(N'2022-08-19T17:37:22.190' AS DateTime), N'', N'321084303351878', N'9d5963e6-b22b-4fb5-822a-06ce1a23afce', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278136393', N'', N'RoleModule', 0, CAST(N'2022-08-19T17:37:22.190' AS DateTime), N'', N'321084303351878', N'4a6ed6c4-7845-44fd-b74a-e082d5e30d1b', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278136394', N'', N'RoleModule', 0, CAST(N'2022-08-19T17:37:22.190' AS DateTime), N'', N'321084303351878', N'd53d1cae-4bb1-4753-871f-420ddc042df0', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278136395', N'', N'RoleModule', 0, CAST(N'2022-08-19T17:37:22.190' AS DateTime), N'', N'321084303351878', N'aeb5de56-2725-43b7-adcb-50a2657ae60c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278136396', N'', N'RoleModule', 0, CAST(N'2022-08-19T17:37:22.190' AS DateTime), N'', N'321084303351878', N'89a56852-6f94-48f8-b57e-83174e811bcb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423109', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'321108717523016', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423110', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'321108753502281', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423111', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'321361673384005', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423112', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'83bf455f-b904-458a-8005-8dd7fc206e30', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423113', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'1b459d63-0c15-4b8a-884e-4f7f09b2afaa', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423114', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'0a42699b-2544-44e0-b020-35f00f12d3ad', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423115', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'2d49b70e-9427-4dd6-852c-e58c59b714d6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423116', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'be0ce18a-b998-4925-b85e-dc24faff8b35', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423117', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'c7ff13f3-00a9-4ea1-a3d1-bc9acf12e77f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'322505278423118', N'', N'RoleElement', 0, CAST(N'2022-08-19T17:37:22.260' AS DateTime), N'', N'321084303351878', N'a8e307b6-04bf-45ca-a2d7-6c232d19b9eb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'32c09aff-4e06-4a9d-ac9e-9645c7e86bea', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255238721601609', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'336dac2c-12bc-4f93-a083-b0be153316b7', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'0ea4571e-9eb7-4677-b779-e8a744b867b9', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'349c5656-fa61-4ef9-85c2-d962d29fa871', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239750688841', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'3569bb08-4eca-4d81-bb71-6168300ef8bd', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239041228871', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'3763b7b9-cf1f-44bb-a7cb-7a7e779a067b', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'618767eb-c248-4f17-b8e9-912c0d0fb064', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'37b88cfa-33ce-4b51-bdb7-de402c7d49b3', N'', N'RoleModule', 0, CAST(N'2022-08-10T12:28:14.863' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240001843269', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'38785897-3a99-4c00-ae9a-5ed69be084f7', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239750688842', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'389f2705-1fa8-4b1c-ae8a-782617cb20f0', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:33:04.457' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'1c9f9af1-2ed3-4c2a-af51-ae4181552f9b', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'38b7b5a5-5206-4fc6-b61c-44c68e2bcb80', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:41:17.950' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'694250e7-e57e-47e7-a4ff-5cfcf3f1a122', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'3cc95553-75ea-4c44-b3e1-e615e2176762', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:47:57.780' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'81c290f1-c2e0-44b0-a01d-e987d4c3add5', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'3d9892a7-0422-4f05-add9-3adb33b43468', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'6c9dd328-c2d3-4632-b83d-00f62fbf1aa8', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'3d994b1d-3920-4f64-b40c-c36d6a67b01a', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239318081611', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'3e102bfe-6cb5-4c68-8d5d-dd2281692228', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:45:25.627' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'aeb5de56-2725-43b7-adcb-50a2657ae60c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'3f918c2d-29ef-47a7-9a71-f733a0610642', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255237533556805', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'3ffbd603-4d54-4183-9d85-f6ac4f138645', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:44:14.057' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'2d49b70e-9427-4dd6-852c-e58c59b714d6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4106a4bb-d9fd-4445-8171-2145694bf1fb', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239891812423', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4156c20a-c4ef-4d2e-b512-4f9f5e20b9f8', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255238721601609', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'45026b00-d2a0-4830-a155-6af7f867dedb', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:40:59.710' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'2125d489-7de9-4af3-854e-b3b215030199', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'460247dc-13c3-4fe5-9028-a3dbffa0a592', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239318081607', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4606c19b-79a9-4f1d-9c56-8d21492c6dea', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:40:08.320' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'0ea4571e-9eb7-4677-b779-e8a744b867b9', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4644edba-4a97-4960-89de-ba07c9b569f9', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240001843273', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'470808d2-ace6-460c-8904-2f867669443c', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239041228873', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'489b8bcc-327d-4ded-ae9b-542a6387b74f', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241211035719', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'49542405-083c-4170-a7e5-4d81d1e5c913', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239750688843', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'49d97dbd-fb93-46c3-9b17-92e9c9edf543', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'4a6ed6c4-7845-44fd-b74a-e082d5e30d1b', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4b649b46-6275-4dff-b25e-d9c92ceea18c', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255240001843272', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4c7179a9-7129-421e-abda-01430c4cd009', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241194623051', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4cec41c0-3150-41ee-8a69-f2be6ca85507', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255240001843270', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4de4dfa1-b8fb-4f58-9565-a637a165ad6c', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:33:04.473' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'54f931fc-71cb-49cd-9609-c316daab058e', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4de73748-5451-4ce4-9cde-c6dd4320e9a4', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255238907945032', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'4ec062cc-af30-40ab-8e26-e5e9227858c2', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:40:08.327' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'6c9dd328-c2d3-4632-b83d-00f62fbf1aa8', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'50736474-fcee-4f55-b2ea-635dfc74dbcf', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255238721601607', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'50e3dccb-7d0d-491e-bb30-06f143679652', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'd46f4e6f-8e91-4a8c-866e-0342316e52dd', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'53f806c9-8937-4a4b-a619-d32630925ccd', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239589728326', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'544c44c2-16f4-40bc-827d-0d9b1ce09340', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240623296583', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'5670caa9-3943-4e37-be22-2d767eab9363', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239750688839', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'58f6eb2f-c48c-4269-bad7-062736229efd', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239589728330', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'5aff1369-d76a-4990-957b-ee372cf5f025', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241194623050', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'5bd46c80-6c23-4949-876a-26567331ba09', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255238907945031', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'5e482746-bd35-493b-8b42-0e52009b86af', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'd158e8f9-aa7f-48a9-9e97-e70254b8d725', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'5e5f8446-e4d4-46a5-a9bb-62a485b1d726', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'2125d489-7de9-4af3-854e-b3b215030199', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'607fd841-b571-4c67-8980-90cb432f2205', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239589728328', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'6272e909-6389-419f-b03f-38f068e3c74f', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:44:14.060' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'be0ce18a-b998-4925-b85e-dc24faff8b35', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'645fc86e-1990-45c7-871d-3a8c7743b66c', N'', N'RoleElement', 0, CAST(N'2022-08-12T17:26:49.197' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'e0df403b-50c1-493d-a054-1d72c24b5888', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'65593f36-1efb-41c8-ae1b-20aa69eaf4d0', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255237529919557', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'663ffed5-269c-411d-890d-8f510af59c43', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255237535002693', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'6834ae4f-2a8a-403b-83b7-e659f2a2483d', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239318081609', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'683bc306-8787-45e1-9933-1876a14eecfe', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239589728330', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'6856516a-522d-466a-a93e-e1d8141b7100', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'96d3aa71-3217-4adc-841f-d9592a9eb82f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'6ae7e43e-f61a-4873-9a3b-6abd10b147d6', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:43:38.967' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'4a6ed6c4-7845-44fd-b74a-e082d5e30d1b', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'6c42243c-5034-424b-bfe1-c758f808b941', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255238721601610', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'6c9ef29a-b1e7-4ff7-b4c0-b4a48fe83e95', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255237531992133', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'6cb27dc7-0f59-4973-85c4-47822ede5312', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239589728327', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'6e8b581d-2a43-4331-96cc-fddd07fe92ef', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:40:28.600' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'8a20cb52-5410-4325-9b03-fb901e314089', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'6f271a9d-b58e-472a-9091-e1418a623d65', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255238721601607', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'702e0bc7-cd4f-4963-8fd9-2a663af67078', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:41:44.180' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'f24d577c-d24b-43eb-a9b8-00550779f255', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'70384b4a-3080-4003-a793-77a900091fbc', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240001843272', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'7296fdcc-2585-4dde-b67a-32360eb7b719', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241100890184', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'751c0c37-78a4-4c68-ae66-b0247aa4ea9d', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239891812422', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'767999c7-ba84-464c-b3b2-79ce3e4ff13c', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'e5ba2b37-fe6b-4132-ad79-f70abcc5c982', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'768dc650-1841-44d2-b1de-3c9c84b3fec8', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'f689b908-dc8b-490a-8c39-34fa081d795c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'776c7de4-3c10-45a8-bf0b-e6a6cfe04294', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'45116ff3-7a7f-49b0-be96-68aa90027224', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'778adebf-1d0a-471f-afb0-6976200200ea', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'961879a9-bbc0-4a63-a7d7-9d44fba5b473', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'77959595-4064-4f84-b4a1-e214ca9b4feb', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'54f931fc-71cb-49cd-9609-c316daab058e', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'77be04b0-caa2-4667-b648-d1195decf6d1', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:47:40.617' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'4f63ecd6-7616-4c51-83c9-542740138f4d', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'77fa7d03-1ff5-4d56-9824-a31ca6fb1441', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:47:40.623' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'89a56852-6f94-48f8-b57e-83174e811bcb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'78068f1f-3416-4e5c-963b-110ab74c4473', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'a8e307b6-04bf-45ca-a2d7-6c232d19b9eb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'785229c8-68e7-4fcf-bc25-5890ebcc62ad', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239750688838', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'788119ca-8c9a-4bb4-9ba4-f1e7b52d0aa3', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:40:59.707' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'bc4bb9bb-fe78-4906-be89-4cf3970aa586', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'78e9e0ca-7af4-4331-84b7-43316af89c51', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'1670d9f1-38d4-4cf0-8d3d-390ce2945a3a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'7a0fc8e1-9e8c-4411-bcbb-f747d58ce7d1', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240356986952', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'7ce34f07-8206-4764-ad2c-b6bd30b55ec3', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255236948213829', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'7e99a490-7f30-4a40-acf9-1d9514b74c23', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'83bf455f-b904-458a-8005-8dd7fc206e30', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'8384ea3d-9ba7-4355-9f85-0e56915e6e98', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'2dced496-97ca-4aa3-9744-02d6bbbb5849', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'84b14f3f-05b4-41f9-9064-863c2e84a4f5', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'70b6095e-74f9-4227-ab9f-1f6e46221bc0', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'85545b5e-7adc-4e78-863e-10fae3a2fea5', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:41:17.943' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'8802141f-0e00-4528-ae57-d5543714929a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'8630995b-d05a-451e-9975-af7fdc00cd05', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:47:01.430' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'62a656d2-fbc8-411a-883c-33386ce8ef2c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'889afbe3-2e04-4ad0-89b4-2c81f93b78d9', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239223332934', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'8a56f623-6619-4d30-9594-79f3918d6a6b', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:41:44.193' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'9d5963e6-b22b-4fb5-822a-06ce1a23afce', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'8a85d057-e8fe-48f8-ba8f-c636d84246e9', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239589728328', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'8a9e3b77-a431-46c6-85e1-337ce0748dcc', N'', N'RoleElement', 0, CAST(N'2022-08-12T17:26:49.240' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'e0df403b-50c1-493d-a054-1d72c24b5888', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'8b41ff1e-8f1f-4869-8b8b-eeae9c6d2baa', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:40:08.330' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'ceab5f73-7e44-4487-a339-c731f5b9bd52', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'8b8aafe3-f62e-4a42-96dc-6fe0b9ea3862', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'bc4bb9bb-fe78-4906-be89-4cf3970aa586', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'8d555be1-1709-4f81-bffc-bc7d64108d30', N'', N'RoleElement', 0, CAST(N'2022-08-12T11:31:23.210' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'87afa6cc-5ad5-4a8f-8720-3997b3e96850', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'8f5366b0-d597-4857-b495-5fa3bbe92396', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239589728331', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'912203e6-b3fa-4496-96f8-45c4db5831af', N'', N'RoleElement', 0, CAST(N'2022-08-11T17:01:50.617' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'ae37eb19-090d-4243-a061-65b096614c0f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'9126729c-4a1d-4127-8a23-f3bb54298411', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:41:44.190' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'273e1c57-464d-4ced-86e4-3ef0fc70a235', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'9150fb4c-9844-45dd-aba2-15bbd69bc89c', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240001843271', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'91a43be5-cf9c-45a5-92e4-ca8f221492f7', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'6b5a9942-7f55-45bf-837c-1f559f3f1e5f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'94024595-4a3c-421d-ade9-d6c631a59995', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:40:28.603' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'70b6095e-74f9-4227-ab9f-1f6e46221bc0', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'9483db08-4e9b-45e7-a00d-6e758f18f2c3', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239750688839', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'95705e7c-954f-4c5c-affe-9d20693ed470', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240001843274', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'96894a76-0f50-4e34-92dd-31e835494b07', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:45:25.617' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'33fc95c4-ff3b-4141-a12e-9acbad6c0ad2', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'9d39b703-8eee-47f9-83ae-cfedad44f26c', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:34:14.973' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'372bd5a0-810a-47fd-929c-d786f5080258', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'9e8567cf-d349-4b3f-b0ad-0f0d9fe2a641', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241211035718', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'9f3f2bb9-fd92-484e-b748-f988bc3e6f70', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255240001843271', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a06fa25b-1c3c-470c-9410-a335b67ccae0', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255240001843269', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a3a54cd2-e8ec-43cc-b0eb-6c462c2f3ede', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239318081607', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a48e0c57-8d34-4072-8142-62693af249c7', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239750688841', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a5a63659-9f9f-4013-8ac0-f0edbf97452d', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'372bd5a0-810a-47fd-929c-d786f5080258', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a6514ec0-b2bb-44f2-acaa-923b20409650', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'1441b3fe-5300-42e7-a2a8-feb4d1ac9f05', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a66264b1-0d6c-496f-a4ef-e49f3d36535d', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'c7ff13f3-00a9-4ea1-a3d1-bc9acf12e77f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a7c60e59-e48b-4d90-881f-03ba5fc22197', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'eca36614-3351-489b-a788-9a8d61743e19', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a8354aa4-db13-4036-8ba1-2ccd2aba9919', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239318081606', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a83e8a10-3594-476e-b8e9-02115a1e645b', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255238721601610', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'a9cc5339-9e34-45e0-840f-9b6b9a638703', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241100890182', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'af1fa333-4f4e-4839-bc57-b31a0a84579b', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:42:41.533' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'e5ba2b37-fe6b-4132-ad79-f70abcc5c982', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'b0b2cf2c-8f2d-469f-83e1-f01117f32498', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'a405010f-675b-4ba9-ba3b-bbc425b93995', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'b10734e3-290f-439f-800c-9273c12394d8', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:47:01.433' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'947bcc54-f508-456e-a586-81cfd86bd978', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'b19743f3-0b53-4f50-bf8f-4da51c04f94c', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239318081606', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'b4b4e744-5b34-444e-a4c3-6fb82b3035db', N'', N'RoleModule', 0, CAST(N'2022-08-10T12:28:14.863' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255238721601605', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'b616db88-93e1-4cda-8a07-d51b56126927', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241194623055', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'b706a7ae-b476-4344-b8d1-86fcd79b3eeb', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'8802141f-0e00-4528-ae57-d5543714929a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'b77fa5dc-e59c-438f-bcb0-b3231f73299f', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239891812424', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'ba3f5217-ef33-492c-b3d8-1d0098d1ca40', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'8fe59c0c-f260-439e-a8fd-c8a9fd4b14f6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'bab4cfb6-e965-435b-8a3b-c685017de7aa', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239750688837', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'bb9255aa-5c45-4873-b2e6-d48b3cfab478', N'', N'RoleElement', 0, CAST(N'2022-08-11T17:01:50.660' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'ae37eb19-090d-4243-a061-65b096614c0f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'be3d1d9b-7977-4cdf-94ff-f5312295752a', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'75b79490-fced-4897-848e-eb483ea31e2a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'be73eaa3-d65e-4d3f-b28f-72b2670a0347', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240356986953', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'bf4a22e5-3676-40e6-a303-a78012024ab9', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255240001843273', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'c0026627-2dd6-431f-830d-8280c689ff95', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255240001843274', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'c1f67770-8488-4147-afa2-0107a02ae5f8', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239223332935', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'c264a493-8eb0-4a54-a1b4-59edebb54fc7', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239589728331', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'c87c2df8-f045-4c0f-8e80-7373ad72f8c3', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:34:14.980' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'4da13b06-b3ac-468f-a4c9-5d77325d34e6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'cbd66561-3c9f-4fdb-b1b5-e7744b929771', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:43:38.920' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'0a42699b-2544-44e0-b020-35f00f12d3ad', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'cbebaff2-5081-4bfe-834b-4ae80c581221', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239318081608', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'cc6b7a62-4a41-45bc-9f6d-b1549412189c', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:30:12.203' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'cbb3f735-e756-4a78-b31d-8bd414cc3b47', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'cfc2bb13-d451-4da9-a25d-660153fd0fd7', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'4f63ecd6-7616-4c51-83c9-542740138f4d', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'cfec91c4-d000-4949-a9cd-db9b3c770201', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239318081608', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'd187b2e7-a6e8-4e42-a62f-b280d4d19880', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'947bcc54-f508-456e-a586-81cfd86bd978', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'd2164b30-a6dc-4d2b-be3b-0e672e17a5c6', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'ca1c16ca-f45d-4381-b259-cf56dbbf7b56', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'd2bb68c4-5019-45b6-9691-673902ec3528', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239891812425', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'd321eef5-6a3e-4478-969f-6654c2245c46', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:33:04.467' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'96d3aa71-3217-4adc-841f-d9592a9eb82f', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'd383908c-b1b3-48a7-8134-283d7ed6e9fc', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241100890183', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'd464b667-8427-4130-ad86-66be5e9f8ac5', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'd53d1cae-4bb1-4753-871f-420ddc042df0', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'd625406f-92ae-445c-a6e4-3d227061df1c', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255238721601606', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'd6791b01-44e2-49b0-93a1-8ae7d3eb9302', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:42:41.520' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'961879a9-bbc0-4a63-a7d7-9d44fba5b473', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'd7996823-8f90-43bc-ab06-35df6a3292de', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:45:25.613' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'77434d4a-41ab-4b07-b3a2-817dcf71dacc', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'dc380109-0a81-4ed2-8c9d-39af9d9db8c7', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:47:40.620' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'1670d9f1-38d4-4cf0-8d3d-390ce2945a3a', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'ddcb63d3-b201-4127-910d-fabc29bcea78', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:42:41.530' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'd158e8f9-aa7f-48a9-9e97-e70254b8d725', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'de08b746-c922-424e-be9c-3eec5e534fcc', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239589728325', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'dea6d72d-2344-46c9-9be3-1749283fb4f9', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:44:14.070' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'd53d1cae-4bb1-4753-871f-420ddc042df0', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'df3fa986-12f9-498f-9bcd-29658a0d3246', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'1b459d63-0c15-4b8a-884e-4f7f09b2afaa', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'df61bbc4-da8a-4703-b299-e73c94995a0b', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:40:28.593' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'9b1912ca-3998-406e-8a36-6753c86a4e9c', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'df7a651b-f332-458a-b04f-56c0130a6df7', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:42:41.523' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'd46f4e6f-8e91-4a8c-866e-0342316e52dd', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'df969c6d-b0c2-4967-970e-18c3721eb694', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239041228870', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'e500616b-e905-4b23-832b-bc8ce198d02f', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255238721601606', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'e623e738-c917-4c8b-92f3-c4c02bc2e528', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:41:17.933' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'8fe59c0c-f260-439e-a8fd-c8a9fd4b14f6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'e6b8584f-14d8-49a8-ac1b-fb2af3ddedda', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'9d5963e6-b22b-4fb5-822a-06ce1a23afce', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'e778b4cd-7253-4bf2-b3f1-e38fa2b97dc8', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'd9049bb2-1670-42cb-a321-08a76910f347', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'e9545b00-6535-49cc-9c2d-36da7cca9894', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:47:01.437' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'618767eb-c248-4f17-b8e9-912c0d0fb064', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'e9f998d7-8be4-4f57-95d4-68389043274e', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:43:38.893' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'1b459d63-0c15-4b8a-884e-4f7f09b2afaa', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'ea29148f-9929-45f7-b495-8f140625ea32', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'255239750688840', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'f0b3486b-04d1-4c3f-86aa-a659b3e5b756', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'2d49b70e-9427-4dd6-852c-e58c59b714d6', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'f185d96b-6678-4468-8208-07d87dfe2de9', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:30:12.197' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'dc9fd25b-ae01-43cd-a62e-2d93e3a023ac', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'f221995d-c118-4e8b-858f-2c3e132a6566', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241194623046', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'f682913f-6060-414d-88f7-d4753b99d864', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241194623056', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'f75b367e-250d-45d6-9515-15cd3c153b3a', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:47:57.777' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'45116ff3-7a7f-49b0-be96-68aa90027224', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'f8165445-a7b9-4364-9fcd-fada3eed7785', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:30:12.100' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'2bf6990a-e052-4bcc-a78e-621e5fe9cfbd', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'f82bdd43-4d16-4b93-9989-588a1e793d60', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:40:28.590' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'bdb391f2-425a-485e-9bcd-0e0c691f38b4', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'f9516fa6-5355-4112-a89b-0dcc148b4fcd', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255240623296582', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'fa282f7c-484d-43d5-98e4-5fbb33ca2ba5', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:47:40.613' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'a8e307b6-04bf-45ca-a2d7-6c232d19b9eb', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'fb4a1d6f-b7ca-430b-b3d6-107328300919', N'', N'RoleModule', 0, CAST(N'2022-08-11T12:15:06.183' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'48d0f1d8-feb3-45c7-b26c-24ecf5994cb1', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'fd01c011-84a5-4026-a402-735cc28fcf91', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255241194623052', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'fd0a2950-813d-44af-80d0-fc63a244d6f1', N'', N'RoleElement', 0, CAST(N'2022-08-11T11:47:57.787' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'd9049bb2-1670-42cb-a321-08a76910f347', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'fd7572b0-6255-431b-86d0-40f0f6713f5d', N'', N'RoleElement', 0, CAST(N'2022-08-11T12:15:06.237' AS DateTime), N'', N'3ca17720-bb57-449e-9772-aceb1cf0c137', N'81c290f1-c2e0-44b0-a01d-e987d4c3add5', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'fdcbd984-1163-4190-b20c-920b07e0777d', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:47:57.790' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'48d0f1d8-feb3-45c7-b26c-24ecf5994cb1', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'fe5c6f0d-7669-4674-a073-e102085eb521', N'', N'RoleElement', 0, CAST(N'2022-08-10T12:28:14.900' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'255239589728326', N'', N'')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId], [ThirdId], [ExtendInfo]) VALUES (N'fef63697-673c-4f29-824a-1bf39ad260df', N'', N'RoleModule', 0, CAST(N'2022-08-11T11:30:12.210' AS DateTime), N'', N'a3196959-b3dc-4022-b9e5-eb75bf6934b4', N'd38a2887-fd2b-48b9-a35f-82f839977af3', N'', N'')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'322586563608645', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-19T23:08:07.277' AS DateTime), N'alice1', N'alice1', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'322586572734533', N'用戶訪問', N'訪問日志', N'', N'check/getuserprofile', CAST(N'2022-08-19T23:08:09.503' AS DateTime), N'321091711946821', N'alice1', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'322586576420933', N'用戶訪問', N'訪問日志', N'', N'orgcheckforms/loadbyorg', CAST(N'2022-08-19T23:08:10.403' AS DateTime), N'321091711946821', N'alice1', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'322586633642053', N'用戶訪問', N'訪問日志', N'', N'check/getuserprofile', CAST(N'2022-08-19T23:08:24.373' AS DateTime), N'321091711946821', N'alice1', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'322586634281029', N'用戶訪問', N'訪問日志', N'', N'checkformresults/load', CAST(N'2022-08-19T23:08:24.530' AS DateTime), N'321091711946821', N'alice1', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435601006661', N'用戶登錄,結果：用戶不存在', N'登錄日志', N'', N'', CAST(N'2022-08-22T08:42:51.797' AS DateTime), N'Systm', N'Systm', N'', 1, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435633422405', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-22T08:42:59.710' AS DateTime), N'System', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435639930949', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T08:43:01.300' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435640090693', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T08:43:01.340' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435641004101', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:43:01.563' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435660779589', N'用戶訪問', N'訪問日志', N'', N'roles/load', CAST(N'2022-08-22T08:43:06.390' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435661418565', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:43:06.547' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435661447241', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:43:06.553' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435661455432', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:43:06.557' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435661467718', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:43:06.557' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435661475909', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:43:06.560' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435661480010', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:43:06.563' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435662073927', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:43:06.707' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435671638088', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:43:09.043' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435671679045', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:43:09.053' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435722879045', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:43:21.550' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435722944581', N'用戶訪問', N'訪問日志', N'', N'categorytypes/load', CAST(N'2022-08-22T08:43:21.567' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435745030214', N'用戶訪問', N'訪問日志', N'', N'check/getsuborgs', CAST(N'2022-08-22T08:43:26.960' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323435745042503', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:43:26.963' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436687605829', N'用戶訪問', N'訪問日志', N'', N'orgs/add', CAST(N'2022-08-22T08:47:17.080' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436688154694', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:47:17.213' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436760232006', N'用戶訪問', N'訪問日志', N'', N'orgs/add', CAST(N'2022-08-22T08:47:34.810' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436760461382', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:47:34.867' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436798099528', N'用戶訪問', N'訪問日志', N'', N'orgs/add', CAST(N'2022-08-22T08:47:44.057' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436798361670', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:47:44.120' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436832604232', N'用戶訪問', N'訪問日志', N'', N'orgs/add', CAST(N'2022-08-22T08:47:52.480' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436832841799', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:47:52.540' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436876943430', N'用戶訪問', N'訪問日志', N'', N'orgs/add', CAST(N'2022-08-22T08:48:03.307' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436877180999', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:48:03.363' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436926124102', N'用戶訪問', N'訪問日志', N'', N'orgs/add', CAST(N'2022-08-22T08:48:15.313' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436926394438', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:48:15.377' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436962029640', N'用戶訪問', N'訪問日志', N'', N'orgs/add', CAST(N'2022-08-22T08:48:24.080' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323436962213958', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:48:24.123' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437011189829', N'用戶訪問', N'訪問日志', N'', N'orgs/update', CAST(N'2022-08-22T08:48:36.080' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437011558470', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:48:36.170' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437071425607', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T08:48:50.787' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437071626310', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T08:48:50.837' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437072048197', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:48:50.937' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437072678981', N'用戶訪問', N'訪問日志', N'', N'check/getsuborgs', CAST(N'2022-08-22T08:48:51.093' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437072687175', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:48:51.093' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437125365832', N'用戶訪問', N'訪問日志', N'', N'roles/load', CAST(N'2022-08-22T08:49:03.957' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437125603405', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:49:04.013' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437125607493', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:49:04.013' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437125656648', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:49:04.027' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437125660745', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:49:04.027' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437125677127', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:49:04.030' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437125681226', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:49:04.033' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437125713993', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-22T08:49:04.040' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437176328261', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:49:16.397' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437176352839', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:49:16.403' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437317976134', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-22T08:49:50.980' AS DateTime), N'CEAI_ADMIN', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437323395141', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T08:49:52.303' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437323604037', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T08:49:52.353' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437323931717', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:49:52.433' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437337010250', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:49:55.627' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437337055301', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:49:55.637' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437374021701', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:50:04.663' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437374066757', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:50:04.673' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437445357639', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:50:22.080' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437564055621', N'用戶訪問', N'訪問日志', N'', N'categorys/add', CAST(N'2022-08-22T08:50:51.057' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437565694022', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:50:51.457' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437613142086', N'用戶訪問', N'訪問日志', N'', N'categorys/add', CAST(N'2022-08-22T08:51:03.043' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437613682758', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:51:03.173' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437645078599', N'用戶訪問', N'訪問日志', N'', N'categorys/add', CAST(N'2022-08-22T08:51:10.840' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437645312071', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:51:10.897' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437677793351', N'用戶訪問', N'訪問日志', N'', N'categorys/add', CAST(N'2022-08-22T08:51:18.827' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437678211143', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:51:18.927' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437712597061', N'用戶訪問', N'訪問日志', N'', N'categorys/add', CAST(N'2022-08-22T08:51:27.323' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437712879687', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:51:27.393' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437745176646', N'用戶訪問', N'訪問日志', N'', N'categorys/add', CAST(N'2022-08-22T08:51:35.277' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437745393734', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:51:35.330' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437803577413', N'用戶訪問', N'訪問日志', N'', N'categorys/add', CAST(N'2022-08-22T08:51:49.533' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437803851845', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:51:49.600' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437841023047', N'用戶訪問', N'訪問日志', N'', N'categorys/add', CAST(N'2022-08-22T08:51:58.677' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323437841260615', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:51:58.733' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438235701319', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:53:35.033' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438235844677', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:53:35.067' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438246957125', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T08:53:37.780' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438247129157', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T08:53:37.823' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438247346245', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:53:37.877' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438247940169', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:53:38.020' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438247977029', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:53:38.030' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438299099210', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:53:50.513' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438315323463', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:53:54.473' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438324166725', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:53:56.630' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438349172805', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T08:54:02.737' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438349221959', N'用戶訪問', N'訪問日志', N'', N'categorytypes/load', CAST(N'2022-08-22T08:54:02.750' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438375264327', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:54:09.107' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438375284805', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:54:09.110' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438473916485', N'用戶訪問', N'訪問日志', N'', N'check/logout', CAST(N'2022-08-22T08:54:33.190' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438496284742', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-22T08:54:38.653' AS DateTime), N'CEAI_ADMIN', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438502613061', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T08:54:40.197' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438502756421', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T08:54:40.233' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438502944837', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:54:40.280' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438513954890', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:54:42.967' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438513995845', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:54:42.977' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438647107655', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:55:15.473' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438647132229', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:55:15.480' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438740979781', N'用戶訪問', N'訪問日志', N'', N'users/delete', CAST(N'2022-08-22T08:55:38.393' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438768439369', N'用戶訪問', N'訪問日志', N'', N'users/delete', CAST(N'2022-08-22T08:55:45.097' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438801379402', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:55:53.140' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438801416261', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:55:53.147' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438885326918', N'用戶訪問', N'訪問日志', N'', N'check/getmodules', CAST(N'2022-08-22T08:56:13.633' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438885892165', N'用戶訪問', N'訪問日志', N'', N'modules/loadmenus', CAST(N'2022-08-22T08:56:13.770' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438919532613', N'用戶訪問', N'訪問日志', N'', N'dataprivilegerules/load', CAST(N'2022-08-22T08:56:21.983' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438964703302', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T08:56:33.013' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438964842566', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T08:56:33.047' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438965252167', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:56:33.147' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438965866570', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:56:33.297' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438965882951', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:56:33.300' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438994178117', N'用戶訪問', N'訪問日志', N'', N'check/getsuborgs', CAST(N'2022-08-22T08:56:40.207' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323438994190407', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:56:40.213' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439043452997', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:56:52.240' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439043809352', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:56:52.327' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439043817541', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:56:52.327' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439095898186', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:57:05.043' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439096111174', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:57:05.093' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439096115273', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:57:05.097' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439126564937', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:57:12.530' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439126806597', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:57:12.587' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439126818885', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:57:12.590' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439138742341', N'用戶訪問', N'訪問日志', N'', N'accessobjs/assignorgusers', CAST(N'2022-08-22T08:57:15.503' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439151083594', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:57:18.517' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439151308870', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:57:18.570' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439151312966', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:57:18.570' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439159341125', N'用戶訪問', N'訪問日志', N'', N'accessobjs/assignorgusers', CAST(N'2022-08-22T08:57:20.530' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439182348361', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:57:26.150' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439182590021', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:57:26.207' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439182598218', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:57:26.210' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439190716485', N'用戶訪問', N'訪問日志', N'', N'accessobjs/assignorgusers', CAST(N'2022-08-22T08:57:28.190' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439206191173', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:57:31.970' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439206395973', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:57:32.020' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439206400073', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:57:32.020' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439217373255', N'用戶訪問', N'訪問日志', N'', N'accessobjs/assignorgusers', CAST(N'2022-08-22T08:57:34.700' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439229173829', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:57:37.580' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439229411399', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:57:37.640' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439229423689', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:57:37.640' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439239790662', N'用戶訪問', N'訪問日志', N'', N'accessobjs/assignorgusers', CAST(N'2022-08-22T08:57:40.173' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439253856329', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:57:43.607' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439254171717', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:57:43.683' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439254179914', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:57:43.687' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439262953543', N'用戶訪問', N'訪問日志', N'', N'accessobjs/assignorgusers', CAST(N'2022-08-22T08:57:45.827' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439275364423', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:57:48.857' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439275581511', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:57:48.910' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439275589701', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:57:48.913' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439286452293', N'用戶訪問', N'訪問日志', N'', N'accessobjs/assignorgusers', CAST(N'2022-08-22T08:57:51.563' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439306612810', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:57:56.487' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439306833990', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:57:56.540' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439306838089', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:57:56.540' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439315812424', N'用戶訪問', N'訪問日志', N'', N'accessobjs/assignorgusers', CAST(N'2022-08-22T08:57:58.733' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439329435720', N'用戶訪問', N'訪問日志', N'', N'users/loadbyorg', CAST(N'2022-08-22T08:58:02.060' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439329706055', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:58:02.123' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439329718346', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:58:02.127' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439340847175', N'用戶訪問', N'訪問日志', N'', N'accessobjs/assignorgusers', CAST(N'2022-08-22T08:58:04.843' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439370227787', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:58:12.017' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439370252357', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:58:12.023' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439628324933', N'用戶訪問', N'訪問日志', N'', N'check/logout', CAST(N'2022-08-22T08:59:15.030' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439662956614', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-22T08:59:23.483' AS DateTime), N'CEAI_ADMIN', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439667335237', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T08:59:24.553' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439667597381', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T08:59:24.617' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439667798085', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:59:24.667' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439680630857', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:59:27.800' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439680667717', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:59:27.810' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439793467465', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T08:59:55.347' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439793483845', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T08:59:55.350' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439883337800', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T09:00:17.290' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439883370565', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T09:00:17.297' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439936200775', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:30.193' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439954186311', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:34.587' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439965278280', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:37.293' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439975395399', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:39.763' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323439985803333', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:42.303' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440000901192', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:45.990' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440011399239', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:48.553' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440022294598', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:51.213' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440033583173', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:53.970' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440044871751', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:56.727' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440055889991', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T09:00:59.417' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440068300870', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T09:01:02.447' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440077951045', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T09:01:04.800' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440078430277', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T09:01:04.917' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440078618693', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T09:01:04.963' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440079048775', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T09:01:05.070' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440908206154', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-22T09:04:27.500' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323440908259397', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T09:04:27.513' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478145237061', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-22T11:35:58.573' AS DateTime), N'CEAI_ADMIN', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478153433157', N'用戶訪問', N'訪問日志', N'', N'check/getuserprofile', CAST(N'2022-08-22T11:36:00.573' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478155800645', N'用戶訪問', N'訪問日志', N'', N'orgcheckforms/loadbyorg', CAST(N'2022-08-22T11:36:01.150' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478157414470', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-22T11:36:01.547' AS DateTime), N'System', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478163853381', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T11:36:03.117' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478164168774', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T11:36:03.193' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478164795462', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T11:36:03.347' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478417809477', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:37:05.120' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478417842245', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T11:37:05.127' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478680186949', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-22T11:38:09.177' AS DateTime), N'CEAI_ADMIN', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478685995077', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T11:38:10.593' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478686343237', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T11:38:10.680' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478686781509', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T11:38:10.787' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478699958344', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:38:14.003' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478700142663', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T11:38:14.047' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478736625733', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:38:22.953' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478737391685', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:38:23.140' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478758858821', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T11:38:28.383' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478759030855', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T11:38:28.423' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478759567430', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T11:38:28.557' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478760230983', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:38:28.717' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478760251463', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T11:38:28.723' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478850027589', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:38:50.640' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478850498632', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:38:50.757' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478884405319', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:38:59.033' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478884745287', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:38:59.117' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478908497990', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T11:39:04.917' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478908862534', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T11:39:05.003' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478909329479', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T11:39:05.120' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478910001221', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:39:05.283' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323478910005319', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T11:39:05.283' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479261261893', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T11:40:31.040' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479380230216', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:41:00.083' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479381008456', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:41:00.273' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479591120965', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:41:51.570' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479591694406', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:41:51.710' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479628890181', N'用戶訪問', N'訪問日志', N'', N'questions/delete', CAST(N'2022-08-22T11:42:00.793' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479641342021', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T11:42:03.833' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479641698373', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T11:42:03.920' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479642370117', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T11:42:04.083' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479643545672', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:42:04.370' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479643598919', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T11:42:04.383' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479816675397', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:42:46.637' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479817547845', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:42:46.850' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479959429191', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:43:21.490' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323479960027207', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:43:21.637' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480066363461', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:43:47.597' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480066850885', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:43:47.717' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480176013381', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:44:14.367' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480176496712', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:44:14.487' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480276144197', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:44:38.813' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480276652101', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:44:38.937' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480387285063', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:45:05.947' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480387792967', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:45:06.070' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480490307653', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:45:31.100' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480490872903', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:45:31.237' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480519835717', N'用戶訪問', N'訪問日志', N'', N'questions/update', CAST(N'2022-08-22T11:45:38.310' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480520814661', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:45:38.547' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480642420806', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:46:08.237' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480643121223', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:46:08.407' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480754036807', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:46:35.487' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480754581573', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:46:35.620' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480950427719', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:47:23.433' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323480950935624', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:47:23.557' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481057808453', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:47:49.650' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481058312264', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:47:49.773' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481338323013', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:48:58.133' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481338896455', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:48:58.273' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481435181126', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:49:21.780' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481435770949', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:49:21.927' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481531441223', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:49:45.283' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481532141639', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:49:45.453' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481652158533', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:50:14.753' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481652895813', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:50:14.933' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481997062213', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:51:38.960' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323481997570119', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:51:39.083' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482149830727', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:52:16.257' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482150408263', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:52:16.397' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482243207237', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:52:39.053' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482243674183', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:52:39.167' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482342940741', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:53:03.403' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482343452744', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:53:03.527' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482455212101', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:53:30.813' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482456277063', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:53:31.073' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482576355397', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:54:00.387' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482576920648', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:54:00.527' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482670800965', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:54:23.447' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482671378504', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:54:23.587' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482782318664', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:54:50.673' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482782830664', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:54:50.797' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482963607623', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:55:34.933' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323482964193349', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:55:35.077' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483091890248', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:56:06.253' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483092459591', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:56:06.390' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483353276487', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:57:10.067' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483353935944', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:57:10.227' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483457888327', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:57:35.607' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483458510919', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:57:35.760' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483569135687', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:58:02.767' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483569754181', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:58:02.917' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483743789127', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:58:45.407' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483744305223', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:58:45.533' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483904606277', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:59:24.667' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323483905134661', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:59:24.797' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484010430535', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T11:59:50.503' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484011102277', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T11:59:50.667' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484367618119', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:01:17.710' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484368842824', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:01:18.007' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484486234181', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:01:46.667' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484490485832', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:01:47.707' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484593500229', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:02:12.857' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484594020423', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:02:12.983' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484709064773', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:02:41.070' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484709609541', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:02:41.203' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484819710023', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:03:08.083' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484820262984', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:03:08.217' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484949393480', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:03:39.743' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323484951633990', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:03:40.290' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485342433349', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:05:15.700' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485343076424', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:05:15.857' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485502632006', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:05:54.810' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485503086661', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:05:54.923' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485613084742', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:06:21.777' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485613629511', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:06:21.910' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485712224327', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:06:45.980' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485712855109', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:06:46.137' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485803614277', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:07:08.293' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485804093509', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:07:08.410' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485917782085', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:07:36.167' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323485918478408', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:07:36.337' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486011076677', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:07:58.943' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486011539528', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:07:59.057' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486103478344', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:08:21.503' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486104150087', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:08:21.667' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486193094726', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:08:43.380' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486193549383', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:08:43.493' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486330679367', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:09:16.970' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486331179077', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:09:17.093' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486438895685', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:09:43.390' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486439419973', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:09:43.520' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486535155784', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:10:06.893' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486536482888', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:10:07.217' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486686744645', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:10:43.900' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486687313992', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:10:44.040' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486786867272', N'用戶訪問', N'訪問日志', N'', N'questions/update', CAST(N'2022-08-22T12:11:08.347' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486787608647', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:11:08.527' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486914752584', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:11:39.567' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323486915321928', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:11:39.707' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323487097724999', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:12:24.240' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323487098232901', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:12:24.363' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323487424974919', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:13:44.133' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323487425503301', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:13:44.263' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323487553310789', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:14:15.467' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323487554248776', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:14:15.693' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323487654740037', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T12:14:40.227' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323487655256134', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T12:14:40.353' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323537491075141', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-22T15:37:27.303' AS DateTime), N'CEAI_ADMIN', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323537498902597', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-22T15:37:29.213' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323537499062341', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-22T15:37:29.253' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323537499807813', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-22T15:37:29.433' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323537665019973', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:38:09.770' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323537665019974', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T15:38:09.770' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323537859407941', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T15:38:57.227' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323537892393030', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-22T15:39:05.280' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323537892487237', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:39:05.303' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323538397712453', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:41:08.650' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323538409091143', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:41:11.427' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323540985548869', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:51:40.447' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323540985827397', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:51:40.513' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541149921349', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:52:20.577' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541151191111', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:52:20.887' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541346472005', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:53:08.560' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541346779208', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:53:08.637' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541494239303', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:53:44.637' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541494501447', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:53:44.700' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541625454661', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:54:16.673' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541625770055', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:54:16.750' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541780983877', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:54:54.643' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541781200967', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:54:54.697' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541908684871', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:55:25.820' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323541908918343', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:55:25.877' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542055891013', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:56:01.760' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542056271941', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:56:01.853' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542193602629', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:56:35.380' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542193840198', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:56:35.437' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542323036229', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:57:06.980' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542323314757', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:57:07.047' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542448418885', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:57:37.590' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542448660549', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:57:37.650' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542596780101', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:58:13.813' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542597120071', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:58:13.897' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542746587206', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:58:50.387' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542746878021', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:58:50.457' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542861103173', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T15:59:18.343' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323542861344840', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T15:59:18.403' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543057842246', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:00:06.377' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543058141255', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:00:06.450' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543194542149', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:00:39.750' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543194755141', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:00:39.803' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543311720517', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:01:08.357' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543311974471', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:01:08.420' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543462703173', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:01:45.220' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543463108677', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:01:45.317' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543628062789', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:02:25.590' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543628320840', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:02:25.653' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543823093831', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:03:13.207' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323543823384645', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:03:13.277' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544054763592', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:04:09.767' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544055074888', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:04:09.843' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544178516037', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:04:39.977' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544178757702', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:04:40.037' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544304513093', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:05:10.740' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544304754757', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:05:10.797' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544423342149', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:05:39.750' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544423559239', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:05:39.803' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544525312069', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:06:04.647' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544525545541', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:06:04.703' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544651530309', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:06:35.460' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544651755590', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:06:35.517' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544822018119', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:07:17.083' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323544822267975', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:07:17.143' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323545268330567', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:09:06.047' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323545268568133', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:09:06.103' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323545395290181', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:09:37.043' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323545395507269', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:09:37.097' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323545624506440', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:10:33.003' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323545624850504', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:10:33.087' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323545848864837', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:11:27.780' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323545849102406', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:11:27.837' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546164875335', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:12:44.930' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546165088328', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:12:44.983' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546290348103', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:13:15.563' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546290581574', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:13:15.620' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546413379655', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:13:45.600' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546413637704', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:13:45.663' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546507894855', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:14:08.673' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546508116040', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:14:08.730' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546630791237', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:14:38.677' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546631082056', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:14:38.750' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546744655944', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:15:06.477' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546744897608', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:15:06.537' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546858352709', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:15:34.237' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546858750021', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:15:34.333' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546980085832', N'用戶訪問', N'訪問日志', N'', N'questions/add', CAST(N'2022-08-22T16:16:03.957' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323546980315208', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-22T16:16:04.013' AS DateTime), N'321089205329989', N'CEAI_ADMIN', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323570289811525', N'用戶登錄,結果：用戶不存在', N'登錄日志', N'', N'', CAST(N'2022-08-22T17:50:54.807' AS DateTime), N'Jung01', N'Jung01', N'', 1, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323570320080965', N'用戶登錄,結果：用戶不存在', N'登錄日志', N'', N'', CAST(N'2022-08-22T17:51:02.197' AS DateTime), N'Jung', N'Jung', N'', 1, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323570340917317', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-22T17:51:07.283' AS DateTime), N'System', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323570347298885', N'用戶訪問', N'訪問日志', N'', N'check/getuserprofile', CAST(N'2022-08-22T17:51:08.840' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323570349174853', N'用戶訪問', N'訪問日志', N'', N'orgcheckforms/loadbyorg', CAST(N'2022-08-22T17:51:09.300' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323858682212421', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-23T13:24:23.107' AS DateTime), N'System', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323858690617413', N'用戶訪問', N'訪問日志', N'', N'check/getuserprofile', CAST(N'2022-08-23T13:24:25.160' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'323858692636741', N'用戶訪問', N'訪問日志', N'', N'orgcheckforms/loadbyorg', CAST(N'2022-08-23T13:24:25.653' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324182961524805', N'用戶登錄,結果：用戶不存在', N'登錄日志', N'', N'', CAST(N'2022-08-24T11:23:52.863' AS DateTime), N'Admin', N'Admin', N'', 1, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324183035867205', N'用戶登錄,結果：用戶不存在', N'登錄日志', N'', N'', CAST(N'2022-08-24T11:24:11.010' AS DateTime), N'Admin', N'Admin', N'', 1, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324183068188741', N'用戶登錄,結果：用戶不存在', N'登錄日志', N'', N'', CAST(N'2022-08-24T11:24:18.903' AS DateTime), N'Jung01', N'Jung01', N'', 1, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324186502504517', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-24T11:38:17.360' AS DateTime), N'System', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324186506518597', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-24T11:38:18.340' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324186509340742', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-24T11:38:19.027' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324186515873862', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:38:20.623' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324186538016837', N'用戶訪問', N'訪問日志', N'', N'buildertables/allmain', CAST(N'2022-08-24T11:38:26.030' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324186538053701', N'用戶訪問', N'訪問日志', N'', N'buildertables/load', CAST(N'2022-08-24T11:38:26.037' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324186554368069', N'用戶訪問', N'訪問日志', N'', N'buildertablecolumns/load', CAST(N'2022-08-24T11:38:30.020' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324186886160453', N'用戶訪問', N'訪問日志', N'', N'buildertablecolumns/load', CAST(N'2022-08-24T11:39:51.023' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324186894991430', N'用戶訪問', N'訪問日志', N'', N'buildertablecolumns/load', CAST(N'2022-08-24T11:39:53.180' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187244396614', N'用戶訪問', N'訪問日志', N'', N'check/getmodules', CAST(N'2022-08-24T11:41:18.483' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187248554053', N'用戶訪問', N'訪問日志', N'', N'modules/loadmenus', CAST(N'2022-08-24T11:41:19.500' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187268939845', N'用戶訪問', N'訪問日志', N'', N'roles/load', CAST(N'2022-08-24T11:41:24.477' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187271557189', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-24T11:41:25.117' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187271663687', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:41:25.140' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187274743878', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-24T11:41:25.893' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187274756170', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-24T11:41:25.897' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187274793029', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-24T11:41:25.907' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187274813510', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-24T11:41:25.910' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187274833991', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-24T11:41:25.917' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187274842184', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-24T11:41:25.917' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187277164613', N'用戶訪問', N'訪問日志', N'', N'users/loadbyrole', CAST(N'2022-08-24T11:41:26.483' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187282051141', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-24T11:41:27.677' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324187282124869', N'用戶訪問', N'訪問日志', N'', N'categorytypes/load', CAST(N'2022-08-24T11:41:27.697' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188728037446', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:47:20.700' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188728041542', N'用戶訪問', N'訪問日志', N'', N'check/getuserprofile', CAST(N'2022-08-24T11:47:20.703' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188728062022', N'用戶訪問', N'訪問日志', N'', N'check/getmodules', CAST(N'2022-08-24T11:47:20.707' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188749549637', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:47:25.953' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188752941126', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:47:26.780' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188793012293', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:47:36.563' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188799086663', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:47:38.047' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188815790150', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:47:42.127' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188872589383', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:47:55.993' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188899930183', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:48:02.667' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188907208774', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:48:04.443' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188908597318', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:48:04.783' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188909928519', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:48:05.110' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188911288390', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:48:05.440' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188914495559', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:48:06.223' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188915904583', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:48:06.567' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188917522502', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:48:06.963' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324188975575109', N'用戶訪問', N'訪問日志', N'', N'flowinstances/load', CAST(N'2022-08-24T11:48:21.137' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189149929542', N'用戶登錄,結果：操作成功', N'登錄日志', N'', N'', CAST(N'2022-08-24T11:49:03.703' AS DateTime), N'System', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189152215110', N'用戶訪問', N'訪問日志', N'', N'check/getusername', CAST(N'2022-08-24T11:49:04.260' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189157339207', N'用戶訪問', N'訪問日志', N'', N'check/getmodulestree', CAST(N'2022-08-24T11:49:05.510' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189163180102', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:49:06.937' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189194563654', N'用戶訪問', N'訪問日志', N'', N'forms/load', CAST(N'2022-08-24T11:49:14.600' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189206786117', N'用戶訪問', N'訪問日志', N'', N'buildertables/load', CAST(N'2022-08-24T11:49:17.583' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189266968645', N'用戶訪問', N'訪問日志', N'', N'forms/load', CAST(N'2022-08-24T11:49:32.277' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189286457417', N'用戶訪問', N'訪問日志', N'', N'buildertables/load', CAST(N'2022-08-24T11:49:37.033' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189776609349', N'用戶訪問', N'訪問日志', N'', N'files/load', CAST(N'2022-08-24T11:51:36.700' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189830561862', N'用戶訪問', N'訪問日志', N'', N'files/load', CAST(N'2022-08-24T11:51:49.873' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189851308101', N'用戶訪問', N'訪問日志', N'', N'checkformresults/load', CAST(N'2022-08-24T11:51:54.937' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189857644613', N'用戶訪問', N'訪問日志', N'', N'dataprivilegerules/load', CAST(N'2022-08-24T11:51:56.483' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189869133893', N'用戶訪問', N'訪問日志', N'', N'resources/load', CAST(N'2022-08-24T11:51:59.290' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189869158469', N'用戶訪問', N'訪問日志', N'', N'applications/load', CAST(N'2022-08-24T11:51:59.297' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189912813637', N'用戶訪問', N'訪問日志', N'', N'checkforms/load', CAST(N'2022-08-24T11:52:09.953' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189912883269', N'用戶訪問', N'訪問日志', N'', N'questions/load', CAST(N'2022-08-24T11:52:09.970' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189926596680', N'用戶訪問', N'訪問日志', N'', N'checkforms/load', CAST(N'2022-08-24T11:52:13.320' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189926649925', N'用戶訪問', N'訪問日志', N'', N'orgcheckforms/load', CAST(N'2022-08-24T11:52:13.333' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189926715463', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:52:13.347' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189935054917', N'用戶訪問', N'訪問日志', N'', N'categorys/load', CAST(N'2022-08-24T11:52:15.383' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189942386757', N'用戶訪問', N'訪問日志', N'', N'users/load', CAST(N'2022-08-24T11:52:17.173' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
INSERT [dbo].[SysLog] ([Id], [Content], [TypeName], [TypeId], [Href], [CreateTime], [CreateId], [CreateName], [Ip], [Result], [Application]) VALUES (N'324189942394951', N'用戶訪問', N'訪問日志', N'', N'check/getorgs', CAST(N'2022-08-24T11:52:17.177' AS DateTime), N'00000000-0000-0000-0000-000000000000', N'System', N'', 0, N'OsSYS.WebApi')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_FLOWINSTANCE]    Script Date: 2022/8/24 下午 05:40:34 ******/
ALTER TABLE [dbo].[FlowInstance] ADD  CONSTRAINT [PK_FLOWINSTANCE] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_FLOWINSTANCEOPERATIONHISTOR]    Script Date: 2022/8/24 下午 05:40:34 ******/
ALTER TABLE [dbo].[FlowInstanceOperationHistory] ADD  CONSTRAINT [PK_FLOWINSTANCEOPERATIONHISTOR] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_FLOWINSTANCETRANSITIONHISTO]    Script Date: 2022/8/24 下午 05:40:34 ******/
ALTER TABLE [dbo].[FlowInstanceTransitionHistory] ADD  CONSTRAINT [PK_FLOWINSTANCETRANSITIONHISTO] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_FLOWSCHEME]    Script Date: 2022/8/24 下午 05:40:34 ******/
ALTER TABLE [dbo].[FlowScheme] ADD  CONSTRAINT [PK_FLOWSCHEME] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_FORM]    Script Date: 2022/8/24 下午 05:40:34 ******/
ALTER TABLE [dbo].[Form] ADD  CONSTRAINT [PK_FORM] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT ((0)) FOR [FrmType]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT ((0)) FOR [FlowLevel]
GO
ALTER TABLE [dbo].[FlowInstance] ADD  DEFAULT ((0)) FOR [IsFinish]
GO
ALTER TABLE [dbo].[FlowInstanceOperationHistory] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[FlowInstanceTransitionHistory] ADD  DEFAULT ((0)) FOR [TransitionSate]
GO
ALTER TABLE [dbo].[FlowInstanceTransitionHistory] ADD  DEFAULT ((0)) FOR [IsFinish]
GO
ALTER TABLE [dbo].[FlowInstanceTransitionHistory] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [FrmType]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [AuthorizeType]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [SortCode]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [DeleteMark]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[FlowScheme] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT ((0)) FOR [FrmType]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT ((0)) FOR [Fields]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT ((0)) FOR [SortCode]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT ((0)) FOR [DeleteMark]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[Form] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OpenJob] ADD  DEFAULT ((0)) FOR [RunCount]
GO
ALTER TABLE [dbo].[OpenJob] ADD  DEFAULT ((0)) FOR [ErrorCount]
GO
ALTER TABLE [dbo].[OpenJob] ADD  DEFAULT ((0)) FOR [JobType]
GO
ALTER TABLE [dbo].[OpenJob] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[OpenJob] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [CascadeId]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [HotKey]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [ParentName]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((1)) FOR [IsLeaf]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((0)) FOR [IsAutoExpand]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [IconName]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [BizCode]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (' ') FOR [CustomCode]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((0)) FOR [CreateId]
GO
ALTER TABLE [dbo].[Org] ADD  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[Relevance] ADD  DEFAULT (' ') FOR [Description]
GO
ALTER TABLE [dbo].[Relevance] ADD  DEFAULT (' ') FOR [Key]
GO
ALTER TABLE [dbo].[Relevance] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Relevance] ADD  DEFAULT (getdate()) FOR [OperateTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'App密鑰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'AppSecret'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'說明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'圖標' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Disable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuilderTable', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'DtCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'DtValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'說明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類別序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類別名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'啟用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Enable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'UpdateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'UpdateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryType', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryType', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryType', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'數據ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資源標識（模塊編號）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'SourceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'二級資源標識' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'SubSourceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'權限描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'權限規則' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'PrivilegeRules'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'Enable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後更新時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後更新人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'UpdateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule', @level2type=N'COLUMN',@level2name=N'UpdateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系統授權規制表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataPrivilegeRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主鍵Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程實例模板Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'InstanceSchemeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'實例編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定義名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'CustomName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當前節點ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'ActivityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當前節點類型（0會簽節點）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'ActivityType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當前節點名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'ActivityName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前一個ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'PreviousId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'SchemeContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'SchemeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'數據庫名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'DbName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單數據' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單中的控件屬性描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmContentData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單控件位置模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmContentParse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FrmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'SchemeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效標誌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'Disabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建用戶主鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建用戶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等級' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'FlowLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'實例備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'IsFinish'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'執行人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'MakerList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所屬部門' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance', @level2type=N'COLUMN',@level2name=N'OrgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流流程實例表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主鍵Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'實例進程Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'InstanceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建用戶主鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建用戶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流實例操作記錄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceOperationHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主鍵Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'實例Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'InstanceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始節點Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'FromNodeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始節點類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'FromNodeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始節點名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'FromNodeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結束節點Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'ToNodeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結束節點類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'ToNodeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結束節點名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'ToNodeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轉化狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'TransitionSate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否結束' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'IsFinish'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轉化時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流實例流轉歷史記錄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowInstanceTransitionHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主鍵Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程分類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程內容版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板使用者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeCanUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SchemeContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'FrmId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'FrmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板權限類型：0完全公開,1指定部門/人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'AuthorizeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刪除標記' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'Disabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建用戶主鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建用戶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用戶主鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用戶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所屬部門' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme', @level2type=N'COLUMN',@level2name=N'OrgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流模板信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowScheme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單模板Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單類型，0：默認動態表單；1：Web自定義表單' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'FrmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系統頁面標識，當表單類型為用Web自定義的表單時，需要標識加載哪個頁面' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'WebId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段個數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Fields'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單中的控件屬性描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ContentData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單控件位置模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ContentParse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單原html模板未經處理的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刪除標記' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'數據庫名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'DbName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Disabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建用戶主鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建用戶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用戶主鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用戶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所屬部門' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form', @level2type=N'COLUMN',@level2name=N'OrgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表單模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Form'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模塊流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點語義ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模塊名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主頁面URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'熱鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否葉子節點' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IsLeaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自動展開' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IsAutoExpand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點圖標文件名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IconName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當前狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父節點名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'矢量圖標' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Vector'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父節點流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否為系統模塊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IsSys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DOM ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'DomId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素附加屬性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Attr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素調用腳本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Script'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素圖標' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素樣式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模塊Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'ModuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任務名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'JobName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任務執行次數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'RunCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'異常次數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'ErrorCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下次執行時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'NextRunTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後一次執行時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'LastRunTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後一次失敗時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'LastErrorTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任務執行方式0：本地任務；1：外部接口任務' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'JobType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任務地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'JobCall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任務參數，JSON格式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'JobCallParams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CRON表達式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'Cron'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任務運行狀態（0：停止，1：正在運行，2：暫停）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後更新時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後更新人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'UpdateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'UpdateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所屬部門' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob', @level2type=N'COLUMN',@level2name=N'OrgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'定時任務' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpenJob'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點語義ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'熱鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父節點名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否葉子節點' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IsLeaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自動展開' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IsAutoExpand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點圖標文件名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IconName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當前狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'業務對照碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'BizCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定義擴展碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CustomCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父節點流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'映射標識' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授權時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'OperateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授權人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'OperatorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第一個表主鍵ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'FirstId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二個表主鍵ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'SecondId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第三個表主鍵ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'ThirdId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'擴展信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'ExtendInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多對多關係集中映射' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資源標識' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'節點語義ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父節點名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父節點流ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資源所屬應用ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'AppId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所屬應用名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'AppName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Disable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後更新時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後更新人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'UpdateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'UpdateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當前狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日誌內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作所屬模塊地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'Href'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'記錄時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'CreateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作機器的IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'Ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作的結果：0：成功；1：失敗；' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'Result'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所屬應用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'Application'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息源頭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'FromId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到達' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'ToId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息源頭名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'FromName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息到達名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'ToName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1:已刪除；0:默認' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'FromStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1:已刪除；0:默認未讀；1：已讀' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'ToStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'點擊消息跳轉的頁面等' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'Href'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMessage', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件路徑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'FilePath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'FileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'FileSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'擴展名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'Extension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'Enable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刪除標識' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上傳人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上傳人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上傳時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'縮略圖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'Thumbnail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所屬應用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'BelongApp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所屬應用ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UploadFile', @level2type=N'COLUMN',@level2name=N'BelongAppId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'業務對照碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'BizCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建人序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類別名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類別序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'信箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手機' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Phone'
GO
