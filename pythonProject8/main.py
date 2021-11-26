from itertools import combinations #сборником полезных итераторов,всеми возможными комбинациями
import nltk
from nltk.tokenize import sent_tokenize, RegexpTokenizer
from nltk.stem.snowball import RussianStemmer
import networkx as nx #Графы
import numpy
import scipy

def similarity(s1,s2): #схожесть строк
    if not len(s1) or not len(s2):
        return 0.0
    return len(s1.intersection(s2)) / (1.0 * (len(s1) + len(s2)))

# Выдает список предложений отсортированных по значимости
#преобразует в набор слов, набор предложений, потом вычисляет самые важные предложения
#из вероятности появления слов в этих предложениях
def textrank(text):
    sentences = sent_tokenize(text)
    tokenizer = RegexpTokenizer(r'\w+')
    lmtzr = RussianStemmer()
    words = [set(lmtzr.stem(word) for word in tokenizer.tokenize(sentence.lower()))
             for sentence in sentences]
    pairs = combinations(range(len(sentences)), 2)
    scores = [(i, j, similarity(words[i], words[j])) for i, j in pairs]
    scores = filter(lambda x: x[2], scores)
    g = nx.Graph()
    g.add_weighted_edges_from(scores)
    pr = nx.pagerank(g)
    return sorted(((i, pr[i], s) for i, s in enumerate(sentences) if i in pr), key=lambda x: pr[x[0]], reverse=True)


 # Сокращает текст до нескольких наиболее важных предложений

def sumextract(text, n=5):
    text = open("text.txt", "r", encoding="utf-8").read()
    tr = textrank(text)
    top_n = sorted(tr[:n])
    return ' '.join(x[2] for x in top_n)

text= open("text.txt","r",encoding="utf-8").read()

print(sumextract(text, 2))


