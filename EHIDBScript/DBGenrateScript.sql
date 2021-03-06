USE [master]
GO
/****** Object:  Database [EvolentHealth]    Script Date: 4/16/2021 5:39:21 PM ******/
CREATE DATABASE [EvolentHealth]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EvolentHealth', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EvolentHealth.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EvolentHealth_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EvolentHealth_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EvolentHealth] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvolentHealth].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvolentHealth] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvolentHealth] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvolentHealth] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvolentHealth] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvolentHealth] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvolentHealth] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EvolentHealth] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvolentHealth] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvolentHealth] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvolentHealth] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvolentHealth] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvolentHealth] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvolentHealth] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvolentHealth] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvolentHealth] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EvolentHealth] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvolentHealth] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvolentHealth] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvolentHealth] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvolentHealth] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvolentHealth] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EvolentHealth] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvolentHealth] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EvolentHealth] SET  MULTI_USER 
GO
ALTER DATABASE [EvolentHealth] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvolentHealth] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvolentHealth] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvolentHealth] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EvolentHealth] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EvolentHealth] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EvolentHealth] SET QUERY_STORE = OFF
GO
USE [EvolentHealth]
GO
/****** Object:  Table [dbo].[tblContactInformation]    Script Date: 4/16/2021 5:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContactInformation](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Status] [varchar](20) NULL,
	[PhoneNumber] [varchar](20) NULL,
 CONSTRAINT [PK_tblContactInformation] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAddContactInfo]    Script Date: 4/16/2021 5:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAddContactInfo]       
(        
    @FirstName VARCHAR(20),         
    @LastName VARCHAR(20),        
    @Email VARCHAR(20),        
    @Status VARCHAR(8),
	@PhoneNumber VARCHAR(10)
)        
as         
Begin         
    Insert into tblContactInformation (FirstName, LastName, Email, Status, PhoneNumber)         
    Values (@FirstName, @LastName, @Email, @Status, @PhoneNumber)
End
GO
/****** Object:  StoredProcedure [dbo].[spDeleteContactInfo]    Script Date: 4/16/2021 5:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spDeleteContactInfo]       
(          
   @PhoneNumber VARCHAR(10)          
)          
as           
begin          
   Delete from tblContactInformation where PhoneNumber=@PhoneNumber          
End 
GO
/****** Object:  StoredProcedure [dbo].[spUpdateContactInfo]    Script Date: 4/16/2021 5:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spUpdateContactInfo]
(          
    @FirstName VARCHAR(20),         
    @LastName VARCHAR(20),        
    @Email VARCHAR(20),        
    @Status VARCHAR(8),
	@PhoneNumber VARCHAR(10)     
)          
as          
begin          
   Update tblContactInformation           
   set FirstName=@FirstName,          
   LastName=@LastName,          
   Email=@Email,        
   Status=@Status          
   where PhoneNumber=@PhoneNumber          
End  
GO
USE [master]
GO
ALTER DATABASE [EvolentHealth] SET  READ_WRITE 
GO
