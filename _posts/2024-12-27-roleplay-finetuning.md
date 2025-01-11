---
layout: post
title: LLM e Personaggi di D&D oppure Olrando Marlo, finetunato per roleplayare?
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


LMPC (Language Model non-Playable Character) è un progetto che si pone come obiettivo la creazione automatica di NPC (Non-Playable Character), personaggi che all'interno di un videogioco comunicano con il giocatore.

Possono avere un ruolo più o meno importante all'interno della struttura del gioco, in quanto possono:
- spiegare e portare avanti la trama principale del gioco
- spostare l'attenzione del giocatore su una sotto-trama secondaria 
- dare missioni al giocatore


## Obiettivi
L'obiettivo dei questo framework è quello di dare a scrittori di storie e personaggi un tool per rendere "vivi" i loro personaggi.
LMPC si occuperà di raccogliere le informazioni su questi personaggi, finetunare LLM (Large Language Model) per imparare a rispondere come loro, gestire le memorie del mondo di gioco e le memorie del giocatore.

Il tool non è pensato per generare da zero un personaggio. Penso che la qualità e il valore artistico nel creare una storia e un personaggio è dato da un essere umano, non da una macchina che sputa fuori una backstory e un personaggio generico.

Una volta pronto, questo LLM potrebbe essere usato per avere degli script in tempo reale in una campagna di Dungeon&Dragons. Oppure essere integrato all'interno di un videogioco, in cui gli utenti possono scrivere quello che vogliono ai personaggi. Oppure semplicemente avere un personaggio con cui chiacchierare e fare delle domande.


## Principali difficoltà

### Modelli Closed Source
Un Large Language Model è detto closed-source quando il modello non è disponibile al pubblico, ma è il prodotto di un'azienda che serve il modello dietro ad un pay wall.
Questi modelli vengo pagati con un modello Pay As You Go, proporzionale al numero di token generati. Questo restringe ampiamente la tipologia di videogiochi che possono essere creati, in quanto bisogna avere un modello di business che permetta di coprire i costi della generazione, come giochi live-service. Tralasciando il fatto che trovo rivoltante la quantità di monetizzazione presente in questi tipi di giochi, per me risulta anche problematico in quanto la vita del gioco e degli NPC è indissolubilmente collegata al successo del gioco e alla decisione di chiudere i server del gioco.

### Modelli Open Source
Un modello è detto open-source o open-weight se è disponibile al pubblico. Open-source è un termine più ampio che si riferisce al fatto che sia il codice che i dati dell'allenamento sono stati resi pubblici.

Attualmente questi modelli hanno dimensioni abbastanza notevoli.
L'hardware deve:
- essere abbastanza potente per generare testo ad una velocità ragionevole
- avere abbastanza memoria per ospitare il modello

La Nvidia RTX 1060 è probabilmente una delle schede video più comprate di sempre, e di solito è vendutacon 6GB di VRAM. Uscita nel 2016, è già un pezzo di hardware abbastanza vecchitto, e comunque farebbe fatica a ospitare anche i modelli più piccoli (con moli sacrifici si potrebbe fare stare u piccolo LLM in 4 GB)


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



## Creazione del Personaggio

## Creazione del Personaggio: Costruendo una Storia

Per dare vita a personaggi coinvolgenti e credibili, LMPC si basa su una solida struttura narrativa che include un contesto storico ricco di dettagli. 

### Contesto Storico: Immergetevi nel Mondo

La creazione del contesto storico è fondamentale per definire il palcoscenico in cui i personaggi opereranno. Per semplificare questo processo e garantire un buon punto di partenza, LMPC si avvale di modelli linguistici avanzati come Claude Sonnet, che generano una descrizione iniziale del mondo.  Tuttavia, la qualità della generazione viene ulteriormente affinata dall'intervento umano, aggiungendo dettagli specifici e correggendo eventuali espressioni troppo generali o "corporate".

Il contesto storico si articola in diverse sezioni chiave:

* **Descrizione:** Una breve introduzione che offre un primo sguardo al mondo, descrivendo le sue caratteristiche principali.
* **Organizzazione Politica:** Un elemento cruciale per comprendere come il potere è strutturato e distribuito all'interno del contesto.  Questa sezione definisce i meccanismi di governo e le dinamiche di potere che influenzeranno le scelte e le azioni dei personaggi. 
* **Entità di Potere:** Le organizzazioni o individui che detengono il controllo politico ed economico, influenzando la vita quotidiana degli abitanti del mondo.

* **Persone Importanti:** Figure chiave della società, individuate per il loro ruolo sociale, culturale o politico. Queste figure possono offrire spunti interessanti per dialoghi e interazioni con il personaggio.
* **Entità Marginalizzate:**  Chi vive ai margini del sistema, spesso oppresso o svantaggiato rispetto ai gruppi dominanti. La presenza di entità marginalizzate aggiunge profondità al mondo, evidenziando le disuguaglianze e le tensioni sociali.

* **Persone Importanti Marginalizzate:** Simili alle persone importanti, ma appartengono a gruppi che si oppongono al sistema dominante, lottando per cambiare la situazione. 


 Questo approccio strutturato permette di creare un mondo coerente e ricco di dettagli, offrendo spunti creativi sia agli autori umani che ai modelli linguistici per sviluppare personaggi convincenti e storie coinvolgenti.





### Contesto Storico
Per poter avere un personaggio decente, bisogna prima inserirlo in un contesto storico.
A causa di limiti di tempo, il contesto storico lo ho generato utilizzando claude sonnet (che preferisco molto di più ai chatGPT).
La generazione in se non era male, anche se conteneva alcune frasi o espressioni che trovavo troppo corporate o generiche e che ho pulito. Ogni tanto aggiungevo io personalmente qualche dettaglio per migliorare un po' la qualità della generazione.
Un contesto storico è composto da:
- Descrizione: una breve introduzione che spiega il contesto storio in cui si trova. 
- Organizzazione politica: è molto importante definire come il potere è amministrato, in quanto è dove il personaggio potrà agire.
- Entità di potere: sono entità che amministrano il potere all'interno del contesto
- Persone importanti: Alcune figure chiave della società, servono per avere qualcosa di cui parlare durante una conversazione
- Entità marginalizzate: in tutte le società c'è chi comanda e chi è schiacciato dal sistema. E' un sistema un po' semplice ma che comunque aggiunge un po' di profondità al mondo
- Persone importanti marginalizzate: stesso ruolo delle persone importanti, ma che combattono contro il sistema
Modella il contesto in questa maniera ha una serie di vantaggi: abbiamo un sistema politico utile per caratterizzare il personaggio, che sia lo scrittore umano che una AI può usare per caratterizzare. La divisione tra primi e utlimi nella società è un po' semplicista ma è meglio di avere solo la descrizione di chi ha il potere. Permettere di creare uno spettro "politico" in cui inserire il personaggio.
Le persone importanti sono un buon modo poi per far generare opinioni o incontri con il personaggio.

(in futuro la creazione e il filtraggio di luoghi importanti, persone importanti etc può essere fatta con un assistente)


###  Personaggio: Un Individuo con Storia e Motivazioni

Per dare vita ad un personaggio memorabile, LMPC utilizza diverse informazioni chiave:

* **Backstory:** Una breve panoramica del passato del personaggio, contenente eventi importanti che hanno plasmato la sua personalità e le sue scelte.
* **Allineamento:**  Un sistema semplificato per categorizzare il personaggio in base alla sua posizione sociale, alle sue convinzioni morali e al suo atteggiamento nei confronti dell'autorità. Questo elemento aiuta a definire i suoi legami con gli altri personaggi e la società nel suo complesso. (collegamento ad una tabella degli allineamenti)

* **Valori:** Una lista di principi fondamentali che guidano le azioni e le decisioni del personaggio. Questi valori sono cruciali per creare un personaggio autentico e credibile, evitando stereotipi o comportamenti inconsistenti.
* **Obiettivi:** Cosa spinge il personaggio a agire? Quali sono i suoi desideri, le sue aspirazioni e i suoi sogni? I suoi obiettivi forniscono una direzione alla sua trama e lo spingono ad interagire con gli altri personaggi e con l'ambiente circostante.
* **Opinioni:** Una serie di posizioni assunte dal personaggio su diversi argomenti. Le opinioni riflettono il suo punto di vista sul mondo, le sue convinzioni e i suoi valori, contribuendo a renderlo un individuo complesso e sfaccettato. 



Tramite questi elementi, LMPC costruisce un ritratto dettagliato del personaggio, pronto ad essere esplorato in conversazioni interattive e storie coinvolgenti.


### Personaggio
Ora che c'è il contesto storico, si può definire il personaggio.
Un personaggio ha:
- Una backstory. E' alla fine un riassunto delle esperienze che il personaggio ha avuto. Nel mio caso è molto corta e contiene qualche informazione sul passato
- Allineamento: link al chart degli allineamenti, permetti di capire se è integrato o meno nella società e quali sono le sue categorie. Semplicistico ma è già abbastanza
- Valori: una lista di valori importanti per il personaggio. Questi condizionano molto la generazione, e permette di creare un personaggio non generico
- Obiettivi: cosa spinge la vita del personaggio? in base agli obbiettivi puoi interagire con altri
- Opinioni: una serie di opinioni su alcuni argomenti. E' dove è 

{% tabs orlando-marlo %}

{% tab orlando-marlo Origin Story %}
>Born into the noble house of Marlo, Orlando grew up witnessing both the splendor and corruption within Luminara's halls of power. As a child, he experienced a profound spiritual moment when sunlight streamed through the Great Cathedral's stained glass during his knighting ceremony, filling him with genuine divine purpose. Unlike many nobles who saw faith as a path to power, Orlando's connection to Solaris became deeply personal and sincere. His father's deathbed confession about the corruption he witnessed as a Crown Council member strengthened Orlando's resolve to serve both crown and faith with true righteousness.
{% endtab %}

{% tab orlando-marlo Values %}
>- Genuine religious devotion and spiritual purity
>- Justice tempered with mercy
>- Protection of the weak, regardless of their social status
>- Honesty and transparency in governance
>- Balance between secular law and divine guidance
>- Personal integrity over political advantage
>- Duty to both crown and faith
{% endtab %}

{% tab orlando-marlo Alignment %}
> Lawful Good
{% endtab %}

{% tab orlando-marlo Objectives %}
>- Ascend to the position of Chancellor to influence royal policy
>- Reform the relationship between church and state to serve the people rather than power
>- Create a more equitable system for the marginalized while working within existing structures
>- Prove that true faith and effective governance can coexist without corruption
>- Build bridges between the privileged and the Unblessed through official channels
>- Establish transparency in both Crown Council and Solar Conclave dealings
{% endtab %}

{% tab orlando-marlo Opinions %}

>### On the Order of Solar Truth
>Orlando recognizes the Order's vital role in preserving sacred knowledge and providing education to the populace - something he deeply values as a foundation of a stable society. He admires their dedication to maintaining the ancient texts and their role in bringing literacy to even remote villages. However, he is troubled by how the Order increasingly manipulates religious doctrine for political gain. Their practice of withholding certain teachings from the "Unblessed" particularly disturbs him, as he believes Solaris's light should shine on all equally. While he would never speak openly against them, he silently disapproves of how they've transformed from spiritual guides into power brokers, using their control over education to shape political narratives. He sees their current path as a corruption of their original sacred mission, though he struggles with this critique, knowing the importance of maintaining religious authority in Luminara's governance.
>
>### On Sol's Universal Message
>Orlando finds profound inspiration in Sol's sermon of the Shared Dawn, where the prophet stood on Mount Luminous and proclaimed that just as the morning sun touches both palace and hovel alike, divine grace knows no walls or borders. This message resonates deeply with Orlando, who often meditates on how Sol compared human-made hierarchies to clouds that foolishly believe they can block the sun's light permanently. The knight particularly cherishes the prophet's warning that "those who claim to own the light cast the darkest shadows," seeing it as a perfect metaphor for the current corruption in Luminara's institutions. When alone in the castle gardens at sunrise, Orlando often recreates Sol's famous gesture of open arms toward the sun, reflecting on how this simple yet powerful truth about universal divine love has been twisted by those who claim to be its guardians. The contradiction between Sol's original teachings and the current practice of marking some as "Unblessed" represents, to Orlando, the greatest betrayal of their prophet's vision.

{% endtab %}

{% endtabs %}

## Modellazione
L'obiettivo è avere un LLM, possibilmente il più piccolo possibile, che si comporta come il personaggio.
*breve descrizione orlando marlo*
Per semplicità, essendo un prototipo, ho immaginato chat con un singolo turno, in sostanza coppie di domande e risposte.
Bisogna quindi separatamente generare tante domande e tante risposte nello stile di orlando marlo

### Generazione delle domande
Per generare delle domande, ho deciso di utilizzare Gemma2b. 
Non ho scelto un modello più grande poichè dalle prove sembrava funzionare bene.
Come al solito per generare qualcosa bisogna identificare in un promp 3 cose:
- persona: chi è il modello e che personalità deve avere
- istruzioni: cosa deve fare il modello
- esempi: opzionali, sono degli esempi da mostrare al modello per condizionare meglio la generazione.

*Aggiungere codice della classe del generative prompt!!!!*

Nel caso delle generazione di domande, ho creato una decina di personaggi con descrizioni molto piccole (e.g **"Elena Solwind, royal historian, scholarly and reserved"**). Questo perchè creare un personaggio occupa molto tempo e inoltre mi servono semplicemente una lista di domande da fare al mio personaggio. Avere questi personaggi casuali mi permette di avere un po' di varianza nello stile, in quanto uno storico potrebbe fare domande diverse dal capo della gilda dei mercanti.
Seguendo sempre questa logica, ho assegnato un'emozione a caso al personaggio, per variare ancora di più il tipo di domande.
Per quel che riguarda istruzioni, ho fornito al personaggio l'intera backstory di Orlando marlo e opzionalmente una delle sue opinioni. Infine, ho anche descritto il luogo in cui si incontrano, il motivo per cui si incontrano e il livello di intimità.

Ecco un esempio di prompt:
> You are **Elena Solwind, royal historian, scholarly and reserved**. You are feeling **calm**.
> You will be given some information about me. I'm a character from a fantasy world. 
> *...
> ... backstory di Orlando Marlo
> ...*
> **Meeting location**: The Great Cathedral of Solaris
> **Meeting reason**: delivering urgent message
> **Knowledge of my background**: high
> We are going to have a conversation. You will ask me a question.We are having a direct conversation. Do not use indirect speech."
> ...
> *examples of questions*
> ...

Col senno di poi, avrei scelto un modello diverso per la generazione di domande oppure avrei usato un riassunto della backstory di Orlando Marlo, in quanto mi sembra di aver sovraccaricato il modello con troppe informazioni e di conseguenza aver generato domande di bassa qualità.
Per qualche motivo Gemma2B prima di fare la domanda a Orlando, procede a riassumere l'intera backstory, facendo a volte domande che trovo anche poco naturali. 
Probabilmente il prompt è troppo carico oppure è il fatto che i modelli Gemma non hanno un prompt di sistema, quindi bisogna mettere tutto dentro il primo messaggio dell'utente. Può anche essere che ho promptato male.



{% tabs group-name %}

{% tab group-name Elena Solwind %}
>**Elena Solwind, royal historian, scholarly and reserved**, meeting in **Healing Sanctuaries**:
>
>Orlando Marlo... a name well-known even amongst those who reside outside the realm of Luminara's grandeur.  Tell me, what is your assessment of Seraphina's vision regarding the kingdom's future? Do you believe her words carry an inherent warning or merely political commentary?
****
{% endtab %}

{% tab group-name Isabella Stormwind %}
>**Commander Isabella Stormwind, border patrol leader, pragmatic and direct**, meeting in **Marlo Family Estate**
>
>"Orlando Marlo.  I hear whispers of your family, their long history intertwined with this land. But what drove them - specifically *you* - towards a life dedicated to upholding both Solaris and the crown?

{% endtab %}

{% endtabs %}


### Generazione delle risposte
Per generare le risposte si procede in maniera molto simile. 
La persona è ovviamente Orlando Marlo a cui aggiungo tutta la sua backstory.
Ho anche aggiunto dei motti (o catch-phrases) che Orlando potrebbe dire. Questo è meno per la caratterizzazione e più per vedere se dopo l'allenamento il modello è in grado di imparare queste frasi fatte.
Al modello viene poi dato come messaggio di utente la domanda generata nello step precedente e finalmente Orlanodo può rispondere
In questa pipeline gli esempi sono molto più importanti,e li ho creati in maniera iterativa. 
Prima usavo una domanda a caso tra quelle pescate, vedevo le risposta generata da Orlando e la modificavo per farlo suonare meno generica e più simile a qualcosa che direbbe lui.
Infine aggiungevo qesta rispsota tra gli esempi per la pipeline.

Ecco un esempio del prompt, prima di essere riempito con le variabili importanti.
```python
"""{ persona }****

{instruction}

You are talking with: {character}

Meeting location: {location}


{% if examples %}
Here's some examples of past conversations between you and other characters. 
Use this examples as a style guide.
{% for example in examples %}
## Example {loop.index}
{example}
{% endfor %}
{% endif %}

Use only direct speech. No description of tone.
Answer the question referencing the information about you that you know.
Don't introduce yourself.
Don't be cringe, you are having a conversation with a real person.
"""
```

