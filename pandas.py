# read in a tsv file
pd.read_csv('input.tsv', sep='\t')

# dump to a csv file
df.to_csv('output.csv', index=False)

# read a frame from MySQL
conn = MySQL.connect(**kwargs)
df = pd.io.sql.read_frame("select * from blarg", conn)
