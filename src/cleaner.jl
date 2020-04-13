using TextAnalysis

function cleaner(arr::{String,1})

    clean = []
    for s in arr
        strip(s)
        prepare!(s, strip_punctuation | strip_stopwords)
        push!(clean, s)
    end
    
    return clean
  
  end
  
  s = ["¿Does it handle unicode well?", "y!es#"]
  
  cleaner(s)
 
# using TextAnalysis

# function cleaner(arr::{String,1})

#     clean = []
#     for s in arr
#         strip(s)
#         remove_corrupt_utf8!(s)
#         remove_punctuation!(s)
#         remove_stopwords!(s)
#         stem!(s)
#         ##prepare!(s, strip_punctuation | strip_stopwords)
#         push!(clean, s)
#     end
    
#     return clean
  
# end
  
#   s = ["¿Does it handle unicode well?", "y!es#"]
  
#   cleaner(s)
  