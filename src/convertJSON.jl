using JSON

# Note: JSON types map to sensible types in Julia
# Oject becomes Dict
# array becomes Vector
# number becomes Int64
# boolean becomes Bool
# null becomes nothing::Void

juliaDict = JSON.parse("""{"name": ["Adam", "Connor", "Gabriel", "Isaac", "Michael"],
"age" : [21,22,23,24,25],
"favorite_program_lang" : ["Java", "C++", "Golang", "Ruby", "Python"]}""")


# Prints the names in Dictionary

juliaDict["name"]

# Selects an individual name from Dict

juliaDict["name"][2]

# print the keys in the Dict

keys(juliaDict)

# print the values in Dict

values(juliaDict)

# Serializing converts a Dict object to a JSON object

"month_names" => ["January", "December", "November", "August", "September"]
"abbr" => ["JAN", "DEC", "NOV", "AUG", "SEP"]

jD = JSON.json(Dict("month_names" => ["January", "December", "November", "August", "September"],
"abbr" => ["JAN", "DEC", "NOV", "AUG", "SEP"]))

typeof(jD)

# takes 3 arguments - (IO, data/object,INDENT)
#first argument can be omitted

JSON.print(jD,2)

#write into a JSON format

open("toJSON.json", "w") do j
    write(j,jD)
end


readdir()

pwd()




