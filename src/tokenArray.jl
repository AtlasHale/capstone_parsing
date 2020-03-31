using Tokenize

function tokenArray(vec::Array{Array,1})
    result = []
    for a in vec
        tokens = []
        for s in a
        toks = tokenize(s)
            for t in toks
                val = Tokens.untokenize(t)
                kind = Tokens.kind(t)
                if val != " " && val != ""
                    println(val)
                    push!(tokens, val)
                end
            end
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
