create_db <- function(title)
  {
  sql<-paste('USE [fred_stuff] CREATE TABLE [dbo].[',title,' temp]([dt] [date] NOT NULL,[',title,'] [float] NULL, CONSTRAINT [PK_',title,' temp] PRIMARY KEY CLUSTERED ([dt] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]')
  sql_query(sql)

  sql<-paste('USE [fred_stuff] CREATE TABLE [dbo].[',title,']([dt] [date] NOT NULL,[',title,'] [float] NULL, CONSTRAINT [PK_',title,'] PRIMARY KEY CLUSTERED ([dt] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]')
  sql_query(sql)
  }
