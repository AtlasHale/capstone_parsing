using TextAnalysis, WordTokenizers

function tagSentences(a::Array{String})
    ner = NERTagger()
    output = []
    for s in a
        tags = ner(s)
        res = collect(zip(WordTokenizers.tokenize(s), tags))
        filtered = filter(x -> x[1] != "O", res)
        r = [i[1] for i in res if i[2] != "O"]
        println(r)
        append!(output, r)
    end
    return output
end

tagSentences(["A chic hacienda in Carmel Valley, Monterey County that comes with a mature olive grove used to produce an artisan olive oil is on the market for 4.295 million.", 
            "The stunning main house—3,362-square-foot, four bedrooms, four baths—sits on 2.5 acres of land that grows nearly 450 olive trees. The olives are 
            harvested annually to produce N°13 Olive Oil.", "The home is listed by Compass agents Mark Peterson and Dana Bambace. The property hit the market in early March 2020."])
