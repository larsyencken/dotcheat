using HDF5, JLD

# use JLD format to store variables
t = 15
z = [1, 3]
@save "/tmp/myfile.jld" t z

# restore variables to current environment
@load "/tmp/myfile.jld"

# manual HDF5 operations
file = h5open("test.h5", "w")
g = g_create(file, "mygroup") # create a group
g["dset1"] = 3.2              # create a scalar dataset inside the group
attrs(g)["Description"] = "This group contains a single dataset" # an attribute
close(file)
