---
layout: post
title: Fare una Game Jam in 9 persone
date: 2026-08-15 12:00:00
description: Come organizziamo il lavoro in team durante la GMTK Jam 2026 con 9 partecipanti per creare Dungeon Intern - Danse Macabre
tags: [game-design]
categories: [game-design]
featured: true
image: assets/img/gmtk_2026/cover_danse_macabre.png
---

{% include figure.liquid
    loading="eager"
    path="/assets/img/gmtk_2026/title.gif"
    class="img-fluid rounded z-depth-1"
    center=true
%}

Anche quest'anno la [Wauhaus](https://wauhaus.itch.io/), il gruppo di cui faccio parte, ha partecipato alla GMTK Jam.
Il tema era **Count Down**: molto interessante, ma lo ho trovato più debole rispetto ai temi degli anni passati.

L'idea del nostro gioco, [**Dungeon Intern: Danse Macabre**](https://wauhaus.itch.io/dungeon-intern-danse-macabre) è semplice: l'amato Dungeon Intern, che abbiamo imparato a conoscere già in altri giochi passati, è finalmente riuscito ad arrivare alla pensione. Ma la mano invisibile del mercato non può tollerare questo evento innaturale, e quindi sguinzaglia il Diavolo, che proverà a porre rimedio a questo errore.
Durante la partita, il Diavolo si divertirà a sancire sentenze di morte: *"Goblin, un autobus ti colpirà tra 5 secondi"*. Tuttavia, non si è reso conto che per rendere vera la profezia, il nostro goblin sarà a tutti gli effetti immortale e invulnerabile ad altri eventi catastrofici.

Alla fine, è uscito fuori un simpatico puzzle game in cui bisogna decidere in fretta come interagire con i diversi pericoli sulla mappa.

Oggi prendo l'occasione per parlare di come organizziamo il nostro lavoro, visto che siamo un sacco di persone (a questo giro, 9 partecipanti). Parlerò anche un po' della mia esperienza come artista allo sbaraglio e che effetto ha avuto su come abbiamo prodotto il gioco.


## Il reclutamento

{% two_column image_path:"/assets/img/gmtk_2026/lightning.gif" pixelated:true %}
Mi piace pensare a questa parte come la prima metà dei "Blues Brothers", ma molto meno figo. Viene imbastito un sondaggio in un gruppo telegram, ci si incontra per chi può due settimane prima per discutere un po' sulle nostre speranze e desideri, e poi si cerca una casa in cui poter ficcare 9 persone.
Questa parte è abbastanza semplice, visto che non ci sono grandi decisioni da prendere.
E' stata durante questa fase che ho iniziato a pensare a programmare meno e fare da supporto al nostro artista.
{% endtwo_column %}

### Identificare il  proprio ruolo
Metà di noi si sono conosciuti all'università, ed ecco quindi la distribuzione delle skill del nostro team:
- Un disegnatore
- Un musicista
- Un UX designer
- **6** programmatori

In realtà i programmatori hanno tutti delle capacità al di fuori del proprio campo di competenza. Fabio bazzica con musica e Pixel Art, Mangioni e Sam si smazzano soprattutto il Game design, e così via. Tuttavia, c'è sempre il dramma di dividere il lavoro tra 6 persone che sanno programmare, mentre le altre 3 funzioni hanno decisamente meno potenza di fuoco.

### Il mio ruolo nel passato
Normalmente il mio ruolo in una game jam è quello di sviluppatore. In particolare, oltre a sviluppare, mi occupo, la sera del primo giorno, di fare un design del software spannometrico  da imporre ai miei compagni, che dentro a dei paletti di alto livello imposti da me hanno la libertà di implementare come vogliono. E' importante capire che questo è un buon modo per spiegare quello che faccio, ma in realtà non è così rigido, visto che alla fine è uno sforzo di gruppo.

Spesso, le decisioni di design da compiere sono più di carattere filosofico che altro: il gioco sarà programmato top-down o bottom-up? C'è un controllore centralizzato che conosce lo stato di tutta la board, o ogni elemento controlla il proprio stato e interagisce con segnali ed eventi con il resto degli elementi? Cose di questo tipo.

Questa attività per sua natura attira su di se un po' di ***sgrunt*** e ***grr***, ma è necessaria per avere un minimo di integrità concettuale nel progetto (["The Mythical Man-Month"](https://en.wikipedia.org/wiki/The_Mythical_Man-Month) guardo te),  al posto di avere 6 programmatori che fanno un po' quello che vogliono e che provano ad integrare alla carlona.

Alla fin della fiera, queste decisioni non sono *così* importanti: il gioco verrà prodotto in due giorni, messo insieme con la colla e lo sputo, e in totale verranno prodotte forse un migliaio di righe di codice. Seguendo un po' la [legge di Conway](https://en.wikipedia.org/wiki/Conway%27s_law), provo a fare la progettazione che meglio rispecchia le relazioni di comunicazione tra i diversi implementatori, visto che il tempo passato a comunicare e integrare è molto più alto di quello passato a scrivere codice.

{% include figure.liquid path="assets/img/gmtk_2026/manhole_wave_10col.gif" alt="Goblin entering and exiting manhole" center=true     caption="Wiiiiiiiiiii!!!"
  %}


Il resto delle mie attività consiste nel mettere a posto merge conflict, fare un po' da riferimento per i prossimi passi implementativi (alla fine, finisce che detengo nella mia testolina gran parte della struttura dell'applicazione), e vagare un po' tra i tavoli quando mi rompo le palle.

Trovo che questo ruolo abbia delle caratteristiche paradossali: nonostante io detenga nelle mie mani molte decisioni tecniche, mi manca il senso di possedere quello che ho prodotto. Guidare il design dell'applicazione non mi da questa sensazione, perché il mio lavoro di programmazione è spezzettato da tanti piccoli micro-task. E' anche la sagra del compromesso, un continuo provar a far combaciare cose, adattare le implementazioni alla meno peggio per evitare che lo sviluppo si blocchi, discutere continuamente sul fatto che non ti sei adattato abbastanza, e così via.

Non fraintendetemi, mi piace molto questo tipo di attività, ma mi ha iniziato a pesare un po' nelle ultime Jam, sopratutto perché è *mooolto* simile alle attività che svolgo settimanalmente al lavoro.
Visto che tendevo ad inacidirmi verso la consegna, ho scelto a questo giro di lanciarmi in qualcosa di nuovo.

### Il mio ruolo nel presente

Ho deciso di disegnare un po' di pixel art al fianco della nostro mitico artista Vittorio, giusto per imparare qualcosa di nuovo.

Le motivazioni sono abbastanza superficiali: sembrava divertente, e volevo dire "Questa cosa la ho fatta io" mentre indico uno sprite sullo schermo.
C'è anche un fattore diciamo filosofico che mi spinge: mi piace l'idea di diventare un *essere umano completo*, che sa fare tutto un po' così così. La mia area di profonda conoscenza ce l'ho già, legata alla programmazione, intelligenza artificiale e tutto quello che ci sta nel mezzo, quindi vorrei passare il mio tempo libero anche a imparare cose nuove e capire un po' com'è il mondo, o in questo caso la Jam, dalle lenti di qualcun altro.

## Brainstorming
A mani basse, la parte più faticosa della Jam.
Probabilmente il nostro gruppo non ha ancora trovato la quadra su come fare un brainstorming non dico *efficace* (visto che non è il punto), ma almeno *piacevole*.

L'ostacolo principale è che siamo 9, e mettere d'accordo 9 persone è *moooooolto* più difficile di metterne d'accordo 5.

Rispetto alle prime volte, siamo migliorati tanto visto che col tempo ognuno ha capito quali sono le cose molto importanti per lui e le cose su cui mollare la presa.

Di me ho capito che dopo le 23 sono disposto ad accettare quasi tutto pur di chiuderla e iniziare a produrre.

### Ma come mai è così difficile?
I punti di contenzioso gravitano attorno due temi:
- **COSA** fare
- **COME** fare

Le differenze di opinioni sono generalmente causate dal fatto che abbiamo *Diverse Aspettative* su cosa una Jam debba essere.

Siamo un gruppo molto eterogeneo, e partecipiamo alla Jam per motivi diversi. C'è chi al lavoro ha tante responsabilità e ora vorrebbe staccare un po', chi scrive codice troppo semplice per lui, chi vuole farsi un weekend con gli amici, chi vuole avere un gioco da mettere nel proprio portfolio, e così via.

Queste diverse direzioni di intenti tendono a collidere spontaneamente, e le differenze emergono sia durante la fase di *brainstorming* sia durante la parte di *integrazione*.
La forza di questo processo è che alla fine facciamo qualcosa di cui siamo tutti abbastanza orgogliosi,  ma ha comunque delle debolezze strutturali: a volte si discute tanto per cose abbastanza irrilevanti, ma probabilmente è la cosa che per una certa persona è importante, visto che è il motivo per cui sta partecipando. Altre volte si discute di cose irrilevanti e basta.

Per me, la cosa importante da ricordarsi è che siamo **hobbisti**: non c'è nessuna metrica particolare da massimizzare. Questo ha portato naturalmente a creare specifici modi per risolvere alcune diatribe: l'artista ha l'ultima parola sul tema artistico, perché se gli fa cagare non ha molta voglia di disegnarlo; il musicista ha carta bianca sulla musica (devo dire che non saprei nemmeno come partecipare :D ), e così via.

Quello che secondo me ancora non è stato risolto, è il design. Ci saranno un milione di tassonomie sui diversi tipi di giocatori, e diversi tipi di giocatori ovviamente implementeranno quello che per loro è divertente. Credo che da parte del gruppo c'è ancora tanta resistenza ad affidarsi ai nostri ottimi designer e semplicemente occuparci tutti insieme delle idee di alto livello. Se siamo disposti a dire all'artista *"ok, mi fido"* e vedere due giorni dopo qualcosa di completamente inimmaginabile, ancora non siamo in grado di lasciare le redini al nostro team di game design.

Mentre chiacchieravamo per capire un po' come mai esiste questo fenomeno, Il Game Designer ha snocciolato una considerazione interessante. Tutti gli esseri umani *nascono come game designer*. Chiunque è in grado di immaginare e inventare un gioco perché lo ha fatto da quando era bambino.
Ciò che distingue un game designer *professionista* sta nel fatto che ha un vocabolario di termini e meccaniche più ampio e una maggiore intuizione su come potrebbero interagire.

## Implementazione

Di me dovete sapere che ho usato 25 ore [Aseprite](https://www.aseprite.org/) per disegnare un paio di lanterne e un limone. Inoltre, non ho nessun tipo di formazione artistica, e scuole elementari e media hanno fallito spettacolarmente nell'insegnarmi qualcosa.

{% include figure.liquid path="assets/img/gmtk_2026/panchina.png" alt="Panchina" center=true constrain=true width="200px" caption="La panchina originale, purtroppo non è riuscita a vedere la luce del sole." caption_width="600px" %}

E' evidente che non sono nemmeno considerabile un amatoriale.
La parte interessante di cui parlare è quindi non tanto il processo che ho seguito per disegnare (cercare reference, implorare l'aiuto dell'artista, etc), ma più il dover affrontare tutta una serie di insicurezze:
* *cavolo, sta panchina ha una forma strana...*
* *ehi Claude, c'è una formula matematica per calcolare il colore dell'ombra di un oggetto?*
* *aspetta un attimo... il mio lavoro rischia di non finire nel gioco finale???*

Detto questo, in qualche maniera, e grazie all'aiuto degli altri, sono riuscito a produrre ben quattro sprite


{% include figure.liquid path="assets/img/gmtk_2026/hydrant.png" alt="Idrante" center=true constrain=true width="150px" caption="Al momento della scrittura, mi sembra più un palo con un cappello da cowboy, o un pisello." caption_width="600px" %}


{% include figure.liquid path="assets/img/gmtk_2026/casa1.png" alt="Casa" center=true constrain=true width="180px" caption="Palette copiata barbaramente dalla mia fonte di ispirazione. Purtroppo la casa risulta molto piatta. Va che bella cornice sulla finestra!" caption_width="600px" %}

Alla fine, i colori della panchina sono stati cambiati da un altro perché cozzavano troppo con il resto dello stile (ed erano piattissimi), all'idrante sono stati ritoccati i colori, l'autobus è stato consegnato senza cambiamenti ( grazie anche all'incredibile intervento di Fabio su luce e dettagli) e infine il cancello è arrivato intero nel gioco senza nessuna modifica o ritocco esterno!

{% include figure.liquid path="assets/img/gmtk_2026/autobus.gif" alt="Autobus" center=true constrain=true width="240px" caption="La prospettiva dei nostri giochi ti permette di vedere il sopra e il lato. Ho avuto bisogno di un aiuto esterno per capire come fare il tetto." caption_width="600px" %}

La cosa piacevole è comunque vedere questa progressione in cui il primo sprite è stato praticamente buttato mentre l'ultimo è stato tenuto nella sua interezza: evidentemente qualcosa ho imparato, ma penso che sia anche perché piano piano ho capito come dovevo integrarmi con il resto dello stile.
**Mannaggia a te Vittorio che non mi hai dato una palette da seguire!!!**

{% include figure.liquid path="assets/img/gmtk_2026/gate.gif" alt="Cancello" center=true constrain=true width="200px" caption="Sono molto fiero di questo"%}



### Limitazioni e cose imparate

Quando si impara qualcosa, in generale si fanno grandi miglioramenti in due modi:
- *fare fare fare* all'infinito
- assimilare nuovi concetti o prospettive

Mi sento di dire che, con 43 ore di pixel art, la strada del miglioramento sia *fare fare fare*.
Detto questo, penso che mi manchino proprio dei concetti fondamentali: è disarmante la consistenza con cui scelgo il colore sbagliato per ombre e punti luce.
Inoltre sono anche uno che impara guardando fare gli altri, quindi dovrei passare un po' di tempo a vedermi qualche video di qualcuno che fa cose. Detto questo, che palle...

### L'Artista Programmatore

Capita di frequente che nelle ultime due ore prima della consegna, si realizza che non c'è tempo di aggiungere una certa musica o un certo asset. E' un momento molto doloroso per tutti.
Chi sta programmando da due giorni sa che gli è impossibile aggiungere quegli asset, perché c'è la funzionalità X che è così rotta che è ingiocabile, c'è un merge conflict che ha distrutto metà dei file, e altri mille problemi.

A questo giro, avendo un ruolo mooolto diverso dal solito, e avendo sudato sangue per quei 4 pixel che ho disegnato, mi sono trovato in una situazione diversa:
- sono troppo fuori dallo sviluppo per interessarmi spontaneamente a risolvere bug di funzionalità
- ehi ci sono già 5 persone che stanno risolvendo bug
- SE IL MIO SPRITE NON FINISCE NEL GIOCO FINALE FACCIO UN MACELLO

Sabato sera quindi ho aperto Godot, ho notato che l'autobus era la mascotte di Godot tutto tirato, e ho detto "Ok, metto apposto gli asset grafici". E piano piano ho sostituito tutti gli asset, ho aggiunto animazioni mancanti, ho aggiunto effetti visivi per rendere chiare le hitbox e così via. Il bello è che ho dovuto capire molto poco della struttura del codice: aprivo il file, capivo vagamente cosa e dove dovevo chiamare le funzioni di disegno, scrivevo la mia riga, e andavo avanti al prossimo asset da glorificare.

Ho anche iniziato a pensare un po' come game designer e meno da programmatore: bisognava aggiungere allo sprite dell'autobus una scia che flashava a frequenza sempre più alta quanto più era vicino il momento dell'impatto. Ho iniziato a scrivere una equazione con un seno a frequenza variabile, ma poi ho pensato: *"Ma se usassi una Curve2D e disegnassi a mano la funzione di trasparenza?"*. Per quanto questa cosa sembri una cazzata, è stato davvero strano procedere in questo modo che trovo diciamo poco naturale, ma in effetti molto efficace.

## Risultati
Siamo arrivati piuttosto bene, considerando che c'erano circa 10,000 submission:

| Categoria | Ranking | Score | Percentile |
|-----------|---------|-------|-----------|
| Creatività | #393 | 4.265 | Top 3.9% |
| Divertimento | #521 | 3.971 | Top 5.2% |
| Artwork | #673 | 4.176 | Top 6.7% |
| Storia | #1039 | 3.441 | Top 10.4% |
| Audio | #1142 | 3.529 | Top 11.4% |

Che gran fighi che siamo. Ad oggi, è in assoluto il miglior risultato che abbiamo mai avuto: normalmente ci posizioniamo nel primo quartile.

## Conclusione

Sul lato organizzativo, sento che abbiamo ancora alcune questioni di natura organizzativa da risolvere. Può essere che le cose che trovo critiche sono dovute al fatto che siamo hobbisti che si pongono il problema dello sviluppo di un videogioco una volta ogni 3 mesi.

Per quel che riguarda il cambio di ruolo, è stato molto interessante, e onestamente spero di rifarlo e migliorare un po'. Magari la prossima volta aiuto con i suoni il musicista, e vediamo se questo connubio programmazione / artista funziona o è stato semplicemente un caso .
Di sicuro non ha molto senso artistare due giorni di fila, ma passare il secondo giorno a scrivere codice "artistico" è stata un'ottima idea: i programmatori mettono apposto i bug, i disegnatori disegnano sapendo che il loro lavoro non viene buttato.
