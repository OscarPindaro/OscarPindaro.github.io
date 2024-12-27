---
layout: post
title: LLM e Personaggi di D&D
date: 2024-12-27 18:00:00
description: Tentativi per capire
tags: llm ai roleplay
categories: sample-posts
featured: true
thumbnail: assets/gif/linestar/light/LinestarScene_onedark_vivid_rainbow_f0ead6.gif
toc:
  sidebar: left
tabs: true
---

Questo blogpost nasce a seguito di una chiacchierata che ho avuto con degli amici in una serata di relax.
Insieme partecipiamo a delle Game Jam, delle sfide in cui in un paio di giorni bisogna creare il prototipo di un videogioco dato un tema.
Sono sempre delle esperienze molto intense, a causa del poco tempo, e un misto di poca esperienza e poco tempo materiale ci ha sempre impedito di fare giochi di tipo narrativo.
Questa mancanza ci ha portato a parlare di LLM in ambito gaming e come implementarli.
Fare un videogioco classico non live service rende poco pratico l'utilizzo di closed source models, in quanto viene pagato il consumo di token. Questo impedisce il gioco di essere vivo per sempre, in quanto bisognerebbe spegnere la connessione a Claude o OpenAI dopo un certo tempo per evitare di entrare in perdita.

Questo ragionamento mi ha portato a iniziare l'ennesimo nuovo progetto: LMPC (Language Model non-Playable Character).
L'idea è quella di avere un framework che permetta di creare da zero dei personaggi, gestendo finetuning rispetto sia alla generazione di testo sia alla gestione delle memorie del giocaztore.
Il tool non è pensato per generare da 0 un personaggio, in quando il valore artistico dello scrivere un personaggio è dato da un essere umano, non da una macchina che sputa fuori una backstory e un personaggio generico.

## LMPC
Attualmente LLM open-weight o open-source sono di dimensioni abbastanza grandi, e per farli stare dentro una gpu da consumer hardware bisogna comunque fare sacrifici (quantizzazioni etc).
Un LLM che utilizza una GPU genera grandi constraints sul tipo di gioco che può essere sviluppato. Infatti automaticamente taglia fuori tutti quei videgiocatore che non posseggono hardware particolarmente prestante (dato sulla 1060 di steam. che è tra la GPU più comprate di sempre e all'epoca era comunque una fascia media).
Immagino che l'applicazione sarebbe su giochi di tipo narrativo, che in generale posso girare anche su dei tostapane.
Nel caso di giochi particolarmente prestanti, comunque competirebbe con l'utilizzo della GPU della pipeline di rendering e cose simili, creando uno strain aggiuntivo su giochi in generale difficili da ottimizzare.
Il mio sogno sarebbe quello di riuscire a usare da 200MB a 2GB di RAM, in quando non è una risorsa particolarmente costosa e rara, e far girare tutto su CPU.
Questo limita di molto la velocità di generazione (sulla mia macchina con un ryzen bla bla sono circa 4 token al secondo, non molto leggibile), ma è comunque un buon inizio.
La speranza è che con quantizzazioni e framework che servono il modello si riesca a tirarer su le performance.

Quindi in sostanza LMPC deve essere in grado di produrre un language model che si comporta come un personaggio scritto da un essere umano. L'essere umanto può dare informazioni su questo personaggio, come backstory, esempi di conversazione, cose avvenute in passato, lista di valori. Se possibile, l'utente dovrebbe seguire un formato, ma spesso queste info sono spaiate e non strutturate.
Se viene fornito un dataset di conversazioni, basta fare finetuning. Altrimenti, LMPC genererà un dataset di conversazioni tra il personaggio e una serie di altri personaggi o utenti che interagirebbero con lui. 
Inoltre, se necessario, visto che si usa RAG per interagire con un NPC, creare un dataset per RAG così che la gestione delle memorie dell'NPC siano fisse.

### Difficoltà principali
Le difficoltà principali è che usare close-source language models con openai o claude genera dati decenti, ma essendo modelli molto corporate hanno a volte del cringe e sono anche  mlto moralisti su argomenti che un NPC potremme parlare (alchol, erotismo, ). Questo è un po' il problema della censura dei modelli che in alcuni casi può essere un pro, ma in questo caso attimvamente perggioralo sviluppo e inltre lo il mosralismo riovina per sempre un personaggio.