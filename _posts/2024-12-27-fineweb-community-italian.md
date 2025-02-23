---
layout: post
title: Fineweb-community topic distribution
date: 2025-02-23 18:00:00
description: Un framework per convertire personaggi in Language Models
tags: llm ai transformers gen-ai
categories: [llm, transformers, genenerative-ai]
featured: true
toc:
  sidebar: left
tabs: true
thumbnail: /assets/img/limone32_bordo_colorato.png
---


In generale in italia ci sono pochi dati e pochi modelli.
Perchè è importante avere dataset di larga scala italiani?
Normalmente LLM generativi e non sono molto forti solo su inglese.
Magari qualche statistica sul numero di modelli inglesi, francesi, tedesci e poi italiani.
Considerazioni su numero di modelli e spirito open source in italia?

Su hugging face ci sono
1. Italiano: 660
2. Inglese: 16746
3. Francese: 1404
4. Spagnolo: 1167
5. Tedesco: 943
Modelli:
1. Italiano: 6254
2. Inglese: 154 599
3. Francese: 8 951
4. Spagnolo: 8092
5. Tedesco: 8004

Hugging face ha iniziato una iniziativa di raccolta dati multilingua.
L'anno scorso hanno creato il dataset fineweb (https://huggingface.co/datasets/HuggingFaceFW/fineweb), un dataset generato a partire da CommonCrawl (https://commoncrawl.org/). CommonCrawl è un dataset "raw" che contiene gran parte delle pagine presenti su internet.
Hugging Face si è occupato di filtrarlo da informazione di bassa qualità, formattat male e pornografia.
Un subset del dataset è stato classificato da  LLama 3 70B in base alla qualità. A questo punto fanno un classficatore per poterlo scalare.
Il problema di questo approccio è che ha creato dei dati a parte di un LLM, che di sicuro performa bene su inlgese ma in altre lingue non è detto (soprattuto le meno rappresentate).

Nasce la seconda iterazione, in cui la parte di labelling viene fatta dalla community. 
L'obiettivo è ottenere un subset di 1000 campioni per ogni lingua e allenare poi classifcatori specifici su quello annotato dalle persone. Per lo split italiano sono presenti 26 annotatori.
https://huggingface.co/datasets/data-is-better-together/fineweb-c

## Labelling task
(C'è un bel blog che lo aveva spiegato bene e aveva messo uno screen del task, ci potrebbe stare)

Spiegazione generale della roba di labelling.
sono 5 classi + 1 (mettere riassuntini delle classi)
- None
- Minimal
- Basic
- Good 
- Excellent
Ultima classe è "Problematic Content" per testo formattato male, pornografia, gioco d'azzardo.


Ho labelizzato circa 400 campioni
Pipeline di filtro sulla pornografia molto buona.
Un sacco di contenuto è pubblicità e autopromozionale.
Nei campioni che ho visto io i campioni di alta qualità erano tendezialmente discussioni di tipo teologico e sul marxismo.
Sospettato che la pipeline di filtro potesse aver penalizzato alcune catregorie, quindi ho deciso di fare uno studio sulla distribuzione dei topic per vedere se era sbilanciata o no e poi aggiungere altre feature per altre pipelines.

## Estrazione keyword

Metodo:
tf-idf per estratte keywords. Dovuto rimuovere aritcoli, numeri e cose del genere se no venivano estratti come parole chiavi. 
Non male devo dire.
Poi pipeline generativa, usato con llama e gemma. Setuppato con deepseek ma era troppo lento sulla mia RTX 4070. Spiegare meglio come il prompt è fatto.
Sfruttsto ollama che cacha i prompt, quindi bassissima latenza visto che il prompt era abbastanza fisso.
LLM istruitio ad assegnare classi da una lista prefatta. Detto questo LLM poteva mettere nuove categorie nel caso quelle pre-esistenti non esistevano.
Partito con 20, finito con 181? Gemma non mi piacevano tanto onestamente ma personale.
Magari mettere tempi di generazione e valutare l'equivcalente che ci vorrebbe con un BERT di classificazione.

Risultati
Inserire il plot di plotly spiegando come l'ho fatto.
emb = alpha emb_init + (1-alpha)emb_topic

Clusterizzazione abbastanza utile per vedere come cambia.


