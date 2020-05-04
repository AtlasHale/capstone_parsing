"""
Transformers.jl, build is broken due to cookiejar argument.

Test Summary:                         | Pass  Fail  Error  Total
Transformers                          |   74     2     17     93
  Transformer                         |                 5      5
  NNTopo                              |    7     2             9
  Embed                               |   35                  35
  Basic                               |    2                   2
  Gpt                                 |                 1      1
    Transformer                       |                 1      1
  Bert                                |   29            1     30
    Tokenizer                         |   23                  23
    Transformer                       |                 1      1
    WordPiece                         |    6                   6
  Pretrain                            |    1           10     11
    GPT-OpenAIftlm                    |                 1      1
    Bert-cased_L-12_H-768_A-12        |                 1      1
    Bert-wwm_cased_L-24_H-1024_A-16   |                 1      1
    Bert-uncased_L-12_H-768_A-12      |                 1      1
    Bert-multi_cased_L-12_H-768_A-12  |                 1      1
    Bert-wwm_uncased_L-24_H-1024_A-16 |                 1      1
    Bert-multilingual_L-12_H-768_A-12 |                 1      1
    Bert-chinese_L-12_H-768_A-12      |                 1      1
    Bert-cased_L-24_H-1024_A-16       |                 1      1
    Bert-uncased_L-24_H-1024_A-16     |                 1      1

In runtests, almost all tests have errors. 
"""
using Transformers
using Transformers.Basic
using Transformers.Pretrain

ENV["DATADEPS_ALWAYS_ACCEPT"] = true

bert_model, wordpiece, tokenizer = pretrain"bert-uncased_L-12_H-768_A-12"
vocab = Vocabulary(wordpiece)

text1 = "Peter Piper picked a peck of pickled peppers" |> tokenizer |> wordpiece
text2 = "Fuzzy Wuzzy was a bear" |> tokenizer |> wordpiece

text = ["[CLS]"; text1; "[SEP]"; text2; "[SEP]"]
@assert text == [
    "[CLS]", "peter", "piper", "picked", "a", "peck", "of", "pick", "##led", "peppers", "[SEP]", 
    "fuzzy", "wu", "##zzy",  "was", "a", "bear", "[SEP]"
]

token_indices = vocab(text)
segment_indices = [fill(1, length(text1)+2); fill(2, length(text2)+1)]

sample = (tok = token_indices, segment = segment_indices)

bert_embedding = sample |> bert_model.embed
feature_tensors = bert_embedding |> bert_model.transformers