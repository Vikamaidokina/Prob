USE [probnik]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 27.05.2023 10:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Мишина', N'Иветта', N'Андреевна', CAST(N'2002-10-05' AS Date), CAST(N'2016-01-24T00:00:00.000' AS DateTime), N' aukjan@yahoo.com', N' 7(3926)244-81-96 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Суворова', N'Божена', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N' attwood@aol.com', N' 7(347)895-86-57 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Белозерова', N'Диана', N'Антоновна', CAST(N'1989-02-27' AS Date), CAST(N'2017-01-30T00:00:00.000' AS DateTime), N' dialworld@aol.com', N' 7(9900)174-59-87 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Дементьева', N'Эдита', N'Онисимовна', CAST(N'1975-09-17' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N' frosal@hotmail.com', N' 7(198)922-28-76 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (6, N'Блинов', N'Евгений', N'Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07T00:00:00.000' AS DateTime), N' moxfulder@outlook.com', N' 7(0852)321-82-64 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Морозов', N'Наум', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N' salesgeek@mac.com', N' 7(636)050-96-13 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Попова', N'Харита', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N' firstpr@verizon.net', N' 7(335)386-81-06 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (9, N'Крюков', N'Наум', N'Ильянович', CAST(N'1993-11-17' AS Date), CAST(N'2017-02-01T00:00:00.000' AS DateTime), N' floxy@hotmail.com', N' 7(81)657-88-92 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (10, N'Крюкова', N'Авигея', N'Святославовна', CAST(N'2000-08-10' AS Date), CAST(N'2018-01-03T00:00:00.000' AS DateTime), N' simone@gmail.com', N' 7(499)318-88-53 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Беляева', N'Сабрина', N'Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'2017-06-14T00:00:00.000' AS DateTime), N' agapow@gmail.com', N' 7(6580)534-32-58 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (12, N'Медведев', N'Святослав', N'Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13T00:00:00.000' AS DateTime), N' hllam@comcast.net', N' 7(3520)435-21-20 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Блохин', N'Пантелеймон ', N'Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14T00:00:00.000' AS DateTime), N' balchen@comcast.net', N' 7(9524)556-48-98 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (14, N'Горбачева', N'Никки', N'Еремеевна', CAST(N'1987-04-21' AS Date), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N' chinthaka@att.net', N' 7(94)789-69-20 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (15, N'Архипова', N'Прасковья', N'Валерьевна', CAST(N'1979-01-09' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N' cgcra@live.com', N' 7(86)540-10-21 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Андреева', N'Патрисия', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N' jigsaw@aol.com', N' 7(9648)953-81-26 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (17, N'Горшкова', N'Марта', N'Иосифовна', CAST(N'2001-02-13' AS Date), CAST(N'2016-08-04T00:00:00.000' AS DateTime), N' gbacon@mac.com', N' 7(544)650-59-03 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Орлова', N'Влада', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N' rnelson@yahoo.ca', N' 7(2506)433-38-35 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Ершов', N'Глеб', N'Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14T00:00:00.000' AS DateTime), N' sjava@aol.com', N' 7(2608)298-40-82 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (20, N'Быкова', N'Тала', N'Георгеевна', CAST(N'2000-02-22' AS Date), CAST(N'2016-08-13T00:00:00.000' AS DateTime), N' ganter@optonline.net', N' 7(13)915-53-53 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (21, N'Новиков', N'Адриан', N'Аркадьевич', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N' multiplx@verizon.net', N' 7(70)572-33-62 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Филатов', N'Аристарх', N'Дмитриевич', CAST(N'1989-05-29' AS Date), CAST(N'2017-01-11T00:00:00.000' AS DateTime), N' hampton@att.net', N' 7(696)235-29-24 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (23, N'Анисимова', N'Тамара', N'Витальевна', CAST(N'1988-06-16' AS Date), CAST(N'2016-02-25T00:00:00.000' AS DateTime), N' schwaang@mac.com', N' 7(66)128-04-10 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (24, N'Кудряшов', N'Аверкий', N'Константинович', CAST(N'1991-07-26' AS Date), CAST(N'2018-03-08T00:00:00.000' AS DateTime), N' nanop@msn.com', N' 7(88)732-96-30 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (25, N'Колобов', N'Орест', N'Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01T00:00:00.000' AS DateTime), N' parkes@verizon.net', N' 7(1680)508-58-26 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'Кузьмина', N'Дэнна', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N' nichoj@mac.com', N' 7(9940)977-45-73 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Александров', N'Станислав', N'Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08T00:00:00.000' AS DateTime), N' bigmauler@aol.com', N' 7(18)164-05-12 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Андреев ', N'Станислав', N'Максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26T00:00:00.000' AS DateTime), N' budinger@mac.com', N' 7(02)993-91-28 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (29, N'Дроздов', N'Вольдемар', N'Артемович', CAST(N'1976-02-07' AS Date), CAST(N'2017-07-18T00:00:00.000' AS DateTime), N' smpeters@me.com', N' 7(307)456-99-05 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'Абрамов', N'Станислав', N'Филатович', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08T00:00:00.000' AS DateTime), N' solomon@att.net', N' 7(6545)478-87-79 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (31, N'Гусева', N'Роза', N'Дмитриевна', CAST(N'1999-02-13' AS Date), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N' martyloo@live.com', N' 7(23)064-51-84 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (32, N'Лазарев', N'Алексей', N'Богданович', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N' claesjac@me.com', N' 7(0055)737-37-48 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Большаков', N'Вадим', N'Данилович', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04T00:00:00.000' AS DateTime), N' uncle@gmail.com', N' 7(386)641-13-37 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (34, N'Ефремов', N'Витольд', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N' kwilliams@yahoo.ca', N' 7(93)922-14-03 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Игнатов', N'Захар', N'Павлович', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10T00:00:00.000' AS DateTime), N' dieman@icloud.com', N' 7(578)574-73-36 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Калашников', N'Артур', N'Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20T00:00:00.000' AS DateTime), N' oevans@aol.com', N' 7(147)947-47-21 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (37, N'Овчинникова', N'Лаура', N'Еремеевна', CAST(N'1992-04-03' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N' carcus@yahoo.ca', N' 7(85)829-33-79 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (38, N'Голубев', N'Иосиф', N'Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'2018-08-18T00:00:00.000' AS DateTime), N' smcnabb@att.net', N' 7(78)972-73-11 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (39, N'Галкин', N'Эрик', N'Онисимович', CAST(N'1975-01-18' AS Date), CAST(N'2016-07-19T00:00:00.000' AS DateTime), N' snunez@verizon.net', N' 7(759)873-77-39 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (40, N'Некрасов', N'Варлам', N'Михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N' dogdude@verizon.net', N' 7(019)258-06-35 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Федотов', N'Осип', N'Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N' breegster@hotmail.com', N' 7(590)702-33-06 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Смирнов', N'Мартын ', N'Арсеньевич', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N' haddawy@live.com', N' 7(6251)589-02-43 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (43, N'Копылов', N'Касьян', N'Робертович', CAST(N'1983-08-04' AS Date), CAST(N'2018-03-18T00:00:00.000' AS DateTime), N' crobles@sbcglobal.net', N' 7(5774)679-82-06 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (44, N'Дмитриева', N'Элина', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N' vmalik@live.com', N' 7(787)140-48-84 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (45, N'Бирюкова', N'Инара', N'Улебовна', CAST(N'1978-07-21' AS Date), CAST(N'2017-10-01T00:00:00.000' AS DateTime), N' smpeters@hotmail.com', N' 7(098)346-50-58 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (46, N'Васильев', N'Оскар', N'Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N' miturria@verizon.net', N' 7(585)801-94-29 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (47, N'Киселев', N'Устин', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N' dalamb@verizon.net', N' 7(83)334-52-76 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (48, N'Кузьмин ', N'Леонтий', N'Валерьянович', CAST(N'2000-05-05' AS Date), CAST(N'2017-10-12T00:00:00.000' AS DateTime), N' msloan@hotmail.com', N' 7(1340)148-90-68 ', N'1', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Ефимова', N'Магда', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N' rbarreira@me.com', N' 7(9261)386-15-92 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Воронова', N'Изабелла', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N' kildjean@sbcglobal.net', N' 7(17)433-44-98 ', N'2', N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (51, N'Волков', N'Людвиг', N'Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27T00:00:00.000' AS DateTime), N' jrkorson@msn.com', N' 7(8459)592-05-58 ', N'1', N'')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'Мужской')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'Женский')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Замена жидкости в кондиционере', 3040.0000, 8, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Ремонт и замена коллектора', 2770.0000, 150, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Замена актуатора сцепления', 4100.0000, 330, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Замена жидкости ГУР', 2380.0000, 9, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Заправка кондиционеров', 4860.0000, 2, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Замена масла в вариаторе', 4720.0000, 2, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Ремонт двигателя', 2470.0000, 4, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Замена заднего сальника АКПП', 1510.0000, 390, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Покраска', 2370.0000, 2, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Мойка колес', 3490.0000, 570, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Замена прокладки впускного-выпуского коллектора', 2980.0000, 3, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Диагностика работы двигателя', 2760.0000, 150, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Установка сигнализации', 1760.0000, 4, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Замена компрессора кондиционера', 2720.0000, 270, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Замена ремня привода ГУР', 3350.0000, 10, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Замена тормозных колодок', 4260.0000, 8, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Замена масла', 1430.0000, 510, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Замена цепи ГРМ', 4570.0000, 6, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Замена бензонасоса', 1780.0000, 4, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Ремонт приводного вала', 4520.0000, 210, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Замена подшипника компрессора кондиционера', 1110.0000, 330, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Снятие и установка колес', 3130.0000, 390, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Замена лямбда зонда', 770.0000, 270, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Замена привода в сборе', 3890.0000, 8, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Замена трубки кондиционера', 2810.0000, 3, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Замена ремня кондиционера', 4650.0000, 8, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Замена охлаждающей жидкости', 1590.0000, 210, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Замена троса сцепления', 4460.0000, 8, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Замена масла в МКПП', 4490.0000, 9, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Замена рулевой рейки', 4840.0000, 570, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Ремонт дисков', 3860.0000, 270, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Замена масла заднего редуктора (моста)', 840.0000, 7, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Замена подшипника задней ступицы', 1860.0000, 270, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Восстановление рулевых реек', 1020.0000, 2, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Замена рулевой тяги', 570.0000, 3, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Ремонт и замена гидроблока АКПП', 2040.0000, 270, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Замена масла раздаточной коробки', 2070.0000, 510, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Диагностика кондиционера', 2590.0000, 10, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Ремонт и замена катализатора', 500.0000, 270, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Замена гофры глушителя', 760.0000, 270, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Замена ремня ГРМ', 4630.0000, 150, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Ремонт редуктора', 870.0000, 8, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Замена электромагнитного клапана без снятия ТНВД', 4610.0000, 450, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Вулканизация шин', 540.0000, 330, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Ремонт стартера', 2680.0000, 8, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Ремонт коробки передач', 1850.0000, 450, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Жидкостная промывка топливной системы', 3620.0000, 6, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Ремонт генератора', 1700.0000, 210, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Замена масла АКПП', 2430.0000, 450, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Диагностика трансмиссии', 2790.0000, 2, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N'Монтаж и снятие шин с диска', 3990.0000, 10, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N'Замена подшипника передней ступицы', 4020.0000, 330, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N'Замена главного цилиндра сцепления', 4910.0000, 150, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N'Установка автомагнитолы', 3210.0000, 270, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N'Диагностика рулевых тяг', 1680.0000, 3, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N'Замена радиатора кондиционера', 1770.0000, 9, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N'Замена тормозной жидкости', 2200.0000, 6, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N'Ремонт рулевого управления', 3440.0000, 2, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N'Замена заднего редуктора', 2240.0000, 330, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N'Дефектация CVT', 1830.0000, 3, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N'Замена карданного вала', 4450.0000, 2, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N'Замена сцепления', 4320.0000, 330, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N'Установка системы автозапуска', 3620.0000, 9, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N'Замена опоры АКПП', 2540.0000, 5, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N'Ремонт бензонасоса', 500.0000, 210, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N'Замена масла переднего редуктора (моста)', 3950.0000, 9, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N'Ремонт подвесного подшипника', 4440.0000, 7, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N'Тестирование форсунок (стенд)', 1600.0000, 6, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N'Диагностика сцепления', 4210.0000, 6, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N'Замена ступицы в сборе', 4250.0000, 150, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N'Антибактериальная обработка кондиционера', 4580.0000, 450, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N'Ремонт глушителя', 2100.0000, 150, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N'Диагностика рулевого редуктора', 2930.0000, 3, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N'Диагностика подвески', 1460.0000, 330, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (75, N'Замена свечей', 2240.0000, 2, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N'Диагностика инжектора', 3390.0000, 330, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N'Комплексная диагностика автомобиля', 1120.0000, 10, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N'Ремонт раздаточной коробки', 3610.0000, 10, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N'Удаление катализатора', 1930.0000, 510, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N'Снятие/установка форсунок', 1470.0000, 5, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N'Развал-схождение', 3890.0000, 3, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N'Замена выжимного подшипника', 2250.0000, 10, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N'Чистка форсунок ультразвуком', 3920.0000, 4, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N'Ремонт компрессора кондиционера', 4760.0000, 150, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N'Замена цилиндра сцепления', 810.0000, 8, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N'Ремонт подвески (ходовой)', 680.0000, 3, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N'Замена фильтров', 530.0000, 210, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N'Кузовной ремонт', 2750.0000, 150, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N'Замена прокладки приемной трубки', 4680.0000, 570, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N'Диагностика выхлопной системы автомобиля', 2550.0000, 3, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N'Балансировка колес', 4690.0000, 390, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N'Ремонт автоэлектрики', 4230.0000, 450, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N'ТО с сохранением гарантии', 4300.0000, 270, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N'Ремонт карданного вала', 780.0000, 210, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N'Ремонт сцепления', 3290.0000, 10, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N'Замена кулисы АКПП', 3250.0000, 6, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N'Ремонт кронштейна глушителя', 1410.0000, 570, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N'Замена сальника привода', 3820.0000, 570, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N'Замена пыльника шруса', 4730.0000, 5, N'', NULL, N'')
GO
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N'Замена маховика', 2400.0000, 10, N'', 25, N'')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
