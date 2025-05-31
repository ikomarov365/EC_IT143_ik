DROP TABLE IF EXISTS dbo.t_global_sales_by_platform;
GO

CREATE TABLE dbo.t_global_sales_by_platform (
    Platform VARCHAR(20) NOT NULL,
    total_global_sales DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_t_global_sales_by_platform PRIMARY KEY CLUSTERED (Platform ASC)
);
