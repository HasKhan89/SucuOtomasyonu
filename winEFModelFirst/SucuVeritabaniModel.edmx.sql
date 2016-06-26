
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/31/2016 11:29:57
-- Generated from EDMX file: c:\users\sc501\documents\visual studio 2015\Projects\winEFModelFirst\winEFModelFirst\SucuVeritabaniModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SucuVeritabani];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_MarkaStok]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Stok] DROP CONSTRAINT [FK_MarkaStok];
GO
IF OBJECT_ID(N'[dbo].[FK_MusteriSiparis]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Siparis] DROP CONSTRAINT [FK_MusteriSiparis];
GO
IF OBJECT_ID(N'[dbo].[FK_StokSiparis]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Siparis] DROP CONSTRAINT [FK_StokSiparis];
GO
IF OBJECT_ID(N'[dbo].[FK_FaturaSiparis]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Siparis] DROP CONSTRAINT [FK_FaturaSiparis];
GO
IF OBJECT_ID(N'[dbo].[FK_MusteriHediye]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Hediye] DROP CONSTRAINT [FK_MusteriHediye];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Musteri]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Musteri];
GO
IF OBJECT_ID(N'[dbo].[Hediye]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hediye];
GO
IF OBJECT_ID(N'[dbo].[Marka]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Marka];
GO
IF OBJECT_ID(N'[dbo].[Stok]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Stok];
GO
IF OBJECT_ID(N'[dbo].[Siparis]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Siparis];
GO
IF OBJECT_ID(N'[dbo].[Fatura]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Fatura];
GO
IF OBJECT_ID(N'[dbo].[LogSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LogSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Musteri'
CREATE TABLE [dbo].[Musteri] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Adi] nvarchar(15)  NOT NULL,
    [Soyadi] nvarchar(20)  NOT NULL,
    [Telefonu] nchar(12)  NOT NULL,
    [Adresi] nvarchar(250)  NOT NULL,
    [KayitTarihi] datetime  NULL,
    [SonIstekteBulunmaTarihi] datetime  NULL,
    [ToplamSiparisSayisi] bigint  NOT NULL,
    [ToplamPuani] bigint  NULL,
    [VIP] bit  NOT NULL,
    [BireyselMi] bit  NOT NULL,
    [VergiNo] bigint  NULL
);
GO

-- Creating table 'Hediye'
CREATE TABLE [dbo].[Hediye] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Adi] nvarchar(30)  NOT NULL,
    [PiyasaDegeri] decimal(5,2)  NULL,
    [Puani] bigint  NULL,
    [Musteri_Id] int  NOT NULL
);
GO

-- Creating table 'Marka'
CREATE TABLE [dbo].[Marka] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Adi] nvarchar(25)  NOT NULL,
    [FirmaAdi] nvarchar(50)  NULL,
    [FirmaEPosta] nvarchar(254)  NULL
);
GO

-- Creating table 'Stok'
CREATE TABLE [dbo].[Stok] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Turu] nvarchar(50)  NOT NULL,
    [Adedi] bigint  NOT NULL,
    [PerakendeFiyati] decimal(5,2)  NOT NULL,
    [ToptanFiyati] decimal(6,2)  NULL,
    [Marka_Id] int  NOT NULL
);
GO

-- Creating table 'Siparis'
CREATE TABLE [dbo].[Siparis] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tarihi] datetime  NOT NULL,
    [Adedi] bigint  NOT NULL,
    [PerakendeMi] bit  NOT NULL,
    [ToplamTutar] decimal(6,2)  NOT NULL,
    [Musteri_Id] int  NOT NULL,
    [Stok_Id] int  NOT NULL,
    [Fatura_Id] int  NOT NULL
);
GO

-- Creating table 'Fatura'
CREATE TABLE [dbo].[Fatura] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [No] nvarchar(20)  NOT NULL,
    [KesimTarihi] datetime  NOT NULL,
    [ToplamTutar] decimal(6,2)  NOT NULL,
    [KDVOrani] decimal(4,3)  NOT NULL,
    [IskontoOrani] decimal(4,3)  NOT NULL
);
GO

-- Creating table 'Log'
CREATE TABLE [dbo].[Log] (
    [Id] uniqueidentifier  NOT NULL,
    [Username] nvarchar(25)  NOT NULL,
    [LogDateTime] datetime  NOT NULL,
    [Segment] nvarchar(50)  NOT NULL,
    [Detail] nvarchar(100)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Musteri'
ALTER TABLE [dbo].[Musteri]
ADD CONSTRAINT [PK_Musteri]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Hediye'
ALTER TABLE [dbo].[Hediye]
ADD CONSTRAINT [PK_Hediye]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Marka'
ALTER TABLE [dbo].[Marka]
ADD CONSTRAINT [PK_Marka]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Stok'
ALTER TABLE [dbo].[Stok]
ADD CONSTRAINT [PK_Stok]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Siparis'
ALTER TABLE [dbo].[Siparis]
ADD CONSTRAINT [PK_Siparis]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Fatura'
ALTER TABLE [dbo].[Fatura]
ADD CONSTRAINT [PK_Fatura]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Log'
ALTER TABLE [dbo].[Log]
ADD CONSTRAINT [PK_Log]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Marka_Id] in table 'Stok'
ALTER TABLE [dbo].[Stok]
ADD CONSTRAINT [FK_MarkaStok]
    FOREIGN KEY ([Marka_Id])
    REFERENCES [dbo].[Marka]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MarkaStok'
CREATE INDEX [IX_FK_MarkaStok]
ON [dbo].[Stok]
    ([Marka_Id]);
GO

-- Creating foreign key on [Musteri_Id] in table 'Siparis'
ALTER TABLE [dbo].[Siparis]
ADD CONSTRAINT [FK_MusteriSiparis]
    FOREIGN KEY ([Musteri_Id])
    REFERENCES [dbo].[Musteri]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MusteriSiparis'
CREATE INDEX [IX_FK_MusteriSiparis]
ON [dbo].[Siparis]
    ([Musteri_Id]);
GO

-- Creating foreign key on [Stok_Id] in table 'Siparis'
ALTER TABLE [dbo].[Siparis]
ADD CONSTRAINT [FK_StokSiparis]
    FOREIGN KEY ([Stok_Id])
    REFERENCES [dbo].[Stok]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StokSiparis'
CREATE INDEX [IX_FK_StokSiparis]
ON [dbo].[Siparis]
    ([Stok_Id]);
GO

-- Creating foreign key on [Fatura_Id] in table 'Siparis'
ALTER TABLE [dbo].[Siparis]
ADD CONSTRAINT [FK_FaturaSiparis]
    FOREIGN KEY ([Fatura_Id])
    REFERENCES [dbo].[Fatura]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FaturaSiparis'
CREATE INDEX [IX_FK_FaturaSiparis]
ON [dbo].[Siparis]
    ([Fatura_Id]);
GO

-- Creating foreign key on [Musteri_Id] in table 'Hediye'
ALTER TABLE [dbo].[Hediye]
ADD CONSTRAINT [FK_MusteriHediye]
    FOREIGN KEY ([Musteri_Id])
    REFERENCES [dbo].[Musteri]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MusteriHediye'
CREATE INDEX [IX_FK_MusteriHediye]
ON [dbo].[Hediye]
    ([Musteri_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------