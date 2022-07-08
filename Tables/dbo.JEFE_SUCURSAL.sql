CREATE TABLE [dbo].[JEFE_SUCURSAL]
(
[IDJEFSUC] [int] NOT NULL IDENTITY(1, 1),
[NOMJEFSUC] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[APEJEFSUC] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DNIJEFSUC] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CELJEFSUC] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DIRJEFSUC] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JEFE_SUCURSAL] ADD CONSTRAINT [JEFE_SUCURSAL_pk] PRIMARY KEY CLUSTERED ([IDJEFSUC]) ON [PRIMARY]
GO
