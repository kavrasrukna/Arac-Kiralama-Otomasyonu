
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/10/2022 11:26:37
-- Generated from EDMX file: C:\Users\STUDENT1\Desktop\örneklerimiz\arackiralama\arackiralama\arackiralama.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [arackiralama];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'musteriler1'
CREATE TABLE [dbo].[musteriler1] (
    [musterino] int IDENTITY(1,1) NOT NULL,
    [adsoyad] nvarchar(max)  NOT NULL,
    [telefon] nvarchar(max)  NOT NULL,
    [tckimlikno] nvarchar(max)  NOT NULL,
    [ehliyetdurumu] nvarchar(max)  NOT NULL,
    [adres] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'odemeler1'
CREATE TABLE [dbo].[odemeler1] (
    [odemeno] int IDENTITY(1,1) NOT NULL,
    [odemetutar] decimal(18,0)  NOT NULL,
    [odemetarih] nvarchar(max)  NOT NULL,
    [vadefarki] decimal(18,0)  NOT NULL,
    [musterino] int  NOT NULL,
    [aracno] int  NOT NULL
);
GO

-- Creating table 'arabalar1'
CREATE TABLE [dbo].[arabalar1] (
    [aracno] int IDENTITY(1,1) NOT NULL,
    [aracmarka] nvarchar(max)  NOT NULL,
    [aracmodel] nvarchar(max)  NOT NULL,
    [aracozellik] nvarchar(max)  NOT NULL,
    [aracbakimgunu] nvarchar(max)  NOT NULL,
    [arackm] nvarchar(max)  NOT NULL,
    [hgs] decimal(18,0)  NOT NULL,
    [gunluktutar] decimal(18,0)  NOT NULL,
    [bayino] int  NOT NULL
);
GO

-- Creating table 'bayiler1'
CREATE TABLE [dbo].[bayiler1] (
    [bayino] int IDENTITY(1,1) NOT NULL,
    [bayiadi] nvarchar(max)  NOT NULL,
    [bayiyetkilisi] nvarchar(max)  NOT NULL,
    [bayiadres] nvarchar(max)  NOT NULL,
    [bayitelefon] nvarchar(max)  NOT NULL,
    [bayiciro] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'kullanicilar1'
CREATE TABLE [dbo].[kullanicilar1] (
    [kullanicino] int IDENTITY(1,1) NOT NULL,
    [kullaniciadi] nvarchar(max)  NOT NULL,
    [sifre] nvarchar(max)  NOT NULL,
    [mail] nvarchar(max)  NOT NULL,
    [telefon] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [musterino] in table 'musteriler1'
ALTER TABLE [dbo].[musteriler1]
ADD CONSTRAINT [PK_musteriler1]
    PRIMARY KEY CLUSTERED ([musterino] ASC);
GO

-- Creating primary key on [odemeno] in table 'odemeler1'
ALTER TABLE [dbo].[odemeler1]
ADD CONSTRAINT [PK_odemeler1]
    PRIMARY KEY CLUSTERED ([odemeno] ASC);
GO

-- Creating primary key on [aracno] in table 'arabalar1'
ALTER TABLE [dbo].[arabalar1]
ADD CONSTRAINT [PK_arabalar1]
    PRIMARY KEY CLUSTERED ([aracno] ASC);
GO

-- Creating primary key on [bayino] in table 'bayiler1'
ALTER TABLE [dbo].[bayiler1]
ADD CONSTRAINT [PK_bayiler1]
    PRIMARY KEY CLUSTERED ([bayino] ASC);
GO

-- Creating primary key on [kullanicino] in table 'kullanicilar1'
ALTER TABLE [dbo].[kullanicilar1]
ADD CONSTRAINT [PK_kullanicilar1]
    PRIMARY KEY CLUSTERED ([kullanicino] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [musterino] in table 'odemeler1'
ALTER TABLE [dbo].[odemeler1]
ADD CONSTRAINT [FK_musterilerodemeler]
    FOREIGN KEY ([musterino])
    REFERENCES [dbo].[musteriler1]
        ([musterino])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_musterilerodemeler'
CREATE INDEX [IX_FK_musterilerodemeler]
ON [dbo].[odemeler1]
    ([musterino]);
GO

-- Creating foreign key on [aracno] in table 'odemeler1'
ALTER TABLE [dbo].[odemeler1]
ADD CONSTRAINT [FK_arabalarodemeler]
    FOREIGN KEY ([aracno])
    REFERENCES [dbo].[arabalar1]
        ([aracno])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_arabalarodemeler'
CREATE INDEX [IX_FK_arabalarodemeler]
ON [dbo].[odemeler1]
    ([aracno]);
GO

-- Creating foreign key on [bayino] in table 'arabalar1'
ALTER TABLE [dbo].[arabalar1]
ADD CONSTRAINT [FK_bayilerarabalar]
    FOREIGN KEY ([bayino])
    REFERENCES [dbo].[bayiler1]
        ([bayino])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_bayilerarabalar'
CREATE INDEX [IX_FK_bayilerarabalar]
ON [dbo].[arabalar1]
    ([bayino]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------