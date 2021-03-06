USE [master]
GO
/****** Object:  Database [MiniProjContext]    Script Date: 18/5/2017 9:34:32 PM ******/
CREATE DATABASE [MiniProjContext]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiniProjContext', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MiniProjContext.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MiniProjContext_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MiniProjContext_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MiniProjContext] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiniProjContext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiniProjContext] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiniProjContext] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiniProjContext] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiniProjContext] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiniProjContext] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiniProjContext] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MiniProjContext] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiniProjContext] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiniProjContext] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiniProjContext] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiniProjContext] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiniProjContext] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiniProjContext] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiniProjContext] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiniProjContext] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MiniProjContext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiniProjContext] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiniProjContext] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiniProjContext] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiniProjContext] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiniProjContext] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MiniProjContext] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiniProjContext] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MiniProjContext] SET  MULTI_USER 
GO
ALTER DATABASE [MiniProjContext] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiniProjContext] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiniProjContext] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiniProjContext] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MiniProjContext] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MiniProjContext]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 18/5/2017 9:34:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Upload]    Script Date: 18/5/2017 9:34:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Upload](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](160) NULL,
	[FileName] [nvarchar](100) NULL,
	[FileUrl] [nvarchar](1000) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Upload] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201705180915119_InitialCreate', N'MiniProject.DAL.Context', 0x1F8B0800000000000400CD57DB6EE336107D2FD07F20F89C359D0428DA40DE456AC785D1380956C9BED3D2D8614B912A4905F1B7F5A19FD45FE850F78B6F4983A2300C48E4CC9933C3B9507FFFF957F0E53591E4058C155A4DE8F9684C09A848C7426D263473EB4F3FD22F9FBFFF2EB8899357F2AD92BBF472A8A9EC843E3B975E3166A36748B81D252232DAEAB51B453A613CD6EC623CFE899D9F3340088A5884045F33E54402F90BBE4EB58A207519974B1D83B4E53AEE84392AB9E309D8944730A14BA1C483D1BF41E446B3EB5B4AAEA5E0482304B9A6842BA51D7748F2EAC942E88C569B30C5052E1FB729A0DC9A4B0B25F9AB46FC543FC617DE0FD628565051669D4EDE08787E590686F5D5DF155E5A070E43778321765BEF751EBE097D4AA5E631257D53575369BC5837B6C5498C0AA533D2DA3AABF300D3C5FFCEC834932E3330519039C3E51979C8565244BFC2F651FF0E6AA23229DBE4901EEE75167009F153306EFB15D625E5C58C12D6D5637DC55AADA553B8B350EEF282923B34CE5712EAB36FB91E3A6DE0175060B883F8813B07068F6E11431EBD81F59EAD2558CB375019C47CC3BAA164C95F6F416DDC3356D40F582973F10A71B55292785202CB0C959CC9E0989DB990E09F0E191A7F94A127230FDBF90843530318F119FE2B5BFEF951781F0707D6860A5893D8C374C74EE2B8C0E3ACCCE03BBCBA1D498FEDA1CC7B5B32EEF22DF042709DEAB19434E68BA633AAEA6A17CB9A4FD3D258D1D3AADEC7F634BF60C9D31483DF6A86E50A098B4E38FD14BEBD4B2405068BEC8E6651B3AD2D6179607EF7767D5863980B631D1E1A5F717F46D338D92156447F4F642B2BDD00F7BB4213EF4ADE3F97F5D71D06D551F4209AD0CDD19B044B3B770C6A22756F1C28E623884B6E763499A99659A2F635AA43DA75DB6843D48BA7E3346DA10DD4ACBE0D29AFFB3E50BE783A4EBBACDB50EDF5215AC07AE7D3CF01364882DE50E8E7D4A152EC8BD4D6EB92EC955E5096C1F1CBC9A02E0A114A304C2F22F635116EAD8364E40546E11F722A05FADB082CB9126BB0AE989B14AF0817BD2BCEFFE7BAC1AC8DE549778EFF7CF40B1FD3A3C3FDE0A0393AEDD50B37D13337C379DFE0BE67B8EFC61DBF0BB735CBF7C1BE197738BA637C761F3FBAFB33E694017D603E17B5886C571A89172CFFE5EC1E368680B5BF6D821958B16920FC978EC2618515D78056320BB5D655A8D1AD36A34A6490908E63ECF9B57162CD2387DB11E6687E65FBC665862237C90AE285BACF5C9AB96B6B2159C9CEB5366087EDE717942EE7E03EF56FF6235C409AC2A7CFBDFA391332AE79CF77A4CF1E089F286595232BBCB222DC665B23DD6975225019BE19A4A07C8F788424950866EF55C85FE03DDCF096790B1B1E6DABFEBE1FE4F84174C31ECC04DF189ED812A3D1F7DFEBCC7FB07FFE07C1C8FA5FE20F0000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Upload] ON 

INSERT [dbo].[Upload] ([ID], [Message], [FileName], [FileUrl], [CreateDate]) VALUES (1, N'12345678910123456789101', N'abc', NULL, CAST(N'2017-05-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Upload] ([ID], [Message], [FileName], [FileUrl], [CreateDate]) VALUES (3, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.', N'Uwin18MembershipEstimatedTimeline.xlsx', N'~\UploadedFiles\Uwin18MembershipEstimatedTimeline.xlsx', CAST(N'2017-05-16 18:25:44.377' AS DateTime))
INSERT [dbo].[Upload] ([ID], [Message], [FileName], [FileUrl], [CreateDate]) VALUES (5, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.', N'Uwin18MembershipEstimatedTimeline.xlsx', N'~\UploadedFiles\Uwin18MembershipEstimatedTimeline.xlsx', CAST(N'2017-05-18 21:17:58.737' AS DateTime))
SET IDENTITY_INSERT [dbo].[Upload] OFF
USE [master]
GO
ALTER DATABASE [MiniProjContext] SET  READ_WRITE 
GO
