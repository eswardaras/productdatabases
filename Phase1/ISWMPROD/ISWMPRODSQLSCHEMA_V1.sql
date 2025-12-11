USE [master]
GO
/****** Object:  Database [ISWMPROD]    Script Date: 12/11/2025 11:18:51 AM ******/
CREATE DATABASE [ISWMPROD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ISWMPROD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\ISWMPROD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ISWMPROD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\ISWMPROD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ISWMPROD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ISWMPROD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ISWMPROD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ISWMPROD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ISWMPROD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ISWMPROD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ISWMPROD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ISWMPROD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ISWMPROD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ISWMPROD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ISWMPROD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ISWMPROD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ISWMPROD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ISWMPROD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ISWMPROD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ISWMPROD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ISWMPROD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ISWMPROD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ISWMPROD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ISWMPROD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ISWMPROD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ISWMPROD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ISWMPROD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ISWMPROD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ISWMPROD] SET  MULTI_USER 
GO
ALTER DATABASE [ISWMPROD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ISWMPROD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ISWMPROD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ISWMPROD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ISWMPROD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ISWMPROD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ISWMPROD] SET QUERY_STORE = ON
GO
ALTER DATABASE [ISWMPROD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ISWMPROD]
GO
/****** Object:  Table [dbo].[ApplicationLogs]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationLogs](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[LogDate] [datetime2](0) NOT NULL,
	[LogLevel] [nvarchar](20) NOT NULL,
	[Application] [nvarchar](100) NULL,
	[Module] [nvarchar](100) NULL,
	[UserId] [bigint] NULL,
	[Message] [nvarchar](2000) NOT NULL,
	[Exception] [nvarchar](max) NULL,
	[SourceIP] [nvarchar](45) NULL,
	[CorrelationId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordResets]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordResets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](400) NULL,
	[Otp] [nvarchar](50) NULL,
	[Expiry] [datetime] NULL,
	[Used] [bit] NULL,
 CONSTRAINT [PK__Password__3214EC07ABD13D23] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortalUsers]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortalUsers](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[PasswordHash] [varbinary](max) NOT NULL,
	[IsMFAEnabled] [bit] NOT NULL,
	[MFAType] [nvarchar](50) NULL,
	[UserType] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[LastLoginAt] [datetime] NULL,
 CONSTRAINT [PK__PortalUs__1788CC4CAE936321] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProdUsers]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdUsers](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[Role] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TokenHash] [nvarchar](400) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpiresAt] [datetime] NOT NULL,
	[Revoked] [bit] NOT NULL,
	[ReplacedByToken] [nvarchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMfa]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMfa](
	[UserId] [uniqueidentifier] NOT NULL,
	[IsMfaEnabled] [bit] NOT NULL,
	[MfaMethod] [nvarchar](20) NULL,
	[EmailOtp] [nvarchar](10) NULL,
	[OtpExpiry] [datetime] NULL,
	[SmsOtp] [nvarchar](10) NULL,
	[SmsOtpExpiry] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[Role] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PasswordResets] ON 
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (1, N'Pavan@gmail.com', N'634630', CAST(N'2025-12-09T09:40:25.193' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (2, N'pavan@gmail.com', N'209340', CAST(N'2025-12-09T09:47:30.840' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (3, N'pavan@gmail.com', N'920422', CAST(N'2025-12-09T10:02:28.940' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (4, N'Pavan@gmail.com', N'782886', CAST(N'2025-12-09T10:08:01.093' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (5, N'pavan.pasupuleti909@gmail.com', N'719563', CAST(N'2025-12-09T10:12:19.490' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (6, N'pavan.pasupuleti909@gmail.com', N'142094', CAST(N'2025-12-09T10:18:43.647' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (7, N'pavan.pasupuleti909@gmail.com', N'915555', CAST(N'2025-12-09T10:23:56.403' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (8, N'pavan.pasupuleti909@gmail.com', N'533905', CAST(N'2025-12-09T11:09:46.677' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (9, N'pavan.pasupuleti909@gmail.com', N'559591', CAST(N'2025-12-09T12:56:06.020' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (10, N'pavan.pasupuleti909@gmail.com', N'343172', CAST(N'2025-12-09T13:20:49.433' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (11, N'pavan.pasupuleti909@gmail.com', N'255696', CAST(N'2025-12-09T13:29:35.763' AS DateTime), 0)
GO
INSERT [dbo].[PasswordResets] ([Id], [Email], [Otp], [Expiry], [Used]) VALUES (12, N'pavan.pasupuleti909@gmail.com', N'720271', CAST(N'2025-12-09T13:38:53.050' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[PasswordResets] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshTokens] ON 
GO
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [TokenHash], [CreatedAt], [ExpiresAt], [Revoked], [ReplacedByToken]) VALUES (1, N'935274d2-1328-4349-845c-3eafb021a076', N'93dc527261a713a71320ee1d6c24b7fd5cf6db2e9bb7e6661497c7c86fb86a99', CAST(N'2025-12-09T21:31:39.193' AS DateTime), CAST(N'2026-01-08T16:01:39.110' AS DateTime), 1, N'eed8fd097b9c62806cb7082152408425634bbf85045a2dc7993f38bc99b826b9')
GO
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [TokenHash], [CreatedAt], [ExpiresAt], [Revoked], [ReplacedByToken]) VALUES (2, N'935274d2-1328-4349-845c-3eafb021a076', N'eed8fd097b9c62806cb7082152408425634bbf85045a2dc7993f38bc99b826b9', CAST(N'2025-12-09T21:32:26.743' AS DateTime), CAST(N'2026-01-08T16:02:26.440' AS DateTime), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[RefreshTokens] OFF
GO
INSERT [dbo].[UserMfa] ([UserId], [IsMfaEnabled], [MfaMethod], [EmailOtp], [OtpExpiry], [SmsOtp], [SmsOtpExpiry]) VALUES (N'935274d2-1328-4349-845c-3eafb021a076', 1, N'SMS', NULL, NULL, N'439010', CAST(N'2025-12-09T18:35:11.603' AS DateTime))
GO
INSERT [dbo].[UserMfa] ([UserId], [IsMfaEnabled], [MfaMethod], [EmailOtp], [OtpExpiry], [SmsOtp], [SmsOtpExpiry]) VALUES (N'ca4be7be-51fa-4876-b4fa-cc9ca0191aff', 1, N'SMS', N'449787', CAST(N'2025-12-09T17:24:52.190' AS DateTime), NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PortalUs__A9D105344BBDCB0E]    Script Date: 12/11/2025 11:18:52 AM ******/
ALTER TABLE [dbo].[PortalUsers] ADD  CONSTRAINT [UQ__PortalUs__A9D105344BBDCB0E] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ProdUser__A9D105341696E7FE]    Script Date: 12/11/2025 11:18:52 AM ******/
ALTER TABLE [dbo].[ProdUsers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RefreshTokens_UserId]    Script Date: 12/11/2025 11:18:52 AM ******/
CREATE NONCLUSTERED INDEX [IX_RefreshTokens_UserId] ON [dbo].[RefreshTokens]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105345A18E5D8]    Script Date: 12/11/2025 11:18:52 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicationLogs] ADD  DEFAULT (sysdatetime()) FOR [LogDate]
GO
ALTER TABLE [dbo].[PasswordResets] ADD  CONSTRAINT [DF__PasswordRe__Used__45F365D3]  DEFAULT ((0)) FOR [Used]
GO
ALTER TABLE [dbo].[PortalUsers] ADD  CONSTRAINT [DF__PortalUse__IsMFA__5165187F]  DEFAULT ((0)) FOR [IsMFAEnabled]
GO
ALTER TABLE [dbo].[PortalUsers] ADD  CONSTRAINT [DF__PortalUse__UserT__52593CB8]  DEFAULT ('Customer') FOR [UserType]
GO
ALTER TABLE [dbo].[PortalUsers] ADD  CONSTRAINT [DF__PortalUse__Statu__534D60F1]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[PortalUsers] ADD  CONSTRAINT [DF__PortalUse__Creat__5441852A]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[RefreshTokens] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[RefreshTokens] ADD  DEFAULT ((0)) FOR [Revoked]
GO
ALTER TABLE [dbo].[UserMfa] ADD  DEFAULT ((0)) FOR [IsMfaEnabled]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreatePortalUser]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreatePortalUser]
    @UserName      NVARCHAR(150),
    @Email         NVARCHAR(150),
    @Phone         NVARCHAR(20),
    @PasswordHash  VARBINARY(MAX),
    @UserType      NVARCHAR(50) = 'Customer',
    @IsMFAEnabled  BIT = 0
    
AS
BEGIN
    SET NOCOUNT ON;

    -------------------------------------------------------------
    -- 1. Check if email already exists (email must be unique)
    -------------------------------------------------------------
    IF EXISTS (SELECT 1 FROM PortalUsers WHERE Email = @Email)
    BEGIN
        RAISERROR('Email already exists.', 16, 1);
        RETURN;
    END

    -------------------------------------------------------------
    -- 2. Insert new portal user
    -------------------------------------------------------------
    INSERT INTO PortalUsers (
        UserName,
        Email,
        Phone,
        PasswordHash,
        UserType,
        IsMFAEnabled,
        Status,
        CreatedAt,
        UpdatedAt
    )
    VALUES (
        @UserName,
        @Email,
        @Phone,
        @PasswordHash,
        @UserType,
        @IsMFAEnabled,
        'Active',
        GETDATE(),
        GETDATE()
    );

    -------------------------------------------------------------
    -- 3. Return the created UserId
    -------------------------------------------------------------
    SELECT SCOPE_IDENTITY() AS UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteApplicationLogs]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================
-- Procedure: sp_DeleteApplicationLogs
-- Purpose  : Delete old or specific application logs
-- =====================================================
CREATE PROCEDURE [dbo].[sp_DeleteApplicationLogs]
(
    @BeforeDate DATETIME2(0) = NULL,   -- Delete logs older than this date
    @LogLevel NVARCHAR(20) = NULL,     -- Delete by log level (ERROR/INFO)
    @Application NVARCHAR(100) = NULL  -- Delete by application name
)
AS
BEGIN
    SET NOCOUNT ON;

    ----------------------------------------------------
    -- If no filter is provided, stop execution
    -- This prevents accidental full table delete
    ----------------------------------------------------
    IF @BeforeDate IS NULL 
       AND @LogLevel IS NULL 
       AND @Application IS NULL
    BEGIN
        RAISERROR(
            'At least one filter (date, level, or application) is required.',
            16, 1
        );
        RETURN;
    END

    ----------------------------------------------------
    -- Delete logs matching provided conditions
    ----------------------------------------------------
    DELETE FROM dbo.ApplicationLogs
    WHERE
        (@BeforeDate IS NULL OR LogDate < @BeforeDate)
        AND (@LogLevel IS NULL OR LogLevel = @LogLevel)
        AND (@Application IS NULL OR Application = @Application);

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMfa_ByEmail]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetMfa_ByEmail]
    @Email NVARCHAR(400)
AS
BEGIN
    SELECT * FROM ProdUsers WHERE Email = @Email;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPortalUsers]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetPortalUsers]
AS
BEGIN
    SET NOCOUNT ON;

    -------------------------------------------------------------
    -- Return all users with basic information
    -------------------------------------------------------------
    SELECT 
        UserId,
        UserName,
        Email,
        Phone,
        UserType,
        Status,
        IsMFAEnabled,
        CreatedAt,
        UpdatedAt,
        LastLoginAt
    FROM PortalUsers
    ORDER BY CreatedAt DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertApplicationLog]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================
-- Procedure: sp_InsertApplicationLog
-- Purpose  : Inserts a new log record into ApplicationLogs
-- =====================================================
CREATE PROCEDURE [dbo].[sp_InsertApplicationLog]
(
    @LogLevel NVARCHAR(20),          -- Severity level
    @Message NVARCHAR(2000),         -- Log message

    @Application NVARCHAR(100) = NULL,   -- Application name
    @Module NVARCHAR(100) = NULL,        -- Module name
    @UserId BIGINT = NULL,               -- Logged-in user
    @Exception NVARCHAR(MAX) = NULL,     -- Exception details
    @SourceIP NVARCHAR(45) = NULL,       -- Client IP address
    @CorrelationId UNIQUEIDENTIFIER = NULL -- Request tracking id
)
AS
BEGIN
    -- Avoid returning row count messages
    SET NOCOUNT ON;

    -- Insert log data into table
    INSERT INTO dbo.ApplicationLogs
    (
        LogLevel,
        Message,
        Application,
        Module,
        UserId,
        Exception,
        SourceIP,
        CorrelationId
    )
    VALUES
    (
        @LogLevel,
        @Message,
        @Application,
        @Module,
        @UserId,
        @Exception,
        @SourceIP,
        @CorrelationId
    );
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Mfa_SaveOtp]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Mfa_SaveOtp]
    @UserId UNIQUEIDENTIFIER,
    @Otp NVARCHAR(10),
    @Expiry DATETIME
AS
BEGIN
    IF EXISTS (SELECT 1 FROM UserMfa WHERE UserId = @UserId)
        UPDATE UserMfa SET EmailOtp = @Otp, OtpExpiry = @Expiry, MfaMethod = 'EMAIL'
        WHERE UserId = @UserId;
    ELSE
        INSERT INTO UserMfa (UserId, IsMfaEnabled, MfaMethod, EmailOtp, OtpExpiry)
        VALUES (@UserId, 1, 'EMAIL', @Otp, @Expiry);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Mfa_SaveSmsOtp]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE   PROCEDURE [dbo].[sp_Mfa_SaveSmsOtp]
    @UserId UNIQUEIDENTIFIER,
    @Otp NVARCHAR(10),
    @Expiry DATETIME
AS
BEGIN
    IF EXISTS (SELECT 1 FROM UserMfa WHERE UserId = @UserId)
        UPDATE UserMfa 
        SET SmsOtp = @Otp, SmsOtpExpiry = @Expiry, MfaMethod = 'SMS'
        WHERE UserId = @UserId;
    ELSE
        INSERT INTO UserMfa (UserId, IsMfaEnabled, MfaMethod, SmsOtp, SmsOtpExpiry)
        VALUES (@UserId, 1, 'SMS', @Otp, @Expiry);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Mfa_ValidateOtp]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Mfa_ValidateOtp]
    @UserId UNIQUEIDENTIFIER,
    @Otp NVARCHAR(10)
AS
BEGIN
    SELECT TOP 1 *
    FROM UserMfa
    WHERE UserId = @UserId
      AND EmailOtp = @Otp
      AND OtpExpiry > GETUTCDATE();
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Mfa_ValidateSmsOtp]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Mfa_ValidateSmsOtp]
    @UserId UNIQUEIDENTIFIER,
    @Otp NVARCHAR(10)
AS
BEGIN
    SELECT TOP 1 *
    FROM UserMfa
    WHERE UserId = @UserId
      AND SmsOtp = @Otp
      AND SmsOtpExpiry > GETUTCDATE();
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_PasswordReset_Create]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_PasswordReset_Create]  
    @Email NVARCHAR(400),  
    @Otp NVARCHAR(50),  
    @Expiry DATETIME  
AS  
BEGIN  
    INSERT INTO PasswordResets (Email, Otp, Expiry, Used)  
    VALUES (@Email, @Otp, @Expiry, 0);  
END  
GO
/****** Object:  StoredProcedure [dbo].[sp_PasswordReset_MarkUsed]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_PasswordReset_MarkUsed]
    @Id INT
AS
BEGIN
    UPDATE PasswordResets
    SET Used = 1
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PasswordReset_Validate]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_PasswordReset_Validate]
    @Email NVARCHAR(400),
    @Otp NVARCHAR(50)
AS
BEGIN
    SELECT TOP 1 *
    FROM PasswordResets
    WHERE Email = @Email
      AND Otp = @Otp
      AND Used = 0
      AND Expiry > GETUTCDATE();  -- FIXED
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PortalUserSignIn]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_PortalUserSignIn]
    @Email NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    -------------------------------------------------------------
    -- 1. Validate: Check if email exists
    -------------------------------------------------------------
    IF NOT EXISTS (SELECT 1 FROM PortalUsers WHERE Email = @Email)
    BEGIN
        RAISERROR('User with this email does not exist.', 16, 1);
        RETURN;
    END

    -------------------------------------------------------------
    -- 2. Validate: Check if user is active
    -------------------------------------------------------------
    IF EXISTS (
        SELECT 1 
        FROM PortalUsers 
        WHERE Email = @Email 
          AND Status <> 'Active'
    )
    BEGIN
        RAISERROR('This user account is inactive or blocked.', 16, 1);
        RETURN;
    END

    -------------------------------------------------------------
    -- 3. Return password hash, salt and MFA settings
    --    (Used for verifying password + triggering MFA)
    -------------------------------------------------------------
    SELECT 
        UserId,
        Password,
        PasswordHash,
        IsMFAEnabled
    FROM PortalUsers
    WHERE Email = @Email;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RefreshToken_Create]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_RefreshToken_Create]
    @UserId UNIQUEIDENTIFIER,
    @TokenHash NVARCHAR(400),
    @ExpiresAt DATETIME
AS
BEGIN
    INSERT INTO RefreshTokens (UserId, TokenHash, ExpiresAt, CreatedAt, Revoked)
    VALUES (@UserId, @TokenHash, @ExpiresAt, GETDATE(), 0);

    SELECT SCOPE_IDENTITY() AS Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RefreshToken_GetByHash]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_RefreshToken_GetByHash]
    @TokenHash NVARCHAR(400)
AS
BEGIN
    SELECT TOP 1 *
    FROM RefreshTokens
    WHERE TokenHash = @TokenHash
      AND Revoked = 0
      AND ExpiresAt > GETUTCDATE();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RefreshToken_Revoke]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_RefreshToken_Revoke]
    @Id INT,
    @ReplacedByToken NVARCHAR(400) = NULL
AS
BEGIN
    UPDATE RefreshTokens
    SET Revoked = 1,
        ReplacedByToken = @ReplacedByToken
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RefreshToken_RevokeAllForUser]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_RefreshToken_RevokeAllForUser]
    @UserId UNIQUEIDENTIFIER
AS
BEGIN
    UPDATE RefreshTokens
    SET Revoked = 1
    WHERE UserId = @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Delete]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_Delete]
    @UserId BIGINT
AS
BEGIN
    UPDATE ProdUsers
    SET IsActive = 0
    WHERE UserId = @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetAll]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_GetAll]
AS
BEGIN
    SELECT UserId, UserName, Email, Role, CreatedAt, IsActive, PhoneNumber
    FROM ProdUsers;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetById]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_GetById]
    @UserId BIGINT
AS
BEGIN
    SELECT *
    FROM ProdUsers
    WHERE UserId = @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Login]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_Login]
    @Email NVARCHAR(200)
AS
BEGIN
    SELECT *
    FROM ProdUsers
    WHERE Email = @Email AND IsActive = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Register]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_Register]
    @UserName NVARCHAR(200),
    @Email NVARCHAR(200),
    @PasswordHash NVARCHAR(MAX),
    @Role NVARCHAR(50),
    @PhoneNumber NVARCHAR(20)
AS
BEGIN
    INSERT INTO ProdUsers (UserName, Email, PasswordHash, Role, CreatedAt, IsActive, PhoneNumber)
    VALUES (@UserName, @Email, @PasswordHash, @Role, GETUTCDATE(), 1, @PhoneNumber);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_ResetPassword]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_ResetPassword]
    @Email NVARCHAR(200),
    @PasswordHash NVARCHAR(MAX)
AS
BEGIN
    UPDATE ProdUsers
    SET PasswordHash = @PasswordHash
    WHERE Email = @Email;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_SetStatus]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_SetStatus]
    @UserId BIGINT,
    @IsActive BIT
AS
BEGIN
    UPDATE ProdUsers
    SET IsActive = @IsActive
    WHERE UserId = @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Update]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_Update]
    @UserId BIGINT,
    @UserName NVARCHAR(200),
    @Email NVARCHAR(200),
    @PhoneNumber NVARCHAR(20)
AS
BEGIN
    UPDATE ProdUsers
    SET UserName = @UserName,
        Email = @Email,
        PhoneNumber = @PhoneNumber
    WHERE UserId = @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_UpdateRole]    Script Date: 12/11/2025 11:18:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_UpdateRole]
    @UserId BIGINT,
    @NewRole NVARCHAR(50)
AS
BEGIN
    UPDATE ProdUsers
    SET Role = @NewRole
    WHERE UserId = @UserId;
END
GO
USE [master]
GO
ALTER DATABASE [ISWMPROD] SET  READ_WRITE 
GO
