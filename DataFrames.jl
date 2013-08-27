using DataFrames

# read from file
df = readtable("data.tsv", separator = '\t', header = true)

# write to file
writetable("output.csv", df)

# select a subset of rows
df[df["amount"] > 0, :]

# select a subset of columns
df[:, ["colA", "colB"]]

# select using quoted expressions
df[:(amount > 0), :]
select(:(amount > 0 && time / 3600 % 24 == 0), df)

# inner join on "id" column
full = join(names, jobs, on = "id", kind = :inner)

# split-apply-combine
by(iris, "Species", nrow)
by(iris, "Species", df -> mean(df["Petal.Length"]))

for subdf in groupby(iris, "Species")
    # ... do something
end

# reshape pivot-table style: amount ~ (country x category)
stack(df, "amount", ["country", "category"])
