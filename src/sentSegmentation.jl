using WordTokenizers

function sentSeg(s)
    newArray = []
    temp = []
    for i in s
        temp = split_sentences(i)
        push!(newArray, temp)
    end
    return newArray
end

# Testing Materials
#
# a = ["Here is a sentence this.  Home Mr. ok m? Another one. Am I done yet? Here are som3 23.323 numbers: today!"
#     , "Resume #2 is here.  He worked someplace awesome?  He also did some stuff!"
#     , "Resume #3 is coming!  My wife is playing with our dog now. 23% chance she will leave me"
#     , "Resume #4?  She does not like it when i make jokes like that 100% of the time! I also ect. think this will work."
#     , "Resume #5 - John Smith. Will this throw it off.  Smith.  Will Smith.  Detective Will Smith."]
    
# a = sentSeg(a)
# println(a)
