﻿USE [master]
GO
/****** Object:  Database [Авиарейсы]    Script Date: 03/20/2011 19:26:29 ******/
CREATE DATABASE [Авиарейсы] ON  PRIMARY 
( NAME = N'Авиарейры', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Авиарейры.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Авиарейры_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Авиарейры_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Авиарейсы] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Авиарейсы].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Авиарейсы] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Авиарейсы] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Авиарейсы] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Авиарейсы] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Авиарейсы] SET ARITHABORT OFF
GO
ALTER DATABASE [Авиарейсы] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Авиарейсы] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Авиарейсы] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Авиарейсы] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Авиарейсы] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Авиарейсы] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Авиарейсы] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Авиарейсы] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Авиарейсы] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Авиарейсы] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Авиарейсы] SET  DISABLE_BROKER
GO
ALTER DATABASE [Авиарейсы] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Авиарейсы] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Авиарейсы] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Авиарейсы] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Авиарейсы] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Авиарейсы] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Авиарейсы] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Авиарейсы] SET  READ_WRITE
GO
ALTER DATABASE [Авиарейсы] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Авиарейсы] SET  MULTI_USER
GO
ALTER DATABASE [Авиарейсы] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Авиарейсы] SET DB_CHAINING OFF
GO
USE [Авиарейсы]
GO
/****** Object:  Table [dbo].[Тип самолёта]    Script Date: 03/20/2011 19:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Тип самолёта](
	[Тип самолёта] [varchar](200) NOT NULL,
	[Количество пассажиров] [int] NULL,
 CONSTRAINT [PK_ТИП САМОЛЁТА] PRIMARY KEY CLUSTERED 
(
	[Тип самолёта] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Авиакомпания]    Script Date: 03/20/2011 19:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Авиакомпания](
	[Название] [varchar](200) NOT NULL,
 CONSTRAINT [PK_АВИАКОМПАНИЯ] PRIMARY KEY CLUSTERED 
(
	[Название] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Город]    Script Date: 03/20/2011 19:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Город](
	[Название] [varchar](200) NOT NULL,
 CONSTRAINT [PK_ГОРОД] PRIMARY KEY CLUSTERED 
(
	[Название] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Авиарейс]    Script Date: 03/20/2011 19:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Авиарейс](
	[Номер рейса] [int] IDENTITY(1,1) NOT NULL,
	[Авиакомпания] [varchar](200) NOT NULL,
	[Откуда] [varchar](200) NOT NULL,
	[Куда] [varchar](200) NOT NULL,
	[Тип самолёта] [varchar](200) NOT NULL,
	[Вылет] [datetime] NOT NULL,
	[Прилёт] [datetime] NOT NULL,
 CONSTRAINT [PK_АВИАРЕЙС] PRIMARY KEY CLUSTERED 
(
	[Номер рейса] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Используемые_типы_самолётов]    Script Date: 03/20/2011 19:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Используемые_типы_самолётов]
AS
SELECT DISTINCT Авиакомпания, [Тип самолёта]
FROM  dbo.Авиарейс
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Авиарейс"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 238
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Используемые_типы_самолётов'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Используемые_типы_самолётов'
GO
/****** Object:  View [dbo].[Количество типов самолётов]    Script Date: 03/20/2011 19:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Количество типов самолётов]
AS
SELECT Авиакомпания, COUNT(*) AS [Типов cамолётов]
FROM  dbo.Используемые_типы_самолётов
GROUP BY Авиакомпания
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Используемые_типы_самолётов"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 112
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Количество типов самолётов'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Количество типов самолётов'
GO
/****** Object:  Default [DF_Авиарейс_Авиакомпания]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс] ADD  CONSTRAINT [DF_Авиарейс_Авиакомпания]  DEFAULT ('Аэрофлот') FOR [Авиакомпания]
GO
/****** Object:  Default [DF_Авиарейс_Откуда]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс] ADD  CONSTRAINT [DF_Авиарейс_Откуда]  DEFAULT ('Пятигорск') FOR [Откуда]
GO
/****** Object:  Default [DF_Авиарейс_Куда]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс] ADD  CONSTRAINT [DF_Авиарейс_Куда]  DEFAULT ('Пятигорск') FOR [Куда]
GO
/****** Object:  Default [DF_Авиарейс_Тип самолёта]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс] ADD  CONSTRAINT [DF_Авиарейс_Тип самолёта]  DEFAULT ('Ту-154') FOR [Тип самолёта]
GO
/****** Object:  Default [DF_Авиарейс_Вылет]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс] ADD  CONSTRAINT [DF_Авиарейс_Вылет]  DEFAULT (getdate()+rand()) FOR [Вылет]
GO
/****** Object:  Default [DF_Авиарейс_Прилёт]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс] ADD  CONSTRAINT [DF_Авиарейс_Прилёт]  DEFAULT ((getdate()+rand())+(2)/(24.0)) FOR [Прилёт]
GO
/****** Object:  Check [CKC_КОЛИЧЕСТВО ПАССАЖ_ТИП САМО]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Тип самолёта]  WITH CHECK ADD  CONSTRAINT [CKC_КОЛИЧЕСТВО ПАССАЖ_ТИП САМО] CHECK  (([Количество пассажиров] IS NULL OR [Количество пассажиров]>=(10) AND [Количество пассажиров]<=(9000)))
GO
ALTER TABLE [dbo].[Тип самолёта] CHECK CONSTRAINT [CKC_КОЛИЧЕСТВО ПАССАЖ_ТИП САМО]
GO
/****** Object:  ForeignKey [FK_АВИАРЕЙС_REFERENCE_ТИП САМО]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс]  WITH CHECK ADD  CONSTRAINT [FK_АВИАРЕЙС_REFERENCE_ТИП САМО] FOREIGN KEY([Тип самолёта])
REFERENCES [dbo].[Тип самолёта] ([Тип самолёта])
GO
ALTER TABLE [dbo].[Авиарейс] CHECK CONSTRAINT [FK_АВИАРЕЙС_REFERENCE_ТИП САМО]
GO
/****** Object:  ForeignKey [FK_АВИАРЕЙС_КАКОЙ АВИ_АВИАКОМП]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс]  WITH CHECK ADD  CONSTRAINT [FK_АВИАРЕЙС_КАКОЙ АВИ_АВИАКОМП] FOREIGN KEY([Авиакомпания])
REFERENCES [dbo].[Авиакомпания] ([Название])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Авиарейс] CHECK CONSTRAINT [FK_АВИАРЕЙС_КАКОЙ АВИ_АВИАКОМП]
GO
/****** Object:  ForeignKey [FK_АВИАРЕЙС_КУДА_ГОРОД]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс]  WITH CHECK ADD  CONSTRAINT [FK_АВИАРЕЙС_КУДА_ГОРОД] FOREIGN KEY([Куда])
REFERENCES [dbo].[Город] ([Название])
GO
ALTER TABLE [dbo].[Авиарейс] CHECK CONSTRAINT [FK_АВИАРЕЙС_КУДА_ГОРОД]
GO
/****** Object:  ForeignKey [FK_АВИАРЕЙС_ОТКУДА_ГОРОД]    Script Date: 03/20/2011 19:26:30 ******/
ALTER TABLE [dbo].[Авиарейс]  WITH CHECK ADD  CONSTRAINT [FK_АВИАРЕЙС_ОТКУДА_ГОРОД] FOREIGN KEY([Откуда])
REFERENCES [dbo].[Город] ([Название])
GO
ALTER TABLE [dbo].[Авиарейс] CHECK CONSTRAINT [FK_АВИАРЕЙС_ОТКУДА_ГОРОД]
GO
