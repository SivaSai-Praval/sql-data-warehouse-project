/*
    File: init_database.sql
    Purpose: Initialize EnterpriseReporting database with required schemas
    Author: SivaSai
    Date: 2026-02-22
*/

-- =============================================
-- 1. Create Database (if not exists)
-- =============================================
IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'EnterpriseReporting'
)
BEGIN
    PRINT 'Creating database EnterpriseReporting...';
    CREATE DATABASE EnterpriseReporting;
END
ELSE
BEGIN
    PRINT 'Database EnterpriseReporting already exists.';
END
GO


-- =============================================
-- 2. Switch to Database
-- =============================================
USE EnterpriseReporting;
GO


-- =============================================
-- 3. Create Schemas (if not exist)
-- =============================================

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stg')
BEGIN
    EXEC('CREATE SCHEMA stg');
    PRINT 'Schema stg created.';
END
ELSE
    PRINT 'Schema stg already exists.';
GO


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ods')
BEGIN
    EXEC('CREATE SCHEMA ods');
    PRINT 'Schema ods created.';
END
ELSE
    PRINT 'Schema ods already exists.';
GO


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'tfm')
BEGIN
    EXEC('CREATE SCHEMA tfm');
    PRINT 'Schema tfm created.';
END
ELSE
    PRINT 'Schema tfm already exists.';
GO


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dwh')
BEGIN
    EXEC('CREATE SCHEMA dwh');
    PRINT 'Schema dwh created.';
END
ELSE
    PRINT 'Schema dwh already exists.';
GO


-- =============================================
-- 4. Success Message
-- =============================================
PRINT 'EnterpriseReporting initialization completed successfully.';
GO
