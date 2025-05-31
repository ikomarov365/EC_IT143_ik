TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world (my_message, current_date_time)
SELECT 
    v.my_message,
    v.current_date_time
FROM dbo.v_hello_world_load AS v;

SELECT * FROM dbo.t_hello_world;
