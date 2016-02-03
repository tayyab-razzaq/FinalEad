
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/02/2016 09:05:24
-- Generated from EDMX file: C:\Users\Kagaroat\Documents\Visual Studio 2012\Projects\Final_Bootstrap\Final_Bootstrap\Models\WebModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Sample];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AdministratorStudent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Students] DROP CONSTRAINT [FK_AdministratorStudent];
GO
IF OBJECT_ID(N'[dbo].[FK_AdministratorTeacher]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Teachers] DROP CONSTRAINT [FK_AdministratorTeacher];
GO
IF OBJECT_ID(N'[dbo].[FK_TeacherDate]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Dates] DROP CONSTRAINT [FK_TeacherDate];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentDate]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Dates] DROP CONSTRAINT [FK_StudentDate];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Teachers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Teachers];
GO
IF OBJECT_ID(N'[dbo].[Students]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Students];
GO
IF OBJECT_ID(N'[dbo].[Administrators]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Administrators];
GO
IF OBJECT_ID(N'[dbo].[Dates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Dates];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Teachers'
CREATE TABLE [dbo].[Teachers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [User] nvarchar(max)  NOT NULL,
    [AdministratorId] int  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Image] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [RollNo] nvarchar(max)  NOT NULL,
    [AdministratorId] int  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Image] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [ChekBox] bit  NOT NULL
);
GO

-- Creating table 'Administrators'
CREATE TABLE [dbo].[Administrators] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [User] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Image] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Dates'
CREATE TABLE [dbo].[Dates] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Day] nvarchar(max)  NOT NULL,
    [TeacherId] int  NOT NULL,
    [StudentId] int  NOT NULL,
    [Present] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Teachers'
ALTER TABLE [dbo].[Teachers]
ADD CONSTRAINT [PK_Teachers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Administrators'
ALTER TABLE [dbo].[Administrators]
ADD CONSTRAINT [PK_Administrators]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Dates'
ALTER TABLE [dbo].[Dates]
ADD CONSTRAINT [PK_Dates]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AdministratorId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_AdministratorStudent]
    FOREIGN KEY ([AdministratorId])
    REFERENCES [dbo].[Administrators]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdministratorStudent'
CREATE INDEX [IX_FK_AdministratorStudent]
ON [dbo].[Students]
    ([AdministratorId]);
GO

-- Creating foreign key on [AdministratorId] in table 'Teachers'
ALTER TABLE [dbo].[Teachers]
ADD CONSTRAINT [FK_AdministratorTeacher]
    FOREIGN KEY ([AdministratorId])
    REFERENCES [dbo].[Administrators]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdministratorTeacher'
CREATE INDEX [IX_FK_AdministratorTeacher]
ON [dbo].[Teachers]
    ([AdministratorId]);
GO

-- Creating foreign key on [TeacherId] in table 'Dates'
ALTER TABLE [dbo].[Dates]
ADD CONSTRAINT [FK_TeacherDate]
    FOREIGN KEY ([TeacherId])
    REFERENCES [dbo].[Teachers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherDate'
CREATE INDEX [IX_FK_TeacherDate]
ON [dbo].[Dates]
    ([TeacherId]);
GO

-- Creating foreign key on [StudentId] in table 'Dates'
ALTER TABLE [dbo].[Dates]
ADD CONSTRAINT [FK_StudentDate]
    FOREIGN KEY ([StudentId])
    REFERENCES [dbo].[Students]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentDate'
CREATE INDEX [IX_FK_StudentDate]
ON [dbo].[Dates]
    ([StudentId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------