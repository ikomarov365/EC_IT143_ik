DROP TABLE IF EXISTS dbo.t_marketing_monthly_spend;
GO

CREATE TABLE dbo.t_marketing_monthly_spend (
    spend_month VARCHAR(7) NOT NULL,
    total_online_spend DECIMAL(18,2) NOT NULL,
    CONSTRAINT PK_t_marketing_monthly_spend PRIMARY KEY CLUSTERED (spend_month ASC)
);