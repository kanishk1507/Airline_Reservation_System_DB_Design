USE [master]
GO
/****** Object:  Database [airline_reservation_system]    Script Date: 1/11/2025 11:28:20 PM ******/
CREATE DATABASE [airline_reservation_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'flight_booking_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\flight_booking_system.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'flight_booking_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\flight_booking_system_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [airline_reservation_system] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [airline_reservation_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [airline_reservation_system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [airline_reservation_system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [airline_reservation_system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [airline_reservation_system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [airline_reservation_system] SET ARITHABORT OFF 
GO
ALTER DATABASE [airline_reservation_system] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [airline_reservation_system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [airline_reservation_system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [airline_reservation_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [airline_reservation_system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [airline_reservation_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [airline_reservation_system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [airline_reservation_system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [airline_reservation_system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [airline_reservation_system] SET  ENABLE_BROKER 
GO
ALTER DATABASE [airline_reservation_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [airline_reservation_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [airline_reservation_system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [airline_reservation_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [airline_reservation_system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [airline_reservation_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [airline_reservation_system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [airline_reservation_system] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [airline_reservation_system] SET  MULTI_USER 
GO
ALTER DATABASE [airline_reservation_system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [airline_reservation_system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [airline_reservation_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [airline_reservation_system] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [airline_reservation_system] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [airline_reservation_system] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [airline_reservation_system] SET QUERY_STORE = ON
GO
ALTER DATABASE [airline_reservation_system] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [airline_reservation_system]
GO
/****** Object:  Table [dbo].[AirCrafts]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirCrafts](
	[AcID] [int] NOT NULL,
	[AcNum] [varchar](30) NOT NULL,
	[Capacity] [int] NOT NULL,
	[MfdBy] [varchar](120) NOT NULL,
	[MfdOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AirFare]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirFare](
	[AfID] [int] NOT NULL,
	[Route] [int] NULL,
	[Fare] [money] NOT NULL,
	[FSC] [money] NULL,
	[NetFare] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[AfID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[BrID] [int] NOT NULL,
	[Center] [varchar](16) NOT NULL,
	[Address] [varchar](32) NOT NULL,
	[State] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[charges]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[charges](
	[ChID] [int] NOT NULL,
	[Title] [varchar](32) NULL,
	[Amount] [int] NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ChID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact_details]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_details](
	[CnID] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Cell] [varchar](16) NOT NULL,
	[Tel] [varchar](16) NULL,
	[Street] [varchar](64) NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CtID] [int] NOT NULL,
	[CountryName] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiID] [int] NOT NULL,
	[title] [varchar](32) NULL,
	[Amount] [int] NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[EmpID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Address] [varchar](32) NOT NULL,
	[Branch] [int] NOT NULL,
	[Designation] [varchar](32) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Tel] [varchar](16) NOT NULL,
	[Ext] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flight_schedule]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flight_schedule](
	[FlID] [int] NOT NULL,
	[FlightDate] [datetime] NULL,
	[Departure] [datetime] NULL,
	[Arrival] [datetime] NULL,
	[AirCraft] [int] NULL,
	[NetFare] [int] NULL,
	[AvailableSeats] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotID] [int] IDENTITY(1,1) NOT NULL,
	[PsID] [int] NULL,
	[NotificationType] [varchar](50) NULL,
	[Message] [varchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[Sent] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[passengers]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passengers](
	[PsID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Address] [varchar](64) NOT NULL,
	[Age] [int] NOT NULL,
	[Nationality] [varchar](16) NOT NULL,
	[Contact] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[RtID] [int] NOT NULL,
	[Airport] [varchar](30) NOT NULL,
	[Destination] [varchar](32) NOT NULL,
	[RouteCode] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RouteCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[StID] [int] NOT NULL,
	[StateName] [varchar](32) NULL,
	[Country] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TsID] [int] NOT NULL,
	[BookingDate] [datetime] NULL,
	[DepartureDate] [datetime] NULL,
	[Passenger] [int] NULL,
	[Flight] [int] NULL,
	[Type] [bit] NULL,
	[Employee] [int] NULL,
	[Charges] [int] NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [Sent]
GO
ALTER TABLE [dbo].[AirFare]  WITH CHECK ADD FOREIGN KEY([Route])
REFERENCES [dbo].[Route] ([RtID])
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD FOREIGN KEY([State])
REFERENCES [dbo].[state] ([StID])
GO
ALTER TABLE [dbo].[Contact_details]  WITH CHECK ADD FOREIGN KEY([State])
REFERENCES [dbo].[state] ([StID])
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD FOREIGN KEY([Branch])
REFERENCES [dbo].[Branches] ([BrID])
GO
ALTER TABLE [dbo].[flight_schedule]  WITH CHECK ADD FOREIGN KEY([AirCraft])
REFERENCES [dbo].[AirCrafts] ([AcID])
GO
ALTER TABLE [dbo].[flight_schedule]  WITH CHECK ADD FOREIGN KEY([NetFare])
REFERENCES [dbo].[AirFare] ([AfID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([PsID])
REFERENCES [dbo].[passengers] ([PsID])
GO
ALTER TABLE [dbo].[passengers]  WITH CHECK ADD FOREIGN KEY([Contact])
REFERENCES [dbo].[Contact_details] ([CnID])
GO
ALTER TABLE [dbo].[state]  WITH CHECK ADD FOREIGN KEY([Country])
REFERENCES [dbo].[Country] ([CtID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([Charges])
REFERENCES [dbo].[charges] ([ChID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([Discount])
REFERENCES [dbo].[Discounts] ([DiID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([Employee])
REFERENCES [dbo].[employee] ([EmpID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([Flight])
REFERENCES [dbo].[flight_schedule] ([FlID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([Passenger])
REFERENCES [dbo].[passengers] ([PsID])
GO
/****** Object:  StoredProcedure [dbo].[SendNotifications]    Script Date: 1/11/2025 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendNotifications]
AS
BEGIN
    DECLARE @PsID INT, @Message VARCHAR(255), @Email VARCHAR(100);

    DECLARE NotificationCursor CURSOR FOR
    SELECT N.PsID, N.Message, C.Email
    FROM Notifications N
    JOIN Passengers P ON N.PsID = P.PsID
    JOIN Contact_details C ON P.Contact = C.CnID
    WHERE N.Sent = 0;

    OPEN NotificationCursor;
    FETCH NEXT FROM NotificationCursor INTO @PsID, @Message, @Email;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Replace with actual email sending logic
        PRINT 'Sending email to: ' + @Email;
        PRINT 'Message: ' + @Message;

        -- Update the notification status to sent
        UPDATE Notifications SET Sent = 1 WHERE PsID = @PsID AND Message = @Message;

        FETCH NEXT FROM NotificationCursor INTO @PsID, @Message, @Email;
    END;

    CLOSE NotificationCursor;
    DEALLOCATE NotificationCursor;
END;
GO
USE [master]
GO
ALTER DATABASE [airline_reservation_system] SET  READ_WRITE 
GO
