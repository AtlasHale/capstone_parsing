using TextAnalysis
using Languages

function cleaner(arr::Array{String})

    clean = []
    for s in arr
        strip(s)
        remove_corrupt_utf8!(s)
        prepare!(s, strip_punctuation | strip_stopwords | strip_non_letters)
        #stem!(s)
        push!(clean, s)
    end
    
    return clean
  
end
  
s = ["¿Does it handle unicode well?", "y!es#"]
  
cleaner(s)
