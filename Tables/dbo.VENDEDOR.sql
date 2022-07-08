CREATE TABLE [dbo].[VENDEDOR]
(
[IDVEND] [int] NOT NULL IDENTITY(1, 1),
[NOMVEND] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[APEVEND] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DNIVEND] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CELVEND] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DIRVEND] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IDJEFSUC] [int] NOT NULL,
[IDSUC] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VENDEDOR] ADD CONSTRAINT [VENDEDOR_pk] PRIMARY KEY CLUSTERED ([IDVEND]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VENDEDOR] ADD CONSTRAINT [VENDEDOR_JEFE_SUCURSAL] FOREIGN KEY ([IDJEFSUC]) REFERENCES [dbo].[JEFE_SUCURSAL] ([IDJEFSUC])
GO
ALTER TABLE [dbo].[VENDEDOR] ADD CONSTRAINT [VENDEDOR_SUCURSAL] FOREIGN KEY ([IDSUC]) REFERENCES [dbo].[SUCURSAL] ([IDSUC])
GO
