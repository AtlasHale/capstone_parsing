function sentSeg(s)
    temp = []
    tempSmall = []
    for i in s
        push!(tempSmall, i)
        if i[end] == '.' && i != "Mr." && i != "Mrs."
            push!(temp, tempSmall)
            tempSmall = []
        end
    end
    return temp
end
    
sampleCode = ["Here", "is", "a", "sententce", "this.", "Home", "Mr.", "Ok", "M.", "Another", "one."]
    
println(sentSeg(sampleCode))
