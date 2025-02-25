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
pretty_table: true
related_publications: true
---


Nell'ambito del Machine Learning, la lingua italiana è una lingua molto poco rappresentata.
Filtrando per lingua italiana la lista di dataset open testuali presenti su [hugging face](https://huggingface.co/), si possono trovare circa 6300 datasets, contro i 9000 francesci o gli 8000 tedeschi. L'inglese ovviamente regna sovrano, per ovvi motivi.
Le stesse considerazioni valgono per modelli NLP.

Nel caso di LLM generativi, i grandi colossi openAI e Anthropic sono in grado di conversare agilmente in italiano, mentre i modelli open source sono ancora un po' acerbi.

| Lingua    | Dataset | Modelli  |
|:-----------|:---------:|:----------:|
| Italiano  | 660     | 6,254    |
| Inglese   | **16,746**  | **154,599**  |
| Francese  | 1,404   | 8,951    |
| Spagnolo  | 1,167   | 8,092    |
| Tedesco   | 943     | 8,004    |


## Fineweb-Edu
Nel maggio 2024 HuggingFace rilasciò Fineweb {% cite penedo2024the%} un dataset di 15 trilioni di token, completamente in inglese. Si tratta di un lavoro davvero immenso e di altissima qualità. L'obiettivo principale è stato quello di creare un dataset da usare nella fase di pretrain di un LLM generativo. 
L'idea dietro a questo progetto è che per allenare un LLM, non solo c'è bisogno di una grande quantità di dati, ma anche di una alta qualità.
Un subset molto importante di questo dataset è [Fineweb-Edu](https://huggingface.co/datasets/HuggingFaceFW/fineweb-edu). Composto da 1.3T di token contenuto educativo, dalla divulgazione e deep-dive tecnici a lezioni.
Per poter estratte questi campioni di alta qualità, HuggingFace annotò un subset di Fineweb con LLama3-70B-Instruct. Da queste annotazioni costruì poi un classificatore che si occupa di classificare su larga scala il resto del dataset.
Questo approccio è ottimo per testo inglese, poichè llama3 performa bene in questa lingua, ma purtroppo non può essere generalizzato alle altre lingue. Per quanto le performance su lingue europee potrebbero essere state accettablii, c'è un grande subset di lingue in cui avrebbe performato molto male.

Si apre quindi la porta a Fineweb-C

## Fineweb-C
[Fineweb-C](https://huggingface.co/datasets/data-is-better-together/fineweb-c) può essere considerato il naturale passo successivo a fineweb. L'idea è quella di riuscire a capire quali campioni sono di altamente educativi e quali invece sono di bassa qualità, proprio come in fineweb edu. Tuttavia, al posto di usare un LLM come LLama3, l'idea è quella di chiedere alla community di annotare circa un migliaio di campioni nella propria lingua.
In particolare, gli annotatori devono classificare i campioni nelle seguenti classi:
- **None**: il campione non ha alcun contenuto informativo. Può essere pubblicità, spam, un post su un social che non parla di niente di particolare, news di gossip
- **Minimal**: il campione contiene un contenuto informativo molto minimo, come ad esempio un articolo di giornale che parla di un particolare evento
- **Basic**: il campione ha un principio di intento educativo, come una definizione, una breve spiegazione
- **Good**: il testo è una spiegazione abbastanza dettagliata, probabilmente anche ben formattata. La maggior parte dei concetti sono esposti chiaramente
- **Excellent**: il testo è di qualità sopraffina, molto ben formattato. Un esempio potrebbe essere un blogpost molto tecnico oppure una dispensa universitaria
- **Problematic Content**: questa è una categoria ombrello in cui finiscono tutti quei pezzi di testo formattati male, oppure spam, pornografia, materiale sensibile, etc.
  
Lo split italiano è stato, ad oggi, annotato da 26 annotatori. Io personalmente ho contribuito annotando circa 400 campioni.
Questi 1000 campioni sono stati pescati casualmente dal dataset original, pre-filtrando materiale problematico (come pornografia, gioco d'azzardo, etc). Devo dire che la pipeline di pre-filtraggio ha funzionato molto bene, visto che non mi è capitato quasi mai di trovare campioni simili. Ho letto che in altre lingue, specialmente del sud-est asiatico, hanno invece un grande problema di filtraggio, e quindi sono ancora alla fase precedente del task di labelling.

### Perchè è importante
Come già detto prima, l'Italiano è una lingua molto poco rappresentata sia in ambito di modelli e dati.
Questo limita gravemente la qualità dei modelli base che possono essere utilizzati, sia in ambito predittivo che in ambito generativo.

La lingua inglese invece gode davvero di moltissima flessibilità, avendo addiritutra dataset mono tematici (specifici ad esempio nel campo medico e legale).

### Lati oscuri
Questo processo si porta ovviamente delle criticità.
Innanzitutto mentre annotavo ho avuto il sospetto che alcuni campioni fossero coperti da proprietà intellettuale. Questo è un grande tema aperto, in quanto tutti i grandi modelli sono stati allenati su contenuti di cui non avevano i diritti. Personalmente non penso che questo problema verrà mai affrontato bene, in quanto storicamente anche in altri ambiti la proprietà intellettuale su contenuti testuali la riesce a garantire solo chi ha i mezzi economici per farlo, magari allo stesso tempo ignorando la proprietà intellettuale di entità più piccole (guardo voi giornali online che caricate video da youtube rebrandizzati).

C'è poi ovviamente tutta la discussione sul fatto che i modelli generativi vengono usati molto per generare contenuti di fake news e polarizzanti, e una tecnologia migliore potrebbe portare in italia un accentuamento di questo problema più di quanto non sia presente adesso

## Analisi del dataset
Mentre annotavo, ho iniziato a sospettare che gran parte del contenuto di alta qualità fosse soprattutto in ambito teologico e politico, avendo trovato molti testi del catechismo e riflessioni sul capitale di Marx.
Per questo motivo, ho deciso di fare un'analisi del dataset per vedere la distribuzione dei topic. A seguire presenterò il mio metodo.
Consiste nei seguenti:
- estrazioni di keyword dal testo
- interrogazione di un LLM per estrarre un topic di alto livello
- analisi dei dati

## Estrazione delle keyword
Visto che ho intenzione di usare un LLM per estrarre dei topic di alto livello dal testo(come ad esempio "Moda", "Tecnologia", "Teologia"), ho deciso innanzitutto di estrarre delle keywords per ogni campione del dataset. L'idea è che se do al LLM queste keyword, sarà in grado di estrarre topic migliori. Purtroppo non sono riuscito a fare nessuno studio di ablazione, ma sembrava una intuizione ragionevole e mi permetteva di pre-esplorare i campioni guardando le keyword più importanti.
Per estrarre queste keyword ho usato **tf-idf** (Term Frequency - Inverse Document Frequency). 
L'intuizione dietro a questo algoritmo è la seguente: una parola non è importante se è in termini assoluti è molto o poco presente. E' importante se è presente solo in questo particolare documento. Questo permette di poter capire quali sono le parole più importanti, considerando la loro frequenza assoluta ma anche la frequenza all'interno del singolo testo. Ad esempio, se ho due pazzi di testo, uno che è un articolo che descrive la vita di uno scienziato, e un altro che descrive la vita dello scienziato Enrico Fermi, per entrambi la parola *scienziato* è molto importante, ma per il secondo le parole Enrico Fermi lo rendono molto unico.

Ecco degli esempi di keyword:
- dal campione 1 ho estratto le parole chiave `['fedi', 'oro', 'anello', 'fondere', 'anelli']`, quindi probabilmente parlerà di Matrimonio, o comunque Fede
- dal campione 12 ho estratto le parole chiave `['plusvalore', 'capitale', 'produzione', 'merce', 'accumulazione']`, quindi probabilmente parlerà di economia, (o di marxismo)

Ho dovuto pulire un po' il dataset, rimuovendo articoli, preposizioni, numero e altre parole ad alta frequenza ma poco interessanti, visto che inizialmente mi venivano proposte loro in alcuni campioni.

## Estrazione dei Topic di alto livello
Una volta estratte le keyword, tocca estrarre i topic. Per estrarre i topic ho deciso di utilizzare LLama3.1 quantizzato a 8 bit (`llama3.1:8b-instruct-q8_0`) e Gemma 2 (`gemma2:2b`), in quanto sono due modelli che stanno agilmente all'interno della mia RTX 4070. Ho anche provato a utilizzare una versione distillata di deepseek (`llama3.1:8b-instruct-q8_0`), ma come mostrerò più avanti i tempi di calcolo erano un po' troppo lunghi e ho preferito ignorarlo.
Il prompt di sistema è strutturato nella seguente maniera:
- spiegazione delle classi di qualità di Fineweb-C
- Indicazioni su che informazioni il modello ha accesso (elenco di parole chiave, testo)
- Regole di categorizzazione: il modello deve dare categorie di alto livello e non specifiche. Ha accesso ad una lista di categorie pre-calcolate, ma può comunque scegliere di assegnare una nuova categoria non esistente
- Formato dell'output: ho chiesto al modello di scrivere tutto all'interno di tag xml, visto che sono semplici da parsare

Il modello ha la libertà di scegliere una classe anche se non è presente tra quelle fornite. Questo è dovuto al fatto che prima di fare questa analisi non volevo espormi troppo scegliendo delle classi predefinite. Operativamente, quando il modello sceglie una classe non presente tra quelle esistente, la aggiungo alla lista delle classi possibili.

Alla fine di questo processo, llama ha estratto circa 142. Ci sono alcuni casi in cui alcune categorie sono duplicate (un singolare o un plurale) ma per la visualizzazione di seguito non avrà molto peso.
Gemma invece ha estratto 94 categorie.
A occhi mi sono piaciute di più quelle di llama

Parlare di prompt caching che classificava in fretta

{% details Prompt di sistema - Tempalte Jinja %}
{% raw %}

```markdown
Sei un assistente specializzato nell'analisi e classificazione di testi in italiano. Il tuo compito è duplice:

1. Comprendere il livello qualitativo del contenuto informativo del testo, basandoti sulla seguente scala:
   - Problematic Content: contenuti inappropriati (pornografia, gambling, testo mal formattato)
   - None: assenza di contenuto informativo (es. pubblicità, post social)
   - Minimal: contenuto con minima valenza informativa non intenzionale
   - Basic: contenuto con discreto valore informativo
   - Good: contenuto ben strutturato con chiaro intento educativo
   - Basic: contenuto con elevato valore informativo e ottima strutturazione

2. Identificare una categoria tematica di alto livello che rappresenti l'argomento principale del testo.

CONTESTO OPERATIVO:
- Hai accesso a un elenco di parole chiave di basso livello estratte dal testo
- Hai accesso a un elenco di categorie tematiche già utilizzate in precedenza
- Puoi sia utilizzare categorie esistenti che crearne di nuove quando necessario

REGOLE DI CATEGORIZZAZIONE:
- Usa categorie ampie e generali (es. "Medicina", "Sport", "Tecnologia")
- Mantieni consistenza con le categorizzazioni precedenti
- Crea nuove categorie solo quando strettamente necessario
- Usa sempre singolare per le categorie (es. "Calcio" non "Calcistica")
- Usa nomi semplici e diretti (es. "Politica" non "Scienze Politiche")

OUTPUT:
Devi sempre rispondere utilizzando esclusivamente questo formato XML:
<classe="CATEGORIA" />

Dove CATEGORIA è la categoria tematica identificata.

ESEMPI DI CATEGORIZZAZIONE:
- Testi su malattie, cure, farmaci → "Medicina"
- Testi su partite, campionati → "Calcio"
- Testi su prodotti in vendita → "Pubblicità"
- Testi su smartphone, computer → "Tecnologia"
- Testi su ricette, cucina → "Gastronomia"
- Testi pubblicitari in cui singole persone promuovono il proprio lavoro-> "Autopromozione"

{% if examples%}
## Esempi
{% for ex in examples%}
### Esempio {{loop.index}}
Testo: {{ex.content}}
{% if ex.meta['quality']%}Qualità: {{ex.meta['quality']}}
{%endif%}{% if ex.meta['keywords']%}Parole Chiave: {{ex.meta['keywords']}}
{%endif%}Categoria: <classe="{{ex.meta['category']}}" />

---
{% endfor %}
{%endif%}
Categorie Esistenti:
{% for cat in categories%}
- "{{cat}}"
{% endfor %}
NOTA IMPORTANTE:
Prima di creare una nuova categoria, verifica sempre se è possibile utilizzare una categoria esistente nell'elenco fornito. La creazione di nuove categorie deve essere l'ultima risorsa quando nessuna categoria esistente è appropriata.
```

{% endraw %}
{% enddetails %}

{% details Prompt dell'utente - Tempalte Jinja %}
{% raw %}
```markdown
Campione:
---
Testo: {{campione.content}}
{% if campione.meta['quality']%}Qualità: {{campione.meta['quality']}}
{%endif%}{% if campione.meta['keywords']%}Parole Chiave: {{campione.meta['keywords']}}
{%endif%}
```
{% endraw %}
{% enddetails %}

Ancora una volta sono rimasto molto stupito dalle performance di llama, mentre gemma non mi ha reso particolarmente entusiasta.

## Visualizzazione

Un plot con la distribuzione delle prime 23 classi.


<div class="l-page">
  <iframe src="{{ '/assets/plotly/class_distribution.html' | relative_url }}" frameborder='0' scrolling='no' height="610" width="810" style="border: 1px dashed grey;"></iframe>
</div>

Scatter plot con i campioni. Se col mouse passate sul campione vedete sia il testo che la classe di appartenenza.
La posizione del testo è calcolata con un BERT model italiano (non mi è piaciuta tanto). embedding del campione e delle categorie, la posizione finale è una combinazione convessa delle due, per dare un senso di clustering.
Poi fatto con PCA (t-SNE nel mio ambiente python distrugge i notebook). Purtroppo queste 2 direzioni raccolgono solo il 14% della variazione.


<div class="l-page">
  <iframe src="{{ '/assets/plotly/sample_scatter.html' | relative_url }}" frameborder='0' scrolling='no' height="610" width="810" style="border: 1px dashed grey;"></iframe>
</div>
 
## Next Steps