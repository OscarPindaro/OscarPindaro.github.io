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



Dando una rapida occhiatta su [hugging face](https://huggingface.co/), i dataset italiani sono circa 6300, contro gli 8000 tedeschi o i 9000 francesi. L'inglese ovviamente regna sovrano, per ovvi motivi.
Le stesse considerazioni valgono per modelli NLP.

| Lingua    | Dataset | Modelli  |
|:-----------|:---------:|:----------:|
| Italiano  | 660     | 6,254    |
| Inglese   | **16,746**  | **154,599**  |
| Francese  | 1,404   | 8,951    |
| Spagnolo  | 1,167   | 8,092    |
| Tedesco   | 943     | 8,004    |

E' chiaro che  la lingua italiana è poco rappresentata.
I grandi modelli privati (come ChatGPT e Claude) conversano agilmente in italiano, mentre quelli open-source sono ancora un po' acerbi, soprattuo in ambienti con poche risorse computazionali.
La poca rappresentazione rende anche poco conveniente e razionale per aziende sviluppare per loro, preferendo a specializzarsi sul mondo anglosassone. 
Questa cosa è particolarmente vera per tutte quelle lingue esterne al mondo occidentale.



## Fineweb-Edu

Nel maggio 2024 HuggingFace ha rilasciato Fineweb {% cite penedo2024the%}, un dataset di 15 trilioni (!!!) di token. 
Il dataset è stato creato a partire da [CommonCrawl](https://commoncrawl.org/), un dump di tutti i contenuti presenti su internet fino a quel momento.
CommonCrawl è stato processato, deduplicato e elaborato, rimuovendo tutti i contenuti di bassa qualità e superflui.
Purtroppo, questo dataset si concentra soprattuto sulla lingua inglese.

Un subset molto importante di questo dataset è [Fineweb-Edu](https://huggingface.co/datasets/HuggingFaceFW/fineweb-edu). Composto da 1.3T di token, ha un focus su contenuto educativo.
Per poter estratte questi campioni di alta qualità, HuggingFace ha annotato un subset di Fineweb con LLama3-70B-Instruct, dividendo i campioni per contenuto e qualità informativa.
Da queste annotazioni ha costruito poi un classificatore molto più snello e rapido che si occupa di classificare su larga scala il resto del dataset.
Questo approccio è ottimo per testo in lingua inglese, essendo la lingua in cui  Llama3 è più fluente,, ma purtroppo non può essere generalizzato alle altre lingue, in quanto le performance di classficazione sarebbero molto più basse (specialmente per le lingue del medio-oriente e del sud-est asiatico).

Per superare questa limitazione dei modelli generativi attuali, è stato quindi creato Fineweb-C.

## Fineweb-C
[Fineweb-C](https://huggingface.co/datasets/data-is-better-together/fineweb-c) può essere considerato il naturale passo successivo a FineWeb, estendendo l'analisi fatta in precedenza su tutte le lingue.
L'idea di base è sempre la stessa: trovare un modo per distinguere campioni do bassa qualità da campioni  informativi. Se in FineWeb si usava un LLM, invece per questo dataset HuggingFace ha chiesto aiuto alla community. Per ogni lingua sono stati estratti 1000 campioni, e ha chiesto a dei volontari di annotare questi campioni. 
In particolare, gli annotatori devono classificare i campioni nelle seguenti classi:
- **None**: il campione non ha alcun contenuto informativo. Può essere pubblicità, spam, un post su un social che non parla di niente di particolare, news di gossip
- **Minimal**: il campione contiene un contenuto informativo molto minimo, come ad esempio un articolo di giornale che parla di un particolare evento
- **Basic**: il campione ha un principio di intento educativo, come una definizione, una breve spiegazione
- **Good**: il testo è una spiegazione abbastanza dettagliata, probabilmente anche ben formattata. La maggior parte dei concetti sono esposti chiaramente
- **Excellent**: il testo è di qualità sopraffina, molto ben formattato. Un esempio potrebbe essere un blogpost molto tecnico oppure una dispensa universitaria
- **Problematic Content**: questa è una categoria ombrello in cui finiscono tutti quei pezzi di testo formattati male, oppure spam, pornografia, materiale sensibile, etc.
  
Lo split italiano è stato, ad oggi, annotato da 26 annotatori. Io personalmente ho contribuito annotando circa 400 campioni.
Questi 1000 campioni sono stati pescati casualmente dal dataset originale, pre-filtrando materiale problematico (come pornografia, gioco d'azzardo, etc). Devo dire che la pipeline di pre-filtraggio ha funzionato molto bene, visto che non mi è capitato quasi mai di trovare campioni imbarazzanti. So che non è stato così semplice in altri casi, specialmente per le lingue del sud-est asiatico, in cui la pipeline ha fatto passare moltissima pornografia.

### Perchè è importante
Come già detto prima, l'Italiano è una lingua molto poco rappresentata sia in ambito di modelli e dati.
Quando cerco modelli per il mio lavoro di tutti i giorni, sono sempre costretto a scegliere modelli generici allenati su dataset che iniziano a mostrare i segni del tempo.
Provo una grande invidia per chi sviluppa in inglese, che ha addirittura classificatori e retriever già pronti per il campo medico o altri campi estremamente specifici.

### Criticità

Mi sembra onesto parlare anche dei punti un po' più dolorosi della questione. 
Mentre annotavo il dataset, ho avuto il sospetto di star leggendo materiale coperto da copyright. 
La proprietà intellettuale è sempre un argomento caldo su cui c'è molta ipocrisia, a cui ci si interessa solo se si è vittime del fenomeno, ma che è molto semplice da ignorare se non si è direttamente coinvolti. 
Probabilmente cambierò idea altre 100 volte su questo. Attualmente penso che la natura open di questo progetto lo allevia un po' dalle invevitabili colpe di cui si macchierà quando verrà scalato sull'intero dataset. Spero però che parlandone il grande pubblico possa iniziare a capire un po' meglio l'origine di questi dati e inizi una conversazione attorno a questo argomento.

C'è poi ovviamente tutto un tema secondario sul fatto che i modelli generativi vengono utilizzati molto per generare fake news e scam. Di sicuro rendere gli LLM fluenti in multiple lingue aumenerà il raggio di questa piaga, ma almeno per design questo dataset prova a raccogliere dati con contenuto educativo.

## Analisi del dataset

Ho deciso di analizzare questo dataset poichè, mentre annotavo, sospetto che gran parte del contenuto di altà qualità fosse soprattuo in ambito teologico e politico.
Ho infatti trovato molti testi estratti da del catechismo e da riflessioni sul capitale di Marx.

Per questo motivo, ho deciso di fare un'analisi del dataset per vedere la distribuzione dei topic. 
L'analisi avverò in questa maniera:
1. estrazioni di keyword dal testo
2. utilizzo di un LLM per estrarre un topic generali
3. visualizzazione dei dati e considerazioni

Il codice sorgente lo trovate qua [nella mia repo.](https://github.com/OscarPindaro/fineweb-c-analysis-ita)

## Estrazione delle keyword
Visto che ho intenzione di usare un LLM per estrarre dei topic di alto livello dal testo(come ad esempio "Moda", "Tecnologia", "Teologia"), ho deciso innanzitutto di estrarre delle keywords per ogni campione del dataset. 
Questo ha due implicazioni. Innanzitutto, mi permette di farmi una vaga idea sui topic di ogni campione, permettendomi di indirizzare meglio i prossimi passi.
Inoltre, penso che se do ad un LLM oltre al testo le sue keyword, potrò estrarre topic generali migliori.
Purtroppo non sono riuscito a fare nessuno studio di ablazione, ma sembrava una intuizione ragionevole e ho gratis una pre-esplorazione del dataset.

Per estrarre queste keyword ho usato **TF-IDF** (Term Frequency - Inverse Document Frequency). 
L'intuizione dietro a questo algoritmo è la seguente: una parola non è importante se è in termini assoluti è molto o poco presente, ma è importante se è presente solo in questo particolare documento. 
Questo permette scovare per ogni documento le parole che lo identificano unicamente, considerando la loro frequenza assoluta ma anche la frequenza all'interno del singolo testo. Ad esempio, se ho due pazzi di testo, uno che è un articolo che descrive la vita di uno scienziato, e un altro che descrive la vita dello scienziato Enrico Fermi, per entrambi la parola *scienziato* è molto importante, ma per il secondo le parole Enrico Fermi lo rendono unico.

Ecco degli esempi di keyword che ho estratto:
- dal campione 1 ho estratto le parole chiave `['fedi', 'oro', 'anello', 'fondere', 'anelli']`, quindi probabilmente parlerà di Matrimonio, o comunque Religione
- dal campione 12 ho estratto le parole chiave `['plusvalore', 'capitale', 'produzione', 'merce', 'accumulazione']`, quindi probabilmente parlerà di economia, (o di marxismo)

Per questo algoritmo è molto importante fare un po' di data cleaning, rimuovendo articoli, preposizioni, numeri e altre parole ad alta frequenza ma poco interessanti.

## Estrazione dei Topic di alto livello
Una volta estratte le keyword, bisogna estrarre i topic generali. Per questi, ho deciso di utilizzare LLama3.1 quantizzato a 8 bit (`llama3.1:8b-instruct-q8_0`) e Gemma 2 (`gemma2:2b`), visto che riesco a lanciarli sulla mia RTX 4070. Ho anche provato a utilizzare una versione distillata di deepseek (`llama3.1:8b-instruct-q8_0`), ma come mostrerò più avanti i tempi di calcolo erano un po' troppo lunghi e ho preferito ignorarlo.
Il prompt di sistema è strutturato nella seguente maniera:
- spiegazione delle classi di qualità di Fineweb-C.
- Indicazioni su che informazioni il modello ha accesso (elenco di parole chiave, testo).
- Regole di categorizzazione: il modello deve dare categorie di alto livello e non specifiche. Ha accesso ad una lista di categorie pre-calcolate, ma può comunque scegliere di assegnare una nuova categoria non esistente.
- Formato dell'output: ho chiesto al modello di scrivere tutto all'interno di tag xml, visto che sono semplici da parsare.

Il modello ha la libertà di scegliere una classe anche se non è presente tra quelle fornite. Questo mi permette di avere un po' di flessibilità, anche perchè è un dataset che conosco poco.  
Operativamente, quando il modello sceglie una classe non presente tra quelle esistente, la aggiungo alla lista delle classi possibili, condizionando le future generazioni.

Alla fine di questo processo, Llama ha estratto circa 142 topic. Ci sono alcuni casi in cui alcune categorie sono duplicate (singolare/plurale) ma per la visualizzazione di seguito non avrà molto peso.
Gemma invece ha estratto 94 categorie, ma ho preferito quelle estratte  
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

Parlare di prompt caching

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