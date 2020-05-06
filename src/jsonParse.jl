using JSON, StatsBase

function parseJson(filepath::String)
    result = []
    # d = Dict()
    open(filepath) do file
        for ln in eachline(file)
            cv = JSON.parse(ln)
            push!(result, cv["text"])
            # d[cv["id"]] = (cv["text"])
        end
    end
    return result
end
# filepath to 545 training set
filepath = raw"C:\Users\Main\Desktop\545_cvs_train_v2.json"
res = parseJson(filepath)
# sample to make sure its working
sample(res, 3)
