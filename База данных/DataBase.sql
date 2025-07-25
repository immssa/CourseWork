USE [master]
GO
/****** Object:  Database [Cw]    Script Date: 14.06.2025 23:28:42 ******/
CREATE DATABASE [Cw]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cw', FILENAME = N'D:\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cw.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cw_log', FILENAME = N'D:\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cw_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cw] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cw].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cw] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cw] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cw] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cw] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cw] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cw] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cw] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cw] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cw] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cw] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cw] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cw] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cw] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cw] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cw] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cw] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cw] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cw] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cw] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cw] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cw] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cw] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cw] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cw] SET  MULTI_USER 
GO
ALTER DATABASE [Cw] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cw] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cw] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cw] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cw] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cw] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cw] SET QUERY_STORE = OFF
GO
USE [Cw]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14.06.2025 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](50) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 14.06.2025 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Comment_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Knowledge_ID] [int] NOT NULL,
	[Comment_Text] [text] NOT NULL,
	[Created_At] [datetime] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Comment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Knowledges]    Script Date: 14.06.2025 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Knowledges](
	[Knowledge_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Text] [text] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Created_At] [datetime] NOT NULL,
	[Update_At] [datetime] NOT NULL,
 CONSTRAINT [PK_Knowledges] PRIMARY KEY CLUSTERED 
(
	[Knowledge_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 14.06.2025 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[Rating_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Knowledge_ID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[Rated_At] [datetime] NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[Rating_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.06.2025 23:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](20) NOT NULL,
	[Password] [char](20) NOT NULL,
	[Full_Name] [varchar](50) NULL,
	[Registered_At] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (4, N'Кулинария', N'Рецепты и кулинарные лайфхаки')
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (5, N'Стихотворения', N'Стихотворения разных писателей')
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (6, N'Фильмы и сериалы', N'')
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (7, N'Цитаты', N'')
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (8, N'Автомобили', N'Всё про машины от А до Я')
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (9, N'Сад и огород', N'')
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (10, N'Путешествия', N'Всё про путешествия, страны и путёвки.
Факты и лазейки.')
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (11, N'Книги', N'')
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (12, N'Известные личности (сплетни)', N'')
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Description]) VALUES (13, N'Дом и ремонт', N'Всё про ремонт ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (4, 7, 35, N'Очень простой рецепт, мне подходит! Вкусно получилось, рекомендую)', CAST(N'2025-06-13T19:49:20.677' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (5, 8, 42, N'Как же трогает', CAST(N'2025-06-13T19:54:22.717' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (7, 6, 44, N'asd', CAST(N'2025-06-13T21:22:33.283' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (8, 6, 130, N'Пойду покажу это соседям', CAST(N'2025-06-14T21:16:46.570' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (9, 6, 131, N'Я считаю, что кухня выйдет в разы дороже', CAST(N'2025-06-14T21:17:31.250' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (10, 6, 115, N'Слишком короткая!', CAST(N'2025-06-14T21:18:21.417' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (11, 6, 45, N'Вкуснятиня', CAST(N'2025-06-14T21:18:43.333' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (12, 6, 102, N'окак', CAST(N'2025-06-14T21:19:06.933' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (13, 6, 105, N'Взял на заметку', CAST(N'2025-06-14T21:27:37.007' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (14, 6, 97, N'Такое мне надо, сделаю', CAST(N'2025-06-14T21:28:16.533' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (15, 6, 43, N'Мне очень понравился сериал! Вообще не оторваться, люблю расследования', CAST(N'2025-06-14T21:29:08.523' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (16, 6, 78, N'И тут я задумался', CAST(N'2025-06-14T21:30:17.010' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (17, 1, 73, N'Ноль процентов осуждения, сто процентов восхваления', CAST(N'2025-06-14T21:31:10.640' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (18, 1, 61, N'Потрясающий фильм!!', CAST(N'2025-06-14T21:32:02.793' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (19, 1, 62, N'Смешная комедия', CAST(N'2025-06-14T21:32:31.097' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (20, 1, 53, N'К-классика', CAST(N'2025-06-14T21:33:00.680' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (21, 1, 99, N'А как домашнюю посадить?', CAST(N'2025-06-14T21:34:03.253' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (22, 1, 103, N'Обязательно к посещению', CAST(N'2025-06-14T21:34:39.690' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (23, 1, 52, N'Это так просто и ну очень вкусно', CAST(N'2025-06-14T21:35:06.627' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (24, 1, 114, N'Было интересно узнать', CAST(N'2025-06-14T21:35:57.520' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (25, 1, 120, N'Вот это поворот про беременность Агаты', CAST(N'2025-06-14T21:36:49.257' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (26, 7, 84, N'Работает', CAST(N'2025-06-14T21:38:30.357' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (27, 7, 87, N'Надо ли свет выключать?', CAST(N'2025-06-14T21:39:07.437' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (28, 7, 127, N'вот на них и держится вся вера в семью, любовь и преданность', CAST(N'2025-06-14T21:41:47.177' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (29, 7, 113, N'Купил, но ещё не читал', CAST(N'2025-06-14T21:42:22.903' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (30, 7, 48, N'Мой любимый суп', CAST(N'2025-06-14T21:42:53.047' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (31, 7, 50, N'Это великолепно', CAST(N'2025-06-14T21:43:17.733' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (32, 7, 100, N'Я там был', CAST(N'2025-06-14T21:43:28.700' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (33, 7, 102, N'Летом еду', CAST(N'2025-06-14T21:43:53.340' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (34, 7, 90, N'А если там и цветы и овощи?)', CAST(N'2025-06-14T21:44:26.107' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (35, 7, 41, N'Сильно', CAST(N'2025-06-14T21:44:57.313' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (36, 7, 44, N'Жду выхода', CAST(N'2025-06-14T21:45:28.130' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (37, 7, 65, N'Мне бы так драться)', CAST(N'2025-06-14T21:46:01.250' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (38, 7, 66, N'Вообще любимка', CAST(N'2025-06-14T21:46:14.343' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (39, 7, 70, N'ничего не понял', CAST(N'2025-06-14T21:46:47.727' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (40, 8, 69, N'Это вырезка?', CAST(N'2025-06-14T21:47:43.620' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (41, 8, 61, N'Смотрел в кино. Полный восторг', CAST(N'2025-06-14T21:48:14.070' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (42, 8, 64, N'Обожаю все фильмы этого режиссёра', CAST(N'2025-06-14T21:48:49.107' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (43, 8, 92, N'Для балкона всё тоже?', CAST(N'2025-06-14T21:49:37.473' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (44, 8, 101, N'Это мне подходит!)', CAST(N'2025-06-14T21:50:05.290' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (45, 8, 47, N'Любимый салат, готовлю на все праздники', CAST(N'2025-06-14T21:50:44.433' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (46, 8, 52, N'Быстро и вкусно', CAST(N'2025-06-14T21:51:05.887' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (47, 8, 119, N'Отец убил сына и это в школьной литературе', CAST(N'2025-06-14T21:51:48.773' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (48, 8, 122, N'Рад за неё. Знаю её с Орла и Решки', CAST(N'2025-06-14T21:52:19.510' AS DateTime))
INSERT [dbo].[Comments] ([Comment_ID], [User_ID], [Knowledge_ID], [Comment_Text], [Created_At]) VALUES (49, 8, 89, N'ещё для механики нужно', CAST(N'2025-06-14T21:53:20.037' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Knowledges] ON 

INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (34, N'Оладьи', N'Продукты (на 4 порции)
Кефир - 1 стакан (250 мл)
Яйца - 1-2 шт.
Мука пшеничная - 1,5 стакана (около 240 г)
Сахар - 2-3 ст. ложки
Соль - 0,5 ч. ложки
Сода - 0,25 ч. ложки
Масло растительное - для жарки', 6, 4, CAST(N'2025-06-13T16:29:22.247' AS DateTime), CAST(N'2025-06-13T16:29:22.247' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (35, N'Блины', N'Продукты
Молоко - 700 мл
Яйца куриные - 2-3 шт.
Масло растительное - 2-3 ст. ложки
Мука - 300 г
Сахар - 2-3 ст. ложки
Соль - 1-2 щепотки', 6, 4, CAST(N'2025-06-13T17:04:15.747' AS DateTime), CAST(N'2025-06-13T17:04:15.747' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (41, N'Люди привыкают ко всему', N'Люди привыкают ко всему
Может быть не сразу, постепенно.
Только непонятно почему
Привыкают к боли и изменам.

И к тому, что предают друзья,
И к тому, что близкие уходят...
Говорите, привыкать нельзя?
Мы и сами понимаем, вроде.

Но устроен странно этот мир —
То, что раньше было невозможно,
Незаметно принимаем мы,
Так логично, мудро, осторожно.

Ничего не поменялось тут.
Просто всем нам далеко не двадцать.
Люди привыкают и живут.
А куда прикажете деваться?', 7, 5, CAST(N'2025-06-13T19:48:17.463' AS DateTime), CAST(N'2025-06-13T19:48:17.463' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (42, N'Одиночество', N'Одиночество... Как же хочется...
Просто за руку взять... Просто нежно обнять...
Поршептать тебе, как же на земле
Стало пусто теперь без тебя и опять
Тихо плакать и громко рыдать...
Помнить каждый день, помнить всё о тебе...
Как любил, как берег, каждый шаг, каждый вдох...
А теперь небеса охраняют тебя, видит Бог...
Моим ангелом стал, своим самым надежным крылом
Ты скрываешь от бед, от разлук, от тревог...
И уходят дни, без тебя они...
быстротечны, но вечны и так бесконечны они...', 7, 5, CAST(N'2025-06-13T19:51:31.010' AS DateTime), CAST(N'2025-06-13T19:51:31.010' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (43, N'Фишер', N'Интеллигентный следователь Валерий Козырев, его дерзкий напарник из Ростова Евгений Боков и другие коллеги расследуют преступления, связанные с серийными убийствами.

Жанр - детектив, драма, криминал, триллер

Рейтинг сериала 8.0

2023 - ....

Россия, 18+
', 8, 6, CAST(N'2025-06-13T19:58:15.093' AS DateTime), CAST(N'2025-06-13T19:58:15.093' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (44, N'Три богатыря. Ни дня без подвига 2', N'Три богатыря — на то и богатыри, что каждый день готовы к новым сказочным подвигам. Всё по силам могучей троице — встретить заморского царя по высшему разряду, разоблачить мошенников-самозванцев, вернуть коню Юлию его способность разговаривать, а князя превратить обратно из комара в человека. И сделать это, как всегда, весело, дружно, да со смекалкой.

2025, 6+, Мультфильм', 8, 6, CAST(N'2025-06-13T19:59:48.307' AS DateTime), CAST(N'2025-06-13T21:16:34.853' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (45, N'Малиновый ревани', N'Продукты:
Йогурт - 200 г
Масло растительное - 200 мл
Яйца - 3 шт.
Сахар - 200 г
Крупа манная - 200 г
Мука - 130 г (1 стакан ёмкостью 200 мл)
Разрыхлитель - 10-12 г
Ванильный сахар (по желанию) - 10 г
Цедра лимона (по желанию) - 1-2 ч. ложки
*
Для малинового сиропа:
Малиновое пюре - 500 г
Сахар - 100 г или по вкусу, в зависимости от сладости пюре
Вода - 100 мл
Сок лимона - 1-2 ст. ложки
*
Для украшения:
Свежая малина
Кокосовая стружка или рубленые фисташки

Шаги приготовления: 
Подготавливаем продукты. Со тщательно вымытого лимона мелкой тёркой снимаем цедру. Выдавливаем нужное количество сока.
Готовим малиновый сироп: в кастрюле соединяем сахар и воду. Отправляем на нагрев. Когда сахар растворится - вливаем сок. Доводим до закипания. Добавляем пюре. Перемешиваем. После закипания выключаем нагрев.
В миске смешиваем манку, муку и разрыхлитель. Форму для выпечки 25х35 см выстилаем силиконизированной бумагой или хорошо смазываем маслом. Включаем духовку для разогрева до 180 ?. 
Яйца взбиваем в отдельной миске до пышности. Всыпаем сахар. Взбиваем до побеления. Добавляем йогурт, всыпаем ванильный сахар, вливаем растительное масло, всыпаем цедру. Порциями вводим манно-мучную смесь. После каждого добавления аккуратно перемешиваем, чтобы не разрушить пузырьки внутри взбитой массы - лопаткой или выключенным миксером. Выливаем тесто в подготовленную форму. Выпекаем 30-40 минут при 180 ?. 
Сироп остыл. По желанию можно отделить малиновые косточки, пропустив сироп через сито. Манник прямо в форме разрезаем на порции. Заливаем верх манника сиропом, стараясь попасть в разрезы.
Оставляем до полного остывания и пропитки при комнатной температуре, затем отправляем на 1-2 часа в холод. Вынимаем из формы. Подачу по желанию украшаем листиками мяты и ягодами малины.', 1, 4, CAST(N'2025-06-13T21:50:58.587' AS DateTime), CAST(N'2025-06-13T21:50:58.587' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (46, N'Картофельный салат с овощами и жареным куриным филе', N'Продукты:
Филе куриное - 320 г
Картофель - 560 г
Перец болгарский - 250 г
Огурцы маринованные - 150 г
Яйцо - 1 шт.
Мука - 75 г
Йогурт натуральный без добавок - 120 г
Масло растительное - 40 мл
Зелень свежая (петрушка, укроп) - 20 г
Соль - по вкусу
Перец чёрный молотый - по вкусу

Приготовление: Подготавливаем продукты. Картофель моем и отвариваем в кожуре 20 минут, до мягкости. Куриное филе нарезаем тонкими полосками. Филе солим и перчим. Яйцо разбиваем в пиалу, слегка взбиваем вилкой. Добавляем 10 г муки. Обваливаем кусочки филе сначала в муке (65 г). Затем окунаем в яичную смесь. В сковороде разогреваем растительное масло. Выкладываем туда филе. Жарим филе до золотистой корочки - по 2-3 минуты с каждой стороны. Выкладываем готовое филе на бумажное полотенце, чтобы удалить излишки масла. Болгарский перец очищаем от семян. Нарезаем тонкой соломкой. Огурцы нарезаем полосками. Картофель очищаем и нарезаем брусочками. В салатник отправляем перец, картофель, огурцы и филе. Мелко нарезаем зелень и добавляем к остальным ингредиентам. Добавляем соль и перец по вкусу. Заправляем салат йогуртом. Тщательно перемешиваем. Подаём салат к столу.', 1, 4, CAST(N'2025-06-13T21:55:03.493' AS DateTime), CAST(N'2025-06-13T21:55:03.493' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (47, N'Салат из фасоли и лука', N'Продукты (на 2 порции):
Фасоль консервированная в собственном соку - 250 г
Лук репчатый - 110 г
Уксус яблочный - 20 мл
Масло растительное - 30 мл
Сахар - 15 г (1 ст. ложка)
Соль - 1/8 ч. ложки
Вода - 100 мл

Приготовление: Подготовить продукты. С консервированной фасоли слить жидкость. Кипячённую воду комнатной температуры и уксус влить в салатник. Добавить растительное масло. Всыпать сахар. Посолить. Перемешать до растворения ингредиентов. Лук очистить, нарезать тонкими полукольцами. Лук выложить в приготовленный маринад. Добавить фасоль. Всё хорошо перемешать. Дать салату постоять минимум 30 минут – при комнатной температуре, если дольше – в холодильнике. Салат из фасоли и лука готов.', 9, 4, CAST(N'2025-06-13T22:00:56.673' AS DateTime), CAST(N'2025-06-13T22:00:56.673' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (48, N'Суп с мясными фрикадельками, картофелем и капустой', N'Продукты (на 3 порции):
Фарш свиной - 300 г
Картофель молодой - 200 г
Капуста молодая - 100 г
Морковь - 80 г
Лук репчатый - 80 г
Сухари панировочные - 1 ст. ложка
Яйцо - 0,5 шт.
Соль - по вкусу
Перец черный молотый - по вкусу
Вода - 1,5 л

Приготовление: Подготовить все продукты по списку. Фарш переложить в удобную миску, всыпать панировочные сухари, добавить соль и черный молотый перец. Отдельно в миску разбить яйцо, слегка взболтать его вилкой и добавить половину яйца в фарш. Тщательно вымешать фарш руками. Сформировать мокрыми руками маленькие фрикадельки. Очистить молодой картофель и нарезать небольшими кубиками. Очистить репчатый лук и нарезать маленькими кубиками. Очистить морковь и натереть на средней терке. Соединить картофель, морковь и лук в кастрюле. Влить 1,5 литра горячей воды, довести до кипения и варить 15 минут. Капусту нарезать небольшими тонкими полосками. Когда овощи будут готовы, выложить в кастрюлю фрикадельки. Следом добавить капусту, соль и черный молотый перец по вкусу. Довести до кипения и варить суп еще 15 минут. Суп с фрикадельками, молодым картофелем и капустой готов к подаче.', 9, 4, CAST(N'2025-06-13T22:03:50.837' AS DateTime), CAST(N'2025-06-13T22:03:50.837' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (49, N'Чешское сырное печенье', N'Продукты:
Мука — 200 г + для работы с тестом
Сыр твёрдый — 150 г
Масло сливочное — 60 г
Яйца — 2 шт.
Сметана — 60 г
Паприка копчёная — 5 г
Разрыхлитель — 10 г
Кунжут — 20 г
Соль — 1/3 ч. ложки

Подготавливаем продукты. Сливочное масло должно быть размягчённым, поэтому заранее достаём его из холодильника. В миску отправляем муку, паприку и разрыхлитель. Перемешиваем сухие ингредиенты. В отдельную миску отправляем яйцо, размягчённое сливочное масло и сметану. Перемешиваем. Духовку включаем для разогрева до 180 градусов. Сыр натираем на мелкой тёрке. Добавляем сыр к яично-масляной массе. Солим. Тщательно перемешиваем. Добавляем муку. Замешиваем эластичное тесто. При необходимости рабочую поверхность подпыляем мукой. Выкладываем тесто и раскатываем в пласт толщиной 4-5 мм. Нарезаем тесто ромбиками. Противень застилаем пергаментом и выкладываем туда заготовки. Оставшееся яйцо разделяем на желток и белок. Белок немного разбалтываем вилкой и смазываем им заготовки с помощью кулинарной кисти. Отправляем печенье в разогретую духовку примерно на 10 минут. Подаём печенье к столу.', 10, 4, CAST(N'2025-06-13T22:08:22.260' AS DateTime), CAST(N'2025-06-13T22:08:22.260' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (50, N'Спагетти с баклажанами и беконом', N'Продукты (на 3 порции):
Спагетти - 200 г
Бекон варёно-копчёный - 150 г
Баклажаны - 400 г
Лук красный - 100 г
Помидоры - 200 г
Чеснок (крупный) - 10 г (1 зубчик)
Томатный соус - 70 г
Масло растительное - 15 мл
Соль - по вкусу
Перец чёрный молотый - 1/8 ч. ложки
Приправа для овощей - 1/4 ч. ложки
Базилик свежий - 15 г
Кинза свежая - 10 г

В кастрюле вскипятить воду, всыпать 1 ч. ложку соли. Опустить туда спагетти. Варить до состояния аль денте, 9 минут. Готовые спагетти откинуть на дуршлаг, дать воде стечь. 100 мл отвара оставить для соуса. Бекон нарезать средними полосками. У баклажанов отрезать плодоножки, мякоть нарезать некрупными кубиками. Бекон выложить в разогретую сухую сковороду. Обжарить на среднем огне, помешивая, до румяности, 2 минуты. Переложить на тарелку. В освободившуюся сковороду долить масло. Добавить баклажаны. Обжарить на среднем огне, помешивая, 5 минут. Лук и чеснок очистить, нарезать некрупными кубиками. Листики базилика и кинзу измельчить. Добавить лук и чеснок к баклажанам. Обжарить, помешивая, 3 минуты. Помидоры нарезать средними кусочками. Помидоры и томатный соус выложить в сковороду. Готовить 3-5 минут. Добавить кинзу, базилик и приправу. Перемешать. Посолить и поперчить. Влить 100 мл отвара от макарон. Перемешать. Готовить всё 1 минуту. Готовые спагетти переложить к овощам. Перемешать. Добавить обжаренный бекон. Перемешать. Накрыть крышкой, прогреть всё 1-2 минуты на небольшом огне. Спагетти с баклажанами и беконом можно подавать к столу.', 10, 4, CAST(N'2025-06-13T22:11:40.367' AS DateTime), CAST(N'2025-06-13T22:11:40.367' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (51, N'Овощные палочки из кабачков, с овсяной мукой и сыром', N'Продукты:
Кабачки – 715 г
Хлопья овсяные – 80 г
Морковь – 115 г
Картофель – 180 г
Мука (для панировки) – 30 г
Яйца – 2 шт.
Сыр твёрдый – 100 г
Петрушка свежая – по вкусу
Чеснок – 1 зубчик
Травы прованские сушёные – 1 ч. ложка
Паприка молотая – 2 ч. ложки
Масло растительное (для жарки) – 30 г
Соль – по вкусу
Перец чёрный молотый – по вкусу

Для соуса:
Сметана/йогурт без добавок – 60 г
Майонез – 1 ст. ложка
Укроп свежий – по вкусу
Чеснок – 1 зубчик
Паприка сушёная – 1 ч. ложка

Овсяные хлопья измельчаем в блендере в муку крупного помола. Кабачки и картофель натираем на крупной тёрке. Морковь очищаем и натираем на средней или мелкой тёрке.
Один зубчик чеснока пропускаем через пресс. Сыр натираем на крупной тёрке. Смешиваем отжатый картофель, кабачки и морковь. Разбиваем два яйца. Всыпаем овсяную муку, сушёные травы, соль, перец и паприку. Хорошо вымешиваем овощную массу до однородности. Кладём в миску измельчённый сыр. Перемешиваем массу до однородности и оставляем на 15 минут, чтобы мука впитала лишнюю жидкость. Смешиваем для соуса майонез, сметану и свежий измельчённый укроп, паприку и сушёный чеснок. Измельчаем зелень. Добавляем зелень к соусу. Перемешиваем — соус готов. Формируем из овощного теста короткие колбаски-пальчики-палочки. Панируем кабачковые палочки в муке на плоской тарелке. Выкладываем кабачковые палочки в сковороду с разогретым растительным маслом и жарим 4-5 минут, до золотистости. Переворачиваем палочки и продолжаем готовить ещё 3-4 минуты, до готовности и золотистости. Палочки из кабачков с овсяной мукой и сыром готовы. Подаём блюдо в горячем и тёплом виде вместе с соусом.', 10, 4, CAST(N'2025-06-13T22:15:35.097' AS DateTime), CAST(N'2025-06-13T22:15:35.097' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (52, N'Помидоры, запечённые с сыром', N'Продукты (на 3 порции):
Помидоры - 550-600 г
Моцарелла - 130 г
Чеддер (или пармезан) - 30-40 г
Оливковое масло - 40 мл
Орегано - 0,5 ч. л.
Чесночный порошок - 0,5 ч. л.
Сахар - 0,3 ч. л.
Соль - по вкусу
Перец черный молотый - по вкусу
Зелень для украшения (петрушка или базилик) - 3-5 г

Помидоры нарезаем колечками толщиной около 1 см. Противень застилаем пергаментом и выкладываем колечки помидоров. Сбрызгиваем помидоры оливковым маслом. Посыпаем их сахаром, солью и перцем. Затем посыпаем сушеным чесноком. Моцареллу натираем на крупной терке и посыпаем им помидоры сверху. Также натираем на средней (мелкой) терке чеддер и посыпаем сверху. Присыпаем сушеным орегано. Отправляем противень с помидорами в предварительно разогретую до 180 градусов духовку на 20-25 минут. Помидоры, запечённые с сыром готовы. Посыпаем нарезанной свежей зеленью и подаем. Приятного аппетита!', 10, 4, CAST(N'2025-06-13T22:17:50.597' AS DateTime), CAST(N'2025-06-13T22:17:50.597' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (53, N'У лукоморья дуб зелёный', N'У лукоморья дуб зелёный;
Златая цепь на дубе том:
И днём и ночью кот учёный
Всё ходит по цепи кругом;
Идёт направо — песнь заводит,
Налево — сказку говорит.
Там чудеса: там леший бродит,
Русалка на ветвях сидит;
Там на неведомых дорожках
Следы невиданных зверей;
Избушка там на курьих ножках
Стоит без окон, без дверей;
Там лес и дол видений полны;
Там о заре прихлынут волны
На брег песчаный и пустой,
И тридцать витязей прекрасных
Чредой из вод выходят ясных,
И с ними дядька их морской;
Там королевич мимоходом
Пленяет грозного царя;
Там в облаках перед народом
Через леса, через моря
Колдун несёт богатыря;
В темнице там царевна тужит,
А бурый волк ей верно служит;
Там ступа с Бабою Ягой
Идёт, бредёт сама собой,
Там царь Кащей над златом чахнет;
Там русский дух… там Русью пахнет!
И там я был, и мёд я пил;
У моря видел дуб зелёный;
Под ним сидел, и кот учёный
Свои мне сказки говорил.', 16, 5, CAST(N'2025-06-13T22:46:07.023' AS DateTime), CAST(N'2025-06-13T22:46:07.023' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (55, N'К Чаадаеву', N'Любви, надежды, тихой славы
Недолго нежил нас обман,
Исчезли юные забавы,
Как сон, как утренний туман;
Но в нас горит еще желанье,
Под гнетом власти роковой
Нетерпеливою душой
Отчизны внемлем призыванье.
Мы ждем с томленьем упованья
Минуты вольности святой,
Как ждет любовник молодой
Минуты верного свиданья.
Пока свободою горим,
Пока сердца для чести живы,
Мой друг, отчизне посвятим
Души прекрасные порывы!
Товарищ, верь: взойдет она,
Звезда пленительного счастья,
Россия вспрянет ото сна,
И на обломках самовластья
Напишут наши имена!', 16, 5, CAST(N'2025-06-13T22:49:26.423' AS DateTime), CAST(N'2025-06-13T22:49:26.423' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (56, N'Узник', N'Сижу за решеткой в темнице сырой.
Вскормленный в неволе орел молодой,
Мой грустный товарищ, махая крылом,
Кровавую пищу клюет под окном,
Клюет, и бросает, и смотрит в окно,
Как будто со мною задумал одно.
Зовет меня взглядом и криком своим
И вымолвить хочет: «Давай улетим!
Мы вольные птицы; пора, брат, пора!
Туда, где за тучей белеет гора,
Туда, где синеют морские края,
Туда, где гуляем лишь ветер… да я!..»', 16, 5, CAST(N'2025-06-13T22:50:19.407' AS DateTime), CAST(N'2025-06-13T22:50:19.407' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (57, N'Няне', N'Подруга дней моих суровых,
Голубка дряхлая моя!
Одна в глуши лесов сосновых
Давно, давно ты ждешь меня.
Ты под окном своей светлицы
Горюешь, будто на часах,
И медлят поминутно спицы
В твоих наморщенных руках.
Глядишь в забытые вороты
На черный отдаленный путь:
Тоска, предчувствия, заботы
Теснят твою всечасно грудь.
То чудится тебе…', 16, 5, CAST(N'2025-06-13T22:50:48.483' AS DateTime), CAST(N'2025-06-13T22:50:48.483' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (58, N'К ней', N'Эльвина, милый друг, приди, подай мне руку,
Я вяну, прекрати тяжелый жизни сон;
Скажи… увижу ли, на долгую ль разлуку
Я роком осужден?
Ужели никогда на друга друг не взглянет?
Иль вечной темнотой покрыты дни мои?
Ужели никогда нас утро не застанет
В объятиях любви?
Эльвина! Почему в часы глубокой ночи
Я не могу тебя с восторгом обнимать,
На милую стремить томленья полны очи
И страстью трепетать?
И в радости немой, в блаженстве наслажденья
Твой шепот сладостный и тихий стон внимать,
И тихо в скромной тьме для неги пробужденья
Близ милой засыпать?', 16, 5, CAST(N'2025-06-13T22:51:30.683' AS DateTime), CAST(N'2025-06-13T22:51:30.683' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (59, N'Парус', N'Белеет парус одинокой
В тумане моря голубом!..
Что ищет он в стране далекой?
Что кинул он в краю родном?..
Играют волны — ветер свищет,
И мачта гнется и скрыпит…
Увы! он счастия не ищет
И не от счастия бежит!
Под ним струя светлей лазури,
Над ним луч солнца золотой…
А он, мятежный, просит бури,
Как будто в бурях есть покой!

1832 г. Михаил Лермонтов', 8, 5, CAST(N'2025-06-13T22:53:24.967' AS DateTime), CAST(N'2025-06-13T22:53:24.970' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (60, N'Мужество', N'Мы знаем, что ныне лежит на весах
И что совершается ныне.
Час мужества пробил на наших часах,
И мужество нас не покинет.
Не страшно под пулями мертвыми лечь,
Не горько остаться без крова,
И мы сохраним тебя, русская речь,
Великое русское слово.
Свободным и чистым тебя пронесем,
И внукам дадим, и от плена спасем
Навеки.

1942 г. Анна Ахматова', 17, 5, CAST(N'2025-06-13T22:56:02.067' AS DateTime), CAST(N'2025-06-13T22:56:02.067' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (61, N'Кракен', N'Подводники сталкиваются с морским монстром во время важной миссии. Фантастический экшен с Александром Петровым.

2025 г. Фантастика, приключения. Россия 2 ч 13 мин 12+', 17, 6, CAST(N'2025-06-13T22:57:49.960' AS DateTime), CAST(N'2025-06-13T22:57:49.960' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (62, N'Беспринципные в Питере', N'Валентина уезжает с Патриарших в поисках лучшей жизни. Новые приключения самой яркой героини «Беспринципных».

2025 г. Комедия, мелодрама. 1 сезон Россия 18+', 17, 6, CAST(N'2025-06-13T22:59:15.023' AS DateTime), CAST(N'2025-06-13T22:59:15.023' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (63, N'ЛедиБаг и Супер-Кот', N'Влюбленные подростки-супергерои спасают Париж. Самый романтичный мультсериал о борьбе добра со злом.

С 2015 г. Мультфильм, фэнтези. 6 сезонов, Франция, 6+', 17, 6, CAST(N'2025-06-13T23:01:07.507' AS DateTime), CAST(N'2025-06-13T23:01:07.507' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (64, N'Мастер', N'Бывший морпех ищет пропавшую дочь босса. Криминальный боевик с Джейсоном Стэйтемом.

Бывший британский спецназовец Левон Кейд оставил войну в прошлом и теперь работает бригадиром на стройке. Он всегда поможет в трудную минуту и не допустит несправедливости, за что его уважают коллеги. Однажды у близких ему людей бандиты похищают 19-летнюю дочь. Полиция бездействует, и Левон по просьбе родителей решает самостоятельно найти девушку и вернуть её домой.

2025 г. 18+ Боевик, криминал. Великобритания, США', 18, 6, CAST(N'2025-06-13T23:08:08.937' AS DateTime), CAST(N'2025-06-13T23:13:52.927' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (65, N'Пчеловод', N'Он мстит за обманутую пенсионерку — и за свою пасеку. Самый яростный боевик года.

Адам Клэй живет в тихом пригороде, занимается разведением пчёл и не распространяется о своей прошлой жизни. Он дружит с пожилой соседкой миссис Паркер, у которой арендует сарай. Однажды миссис Паркер становится жертвой кибермошенников, которые похищают деньги со всех её счетов. Не в силах вынести такой удар, женщина сводит счёты с жизнью. Осознав, что закон в данной ситуации бессилен, Адам решает применить все свои боевые навыки, чтобы вычислить преступников и отомстить.

2024 г. 18+ Боевик, криминал. Великобритания, США', 18, 6, CAST(N'2025-06-13T23:13:33.247' AS DateTime), CAST(N'2025-06-13T23:13:33.247' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (66, N'Форсаж ', N'Его зовут Брайан, и он — фанат турбин и нитроускорителей. Он пытается попасть в автобанду легендарного Доминика Торетто, чемпиона опасных и незаконных уличных гонок. Брайан также полицейский, и его задание — втереться в доверие к Торетто, подозреваемому в причастности к дерзким грабежам грузовиков, совершаемым прямо на ходу.

2001 г. США, Германия. Боевик, триллер, криминал', 18, 6, CAST(N'2025-06-13T23:15:04.290' AS DateTime), CAST(N'2025-06-13T23:15:04.290' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (67, N'Патруль', N'Патрульный снимает рабочие будни на любительскую камеру. Джейк Джилленхол в суровой полицейской экшен-драме.

Двое друзей-полицейских, Брайан Тейлор и Майк Завала, служат в полиции Лос-Анджелеса и патрулируют опасные районы города, где орудуют банды. Опасная служба не мешает Брайану и Майку обзавестись семьями, но однажды их жизни и благополучие близких оказываются под угрозой, когда полицейские нарушают планы влиятельной криминальной группировки.

2012 г. США, Великобритания. Драма, криминал, боевик, триллер. 18+', 18, 6, CAST(N'2025-06-13T23:16:17.497' AS DateTime), CAST(N'2025-06-13T23:16:17.497' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (68, N'Триггер', N'Гениальный психолог или манипулятор? Один из самых популярных российских сериалов.

Психолог Артём Стрелецкий — сторонник шоковой терапии в лечении больных. Он считает, что единственный способ для человека решить свои проблемы — это понять себя и перестать себе врать. Если большинство психологов нянчатся с клиентами, по полгода выслушивают жалобы на жизнь, сочувствуют и получают при этом немалые деньги за цикл сеансов, то Артём постоянно провоцирует клиентов: оскорбляет их, смеется над ними, намеренно выталкивает из зоны комфорта. Практика Артема процветает, пока один из его пациентов не кончает жизнь самоубийством.

Сериал 2018 - ... 4 сезона
Россия 18+ 
Драма
', 19, 6, CAST(N'2025-06-13T23:19:32.923' AS DateTime), CAST(N'2025-06-13T23:19:32.923' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (69, N'«Исповедь хулигана»', N'Не каждый умеет петь,
Не каждому дано яблоком
Падать к чужим ногам.

Есенин', 19, 7, CAST(N'2025-06-13T23:21:22.930' AS DateTime), CAST(N'2025-06-13T23:21:22.930' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (70, N'Письмо к женщине', N'Лицом к лицу
Лица не увидать.
Большое видится на расстоянье.
Когда кипит морская гладь —
Корабль в плачевном состоянье.

Есенин', 19, 7, CAST(N'2025-06-13T23:21:52.823' AS DateTime), CAST(N'2025-06-13T23:21:52.823' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (71, N'Кто я? Что я? Только лишь мечтатель…', N'Если тронуть страсти в человеке,
То, конечно, правды не найдешь.

Есенин', 19, 7, CAST(N'2025-06-13T23:22:26.143' AS DateTime), CAST(N'2025-06-13T23:22:26.143' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (72, N'Не гляди на меня с упреком...', N'Если б не было ада и рая,
Их бы выдумал сам человек.

Есенин', 19, 7, CAST(N'2025-06-13T23:23:01.493' AS DateTime), CAST(N'2025-06-13T23:23:01.493' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (73, N'Есенин', N'В бури, грозы, житейскую стынь, при тяжёлых утратах и когда тебе грустно, казаться улыбчивым и простым самое высшее в мире искусство.', 19, 7, CAST(N'2025-06-13T23:25:43.457' AS DateTime), CAST(N'2025-06-13T23:25:43.457' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (74, N'Стетхем', N'Паникует ли Джейсон Стэтхем? Нет, я не паникую, но каждый день я испытываю страх по самым разным причинам. Он мотивирует меня.', 19, 7, CAST(N'2025-06-13T23:27:09.230' AS DateTime), CAST(N'2025-06-13T23:27:09.230' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (75, N'Стетхем', N'Безнадежно — это когда на крышку гроба падает земля. Остальное можно исправить.', 19, 7, CAST(N'2025-06-13T23:27:30.367' AS DateTime), CAST(N'2025-06-13T23:27:30.367' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (76, N'Стетхем', N'В гараже у Гая лежат специальные маты, и еще к нему захаживает один приятель, большой специалист по части драк. Мы втроем просто убиваем друг друга на этих матах. Вот такое у меня хобби — бить по физиономии лучших друзей.', 19, 7, CAST(N'2025-06-13T23:27:53.877' AS DateTime), CAST(N'2025-06-13T23:27:53.877' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (77, N'Наполеон Хилл', N'Что разум человека может постигнуть и во что он может поверить, того он способен достичь.', 1, 7, CAST(N'2025-06-13T23:30:07.600' AS DateTime), CAST(N'2025-06-13T23:30:07.600' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (78, N'Альберт Эйнштейн', N'Стремитесь не к успеху, а к ценностям, которые он дает.', 1, 7, CAST(N'2025-06-13T23:30:35.050' AS DateTime), CAST(N'2025-06-13T23:30:35.050' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (79, N'Майкл Джордан', N'За свою карьеру я пропустил более 9000 бросков, проиграл почти 300 игр. 26 раз мне доверяли сделать финальный победный бросок, и я промахивался. Я терпел поражения снова, и снова, и снова. И именно поэтому я добился успеха.', 1, 7, CAST(N'2025-06-13T23:30:56.623' AS DateTime), CAST(N'2025-06-13T23:30:56.623' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (80, N'Заправка авто', N'Паркуемся нужной стороной у колонки.
Глушим мотор, фиксируем авто ручным тормозом.
Открываем бак, вставляем в горловину пистолет.
На терминале указываем номер колонки, тип и количество топлива.
Проводим оплату картой или наличными.
Нажимаем на рычаг пистолета, заправляем автомобиль.
Вынимаем пистолет, возвращаем его на место, закрываем бак.
Можно ехать.', 20, 8, CAST(N'2025-06-14T12:00:58.453' AS DateTime), CAST(N'2025-06-14T12:00:58.453' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (81, N'Как трогаться на механике', N'Левой ногой выжимаем сцепление, включаем первую передачу. Правой ногой добавляем газа до 1500 оборотов (в зависимости от уклона, но не более 3000 оборотов). Плавно отпускаем педаль сцепления до рабочего хода (обороты упадут до 1300 ?1200). Машина готова трогаться с места — отпускаем ручник и начинаем движение.', 20, 8, CAST(N'2025-06-14T12:02:16.963' AS DateTime), CAST(N'2025-06-14T12:02:16.963' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (82, N'Начало движения на механике', N'1. Выжать педаль сцепления и запустить мотор, повернув ключ в замке зажигания.
2. Опустить рычаг ручного тормоза, если он находится в верхнем положении.
3. Плавно нажать на газ, добавив обороты.
4. Удерживая сцепление, включить первую передачу.', 20, 8, CAST(N'2025-06-14T12:03:34.513' AS DateTime), CAST(N'2025-06-14T12:03:34.513' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (83, N'Нужно ли выжимать сцепление при торможении?', N'Нужно ли выжимать сцепление при торможении?

Сцепление нужно выжимать в том случае, если обороты двигателя опускаются ниже минимальных значений, чтобы избежать заглушения. В остальных случаях можно использовать тормоза и не касаться сцепления до момента полной остановки.', 20, 8, CAST(N'2025-06-14T12:04:45.647' AS DateTime), CAST(N'2025-06-14T12:04:45.647' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (84, N'Как завести механику «с толчка» ', N'Как завести механику «с толчка» 

Выжать сцепление
Включить вторую передачу
Повернуть ключ в замке зажигания
Разогнать авто до скорости более 10 км/ч
Резко отпустить сцепление и одномоментно нажать педаль газа', 20, 8, CAST(N'2025-06-14T12:05:48.950' AS DateTime), CAST(N'2025-06-14T12:05:48.950' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (85, N'Почему нельзя долго держать нажатой педаль сцепления?', N'Почему нельзя долго держать нажатой педаль сцепления?

На гидравлическом сцеплении долгое удержание педали в нажатом состоянии может привести к преждевременному выходу из строя манжеты в цилиндре сцепления.', 20, 8, CAST(N'2025-06-14T12:06:39.317' AS DateTime), CAST(N'2025-06-14T12:06:39.317' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (86, N'Можно ли переключаться с 3 на 1?', N'Можно ли переключаться с 3 на 1?

Жёсткой последовательности переключения передач на механической коробке нет: со второй можно переходить прямо на пятую, с третьей — на первую и обратно. Но учтите, что при непоследовательном переключении тратится больше времени на разгон, а обороты двигателя снижаются.', 20, 8, CAST(N'2025-06-14T12:07:59.107' AS DateTime), CAST(N'2025-06-14T12:07:59.107' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (87, N'Глушим машину', N'Для машин с механикой это: снизить скорость — выжать сцепление — переключиться на «нейтраль» — нажать на тормоз — дернуть ручник — заглушить мотор. 

Для авто с автоматом: нажать на тормоз — переключить КПП в положение «Р» — поставить машину на стояночный тормоз — заглушить мотор.', 20, 8, CAST(N'2025-06-14T12:09:36.167' AS DateTime), CAST(N'2025-06-14T12:09:36.167' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (88, N'Как трогаться в горку на АКПП?', N'Как трогаться в горку на АКПП?

Включаем соответствующий поворотник (если нужно), плавно отпускаем тормоз — и автомобиль сам трогается.', 20, 8, CAST(N'2025-06-14T12:11:20.853' AS DateTime), CAST(N'2025-06-14T12:11:20.853' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (89, N'Как парковаться под горку на АКПП?', N'Как правильно парковать автомобиль с АКПП на уклоне? 

Если паркуемся на склоне, рекомендуется применять следующий порядок действий: держим нажатым тормоз, переводим селектор АКПП в нейтраль, затягиваем «ручник», и только после этого включаем паркинг.', 20, 8, CAST(N'2025-06-14T12:13:56.590' AS DateTime), CAST(N'2025-06-14T12:13:56.590' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (90, N'В чем разница между садом и огородом?', N'В чем разница между садом и огородом?

В отличие от сада, огород предназначен прежде всего для выращивания овощных культур. Здесь преобладают однолетние и двулетние растения, которые высаживаются ежегодно. Рассмотрим ключевые характеристики огорода: Выращивание овощей и зелени (картофель, капуста, морковь).', 9, 9, CAST(N'2025-06-14T12:30:08.750' AS DateTime), CAST(N'2025-06-14T12:30:08.750' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (91, N'Фирма Сады России', N'Сады России, садовый центр, Центральная ул., 92, д. Шибаново — Яндекс Карты

+78007377758', 9, 9, CAST(N'2025-06-14T12:31:03.507' AS DateTime), CAST(N'2025-06-14T12:31:32.857' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (92, N'Что положить в лунку, когда садишь томаты?', N'Какую почву предпочитают помидоры:

1. Удобрения, содержащие фосфор, калий.
2. Доломитовую муку или другие средства для нейтрализации кислотности.
3. Навоз (конский, коровяк, птичий помет) – источник азота.
4. Золу, обогащающую почву микроэлементами.', 9, 9, CAST(N'2025-06-14T12:33:03.383' AS DateTime), CAST(N'2025-06-14T12:33:03.383' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (93, N'Помидоры', N'Можно ли сажать помидоры по 2 куста вместе?

Выращивать помидоры парами можно в открытом грунте и в теплице. Если претендентов на место под укрытием в огороде много, посадка по два куста в одну лунку позволит собрать большие урожаи даже в случае, если теплица одна. Как показывает опыт многих садоводов помидоры вырастают крупными, созревают они быстрее.', 9, 9, CAST(N'2025-06-14T12:33:50.847' AS DateTime), CAST(N'2025-06-14T12:33:50.847' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (94, N'Клубника', N'Как правильно посадить клубнику, чтобы был хороший урожай?

Чаще всего ягоду сажают лентами в 2 ряда. Расстояние между рядами 30 см, между лентами – 60 см, между кустами 20-30 см. Либо в шахматном порядке на грядках, шириной 100 см. Участок под посадку освобождается от сорняков, под саженцы выкапывают лунки глубиной 25 см.', 10, 9, CAST(N'2025-06-14T12:36:00.260' AS DateTime), CAST(N'2025-06-14T12:36:00.260' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (95, N'Клубника', N'Самый простой способ получить урожай крупной и сладкой ягоды – подкормить клубнику молоком. Все достаточно просто: литр свежего теплого молока разводят в 10 литрах воды, к полученному раствору добавляют 20 капель йода и заливают смесь в опрыскиватель.', 10, 9, CAST(N'2025-06-14T12:36:21.227' AS DateTime), CAST(N'2025-06-14T12:36:21.227' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (96, N'Клубника', N'При посадке внесите специальное удобрение Фертика - для ягод. Данное удобрение не содержит хлор и не подкисляет почву. Удобрение нужно равномерно рассыпать на влажной почве между растениями или по поверхности почвы под кроной кустарников, затем проведите рыхление или перекопку. Обязательно обильно полейте.', 10, 9, CAST(N'2025-06-14T12:36:44.080' AS DateTime), CAST(N'2025-06-14T12:36:44.080' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (97, N'Высокие грядки', N'Чтобы сделать высокие грядки, нужно соорудить каркас из досок, шифера или металла, а затем заполнить его слоями органических материалов, постепенно перекрывая плодородной почвой. Это позволит создать благоприятные условия для роста растений и упростит уход за ними. 

Пошаговая инструкция:

1. Определение места и размеров грядки:
Выберите место на участке, где будет располагаться грядка, и определите ее желаемые размеры (длина, ширина, высота). Оптимальная ширина грядки – 1-1,2 метра, чтобы удобно было дотягиваться до середины, а высота может быть от 30 до 80 см, в зависимости от ваших предпочтений и роста. 

2. Создание каркаса:
Из дерева: Используйте доски, обработанные антисептиком для защиты от гниения. Соедините доски между собой с помощью саморезов и уголков, формируя прямоугольный или квадратный короб. Внутри каркаса можно закрепить пленку для дополнительной защиты от влаги. 
Из шифера: Шифер – прочный и долговечный материал, устойчивый к перепадам температур и гниению. Установите шиферные листы, соединив их с помощью металлических уголков или других подходящих крепежей. 
Из металла: Металлические грядки долговечны и удобны в эксплуатации, но могут быть дорогими. При установке металлического каркаса можно использовать специальные крепежные элементы или сварку. 

3. Заполнение грядки:
Дренажный слой: На дно грядки уложите слой крупных органических материалов, таких как ветки, старые доски, обрезки, которые будут выполнять функцию дренажа. 
Слой органики: Заполните грядку слоями органических материалов, которые будут перегнивать и питать растения. Можно использовать солому, листья, скошенную траву, сорняки, опилки, картон и другие органические отходы. 
Компост и почва: Сверху органических слоев уложите слой компоста или перепревшего навоза, а затем плодородную почву, смешанную с перегноем, золой и торфом.
 
4. Уплотнение и полив:
После заполнения грядки почву нужно уплотнить и хорошо пролить водой, чтобы слои осели. 

5. Мульчирование:
После уплотнения почвы рекомендуется замульчировать ее, чтобы сохранить влагу и предотвратить рост сорняков. 

Преимущества высоких грядок:
Улучшенное прогревание почвы: Высокие грядки прогреваются быстрее весной, что позволяет раньше начать посев и посадку. 
Удобство ухода: Высокие грядки облегчают прополку, полив и сбор урожая. 
Улучшение структуры почвы: Органические материалы в составе высоких грядок способствуют улучшению структуры почвы, делая ее более рыхлой и плодородной. 
Защита от вредителей: Высокие грядки могут защитить растения от некоторых вредителей, таких как слизни и улитки. 
Эстетический вид: Высокие грядки могут стать украшением участка. 

Недостатки высоких грядок:
Высыхание почвы: Почва в высоких грядках может быстро высыхать, поэтому требуется более частый полив. 
Стоимость: Высокие грядки, особенно из готовых материалов, могут потребовать больших затрат. 
Сложность переустановки: При необходимости переноса грядки на другое место, это может быть сложной задачей. ', 17, 9, CAST(N'2025-06-14T12:40:23.107' AS DateTime), CAST(N'2025-06-14T12:40:23.107' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (98, N'Яблоня', N'Чтобы посадить яблоню, нужно подготовить яму, правильно установить саженец, засыпать землей, полить и замульчировать. Важно учесть расположение яблони на участке, выбрать подходящее время года (весна или осень) и правильно подготовить посадочную яму. 

Подготовка посадочной ямы:
Выкопайте яму глубиной и шириной не менее 60 см. Почву с верхнего плодородного слоя отложите отдельно, а нижний слой – в другую сторону. По возможности подготовьте яму за несколько недель до посадки, чтобы земля осела. Если почва тяжелая, добавьте в нее песок и перегной. 

Посадка яблони:
В центр ямы вбейте колышек для опоры саженца, чтобы он не шатался, пока не укоренится. Установите саженец в яму, чтобы корневая шейка была на уровне земли или немного выше (на 5-7 см). Расправьте корни по кругу. Засыпьте корни плодородной почвой, слегка утрамбовывая ее, чтобы не осталось пустот. Сделайте вокруг яблони лунку для полива и замульчируйте приствольный круг. Обильно полейте яблоню. 

Дополнительные советы:
Выбирайте для посадки яблони солнечное место, защищенное от сильных ветров. 
Оптимальное расстояние между яблонями зависит от сорта: для высокорослых – 3-4 метра, для карликовых – 2,5 метра.  После посадки яблоню нужно поливать регулярно, особенно в первые месяцы, и мульчировать приствольный круг.  Для лучшего укоренения можно использовать стимуляторы роста, такие как "Корневин".  Для защиты от вредителей и болезней можно использовать побелку стволов весной и осенью. ', 17, 9, CAST(N'2025-06-14T12:42:29.777' AS DateTime), CAST(N'2025-06-14T12:42:29.777' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (99, N'Ромашки', N'Как прорастить семена ромашки?

Ромашке нужен свет для прорастания, поэтому накройте тонким слоем вермикулита или не накрывайте вообще . Выращенную в помещении рассаду рассадите в отдельные горшки и закаливайте перед высадкой в ??открытый грунт после того, как минует риск заморозков.', 17, 9, CAST(N'2025-06-14T12:43:27.837' AS DateTime), CAST(N'2025-06-14T12:43:27.837' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (100, N'Франция', N'Самой посещаемой страной в мире является Франция.

Уже несколько лет подряд Франция занимает первое место по посещаемости. За что туристы так любят эту страну? Ее природа очень разнообразна: солнце, море, горы, а города красивы.

Каждый найдет здесь занятие по душе. Можно отправиться в сельскую местность и насладиться спокойным отдыхом. Для любителей ночной жизни и шоппинга подойдут крупные города – Париж, Марсель, Лион.

Франция – это огромное количество памятников архитектуры и Диснейленд, а также романтичная атмосфера. Искусство, история, культура, вкусная еда и вино – есть много причин посетить эту страну.', 7, 10, CAST(N'2025-06-14T12:48:10.503' AS DateTime), CAST(N'2025-06-14T12:48:10.503' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (101, N'Короткий перелет', N'Самый короткий перелет на самолете длится две минуты.

Самый короткий авиарейс длится две минуты. Он осуществляется авиакомпанией «Loganair». Пункты назначения – два острова Оркнейского архипелага, Westrey и PapaWestrey. Они находятся на севере Шотландии, расстояние между ними 2,7 километра.

Пассажир находится в салоне самолета всего 4 минуты. Это отличная возможность немного потренироваться для тех, кто панически боится перелетов.', 7, 10, CAST(N'2025-06-14T12:48:59.117' AS DateTime), CAST(N'2025-06-14T12:48:59.117' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (102, N'Отель из соли', N'Отель из соли находится в Боливии.

Одним из самых необычных отелей в мире считают Паласио-де-Саль. Он находится в Боливии, построен из солевых блоков. На строительство здания ушло порядка 10 тысяч тонн материала.

Отель небольшой, всего 16 номеров. Все они оборудованы современными удобствами. К услугам гостей паровая баня, бассейн, джакузи, кинозал. Здесь можно отдохнуть душой и телом. Отель располагается на высоте 3650 метров над уровнем моря, что позволяет гостям наслаждаться прекрасными видами.', 7, 10, CAST(N'2025-06-14T12:49:32.987' AS DateTime), CAST(N'2025-06-14T12:49:32.987' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (103, N'Экскурсия в Хогвартс', N'Существует экскурсионный тур в Хогвартс (Лондон).

Всем поклонникам Гарри Поттера стоит задуматься о поездке в Лондон. Специально для них создан экскурсионный тур в Хогвартс, и не только туда. Экскурсия проходит по всем местам Лондона, которые имеют отношение к герою романа Джоан Роулинг.

Это не единственный тур, посвященный Гарри. Есть возможность попасть на киностудию, где снимали фильм, и не только увидеть все своими глазами, но и «потрогать»: выпить стакан любимого напитка героев в кафе или научиться зельеварению.', 7, 10, CAST(N'2025-06-14T12:50:25.043' AS DateTime), CAST(N'2025-06-14T12:50:25.043' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (104, N'Зоопарк', N'Зоопарк наоборот в Новой Зеландии.

В Новой Зеландии есть удивительное место – зоопарк наоборот. Если вы хотите узнать, что чувствуют животные, обязательно его посетите. Звери здесь живут в естественной среде. Это территория площадью 80 га.

Все желающие могут отправиться в экстремальную поездку по необычному зоопарку, в ту часть, где обитают хищники. Людей помещают в автобус с решетчатыми стенами. Посетители словно заперты в клетку.

Чтобы животные подошли близко, нужно взять с собой куски сырого мяса, но кормить хищников запрещено. Никто не может предсказать, как они себя поведут.', 7, 10, CAST(N'2025-06-14T12:51:06.907' AS DateTime), CAST(N'2025-06-14T12:51:06.907' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (105, N'Незаконное пересечение границы', N'«Незаконное пересечение границы» в парке Эко Альберто.

Парк Эко-Альберто предлагает туристам экстремальное развлечение – незаконное пересечение границы между Мексикой и США. Фактически никакой границы не существует, это квест. За 20 долларов каждый желающий может примерить на себя роль преступника.

«Аттракцион» проходит ночью, нужно преодолеть расстояние в 12 километров. Участникам квеста предстоит столкнуться с большим количеством трудностей: патруль, хищные звери. Владельцы парка таким образом пытаются привлечь внимание властей к проблеме нелегальной миграции.', 7, 10, CAST(N'2025-06-14T12:51:34.410' AS DateTime), CAST(N'2025-06-14T12:51:34.410' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (106, N'Королевство Бутан', N'Королевство Бутан – государство, в которое непросто попасть.

К сожалению, есть в мире такие места, попасть в которые практически невозможно. Одно из них – королевство Бутан. Это страна, расположенная в Южной Азии. Чтобы провести в ней сутки, нужно заплатить очень высокую пошлину. Власти объясняют это тем, что следят за сохранностью уникальной культуры и традиций Бутана, а также девственной природы. 

55 лет назад попасть сюда можно было только получив приглашение королевской четы. Сейчас проблема решается просто: путевка от лицензированного туроператора, виза. Люди со средним достатком о Бутане могут только мечтать.', 1, 10, CAST(N'2025-06-14T12:53:07.143' AS DateTime), CAST(N'2025-06-14T12:53:07.143' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (107, N'Джеймс Кук', N'Джеймс Кук — первый путешественник, побывавший на всех континентах, кроме Антарктиды.

Джеймс Кук – известный мореплаватель, картограф. Он совершил три кругосветных путешествия и побывал на всех континентах, кроме Антарктиды. Эти экспедиции внесли неоценимый вклад в представление о мире. Благодаря мореплавателю, на картах появилось много новых мест. Джеймс Кук серьезно относился к своей работе, его карты точны и аккуратны.

В 18-летнем возрасте он устроился на торговое судно юнгой. Джеймс занялся самообразованием, изучал карты, прочел много книг по географии. Потом он стал капитаном Королевских ВМС. Кук погиб в 50-летнем возрасте во время третьей экспедиции. Он стал жертвой недружелюбного племени – гавайцев.', 1, 10, CAST(N'2025-06-14T12:53:45.070' AS DateTime), CAST(N'2025-06-14T12:53:45.070' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (108, N'Экономика', N'Туризм поддерживает рост экономики.

Знаете ли вы, что одна из 9 американских рабочих мест зависит от туризма? Только в Великобритании туристическая индустрия предлагает почти четыре миллиона рабочих мест .

В следующий раз, когда вы закажете поездку, имейте в виду эту забавную мелочь путешествия и знайте, что вы вносите свой вклад в местную экономику!', 1, 10, CAST(N'2025-06-14T12:55:07.050' AS DateTime), CAST(N'2025-06-14T12:55:07.050' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (109, N'Оплачиваемый отпуск', N'Оплачиваемый отпуск варьируется в зависимости от страны.

Помимо США, каждая развитая страна в мире предоставляет своим работникам хотя бы один обязательный по закону оплачиваемый отпуск или отпуск.

Самая щедрая страна? Австрия, которая имеет законный минимум 22 оплачиваемых выходных дня в году, вдобавок к 13 оплачиваемым отпускам!', 1, 10, CAST(N'2025-06-14T12:55:46.707' AS DateTime), CAST(N'2025-06-14T12:55:46.707' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (110, N'Миллиарды Арсена Люпена', N'Детективные истории Мориса Леблана о приключениях Арсена Люпена раскупались при жизни автора огромными тиражами, превышающими тиражи книг самого Конан Дойла. Имя Люпена, джентльмена-грабителя, давно стало легендой, которая ужасает и восхищает. Поймать его невозможно, предсказать его следующий шаг — исключено. Его хитрость, благородство, изобретательность не знают границ.
В настоящее издание вошли три произведения, завершающих цикл романов об Арсене Люпене: «Виктор из специальной бригады уголовной полиции» (в новом переводе), «Месть графини Калиостро» и «Миллиарды Арсена Люпена» (впервые на русском!). Читателя ожидают удивительные приключения, хитроумные преступления, истории поруганной чести и справедливого возмездия.
В книгу включены редкие иллюстрации американских художников.

Издательство - Азбука
Серия - Мир приключений
Год издания - 2025
Количество страниц - 576
Размер - 3x14.5x21.5
Тип обложки - Твёрдый переплёт
Тираж - 3000
Вес, г - 680
Возрастные ограничения - 16+', 8, 11, CAST(N'2025-06-14T13:10:55.600' AS DateTime), CAST(N'2025-06-14T13:10:55.600' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (111, N'Театр стекла и теней', N'У каждого есть история, но до девятнадцати лет Джульетта Грейс своей истории не знает. Ее история начинается, когда умирает ее отец. Когда перед смертью он произносит незнакомое женское имя. Когда какая-то женщина звонит и плачет в трубку, зовя по имени его, который уже не услышит. Когда на порог являются полицейские и интересуются прошлым Джульетты, а ей нечего ответить.
Джульетта мечтала танцевать на сцене, но по настоянию мачехи скучала на секретарских курсах. Джульетта сочиняла себе удивительную биографию, но покорно жила под контролем равнодушных взрослых. А теперь она вольна жить как хочет и, смутно угадывая начало нового сюжета, отправляется на поиски — себя, своих корней и правды о смерти матери. И так она попадает в лондонский Театральный округ.
В известном нам Лондоне Театрального округа никогда не существовало. Театральный округ — царство иллюзий, нездешний мир дивных историй за гранью реальности. Здесь веками, днем и ночью, без остановки идет Шоу, и ничего важнее на свете нет. Режиссер и артисты — почти небожители: они принадлежат к древним родам, которые своей кровью, плотью, мыслью не первое столетие питают высокое искусство. Околдованные зрители стекаются в Театральный округ и остаются, не в силах отвести глаз от волшебства.
Волшебство блистает ярко, но на изнанке его чернота. Внешний мир над Округом не властен, сюда нет хода даже полиции. Здесь правит лишь один закон: Шоу должно продолжаться. Театральный округ — дым и зеркала, и Джульетте предстоит узнать, до каких пределов способны дойти люди, чтобы некоторые истории не были рассказаны никогда, — и кто расплачивается за это жизнью.
Впервые на русском!

Издательство - Азбука
Серия - The Big Book
Год издания - 2025
Количество страниц - 432
Размер - 2.5x14.5x21.7
Тип обложки - Твёрдый переплёт
Тираж - 4000
Вес, г - 586
Возрастные ограничения - 16+', 8, 11, CAST(N'2025-06-14T13:12:22.607' AS DateTime), CAST(N'2025-06-14T13:12:22.607' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (112, N'Клим Ардашев. Начало. В тени пирамид', N'Осень 1891 года. Перед заграничной командировкой на Восток Клим Ардашев прибывает в Ставрополь, где узнает, что в картинной галерее местного купца произошла подмена эскиза Леонардо да Винчи «Мученичество святого Себастьяна». Немногим позже музыкант – первая скрипка театрального оркестра – кончает жизнь самоубийством при весьма странных обстоятельствах. Расследовать эти происшествия Ардашеву придется не только на борту парохода, следующего из Одессы в Александрию, но и в столице Египта.

Издательство - Яуза, ЛитРес
Серия - ЛитРес: Детектив
Год издания - 2025
Количество страниц - 320
Размер - 2.2x13x20.7
Тип обложки - Твёрдый переплёт
Тираж - 3000
Вес, г - 260
Возрастные ограничения - 16+', 8, 11, CAST(N'2025-06-14T13:13:31.020' AS DateTime), CAST(N'2025-06-14T13:13:31.020' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (113, N'Хозяйка магической лавки. Книга 2', N'У меня очень, ОЧЕНЬ много проблем! И только подумала, что решила часть из них, как добавились новые. Наладила работу в лавке магических зелий? Рядом открылся подобный магазинчик у конкурентов! Выдохнула от того, что тетя прекратила агрессивно тащить под венец? Появился герцог Рейвенс, и последнее, чего он хочет, — жениться. А жаль. В довершении всех бед на мне поставила метку темная ведьма, и мое жертвоприношение уже у нее в графике на ночь Кровавой Луны. А я не хочу, чтобы меня приносили в жертву! Я только выбралась из-под опеки и хочу наладить свою жизнь, и мне нужно найти ведьму раньше, чем наступит ночь Кровавой Луны. Это сложно, но у меня есть помощники — верные друзья, лорд Рейвенс и высшая нечисть. Инкуб.

Издательство - Яуза, ЛитРес
Серия - ЛитРес: Фэнтези
Год издания - 2025
Количество страниц - 384
Размер - 3.5x13x20.5
Тип обложки - Твёрдый переплёт
Тираж - 2000
Вес, г - 380
Возрастные ограничения - 16+', 8, 11, CAST(N'2025-06-14T13:14:27.683' AS DateTime), CAST(N'2025-06-14T13:14:27.683' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (114, N'Смешарики. История культовой Вселенной', N'- Миллионы фанатов по всему миру.
- Более 600 отснятых серий.
- 6 спин-оффов и 3 полнометражных фильма.

Все это о них, о Смешариках, на которых успело вырасти несколько поколений детей.
А ведь на заре 2000-х, когда все только начиналось, никто и подумать не мог, что двум парням — Илье Попову и Салавату Шайхинурову — удастся невозможное: с нуля, без опыта в мультипликации, создать первый в России анимационный сериал, который обойдет по популярности зарубежные франшизы.

Эта книга — искренняя история о том, как рождалась, росла, находилась на грани краха и снова набирала силу Вселенная Смешариков. Написанная свидетелем событий, сценарным редактором проекта Марией Корниловой, книга рассказывает о том, что долгое время оставалось за кадром:
- почему на старте никто не верил в успех проекта;
- какими были бы Совунья, Нюша, Лосяш, Пин и Ежик, сложись все немного иначе;
- кто такие Духи Ромашковой долины и почему с ними не стоит ссориться.

Издательство - Эксмо
Издательский бренд - БОМБОРА
Серия - Подарочные издания. Кино
Год издания - 2025
Количество страниц - 256
Размер - 2.2x18.9x24.6
Тип обложки - Твёрдый переплёт
Тираж - 7000
Вес, г - 820
Возрастные ограничения -  12+', 8, 11, CAST(N'2025-06-14T13:15:57.983' AS DateTime), CAST(N'2025-06-14T13:15:57.983' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (115, N'Бритни Спирс: The Woman in Me', N'Совсем недавно весь мир заговорил о том, через что на самом деле прошла Бритни Спирс. На открытом судебном заседании поп-звезда раскрыла шокирующую правду, которую скрывала годами.

Биография Бритни Спирс — это не просто история успеха яркой поп-певицы. Одна из главных звезд своего поколения пережила огромное количество кошмарных и травмирующих событий: абьюзивные отношения, ужасный контроль со стороны самых близких, ранняя прерванная беременность, зависимость... Бритни прошла через все это, сломавшись, но все-таки обретя себя. Искренняя история певицы демонстрирует исцеляющую силу музыки и любви. Это беспрецедентный монолог женщины, которая наконец получила право высказаться. И теперь ее голос по-настоящему услышал весь мир. Услышьте ее и вы. 
Одна из самых обсуждаемых книг в истории впервые на русском языке!
Более 2 миллионов проданных копий! Книга года по версии Elle, The Washington Post, Rolling Stone, NPR, Financial Times, Vanity Fair и многих других изданий.
«Перед нами откровение о чудовищной жизни, в которой маленькая девочка, полная надежд, всего лишь пыталась найти свое место». — Анна Апалина, онлайн-журнал Woman
«Рутинная жестокость самых близких Спирс людей поражает — ее мемуары читаются как клаустрофобный хоррор, в котором нет выживших». — Арсений Гаврицков, «Правила жизни»

Издательство - Эксмо
Издательский бренд - БОМБОРА
Серия - Поп-культ: музыканты, покорившие чарты и сердца
Год издания - 2024
Количество страниц - 240
Размер - 2.1x16.5x24.2
Тип обложки - Твёрдый переплёт
Тираж - 20000
Вес, г - 506
Возрастные ограничения - 18+', 8, 11, CAST(N'2025-06-14T13:17:57.630' AS DateTime), CAST(N'2025-06-14T13:17:57.630' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (116, N'Капитанская дочка', N'"Капитанская дочка" – исторический роман, в котором на фоне крестьянского восстания Емельяна Пугачева разворачивается трогательная история любви. И наконец, неоконченное произведение "Арап Петра Великого" – первая попытка наиболее полно описать время правления Петра I, а также рассказ о судьбе предка Пушкина Абрама Петровича Ганнибала.

Издательство - АСТ
Издательский бренд - Neoclassic
Серия - Эксклюзив: Русская классика
Год издания - 2025
Количество страниц - 352
Размер - 1.5x11.3x18
Тип обложки - Мягкий переплёт
Тираж - 10000
Вес, г - 219
Возрастные ограничения - 12+', 16, 11, CAST(N'2025-06-14T13:23:42.690' AS DateTime), CAST(N'2025-06-14T13:23:42.690' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (117, N'Евгений Онегин', N'"Евгений Онегин" (1823-1831) – одно из самых значительных произведений русской литературы.
Пронзительная любовная история, драматические повороты сюжета, тонкий психологизм персонажей, детальное описание быта и нравов той эпохи (не случайно Белинский назвал роман "энциклопедией русской жизни") – в этом произведении, как в зеркале, отразилась вся русская жизнь. "Евгений Онегин" никогда не утратит своей актуальности, и даже спустя два века мы поражаемся точности и верности "ума холодных наблюдений и сердца горестных замет" великого русского поэта.

Издательство - АСТ
Издательский бренд - Neoclassic
Серия - Эксклюзив: Русская классика
Год издания - 2025
Количество страниц - 352
Размер - 2.4x11.5x18
Тип обложки - Мягкий переплёт
Тираж - 15000
Вес, г - 219
Возрастные ограничения - 12+', 16, 11, CAST(N'2025-06-14T13:25:00.863' AS DateTime), CAST(N'2025-06-14T13:25:00.863' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (118, N'Пиковая дама', N'«Пиковая дама» – одна из самых загадочных повестей А.С. Пушкина. Одноименная опера П.И. Чайковского, регулярные театральные постановки и солидное количество экранизаций красноречиво свидетельствуют о невероятной популярности этого произведения, а знаменитые «тройка, семерка, туз» известны даже тем, кто незнаком с историей Германна.
Не уступают в популярности и литературной значимости и поэмы «Полтава», «Медный всадник», «Руслан и Людмила» – совершенно разные в сюжетном отношении произведения объединяет читательская и зрительская любовь, будь то постановки на сцене, кинокартины на экране или чтение оригинала.
В состав сборника также входят и другие прозаические и поэтические шедевры, без которых невозможно составить представление о столь разнообразном творчестве великого поэта.

Издательство - АСТ
Издательский бренд - Neoclassic 
Серия - Эксклюзив: Русская классика
Год издания - 2025
Количество страниц - 352
Размер - 1.8x11.6x18
Тип обложки - Мягкий переплёт
Тираж - 5000
Вес, г - 219
Возрастные ограничения - 12+', 16, 11, CAST(N'2025-06-14T13:25:57.710' AS DateTime), CAST(N'2025-06-14T13:25:57.710' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (119, N'Дубровский', N'Роман А.С. Пушкина «Дубровский», повествующий о судьбе благородного разбойника, - это выдающийся образец классического "разбойничьего романа" в стиле романтизма. В увлекательном сюжете переплелись несправедливый суд, кровная месть, лихие подвиги, пылкая любовь, трагическая разлука - и открытый финал. Каждый читатель может самостоятельно придумать дальнейшую судьбу героев.
Яркие полноцветные иллюстрации Екатерины Комраковой увлекут ребёнка и помогут ему полюбить чтение!
Для читателей 12-14 лет (7-8 классы).
Серия «Книги для внеклассного чтения» — это широкий список классических произведений русской и зарубежной литературы, включённых в школьную программу начальной и средней школы. В серию входят самостоятельные произведения без сокращений, сборники рассказов и стихов, хрестоматии и сборники внеклассного чтения.
«Книги для внеклассного чтения» - это:
• Соответствие школьной программе — книги рекомендованы для внеклассного чтения.
• Классика детской литературы — лучшие произведения русских и зарубежных авторов.
• Цветные иллюстрации — яркие картинки делают чтение увлекательным.
• Удобный формат и твёрдый переплёт — удобно брать с собой, надёжно в использовании.
• Доступная цена — качественные книги в бюджетном сегменте.
Книга станет хорошим подарком школьнику, пригодится на уроках литературного чтения и при освоении чтения на лето, поможет подготовиться к новому учебному году.

Издательство - Эксмо
Издательский бренд - Эксмодетство
Серия - Книги для внеклассного чтения
Год издания - 2024
Количество страниц - 112
Размер - 1x14.5x22
Тип обложки - Твёрдый переплёт
Тираж - 7000
Вес, г - 220
Возрастные ограничения - 12+', 16, 11, CAST(N'2025-06-14T13:26:58.533' AS DateTime), CAST(N'2025-06-14T13:26:58.533' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (120, N'Павел Прилучный', N'"Старший плохому не научит". Павел Прилучный показал, как общаются его сыновья от Агаты Муцениеце и Зепюр Брутян.

37-летний Павел Прилучный поделился в соцсетях семейными видео. Среди прочего на кадрах можно увидеть, как его старший и младший сыновья — от бывшей жены Агаты Муцениеце и нынешней супруги Зепюр Брутян — по-братски общаются друг с другом.

Так, в одном из коротких роликов 12-летний Тимофей учит двухлетнего Микаэля показывать определённый жест, а в другом Микаэль догоняет на самокате Тимофея, который уезжает вперёд на скейте. "Старший плохому не научит", — шутливо написал отец мальчиков в инстаграме*.
Также Павел снял на видео, как Микаэль познаёт окружающий мир: впервые трогает кролика и знакомится с индейками.

Судя по всему, в отношениях Прилучного с сыновьями и их отношениях друг с другом царит идиллия. А вот с Агатой Муцениеце и у Павла, и у Тимофея всё сложно. Напомним, что Тимофей, по словам актёра, сам изъявил желание проживать вместе с ним, и Прилучный оставил своего первенца у себя, хотя суд ранее постановил, что мальчик должен проживать с Муцениеце. Как уверяет Павел, он бы с радостью поселил у себя и дочь Мию, но та решила остаться с матерью.

За время, пока Тимофей жил с отцом, его отношения с матерью стали прохладнее. Некоторые даже подозревают, что Прилучный вместе с женой намеренно настраивает сына против Агаты. Как бы то ни было, та всё же старается поддерживать общение с Тимофеем. По её словам, она со многим просто "смирилась".
Напомним, что в личной жизни актрисы недавно произошли серьёзные изменения: Агата объявила, что выходит замуж за своего бойфренда Петра Дрангу. Также поклонники звезды обратили внимание на её округлившийся живот и теперь уверены, что она ждёт ребёнка.', 18, 12, CAST(N'2025-06-14T13:36:30.670' AS DateTime), CAST(N'2025-06-14T13:36:30.670' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (121, N'Фёдор Бондарчук', N'"Все живы и здоровы". Фёдора Бондарчука вместе со съёмочной группой эвакуировали из Ирана.

58-летний Фёдор Бондарчук и его съёмочная группа оказались среди 14 россиян, которых первыми эвакуировали из Ирана в Азербайджан, сообщает РИА "Новости".

Режиссёр, который находился в Иране на съёмках сериала "Трудно быть богом", уже побеседовал с журналистами и сообщил, что у него всё в порядке.
"В первую очередь хочется поблагодарить президента, Ильхама Гейдар оглы Алиева, за беспрецедентную помощь в пересечении границы между Ираном и Азербайджаном. На самом деле, помогали все. Должен сказать про посольство России в Тегеране и консульство (ребята нас довели практически до дверей границы), и министерство культуры РФ", — сказал Бондарчук.
Он отметил, что все 90 человек из его группы живы и здоровы, переходят границу, часть останется в Баку и улетит чуть позже: "Мы все немного устали, это так легко сказать".
Как сообщает "Интерфакс", в ближайшие дни из Ирана вывезут 51 музыканта Большого симфонического оркестра и около 90 актёров и творческих деятелей. "На основании обращений, поступивших в Азербайджанскую Республику, наша страна оказывает поддержку в осуществлении эвакуаций из Исламской Республики Иран", — подтвердил азербайджанский МИД.

С ночи 13 июня Израиль и Иран обмениваются ракетными ударами. Страны развернули против друг друга военные операции "Восстающий лев" и "Истинное обещание 3".
В последнее время имя Фёдора Бондарчука часто мелькает в СМИ. В основном в связи с его разводом с Паулиной Андреевой и новыми предполагаемыми романами.
', 18, 12, CAST(N'2025-06-14T13:38:02.850' AS DateTime), CAST(N'2025-06-14T13:38:02.850' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (122, N'Регина Тодоренко', N'Регина Тодоренко в свой день рождения подтвердила третью беременность.

Регине Тодоренко сегодня исполнилось 35 лет. По такому случаю телеведущая опубликовала в соцсетях видео, в котором перечислила свои жизненные достижения и призналась, что вскоре вновь станет матерью.
Среди прочего, за 35 лет Регина успела побывать в 109 странах, покорить Гималаи, прыгнуть с водопада Виктория, написать книгу, получить премию ТЭФИ, сыграть в кино и озвучить оскароносный мультфильм ("Энканто"). Но главным своим достижением она всё-таки считает создание семьи с Владом Топаловым. У звёзд уже есть двое общих сыновей, и теперь их семью ждёт пополнение. "Мне 35, и скоро нас будет пятеро", — написала Регина.
Для поклонников Тодоренко новость не стала неожиданностью. Ещё на прошлой неделе Регина появилась на торжестве по случаю годовщины свадьбы Владимира Преснякова и Натальи Подольской в платье, подчеркнувшем её округлившийся живот.', 18, 12, CAST(N'2025-06-14T13:39:15.463' AS DateTime), CAST(N'2025-06-14T13:39:15.463' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (123, N'Стася Милославская', N'Жених Стаси Милославской впервые опубликовал совместное фото с ней.  22-летний футболист ЦСКА Егор Ушаков впервые опубликовал совместное фото со своей невестой, 30-летней Стасей Милославской.

На чёрно-белом снимке Егор нежно обнимает улыбающуюся актрису со спины. Никакой подписью спортсмен сопровождать фото не стал, поставив лишь лаконичное эмодзи в виде белого сердца рядом с именем возлюбленной.
Напомним, что о помолвке Стаси и Егора стало известно в конце мая. Ушаков сделал предложение Милославской в Турции во время концерта Валерия Меладзе. Исполнив песню вместе с Валерием, футболист встал на одно колено и признался Стасе в любви.
Интересно, что никто не знал о новом романе актрисы до её помолвки. Перед этим в сети писали о связи Стаси с редактором журнала "Правила жизни" Трифоном Бебутовым. А ещё раньше Милославская три года состояла в отношениях с Александром Петровым. Окончание этого романа стало для всех ещё большей неожиданностью. Петров внезапно сообщил, что женился на девушке, с которой сходил всего на пару свиданий. По слухам, и сама Стася узнала о его новом статусе незадолго до того, как он объявил о нём публично.

Как бы то ни было, Петров и его жена Виктория продолжают строить семейную жизнь. В апреле этого года у пары родился сын Фёдор.
', 18, 12, CAST(N'2025-06-14T13:41:10.293' AS DateTime), CAST(N'2025-06-14T13:41:10.293' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (124, N'Александра Бортич', N'30-летняя Александра Бортич опубликовала в соцсетях новые фото и видео со своим четырёхлетним сыном Сашей.

На кадрах мать и сын наслаждаются речной прогулкой и просто дурачатся на камеру. "Я говорю: "Ай лав ю, бэйби", он отвечает: "Ай лав ю, мамми", — подписала пост актриса.

Напомним, что Саша — сын Бортич от второго мужа Евгения Савельева — сына депутата от "Единой России" Валерия Савельева, с которым актриса развелась в 2023 году. До него Бортич была замужем за рэпером Вячеславом Воронцовым, а сейчас она состоит в отношениях с 27-летним Давидом Сократяном. Александра публично подтвердила новый роман в конце марта.', 18, 12, CAST(N'2025-06-14T13:42:04.300' AS DateTime), CAST(N'2025-06-14T13:42:04.300' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (125, N'Брат Майли Сайрус', N'Брат Майли Сайрус обвинил свою бывшую девушку Бренду Сонг, невесту Маколея Калкина, в инсценировке беременностей, аборта и рака мозга. 

36-летний Трейс Сайрус, старший брат Майли Сайрус, выдвинул неожиданные обвинения против своей бывшей девушки Бренды Сонг, которая сейчас обручена с Маколеем Калкином. 
По словам музыканта, за семь лет отношений с ним Бренда несколько раз инсценировала беременности, а также аборт и онкологическое заболевание в терминальной стадии. Кроме того, она якобы украла у него несколько тысяч долларов.
"Она заставила меня и мою семью поверить, что у неё рак груди и опухоль мозга. Это была ложь. После того как мы узнали обо всём и моя мама всё ей высказала, она была так унижена, что не может показаться на глаза моей семье", — рассказал Трейс в ответ на хейтерский комментарий.
Подписчик музыканта написал, что Сонг правильно поступила, уйдя от него, на что Сайрус заявил, что он как раз таки был прекрасным любящим партнёром, а с ним без причины обошлись плохо: "Однажды она забрызгала пол в ванной фальшивой кровью, чтобы сымитировать аборт, и мы с мамой срочно повезли её в больницу. Тогда-то вся ложь и началаВ сторис* Трейс также вспомнил смешной, по его мнению, случай, который произошёл, когда Бренда инсценировала опухоль мозга. Тогда близкие музыканта уже понимали, что она, скорее всего, лжёт, поэтому, когда Сонг пришла к ним с перебинтованной головой после "операции у лучшего хирурга в Чикаго", Трейс просто сорвал с неё бинты. Никаких следов хирургического вмешательства под ними не оказалось.
"Это ещё одно доказательство тому, что дети-актёры — больные на голову. Надеюсь, сейчас её ментальное здоровье улучшилось", — подытожил музыкант. вскрываться".

Сама Бренда Сонг пока не отреагировала на эти обвинения. Напомним, что актриса обручилась со своим нынешним возлюбленным, Маколеем Калкином, в 2022 году. У пары есть двое сыновей: Дакота и Карсон.', 19, 12, CAST(N'2025-06-14T13:45:31.910' AS DateTime), CAST(N'2025-06-14T13:45:31.910' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (126, N'Санджай Капур', N'Близкий друг принца Уильяма, миллиардер Санджай Капур, умер после того, как проглотил пчелу.

В возрасте 53 лет трагически скончался близкий друг принца Уильяма, индийский миллиардер Санджай Капур.

Как пишет The Mirror, вчера во время матча по поло в Великобритании в рот бизнесмена залетела пчела. По всей видимости, Санджай случайно проглотил её, и та ужалила его в горло. Это вызвало у предпринимателя анафилактический шок, что в свою очередь привело к остановке сердца.

Примечательно, что всего за несколько часов до своей смерти Санджай опубликовал в соцсетях пост с соболезнованиями жертвам вчерашней авиакатастрофы Air India. "Ужасные новости о трагической катастрофе Air India в Ахмадабаде. Мои мысли и молитвы со всеми пострадавшими семьями. Надеюсь, они найдут силы в этот трудный час", — написал бизнесмен. А за несколько дней до этого в другом посте Капур заметил, что лучше сосредотачиваться на возможностях, а не препятствиях, ведь "время человека на земле ограничено". Теперь эти его публикации стали вирусными.

Санджай Капур был главой совета директоров Sona Comstar — мирового гиганта по производству автомобильных запчастей. В прошлом он состоял в браке с суперзвездой Болливуда Каришмой Капур, однако их брак распался в 2016 году. Всего бизнесмен был женат трижды.

С принцем Уильямом Санджая Капура связывала любовь к поло: бизнесмен очень любил этот вид спорта и часто играл с членами британской королевской семьи.', 19, 12, CAST(N'2025-06-14T13:46:47.357' AS DateTime), CAST(N'2025-06-14T13:46:47.357' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (127, N'Жена Басты', N'"Ты научил меня любить". Жена Басты устроила ему сюрприз по случаю годовщины свадьбы и венчания.

Жена 45-летнего Басты (Василия Вакуленко), 44-летняя Елена Пинская-Вакуленко, устроила мужу сюрприз по случаю их семейного праздника — 16-летия со дня их свадьбы и венчания.
Чтобы удивить любимого, Елена сговорилась с его командой, и те притворились, что ему нужно снять приглашение на его июньские концерты в "Лужниках". Однако, когда Баста пришёл на стадион, то увидел на большом экране поздравление от супруги, состоящее из фрагментов семейных видео. В нём Елена поблагодарила мужа за счастливый брак.
"Благодаря тебе я узнала, что такое любовь и какой она бывает многогранной. Ты научил меня любить, заботиться, уважать, доверять, поддерживать, жертвовать. И всё это произошло благодаря твоему собственному примеру", — сказала Пинская.
Начало ролика пара смотрела вдвоём, однако ближе к его концу к родителям подбежали их дочери Мария и Василиса. Судя по выражению лица Басты, сюрприз от семьи его растрогал.
Также Елена поделилась с подписчиками архивными фото, которые были сделаны в день венчания с Василием.
Ранее в интервью Баста рассказал о том, что он однолюб и что ему несложно выбирать моногамию, поскольку для него она совершенно естественна. ', 19, 12, CAST(N'2025-06-14T13:48:16.577' AS DateTime), CAST(N'2025-06-14T13:48:16.577' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (128, N'Дуа Липа', N'Дуа Липа снялась для Vogue и подтвердила помолвку с Каллумом Тёрнером.

29-летняя Дуа Липа украсила обложку нового номера британской версии Vogue. В беседе с изданием певица подтвердила, что обручена со своим возлюбленным, 35-летним актером Каллумом Тёрнером.

"Да, мы помолвлены, я очень взволнована", — сказала артистка и поделилась подробностями того, как Каллум делал ей предложение. По словам звезды, актёр выбирал дизайн её обручального кольца, советуясь с её подругами и сестрой: "Я обожаю своё кольцо. Оно отражает мою суть. Так приятно знать, что человек, с которым ты собираешься провести всю свою жизнь, настолько хорошо тебя знает".

При этом Дуа Липа отметила, что она и Тёрнер не торопятся со свадьбой, ведь он пока занят на съёмках, а ей предстоит сначала завершить гастрольный тур, который продлится до декабря. Так что планировать что-либо пара начнёт ближе к Новому году. Артистка призналась, что никогда не мечтала о свадьбе, поэтому теперь её озадачивает необходимость думать о том, в чём она пойдет к алтарю.

Тем не менее настроена певица серьёзно и подумывает о том, чтобы в будущем стать матерью, только это потребует от неё тщательного планирования: "Решение состариться вместе, прожить жизнь, быть лучшими друзьями всегда — это особенное чувство. Это извечный вопрос — когда настанет подходящее время [для рождения детей]. Надо подумать, смогу ли я совмещать материнство с работой, с поездками в тур, сколько времени это будет отнимать. Наверное, это одна из тех вещей, которая происходит естественным образом, когда приходит время. Я люблю детей, но одно дело просто любить их, и совсем другое — поднимать на ноги".

Напомним, что о помолвке Каллума Тёрнера и Дуа Липы заговорили ещё в конце прошлого года. Новость сообщило со ссылкой на инсайдеров издание The Sun.', 19, 12, CAST(N'2025-06-14T13:49:32.257' AS DateTime), CAST(N'2025-06-14T13:49:32.257' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (129, N'Лиза Мамиашвили', N'Сестра Таты Бондарчук Лиза Мамиашвили вышла замуж за хоккеиста Матвея Гуськова.
В списке летних свадеб прибавление: 11 июня замуж вышла Лиза Мамиашвили — дочь олимпийского чемпиона по греко-римской борьбе, главы Федерации спортивной борьбы Михаила Мамиашвили, и младшая сестра Таты Мамиашвили, бывшей жены сына Фёдора Бондарчука. Жених — хоккеист "Салавата Юлаева" и сын вице-президента Молодёжной хоккейной лиги Матвей Гуськов.
Фотографиями из ЗАГСа счастливая невеста поделилась в соцсетях, коротко подписав снимки: "Муж и жена". Для свадьбы Лиза выбрала воздушное платье с открытыми плечами и длинным шлейфом.
Свадьбе предшествовал традиционный девичник, который Лиза вместе с подружками отмечала в одном из московских отелей: торт, шарики, лимузин и фотосессия в фате — всё было по законам жанра.
Жениху и невесте по 24 года, до свадьбы они встречались несколько лет. Помолвка состоялась в феврале прошлого года.
Лиза известна благодаря своей семье, в том числе старшей сестре, которая была замужем за Сергеем Бондарчуком — старшим сыном Светланы и Фёдора Бондарчук. В этом браке родились две дочери. Несмотря на то что всё закончилось разводом и Тата уже давно вышла замуж снова (за Филиппа Фролова) и родила ещё одного ребёнка, в медиаполе она по-прежнему известна по фамилии бывшего мужа.', 6, 12, CAST(N'2025-06-14T13:51:18.557' AS DateTime), CAST(N'2025-06-14T13:51:18.557' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (130, N'Ремонт с 1 по 10 января', N'Можно ли делать ремонт с 1 по 10 января?
Ремонт в квартире можно делать с понедельника по субботу с 09:00 до 19:00 с перерывом на тихий час с 13:00 до 15:00. В воскресенье и нерабочие праздничные дни ремонт запрещен.', 6, 13, CAST(N'2025-06-14T14:14:38.983' AS DateTime), CAST(N'2025-06-14T14:14:38.983' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (131, N'Самое дорогое', N'Что самое дорогое в ремонте дома?
Дороже всего обходится ремонт гостиной. Эта комната обычно больше остальных помещений по площади, соответственно, будет больше расход стройматериалов и оплата услуг рабочих. Кроме того, в гостиную потребуется мебель, техника, предметы декора — все это стоит немало.', 6, 13, CAST(N'2025-06-14T14:15:18.333' AS DateTime), CAST(N'2025-06-14T14:15:18.333' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (132, N'Этапы', N'Самые дорогие виды ремонтных работ, которые нужно доверить специалистам:
 - выравнивание стен;
 - стяжка пола;
 - замена или монтаж электрической проводки;
 - замена дверей;
 - замена окон;
 - работы с сантехникой.', 6, 13, CAST(N'2025-06-14T14:16:33.827' AS DateTime), CAST(N'2025-06-14T14:16:33.827' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (133, N'пол стены потолок', N'В каком порядке делать ремонт пол стены потолок?
Следовать правилу «сверху вниз». Вначале – натяжной потолок, потом – стены и напоследок – пол. Но вначале производят черновую подготовку всех поверхностей, а затем – финишную отделку в указанном порядке.', 6, 13, CAST(N'2025-06-14T14:17:29.023' AS DateTime), CAST(N'2025-06-14T14:17:29.023' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (134, N'Замена лампочки', N'Отключите свет в комнате, где перегорела лампочка.
Подождите 5-10 минут, что бы электричество точно перестало поступать, а старая лампочка — остыла.
Возьмите стремянку (или стул), что бы не стоять на мысочках, пытаясь в шатком положении произвести замену.
Вытащите перегоревшую лампочку и вставьте новую.', 6, 13, CAST(N'2025-06-14T14:18:36.783' AS DateTime), CAST(N'2025-06-14T14:18:36.783' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (135, N'Поклейка обоев', N'Откуда начинать клеить обои: 
Оптимальный вариант — от окна по направлению к двери. Кто-то говорит, что точка начала не так важна. Но для первой полосы необходим ровный ориентир, поскольку от нее пойдут все остальные листы. Допускается начинать клеить первую полосу от угла стены или откоса двери.', 6, 13, CAST(N'2025-06-14T14:20:06.573' AS DateTime), CAST(N'2025-06-14T14:20:06.573' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (136, N'Обои', N'Что нужно сделать перед тем, как поклеить обои?
План действий:
 - снять со стен старую отделку
 - отремонтировать стены
 - выровнять поверхность штукатуркой
 - зашпаклевать и обработать грунтовкой под обои', 6, 13, CAST(N'2025-06-14T14:21:34.713' AS DateTime), CAST(N'2025-06-14T14:21:34.713' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (137, N'Почему зимой не клеят обои?', N'Большинство обойных клеев рассчитаны на использование при температуре не ниже +5 - +10°C. Поклейка обоев при более низкой температуре может привести к недостаточному застыванию клея, его неравномерному высыханию и, как следствие, к отслаиванию обоев или образованию пузырей.', 6, 13, CAST(N'2025-06-14T14:22:15.423' AS DateTime), CAST(N'2025-06-14T14:22:15.423' AS DateTime))
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (138, N'Паркет', N'Каковы этапы укладки паркета?
Укладка паркета проходит в несколько этапов: проверка основания на ровность и прочность; выравнивание основания; укладка фанеры; шлифовка фанеры; укладка паркета; шлифовка паркета и дальнейшая его защита.', 6, 13, CAST(N'2025-06-14T14:23:10.497' AS DateTime), CAST(N'2025-06-14T14:23:10.497' AS DateTime))
GO
INSERT [dbo].[Knowledges] ([Knowledge_ID], [Title], [Text], [User_ID], [Category_ID], [Created_At], [Update_At]) VALUES (139, N'Что стелить под паркет?', N'Подложкой называется мембрана, разделяющая бетонное или деревянное основание и напольное покрытие. Выбор подложки под паркет — очень ответственное решение. Она отвечает за геометрию, стабильность и долговечность покрытия, а также обеспечивает тепло-, влаго- и звукоизоляцию.', 6, 13, CAST(N'2025-06-14T14:23:41.973' AS DateTime), CAST(N'2025-06-14T14:23:41.973' AS DateTime))
SET IDENTITY_INSERT [dbo].[Knowledges] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (1, 6, 44, 4, CAST(N'2025-06-13T21:22:44.277' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (2, 6, 80, 5, CAST(N'2025-06-14T21:14:31.557' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (3, 6, 83, 5, CAST(N'2025-06-14T21:14:38.813' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (4, 6, 85, 4, CAST(N'2025-06-14T21:14:50.133' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (5, 6, 110, 3, CAST(N'2025-06-14T21:17:46.377' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (6, 6, 118, 5, CAST(N'2025-06-14T21:18:29.120' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (7, 6, 48, 5, CAST(N'2025-06-14T21:18:49.797' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (8, 6, 93, 5, CAST(N'2025-06-14T21:27:52.360' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (9, 6, 97, 5, CAST(N'2025-06-14T21:28:04.240' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (10, 6, 41, 3, CAST(N'2025-06-14T21:28:28.293' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (11, 6, 57, 4, CAST(N'2025-06-14T21:28:35.207' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (12, 6, 65, 5, CAST(N'2025-06-14T21:29:15.523' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (13, 6, 43, 5, CAST(N'2025-06-14T21:29:20.933' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (14, 6, 73, 5, CAST(N'2025-06-14T21:29:33.667' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (15, 6, 75, 2, CAST(N'2025-06-14T21:29:42.443' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (16, 1, 73, 5, CAST(N'2025-06-14T21:31:15.137' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (17, 1, 69, 2, CAST(N'2025-06-14T21:31:42.033' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (18, 1, 61, 5, CAST(N'2025-06-14T21:31:51.353' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (19, 1, 68, 4, CAST(N'2025-06-14T21:32:10.873' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (20, 1, 43, 4, CAST(N'2025-06-14T21:32:18.520' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (21, 1, 55, 4, CAST(N'2025-06-14T21:32:39.503' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (22, 1, 60, 4, CAST(N'2025-06-14T21:32:47.910' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (23, 1, 94, 4, CAST(N'2025-06-14T21:34:09.557' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (24, 1, 102, 4, CAST(N'2025-06-14T21:34:47.730' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (25, 1, 52, 5, CAST(N'2025-06-14T21:35:10.490' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (26, 1, 49, 5, CAST(N'2025-06-14T21:35:18.043' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (27, 1, 35, 5, CAST(N'2025-06-14T21:35:35.530' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (28, 1, 118, 4, CAST(N'2025-06-14T21:35:45.723' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (29, 1, 133, 5, CAST(N'2025-06-14T21:37:03.863' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (30, 1, 138, 5, CAST(N'2025-06-14T21:37:11.407' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (31, 1, 85, 5, CAST(N'2025-06-14T21:37:30.120' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (32, 1, 81, 5, CAST(N'2025-06-14T21:37:40.053' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (33, 7, 89, 5, CAST(N'2025-06-14T21:39:14.700' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (34, 7, 132, 5, CAST(N'2025-06-14T21:40:05.123' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (35, 7, 134, 5, CAST(N'2025-06-14T21:40:12.507' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (36, 7, 124, 4, CAST(N'2025-06-14T21:41:55.390' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (37, 7, 111, 5, CAST(N'2025-06-14T21:42:03.400' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (38, 7, 119, 5, CAST(N'2025-06-14T21:42:30.133' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (39, 7, 34, 5, CAST(N'2025-06-14T21:42:39.727' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (40, 7, 48, 5, CAST(N'2025-06-14T21:42:57.677' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (41, 7, 51, 5, CAST(N'2025-06-14T21:43:02.820' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (42, 7, 101, 5, CAST(N'2025-06-14T21:43:41.923' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (43, 7, 102, 5, CAST(N'2025-06-14T21:43:46.260' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (44, 7, 90, 5, CAST(N'2025-06-14T21:44:08.410' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (45, 7, 93, 5, CAST(N'2025-06-14T21:44:32.850' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (46, 7, 42, 4, CAST(N'2025-06-14T21:45:03.257' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (47, 7, 56, 5, CAST(N'2025-06-14T21:45:10.417' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (48, 7, 44, 5, CAST(N'2025-06-14T21:45:19.050' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (49, 7, 64, 5, CAST(N'2025-06-14T21:45:35.617' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (50, 7, 66, 5, CAST(N'2025-06-14T21:46:06.080' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (51, 7, 74, 5, CAST(N'2025-06-14T21:46:53.600' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (52, 8, 77, 5, CAST(N'2025-06-14T21:47:17.863' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (53, 8, 72, 3, CAST(N'2025-06-14T21:47:25.333' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (54, 8, 61, 5, CAST(N'2025-06-14T21:48:02.053' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (55, 8, 64, 5, CAST(N'2025-06-14T21:48:23.477' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (56, 8, 42, 5, CAST(N'2025-06-14T21:48:59.690' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (57, 8, 58, 4, CAST(N'2025-06-14T21:49:05.027' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (58, 8, 97, 5, CAST(N'2025-06-14T21:49:43.123' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (59, 8, 98, 4, CAST(N'2025-06-14T21:49:49.427' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (60, 8, 104, 5, CAST(N'2025-06-14T21:50:10.897' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (61, 8, 103, 5, CAST(N'2025-06-14T21:50:16.057' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (62, 8, 46, 5, CAST(N'2025-06-14T21:50:24.490' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (63, 8, 50, 5, CAST(N'2025-06-14T21:50:50.343' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (64, 8, 112, 4, CAST(N'2025-06-14T21:51:14.640' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (65, 8, 119, 3, CAST(N'2025-06-14T21:51:23.417' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (66, 8, 123, 4, CAST(N'2025-06-14T21:52:27.100' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (67, 8, 133, 5, CAST(N'2025-06-14T21:52:36.493' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (68, 8, 137, 5, CAST(N'2025-06-14T21:52:41.927' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (69, 8, 80, 5, CAST(N'2025-06-14T21:52:50.900' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (70, 8, 81, 5, CAST(N'2025-06-14T21:52:55.950' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (71, 8, 89, 5, CAST(N'2025-06-14T21:53:26.357' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (72, 9, 83, 5, CAST(N'2025-06-14T22:32:24.297' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (73, 9, 135, 5, CAST(N'2025-06-14T22:32:32.673' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (74, 9, 125, 3, CAST(N'2025-06-14T22:32:39.737' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (75, 9, 127, 5, CAST(N'2025-06-14T22:32:45.240' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (76, 9, 111, 5, CAST(N'2025-06-14T22:32:52.920' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (77, 9, 116, 5, CAST(N'2025-06-14T22:32:58.777' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (78, 9, 45, 5, CAST(N'2025-06-14T22:33:06.610' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (79, 9, 49, 5, CAST(N'2025-06-14T22:33:11.240' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (80, 9, 101, 5, CAST(N'2025-06-14T22:33:19.320' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (81, 9, 106, 5, CAST(N'2025-06-14T22:33:24.840' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (82, 9, 92, 5, CAST(N'2025-06-14T22:33:41.367' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (83, 9, 96, 5, CAST(N'2025-06-14T22:33:47.007' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (84, 9, 56, 5, CAST(N'2025-06-14T22:33:52.463' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (85, 9, 53, 5, CAST(N'2025-06-14T22:33:57.263' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (86, 9, 63, 5, CAST(N'2025-06-14T22:34:05.070' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (87, 9, 68, 5, CAST(N'2025-06-14T22:34:10.497' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (88, 9, 73, 5, CAST(N'2025-06-14T22:34:16.217' AS DateTime))
INSERT [dbo].[Ratings] ([Rating_ID], [User_ID], [Knowledge_ID], [Score], [Rated_At]) VALUES (89, 9, 76, 5, CAST(N'2025-06-14T22:34:20.760' AS DateTime))
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (1, N'immssa', N'12345               ', N'Ирина', CAST(N'2025-06-12T18:19:13.743' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (6, N'admin', N'admin               ', NULL, CAST(N'2025-06-12T16:24:00.000' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (7, N'Иванов', N'Иван123             ', N'Ванюшка', CAST(N'2025-06-13T19:44:23.833' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (8, N'Захарчик', N'sabdir              ', N'', CAST(N'2025-06-13T19:53:11.583' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (9, N'Cat', N'bongo               ', N'', CAST(N'2025-06-13T21:57:50.010' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (10, N'Кулинар', N'шеф-повар           ', N'', CAST(N'2025-06-13T22:05:29.373' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (16, N'Пушкин', N'АйДа                ', N'', CAST(N'2025-06-13T22:44:34.127' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (17, N'Комаров', N'45555               ', N'Любитель', CAST(N'2025-06-13T22:55:13.517' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (18, N'David Ayer', N'Режиссёр            ', N'', CAST(N'2025-06-13T23:02:15.060' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (19, N'Дмитрий', N'Фильм               ', N'', CAST(N'2025-06-13T23:17:30.113' AS DateTime))
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [Full_Name], [Registered_At]) VALUES (20, N'Механик', N'Тачки               ', N'Михаил', CAST(N'2025-06-14T11:58:53.523' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Category]    Script Date: 14.06.2025 23:28:42 ******/
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [Unique_Category] UNIQUE NONCLUSTERED 
(
	[Category_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Login_Unique]    Script Date: 14.06.2025 23:28:42 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [Login_Unique] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Knowledges] FOREIGN KEY([Knowledge_ID])
REFERENCES [dbo].[Knowledges] ([Knowledge_ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Knowledges]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Knowledges]  WITH CHECK ADD  CONSTRAINT [FK_Knowledges_Categories] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([Category_ID])
GO
ALTER TABLE [dbo].[Knowledges] CHECK CONSTRAINT [FK_Knowledges_Categories]
GO
ALTER TABLE [dbo].[Knowledges]  WITH CHECK ADD  CONSTRAINT [FK_Knowledges_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Knowledges] CHECK CONSTRAINT [FK_Knowledges_Users]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Knowledges] FOREIGN KEY([Knowledge_ID])
REFERENCES [dbo].[Knowledges] ([Knowledge_ID])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Knowledges]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Users]
GO
USE [master]
GO
ALTER DATABASE [Cw] SET  READ_WRITE 
GO
