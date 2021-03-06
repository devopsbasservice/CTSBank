USE [onlineBankingDemo]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 04/01/2015 21:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transactions](
	[t_id] [int] IDENTITY(1,1) NOT NULL,
	[t_cid] [int] NULL,
	[t_nartion] [varchar](50) NULL,
	[t_refNo] [varchar](50) NULL,
	[t_withdrawal] [varchar](50) NULL,
	[t_deposit] [varchar](50) NULL,
	[t_blnc] [decimal](10, 2) NULL,
	[t_date] [datetime] NULL,
 CONSTRAINT [PK_transactions] PRIMARY KEY CLUSTERED 
(
	[t_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[net_banking]    Script Date: 04/01/2015 21:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[net_banking](
	[nb_id] [int] IDENTITY(1,1) NOT NULL,
	[nb_cid] [int] NULL,
	[nb_pass] [varchar](50) NULL,
	[nb_date] [datetime] NULL,
	[nb_status] [varchar](50) NULL,
 CONSTRAINT [PK_net_banking] PRIMARY KEY CLUSTERED 
(
	[nb_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cust_details]    Script Date: 04/01/2015 21:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cust_details](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [varchar](50) NULL,
	[c_gender] [varchar](50) NULL,
	[c_state] [varchar](50) NULL,
	[c_city] [varchar](50) NULL,
	[c_pin] [varchar](50) NULL,
	[c_email] [varchar](50) NULL,
	[c_mobNo] [varchar](50) NULL,
	[c_net_banking] [varchar](50) NULL,
	[c_status] [varchar](50) NULL,
	[c_date] [datetime] NULL,
 CONSTRAINT [PK_cust_details] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[admin]    Script Date: 04/01/2015 21:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[account]    Script Date: 04/01/2015 21:57:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[ac_no] [int] IDENTITY(1,1) NOT NULL,
	[ac_cid] [int] NULL,
	[ac_type] [varchar](50) NULL,
	[ac_blnc] [decimal](10, 2) NULL,
	[ac_date] [datetime] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[ac_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
