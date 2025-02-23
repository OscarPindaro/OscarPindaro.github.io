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

## Fineweb-community
Su hugging face ci sono
1. Italian: 660
2. English: 16 746
3. French: 1404
4. Spanish: 1167
5. German: 943
Modelli:
1. Italian: 6254
2. English: 154 599
3. French: 8 951
4. Spanish: 8092
5. German: 8004

In generale in italia ci sono pochi dati e pochi modelli.
Si attiva

https://huggingface.co/datasets/data-is-better-together/fineweb-c

Spiegazione di fineweb edu + link
Magari prendersi una definzione di cos'è common crawl.


Perchè è importante avere dataset di larga scala italiani?
Normalmente LLM generativi e non sono molto forti solo su inglese.
Magari qualche statistica sul numero di modelli inglesi, francesi, tedesci e poi italiani.
Considerazioni su numero di modelli e spirito open source in italia?


Spiegazione generale della roba di labelling.
sono 5 classi + 1
- None
- Minimal
- Basic
- Good 
- Excellent
Ultima classe è "Problematic Content" per testo formattato male, pornografia, gioco d'azzardo.

Discussione sullo split italiano. 
Ho labelizzato circa 400 campioni
Pipeline di filtro sulla pornografia molto buona.
Un sacco di contenuto è pubblicità e autopromozionale.
Nei campioni che ho visto io i campioni di alta qualità erano tendezialmente discussioni di tipo teologico e sul marxismo.
Sospettato che la pipeline di filtro potesse aver penalizzato alcune catregorie, quindi ho deciso di fare uno studio sulla distribuzione dei topic per vedere se era sbilanciata o no e poi aggiungere altre feature per altre pipelines.

Metodo:
tf-idf per estratte keywords. Dovuto rimuovere aritcoli, numeri e cose del genere se no venivano estratti come parole chiavi. 
Non male devo dire.
Poi pipeline generativa, usato con llama e gemma. Setuppato con deepseek ma era troppo lento sulla mia RTX 4070.
Sfruttsto ollama che cacha i prompt, quindi bassissima latenza visto che il prompt era abbastanza fisso.
LLM istruitio ad assegnare classi da una lista prefatta. Detto questo LLM poteva mettere nuove categorie nel caso quelle pre-esistenti non esistevano.
Partito con 20, finito con 181? Gemma non mi piacevano tanto onestamente ma personale.
Magari mettere tempi di generazione e valutare l'equivcalente che ci vorrebbe con un BERT di classificazione.

Risultati
Inserire il plot di plotly spiegando come l'ho fatto.
emb = alpha emb_init + (1-alpha)emb_topic

Clusterizzazione abbastanza utile per vedere come cambia.


