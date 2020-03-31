using Tokenize

function tokenArray(vec::Array{Array,1})
    result = []
    for a in vec
        tokens = Vector{String}
        for s in a
        toks = tokenize(s)
            for t in toks
                val = Tokens.untokenize(t)
                if val != " "
                    println(val)
                    # append!(tokens, val)
                end
            end
        println(tokens)
        end
    end
    return result
end 

s = Array[ ["test string 1", "String 2"], ["test string 2 again", "string 4"] ]

res = tokenArray(s);
