using PyCall
@pyimport nltk

from nltk.tokenize import word_tokenize

a = "Hello World this is from Python"

print(word_tokenize(a))



# @pyimport spacy

# nlp = spacy.load("en")

# doc = nlp(u’The team is not performing well in the match’')

# for token in doc:
#     print str(token.text),  str(token.lemma_),  str(token.pos_),  str(token.dep_)
