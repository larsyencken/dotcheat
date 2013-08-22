using ODBC

# connect to a MySQL db
advancedconnect("Driver=libmyodbc5.so;server=SERVER;user=USER;password=PASSWORD;database=DATABASE;")

# run a query and return a DataFrame
df = query("select * from blah")
