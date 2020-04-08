
function cleaner(arr::{String,1})

    clean = []
    for s in arr
      prepare!(s, strip_non_letters | strip_punctuation | strip_stopwords)
      stem!(s)
      push!(clean, s)
    end
    
    return clean
  
  end
  
  s = ["¿Does it handle unicode well?", "y!es#"]
  
  cleaner(s)
  