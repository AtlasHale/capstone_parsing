using WordTokenizers

function tokenArray(vec::Array{Array,1})
    result = []
    for a in vec
        tokens = []
        for s in a
            push!(tokens, tokenize(s))
        end
        append!(result, tokens)
    end
    return result
end 

s = Array[ ["test string 1", "String 2"], 
            ["another test string, this time 3 with ; a semicolon", "string 4"], 
            ["¿Does it handle unicode well?", "yup"] 
        ] 

res = tokenArray(s);
