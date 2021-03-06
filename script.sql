USE [master]
GO
/****** Object:  Database [netflix]    Script Date: 11/11/2020 9:24:59 a. m. ******/
CREATE DATABASE [netflix]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'netflix', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\netflix.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'netflix_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\netflix_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [netflix] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [netflix].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [netflix] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [netflix] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [netflix] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [netflix] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [netflix] SET ARITHABORT OFF 
GO
ALTER DATABASE [netflix] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [netflix] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [netflix] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [netflix] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [netflix] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [netflix] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [netflix] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [netflix] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [netflix] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [netflix] SET  ENABLE_BROKER 
GO
ALTER DATABASE [netflix] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [netflix] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [netflix] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [netflix] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [netflix] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [netflix] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [netflix] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [netflix] SET RECOVERY FULL 
GO
ALTER DATABASE [netflix] SET  MULTI_USER 
GO
ALTER DATABASE [netflix] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [netflix] SET DB_CHAINING OFF 
GO
ALTER DATABASE [netflix] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [netflix] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [netflix] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'netflix', N'ON'
GO
ALTER DATABASE [netflix] SET QUERY_STORE = OFF
GO
USE [netflix]
GO
/****** Object:  Table [dbo].[Programas]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programas](
	[prog_codigo] [int] IDENTITY(1000,1) NOT NULL,
	[prog_nombre] [varchar](40) NOT NULL,
	[prog_edad_rec] [varchar](20) NOT NULL,
	[prog_duracion] [int] NOT NULL,
	[prog_tipo] [varchar](30) NOT NULL,
	[prog_descripcion] [varchar](max) NULL,
	[prog_imagen] [varchar](max) NULL,
	[imagen_fondo] [varchar](max) NULL,
	[prog_video] [varchar](max) NULL,
 CONSTRAINT [pk_prog_codigo] PRIMARY KEY CLUSTERED 
(
	[prog_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[gen_codigo] [char](2) NOT NULL,
	[gen_nombre] [varchar](15) NOT NULL,
	[gen_imagen] [varchar](max) NULL,
 CONSTRAINT [pk_gen_codigo] PRIMARY KEY CLUSTERED 
(
	[gen_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero_programa]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero_programa](
	[gen_codigo] [char](2) NOT NULL,
	[prog_codigo] [int] NOT NULL,
 CONSTRAINT [pk_gen_prog_codigo] PRIMARY KEY CLUSTERED 
(
	[gen_codigo] ASC,
	[prog_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_genero]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_genero]
as
select prog_edad_rec,Programas.prog_codigo,prog_nombre, gen_nombre ,prog_tipo,prog_duracion,prog_descripcion,prog_imagen,imagen_fondo,prog_video
	from Programas join Genero_programa
		on Programas.prog_codigo=Genero_programa.prog_codigo join Generos on
			Genero_programa.gen_codigo=Generos.gen_codigo
GO
/****** Object:  View [dbo].[v_edad]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_edad]
as
select prog_codigo,prog_nombre,prog_edad_rec,prog_tipo,prog_duracion,prog_descripcion,prog_imagen,imagen_fondo,prog_video
	from Programas 
GO
/****** Object:  Table [dbo].[Actores]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actores](
	[actor_codigo] [int] IDENTITY(100,1) NOT NULL,
	[actor_nombre] [varchar](50) NOT NULL,
 CONSTRAINT [pk_actor_codigo] PRIMARY KEY CLUSTERED 
(
	[actor_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Protagoniza_actor_prog]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Protagoniza_actor_prog](
	[actor_codigo] [int] NOT NULL,
	[prog_codigo] [int] NOT NULL,
 CONSTRAINT [pk_prot_actor_prog_codigo] PRIMARY KEY CLUSTERED 
(
	[actor_codigo] ASC,
	[prog_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_actor]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_actor]
as
select prog_edad_rec,Programas.prog_codigo,prog_nombre,actor_nombre, prog_tipo,prog_duracion,prog_descripcion,prog_imagen,imagen_fondo,prog_video
	from Programas 
		join Protagoniza_actor_prog on Programas.prog_codigo=Protagoniza_actor_prog.prog_codigo 
			join Actores on Protagoniza_actor_prog.actor_codigo=Actores.actor_codigo
GO
/****** Object:  View [dbo].[v_todo]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_todo]
as
	select Programas.prog_codigo,prog_edad_rec,prog_nombre, gen_nombre ,prog_tipo,actor_nombre,prog_duracion,prog_descripcion,prog_imagen,imagen_fondo,prog_video 
		from Programas 
			JOIN Genero_programa on Programas.prog_codigo=Genero_programa.prog_codigo 
				JOIN Generos on Genero_programa.gen_codigo=Generos.gen_codigo 
					JOIN Protagoniza_actor_prog	on Programas.prog_codigo=Protagoniza_actor_prog.prog_codigo 
						JOIN Actores on Protagoniza_actor_prog.actor_codigo=Actores.actor_codigo 
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[cli_codigo] [int] IDENTITY(1,1) NOT NULL,
	[cli_id] [varchar](20) NOT NULL,
	[cli_nombre] [varchar](20) NOT NULL,
	[cli_apellido] [varchar](20) NOT NULL,
	[cli_num_tarjeta] [varchar](20) NULL,
	[cli_tarjeta_tipo] [char](2) NOT NULL,
	[cli_contraseña] [varchar](30) NULL,
	[cli_email] [varchar](40) NULL,
 CONSTRAINT [pk_cli_codigo] PRIMARY KEY CLUSTERED 
(
	[cli_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [U_cliente_email] UNIQUE NONCLUSTERED 
(
	[cli_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[comentario] [varchar](250) NULL,
	[cliente_email] [varchar](40) NULL,
	[cod_programa] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contratos]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contratos](
	[cli_codigo] [int] NOT NULL,
	[plan_codigo] [int] NOT NULL,
	[contra_num] [int] IDENTITY(1000,1) NOT NULL,
	[contra_fecha] [date] NOT NULL,
	[fin_fecha] [date] NOT NULL,
 CONSTRAINT [pk_contratos_cli_plan_codigo] PRIMARY KEY CLUSTERED 
(
	[contra_num] ASC,
	[cli_codigo] ASC,
	[plan_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoritos]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoritos](
	[cliente_email] [varchar](40) NULL,
	[cod_programa] [int] NULL,
	[cod_cliente] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[pago_cod] [int] IDENTITY(1,1) NOT NULL,
	[cli_codigo] [int] NOT NULL,
	[plan_codigo] [int] NOT NULL,
	[pago_fecha] [date] NOT NULL,
	[pago_monto] [money] NOT NULL,
 CONSTRAINT [pk_pagos_cli_plan_codigo] PRIMARY KEY CLUSTERED 
(
	[cli_codigo] ASC,
	[plan_codigo] ASC,
	[pago_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfiles]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfiles](
	[perfil_nombre] [varchar](20) NULL,
	[cliente_codigo] [int] NULL,
	[color] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planes](
	[plan_codigo] [int] NOT NULL,
	[plan_tipo] [varchar](10) NOT NULL,
	[plan_monto] [money] NOT NULL,
 CONSTRAINT [pk_plan_codigo] PRIMARY KEY CLUSTERED 
(
	[plan_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programas_por_capitulo]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programas_por_capitulo](
	[prog_codigo] [int] NOT NULL,
	[capitulo] [int] NOT NULL,
	[duracion_capitulo] [int] NOT NULL,
	[descripcion_por_cap] [varchar](max) NULL,
 CONSTRAINT [pk_progxcap_codigo_capitulo] PRIMARY KEY CLUSTERED 
(
	[prog_codigo] ASC,
	[capitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programas_vistos]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programas_vistos](
	[programa_tipo] [varchar](10) NULL,
	[programa_genero] [varchar](10) NULL,
	[cli_codigo] [int] NOT NULL,
	[prog_visto] [int] NOT NULL,
 CONSTRAINT [PK_programas_vistos] PRIMARY KEY CLUSTERED 
(
	[cli_codigo] ASC,
	[prog_visto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visualiza_cli_prog]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visualiza_cli_prog](
	[cli_codigo] [int] NOT NULL,
	[prog_codigo] [int] NOT NULL,
	[vis_tiempo_visualizado] [int] NOT NULL,
 CONSTRAINT [pk_vis_cli_prog_codigo] PRIMARY KEY CLUSTERED 
(
	[cli_codigo] ASC,
	[prog_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contratos] ADD  CONSTRAINT [DF_contrato_fecha]  DEFAULT (getdate()) FOR [contra_fecha]
GO
ALTER TABLE [dbo].[Contratos] ADD  CONSTRAINT [DF_contrato_finfecha]  DEFAULT (dateadd(month,(1),getdate())) FOR [fin_fecha]
GO
ALTER TABLE [dbo].[Pagos] ADD  CONSTRAINT [DF_pago_fecha]  DEFAULT (getdate()) FOR [pago_fecha]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [fk_contratos_cliente_codigo] FOREIGN KEY([cli_codigo])
REFERENCES [dbo].[Clientes] ([cli_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [fk_contratos_cliente_codigo]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [fk_contratos_plan_codigo] FOREIGN KEY([plan_codigo])
REFERENCES [dbo].[Planes] ([plan_codigo])
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [fk_contratos_plan_codigo]
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD  CONSTRAINT [fk_favorito_cliente] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[Clientes] ([cli_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favoritos] CHECK CONSTRAINT [fk_favorito_cliente]
GO
ALTER TABLE [dbo].[Genero_programa]  WITH CHECK ADD  CONSTRAINT [fk_gen_prog_codigo] FOREIGN KEY([gen_codigo])
REFERENCES [dbo].[Generos] ([gen_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Genero_programa] CHECK CONSTRAINT [fk_gen_prog_codigo]
GO
ALTER TABLE [dbo].[Genero_programa]  WITH CHECK ADD  CONSTRAINT [fk_gen_programa_codigo] FOREIGN KEY([prog_codigo])
REFERENCES [dbo].[Programas] ([prog_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Genero_programa] CHECK CONSTRAINT [fk_gen_programa_codigo]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [fk_pagos_cliente_codigo] FOREIGN KEY([cli_codigo])
REFERENCES [dbo].[Clientes] ([cli_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [fk_pagos_cliente_codigo]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [fk_pagos_plan_codigo] FOREIGN KEY([plan_codigo])
REFERENCES [dbo].[Planes] ([plan_codigo])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [fk_pagos_plan_codigo]
GO
ALTER TABLE [dbo].[perfiles]  WITH CHECK ADD  CONSTRAINT [FK_codigo_cliente] FOREIGN KEY([cliente_codigo])
REFERENCES [dbo].[Clientes] ([cli_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[perfiles] CHECK CONSTRAINT [FK_codigo_cliente]
GO
ALTER TABLE [dbo].[Programas_por_capitulo]  WITH CHECK ADD  CONSTRAINT [fk_progxcap_codigo] FOREIGN KEY([prog_codigo])
REFERENCES [dbo].[Programas] ([prog_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Programas_por_capitulo] CHECK CONSTRAINT [fk_progxcap_codigo]
GO
ALTER TABLE [dbo].[Programas_vistos]  WITH CHECK ADD  CONSTRAINT [FK_prog_visto_cli_cod] FOREIGN KEY([cli_codigo])
REFERENCES [dbo].[Clientes] ([cli_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Programas_vistos] CHECK CONSTRAINT [FK_prog_visto_cli_cod]
GO
ALTER TABLE [dbo].[Programas_vistos]  WITH CHECK ADD  CONSTRAINT [FK_prog_visto_cod] FOREIGN KEY([prog_visto])
REFERENCES [dbo].[Programas] ([prog_codigo])
GO
ALTER TABLE [dbo].[Programas_vistos] CHECK CONSTRAINT [FK_prog_visto_cod]
GO
ALTER TABLE [dbo].[Protagoniza_actor_prog]  WITH CHECK ADD  CONSTRAINT [fk_prot_actor_codigo] FOREIGN KEY([actor_codigo])
REFERENCES [dbo].[Actores] ([actor_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Protagoniza_actor_prog] CHECK CONSTRAINT [fk_prot_actor_codigo]
GO
ALTER TABLE [dbo].[Protagoniza_actor_prog]  WITH CHECK ADD  CONSTRAINT [fk_prot_prog_codigo] FOREIGN KEY([prog_codigo])
REFERENCES [dbo].[Programas] ([prog_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Protagoniza_actor_prog] CHECK CONSTRAINT [fk_prot_prog_codigo]
GO
ALTER TABLE [dbo].[Visualiza_cli_prog]  WITH CHECK ADD  CONSTRAINT [fk_vis_cli_codigo] FOREIGN KEY([cli_codigo])
REFERENCES [dbo].[Clientes] ([cli_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Visualiza_cli_prog] CHECK CONSTRAINT [fk_vis_cli_codigo]
GO
ALTER TABLE [dbo].[Visualiza_cli_prog]  WITH CHECK ADD  CONSTRAINT [fk_vis_prog_codigo] FOREIGN KEY([prog_codigo])
REFERENCES [dbo].[Programas] ([prog_codigo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Visualiza_cli_prog] CHECK CONSTRAINT [fk_vis_prog_codigo]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [ck_cli_tarjeta_tipo] CHECK  (([cli_tarjeta_tipo]='DB' OR [cli_tarjeta_tipo]='CR'))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [ck_cli_tarjeta_tipo]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [ck_contra_fecha] CHECK  (([contra_fecha]>'1997-8-29' AND [contra_fecha]<=getdate()))
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [ck_contra_fecha]
GO
ALTER TABLE [dbo].[Generos]  WITH CHECK ADD  CONSTRAINT [ck_gen_codigo] CHECK  (([gen_codigo]='gu' OR [gen_codigo]='ro' OR [gen_codigo]='fi' OR [gen_codigo]='mu' OR [gen_codigo]='dr' OR [gen_codigo]='ac' OR [gen_codigo]='co' OR [gen_codigo]='te'))
GO
ALTER TABLE [dbo].[Generos] CHECK CONSTRAINT [ck_gen_codigo]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [ck_plan_codigo] CHECK  (([plan_codigo]='3' OR [plan_codigo]='2' OR [plan_codigo]='1'))
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [ck_plan_codigo]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [ck_plan_monto] CHECK  (([plan_monto]='16.00' OR [plan_monto]='14.00' OR [plan_monto]='9.00'))
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [ck_plan_monto]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [ck_plan_tipo] CHECK  (([plan_tipo]='Ultra' OR [plan_tipo]='Estandar' OR [plan_tipo]='Básico'))
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [ck_plan_tipo]
GO
ALTER TABLE [dbo].[Programas]  WITH CHECK ADD  CONSTRAINT [ck_prog_duracion] CHECK  (([prog_duracion]>=(30) AND [prog_duracion]<=(300)))
GO
ALTER TABLE [dbo].[Programas] CHECK CONSTRAINT [ck_prog_duracion]
GO
ALTER TABLE [dbo].[Programas_por_capitulo]  WITH CHECK ADD  CONSTRAINT [ck_programas_por_capitulos_cap] CHECK  (([capitulo]<=(350)))
GO
ALTER TABLE [dbo].[Programas_por_capitulo] CHECK CONSTRAINT [ck_programas_por_capitulos_cap]
GO
/****** Object:  StoredProcedure [dbo].[p_búsqueda]    Script Date: 11/11/2020 9:24:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_búsqueda]
	@vista varchar(10),
	@variable varchar(20),
	@cod int
as
	if(@vista='Genero')
		select*from v_genero where gen_nombre = @variable
	else
		if(@vista='Edad')
			select*from v_edad where  prog_edad_rec= @variable
		else
			if(@vista='Actor')
				select*from v_actor where actor_nombre = @variable
				else 
					if(@vista = 'Todo')
						select*from programas where prog_tipo = @variable
	else
		 select*from v_genero where prog_codigo = @cod
GO
USE [master]
GO
ALTER DATABASE [netflix] SET  READ_WRITE 
GO
