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
L'obiettivo di questo framework è quello di dare a scrittori di storie e personaggi un tool per rendere "vivi" i loro personaggi.
LMPC si occuperà di raccogliere le informazioni di questi personaggi, finetunare un LLM (Large Language Model) per imparare a rispondere come loro, gestire le memorie del mondo di gioco e così via.

Il tool non è pensato per generare da zero un personaggio. Penso che la qualità e il valore artistico nel creare una storia e un personaggio è dato da un essere umano, non da una macchina che sputa fuori una backstory e un personaggio generico.

Una volta pronto, questo LLM potrebbe essere usato per avere degli script in tempo reale in una campagna di Dungeon&Dragons. Oppure essere integrato all'interno di un videogioco, in cui gli utenti possono scrivere quello che vogliono ai personaggi. Oppure semplicemente avere un personaggio con cui chiacchierare e fare delle domande.

Questo non è un framework per generare automaticamente personaggi.
L'obiettivo è partire da un personaggio già creato, con la sua storia, il suo mondo di origine, le caratteristiche, e dargli vita allenando un modello su tutte queste informationi

## Principali difficoltà

### Modelli Closed Source
Un Large Language Model è detto closed-source quando il modello non è disponibile al pubblico, ma è il prodotto di un'azienda che serve il modello dietro ad un pay wall.
Questi modelli vengo pagati con un modello Pay As You Go, proporzionale al numero di token generati. Questo restringe ampiamente la tipologia di videogiochi che possono essere creati, in quanto bisogna avere un modello di business che permetta di coprire i costi della generazione, come giochi live-service. Tralasciando il fatto che trovo rivoltante la quantità di monetizzazione presente in questi tipi di giochi, per me risulta anche problematico in quanto la vita del gioco e degli NPC è indissolubilmente collegata al successo del gioco e alla decisione di chiudere i server del gioco.

### Modelli Open Source
Un modello è detto open-source se è disponibile al pubblico e può essere scaricato e utilizzato sulla propria macchina locale.

Attualmente questi modelli hanno dimensioni abbastanza notevoli, ed è necessario avere un computer con performance dignitose.
L'hardware deve:
- essere abbastanza potente per generare testo ad una velocità ragionevole
- avere abbastanza memoria per ospitare il modello

La [Nvidia RTX 1060](https://www.nvidia.com/it-it/geforce/10-series/) è probabilmente una delle schede video più comprate di sempre. Uscita nel 2016, è già un pezzo di hardware abbastanza vecchitto, e comunque farebbe fatica a ospitare anche i modelli più piccoli: un modello può essere ospitato in 4 GB di VRAM con molti sacrifici, e questa scheda è spesso venduta con 6 GB di VRAM.
L'utilizzo di così tante risorse mette anche grandi limiti al tipo di gioco che può essere sviluppato, visto che il Language Model entra in competizione con la logica del gioco, la pipeline di rendering e eventuali intelligenze artificiali.
Inoltre, non tutti i giocatori hanno a disposizione un computer con una scheda grafica.

Il mio sogno è quello di riuscire a usare tra i 200 MB e i  2GB di RAM, e possibilmente riuscire a far girare tutto su CPU. Questo permetterebbe anche a giocatori senza una macchina particolarmente avanzata di poter interagire con questi personaggi.

Quindi in sostanza LMPC deve essere in grado di produrre un language model che si comporta come un personaggio scritto da un essere umano. L'essere umanto può dare informazioni su questo personaggio, come backstory, esempi di conversazione, cose avvenute in passato, lista di valori. Se possibile, l'utente dovrebbe seguire un formato, ma spesso queste info sono spaiate e non strutturate.
Se viene fornito un dataset di conversazioni, basta fare finetuning. Altrimenti, LMPC genererà un dataset di conversazioni tra il personaggio e una serie di altri personaggi o utenti che interagirebbero con lui. 
Inoltre, se necessario, visto che si usa RAG per interagire con un NPC, creare un dataset per RAG così che la gestione delle memorie dell'NPC siano fisse.

## AI Slop e Moralismo
Gran parte dei modelli presenta un moralismo abbastanza spiccio e un modo di pensare e scrivere molto corporate. Questo è perchè sono allenati da aziende come Meta, Microsoft, OpenAI, Anthropic o Google. 
Questi modelli sono "sicuri", a prezzo di peggiori performance in ambito roleplay. 
L'effetto è una generale sensazione di cringe su alcuni output (molto frequentemente questi modelli fanno la morale all'utente) e un alto livello di **refusal**, ovvero la predisposizione a rifiutarsi a parlare di alcuni argomenti. Questo è un po' un problema nel caso un NPC potrebbe anche banalmente voler parlare di alchol.




## Creazione del Personaggio


### Contesto Storico
La creazione del contesto storico è fondamentale per definire il palcoscenico in cui i personaggi opereranno.
Infatti, un personaggio non vive da solo nel vuoto, ma assume un certo ruolo in una società, ha delle opinioni.
Addirittura interagisce con altri personaggi, ha antipatie, invidie, che lo rendono tridimensionale.

In questo prototipo, ho generato il contesto utilizzando Claude Sonnet, che preferisco a ChatGPT.
Il mondo generato non era male, ma ho dovuto rimuovere frasi o espressioni corporate o troppo generiche. Guidando un po' la generazione sono riuscito a creare un mondo accettabile per il prototipo che voglio creare.
A causa di limiti di tempo, il contesto storico lo ho generato utilizzando claude sonnet (che preferisco molto di più ai chatGPT).
La generazione in se non era male, anche se conteneva alcune frasi o espressioni che trovavo troppo corporate o generiche e che ho pulito. Ogni tanto aggiungevo io personalmente qualche dettaglio per migliorare un po' la qualità della generazione.
Il contesto storico si articola in diverse sezioni chiave:

* **Descrizione:** Una breve introduzione che offre un primo sguardo al mondo, descrivendo le sue caratteristiche principali.
* **Organizzazione Politica:** Definisce come il potere è strutturato e distribuito all'interno del contesto.  Questa sezione definisce i meccanismi di governo e le dinamiche di potere che influenzeranno le scelte e le azioni dei personaggi. 
* **Entità di Potere:** Le organizzazioni o individui che detengono il controllo politico ed economico, influenzando la vita quotidiana degli abitanti del mondo.
* **Persone Importanti:** Figure chiave della società, individuate per il loro ruolo sociale, culturale o politico. Queste figure possono offrire spunti interessanti per dialoghi e interazioni con il personaggio.
* **Entità Marginalizzate:**  Chi vive ai margini del sistema, spesso oppresso o svantaggiato rispetto ai gruppi dominanti. La loro presenza aggiunge profondità al mondo, evidenziando le disuguaglianze e le tensioni sociali e rendendo un po' più tridimensionale l'ambientazione.
* **Persone Importanti Marginalizzate:** Simili alle persone importanti, ma appartengono a gruppi che si oppongono al sistema dominante, in cerca di rivalsa contro un sistema che li ha buttati via e li opprime.

### Il Sacro Regno di Luminaria

Nel mio caso, ho creato il Sacro Regno di Luminaria, una monarchia che condivide il potere con la Chiesa.La legittimità del regno dipende dalla percezione che i suoi sovrani siano stati scelti da Solaris, la divinità. Il governo ha un sistema di doppio potere, dove le decisioni importanti richiedono l'approvazione sia della Corona che del Concilio Solare. Molti gruppi sono marginalizzati o oppressi, tra cui coloro che vengono considerati non favoriti da Solaris e i praticanti delle tradizioni pre-Solaris.


###  Personaggio

Una volta creato il contesto, si può procedere con il personaggio, che ha:

* **Backstory:** Una breve panoramica del passato del personaggio, contenente eventi importanti che hanno plasmato la sua personalità e le sue scelte.
* **Allineamento:**  [Un sistema semplificato per categorizzare il personaggio](https://dungeonedraghi.it/regole/personaggio/allineamento/) in base alla sua posizione sociale, alle sue convinzioni morali e al suo atteggiamento nei confronti dell'autorità. Questo elemento aiuta a definire i suoi legami con gli altri personaggi e la società nel suo complesso. 
* **Valori:** Una lista di principi fondamentali che guidano le azioni e le decisioni del personaggio. Questi valori sono cruciali per creare un personaggio autentico e credibile, evitando stereotipi o comportamenti inconsistenti.
* **Obiettivi:** Cosa spinge il personaggio a agire? Quali sono i suoi desideri, le sue aspirazioni e i suoi sogni? I suoi obiettivi forniscono una direzione alla sua vita e lo spingono ad interagire con gli altri personaggi e con l'ambiente circostante.
* **Opinioni:** Una serie di posizioni assunte dal personaggio su diversi argomenti. Le opinioni riflettono il suo punto di vista sul mondo, le sue convinzioni e i suoi valori, contribuendo a renderlo un individuo complesso e sfaccettato. 

In questo modo ho generato Orlando Marlo, un nobile del regno di Luminaria. Fervente credente, disprezza la corruzione presente all'interno del regno, in quanto capisce che la religione in cui ha posto la fede è utilizzata dagli altri come leva di potere. Vuole cambiare il sistema dall'interno diventando Ciambellano. E' un uomo onorevole e molto rispettato, che prova attivamente a costruire un mondo migliore. E'convinto che chiunque possa essere salvato, ma questa convinzione lo rende paternalista nei confronti di chi non condivide con lui la sua fede.

Nelle schede qua sotto è riportato l'intero personaggio.

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
Tutto quello che è stato discusso fino ad adesso riguarda il tipo di dati e informazioni che il designer del personaggio deve fornire.

Una volta raccolte queste informazioni, può iniziare l'allenamento dell'LLM.
La prima cosa da fare è la creazione di un dataset di conversazioni che il personaggio farebbe.
Idealmente anche queste dovrebbero essere fornite dal designer, ma ho deciso per questo tentativo di generare sinteticamente delle conversazioni del tipo domanda-risposra.


### Generazione delle domande
Per generare delle domande, ho deciso di utilizzare Gemma2 2B, un modello di Google di dimensioni abbastanza ridotte con capacità dignitose.
Non ho scelto un modello più grande poichè dalle prove sembrava funzionare bene.

Per qualsiasi tipo di generazione, bisogna creare un prompt per LLM, ovvero delle istruzioni che il modello deve seguire.
Un prompt è composto dai seguenti componenti:
- persona: chi è il modello e che personalità deve avere
- istruzioni: cosa deve fare il modello
- esempi: opzionali, sono degli esempi da mostrare al modello per condizionare meglio la generazione.

```python
from dataclasses import dataclass
from typing import List

@dataclass
class GenerativePrompt:
    persona: str
    instruction: str
    examples: List[str]
```

Per generare le domande, ho adottato un approccio che introduce variabilità attraverso personaggi casuali. Ho creato una decina di personaggi con descrizioni abbastanza scarne (ad esempio **"Elena Solwind, royal historian, scholarly and reserved"**). La scelta di utilizzare personaggi semplificati, invece di caratterizzazioni complesse, è stata dettata dal fatto che voglio avere un dataset molto vario con personaggi diversi.

Per aumentare ulteriormente la variabilità nelle interazioni, ho aggiunto:
- Un'emozione casuale assegnata al personaggio per ogni conversazione
- Un contesto situazionale che include:
  - Il luogo dell'incontro
  - Il motivo dell'interazione
  - Il livello di intimità tra i personaggi

Nelle sezione __instruction__ ho inserito:
- La backstory completa di Orlando Marlo
- Opzionalmente, una delle sue opinioni
- I dettagli contestuali generati

Questo approccio permette di ottenere domande che variano naturalmente in base al background del personaggio (uno storico porrà domande diverse da un capo gilda) e al contesto emotivo e situazionale dell'interazione.

Ecco un esempio di prompt:
> You are **Elena Solwind, royal historian, scholarly and reserved**. You are feeling **calm**.
> 
> You will be given some information about me. I'm a character from a fantasy world. 
> *...
> ... backstory di Orlando Marlo
> ...*
> 
> **Meeting location**: The Great Cathedral of Solaris
> 
> **Meeting reason**: delivering urgent message
> 
> **Knowledge of my background**: high
> 
> We are going to have a conversation. You will ask me a question.We are having a direct conversation. Do not use indirect speech."
> 
> ...
> *examples of questions*
> ...


Ora che ho completato questo progetto, posso dire che non sono particolarmente soddisfatto delle domande generate. Il modello Gemma2 2B ha mostrato una tendenza a produrre output verbosi e poco naturali, spesso premettendo un riassunto completo della backstory di Orlando prima di formulare la domanda vera e propria.
Questa performance sub-ottimale potrebbe essere attribuita a diverse cause:
- Un sovraccarico informativo nel prompt, con la backstory completa che potrebbe aver "distratto" il modello dal suo obiettivo principale
- Le limitazioni strutturali di Gemma2B, che non supporta un prompt di sistema separato, costringendo a includere tutte le istruzioni nel messaggio dell'utente
- Possibili inefficienze nella struttura del prompt stesso che non ho avuto modo di perfezionare

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
Il processo di generazione delle risposte segue un approccio simile alla generazione delle domande.

Per la __persona__, ho utilizzato Orlando Marlo includendo:
- La sua backstory completa
- Una serie di motti e frasi ricorrenti tipiche del personaggio (non tanto per caratterizzarlo, quanto per verificare se il modello riesce a imparare questi pattern dopo l'allenamento)

Il processo di generazione è semplice:
- Il messaggio dell'utente è la domanda generata nello step precedente
- Il modello risponde nei panni di Orlando

Gli esempi in questa fase sono stati cruciali e li ho sviluppati attraverso un processo iterativo:
1. Selezionavo una domanda casuale dal dataset
2. Osservavo la risposta generata da Orlando
3. Modificavo la risposta per ridurre elementi generici e enfatizzare lo stile caratteristico del personaggio
4. Aggiungevo la risposta modificata al set di esempi per migliorare le generazioni successive

Ecco un esempio del prompt, prima di essere riempito con le variabili importanti.
```python
"""
{ persona }

{instruction}

You are talking with: {character}

Meeting location: {location}

{ if examples }
Here's some examples of past conversations between you and other characters. 
Use this examples as a style guide.
{ for example in examples }
## Example {loop.index}
{example}
{ endfor }
{ endif }

Use only direct speech. No description of tone.
Answer the question referencing the information about you that you know.
Don't introduce yourself.
Don't be cringe, you are having a conversation with a real person.
"""
```


## Allenamento
Per questo esperimento ho scelto di utilizzare [SmolLM2](https://huggingface.co/HuggingFaceTB/SmolLM2-135M-Instruct), uno dei modelli linguistici più compatti disponibili. Esiste in tre varianti (135M, 360M e 1.7B parametri) e ho optato per la versione da 135M. Il modello ha un limite di 2048 token - una limitazione accettabile per questo test, ma che potrebbe diventare problematica per future conversazioni multi-turno.

L'obiettivo era finetunare il modello sul dataset di circa mille esempi generati precedentemente. Durante i primi tentativi ho scoperto un problema interessante: il token di PAD (usato per uniformare la lunghezza delle sequenze) coincideva con il token EOS (fine sequenza). Questo causava un comportamento indesiderato dove il modello "dimenticava" come terminare le risposte, producendo output senza fine.

Per l'allenamento ho utilizzato [TRL](https://github.com/huggingface/trl) con i seguenti parametri:
- learning rate: 5e-5 (volutamente conservativo)
- epoche: 5 (il modello migliore è stato quello della quarta epoca)

Un'ottimizzazione importante è stata l'utilizzo dei [Liger Kernel](https://github.com/linkedin/Liger-Kernel), che mi hanno permesso di raddoppiare la batch size da 4 a 8 riducendo significativamente i tempi di training grazie a una gestione più efficiente della memoria.

Ho sperimentato con due approcci diversi:
1. Includendo la backstory di Orlando nel contesto di training: l'allenamento è molto più rapido in quanto tutte le informazioni sono già presenti nel prompt
2. Senza includere informazioni specifiche nel contesto: la loss del modello è più alta, in quanto il modello ha dovuto imparate implicitamente le informazioni su Orlando. Il vantaggio di questo approccio è che il contesto è molto più compatto e può quindi essere usato per codificare altre conversazioni.

Le prove sul modello allenato hanno mostrato risultati interessanti: riesce a utilizzare correttamente le frasi caratteristiche di Orlando e mantiene una buona coerenza quando risponde a domande simili a quelle del training. Tuttavia, emerge un limite significativo quando il modello si trova di fronte a domande che si discostano troppo dal dataset di allenamento - in questi casi, tende a ignorare la domanda e a ripetere informazioni su se stesso in modo poco naturale.

Queste osservazioni suggeriscono due direzioni principali per migliorare il sistema: da un lato, sarà fondamentale espandere la varietà del dataset di training per coprire un range più ampio di possibili interazioni. Dall'altro, sarà cruciale ridurre la dipendenza da conversazioni generate automaticamente, incorporando invece più esempi di dialoghi creati da esseri umani, che tipicamente presentano sfumature e complessità difficili da replicare attraverso la generazione automatica.