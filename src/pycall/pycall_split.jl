using PyCall

using WordTokenizers

sent = FileDocument("sentences.txt")

split_sentences(text(sent_files))


for sentence in split_sentences(text(sent))
    println(sentence)
end

for sentence in split_sentences(text(sent))
    wordtokens = tokenize(sentence)
    println("Word token=> $wordtokens")
end

