---
layout: post
title: Fare una Game Jam in 9 persone
date: 2026-08-15 12:00:00
description:
tags: [game-design]
categories: [game-design]
featured: true
thumbnail: assets/img/gmtk_2026/cover_danse_macabre.png
---

Anche quest'anno la [Wauhaus](https://wauhaus.itch.io/), il gruppo di cui faccio parte, ha partecipato alla GMTK Jam.
Il tema era **Count Down**: molto interessante, ma lo ho trovato più debole rispeto ai temi passati.

L'idea del nostor gioco, [**Dungeon Intern: Danse Macabre**](https://wauhaus.itch.io/dungeon-intern-danse-macabre) è semplice: l'amato Dungeon Intern, che abbiamo imparato a conoscere già in altri giochi passati, è finalmente riuscito ad arrivare alla pensione. Ma la mano invisibile del mercato non può tollerare questo evento innaturale, e quindi sguinzaglia il Diavolo, che proverà a porre rimedio a questo imperdonabile errore.
Durante la partita, il Diavolo si divertià a sancire sentenze di morte: "Goblin, un autobus ti colpirà tra 5 secondi". Tuttavia, non si p reso conto che per rendere vera la profezia, il nostro goblin sarà a tutti gli effetti immortale e invulnerabile ad altri eventi catastrogici.

Alla fine, è uscito fuori un simpatico puzzle game in cui bisogna decidere in fretta come interagire con i diversi pericoli sulla mappa.

Oggi prendo l'occasione per parlare di come organizziamo il nostro lavoro, visto che siamo un sacco di persone (a questo giro, 9 partecipanti). Parlerò anche un po' della mia esperienza come artista allo sbaraglio e che effetto ha avuto su come abbiamo prodotto il gioco.


## Il reclutamento

Mi piace pensare a questa parte come la prima metà dei "Blues Brothers", ma molto meno figo. Viene imbastito un sondaggio in un gruppo telegram, ci si incontra per chi può due settimane prima per discutere un po' sulle nostre speranze e desideri, e poi si cerca una casa in cui poter ficcare 9 persone.
Questa parte è abbastanza semplice, visto che non ci sono grandi decisioni da prendere.
E' stata durante questa fase che ho iniziato a pensare di programmare meno e fare da supporto al nostro artista.

### Identificare il  proprio ruolo
Metà di noi si sono conosciuti all'università, ed ecco quindi la distribuzione delle skill del nostro team:
- Un disegnatore
- Un musicista
- Un UX designer
- **6** programmatori

In realtà i programmatori hanno tutti delle capacità al doi fuori del proprio campo di competenza. Fabio bazzica con musica e pixel Art, Mangioni e Sam si smazzano soprattuto il Game design, e così via. Tuttavia, c'è sempre il dramma di dividere il lavoro tra 6 persone che sanno programmare, mentre le altre 3 funzioni hanno decisamente meno potenza di fuoco.

### Il mio ruolo nel passato
Normalmente il mio ruolo in una game jam è quello di sviluppatore. In particolare, oltre a sviluppare, mi occupo, la sera del primo giorno, a fare  <strana espression> un design del software spannometrico  da imporre ai miei compagni, che dentro a dei paletti di alto livello imposti da me hanno la libertà di implementare come vogliono. E' importante capire che questo è un buon modo per spiegare quello che faccio, ma in realtà non è così rigido, visto che alla fine è uno sforzo di gruppo.

Spesso, le decisioni di design da compiere sono più di carattere filosofico che altro: il gioco sarà programmato top-down o bottom up? C'è un controllore centralizzato che conosce lo stato di tutta la board, o ogni elemento controlla il proprio stato e interagisce con segnali ed eventi con il resto delgli elementi? Cose di questo tipo.

Questa attività per sua natura attira su di se un po' di sgrunt e grr, ma è necessaria per avere un minimo di integrità concettuale nel progetto ("The Mythincal Man-Month" guardo te),  al posto di avere 5 programmatori che fanno un po' quello che vogliono e che provano ad integrare alla carlona.

Per viverla bene, bisogna interiorizzare <un po' preachy> il fatto che queste scelte non sono così rilevanti: il gioco verrà prodotto in due giorni, messo insieme con la colla e lo sputo, e in totale verranno prodotte forse un migliaio di righe di codice. Seguendo un po' la [legge di Conway](https://en.wikipedia.org/wiki/Conway%27s_law), tendo fare la progettazione che meglio rispecchia le relazioni di comunicazione tra i diversi implementatori, visto che il tempo passato a comunicare e integrare è molto più alto di quello passato a scrivere codice.

Il resto delle mie attività consiste nel mettere a posto merge conflict, fare un po' da riferimento per i prossimi passi implementativi (alla fine, finisce che detengo nella mia testolina gran parte della struttura dell'applicazione), e vagare un po' tra i tavoli quando mi rompo le palle.

Questo ruolo ha delle caratteristiche paradossali: nonostante detenessi <tempi verbali strani> nelle mie mani molte delle decisioni tecniche, mi manca il senso di possedere quello che ho prodotto. Guidare il design dell'applicazione non mi da questa sensazione, perchè il lavoro è spezzettato da tanti piccoli micro-task. E' anche la sagra del compromesso, un continuo provar a far combaciare cose, adattare le implementazioni alla meno peggio per evitare che lo sviluppo si blocchi, discutere continuomanete sul fatto che non ti sei adattato abbastanza, e così via.

Non fraintendetemi, mi piace molto questo tipo di attività, ma durante la Jam mi ha iniziato a pesare un po', soprattuto perchè *mooolto* simile alle attività che svolgo settimanalmente al lavoro; visto che tendevo ad inacidirmi verso la consegna, ho scelto a questo giro di lanciarmi in qualcosa di nuovo.

### Il mio ruolo nel presente

Ho deciso di disegnare un po' di pixel art al fianco della nostro mitico artista Vittorio, giusto per imparare qualcosa di nuovo.

Le motivazioni sono abbastanza superficiali: sembrava divertente, e volevo dire "Questa cosa la ho fatta io" mentre indico uno sprite sullo schermo.
C'è anche un fattore diciamo filosofico che mi spinge: mi piace l'idea di diventare un *essere umano completa*, che sa fare tutto un po' così così. La mia area di profonda conoscienza ce l'ho già, legata alla programmazione, intelligenza artificiale e tutto quello che ci sta nel mezzo, quindi vorrei passare il mio temp libero anche a imparare cose nuove e capire un po' com'è il mondo, o in questo caso la Jam, dalle lenti di qualcun altro.

## Brain Storming
A mani basse, la parte più faticosa della Jam.
Probabilmente, il nostro gruppo non ha ancora trovato la quadra su come fare un brainstorming non dico efficace (visto che non è il punto), ma piacevole.

L'ostacolo principale è che siamo 9, e metterè d'accordo 9 persone è moooooolto più difficile di mettderne d'accordo 5.


Rispetto alle prime volte, siamo migliorati tanto visto che col tempo ognuno ha capito quali sono le cose molto importanti per lui e le cose su cui mollare e smettere di partecipare.

Di me ho capito che dopo le 23 sono disposto ad accettare quasi tutto pur di chiuderla e iniziare a produrre.

### Ma come mai è così difficile?
I punti di contenzioso gravitano attorno due temi:
- **COSA** fare
- **COME** fare
è le differenze di opinioni sono generalmente causate dal fatto che abbiamo *Diverse Aspettative*

Siamo un gruppo molto eterogeneo, e per questo motivo partecipiamo e ci aspettiamo cose diverse da queste Jam. C'è chi al lavoro ha tante responsabilità, chi scrive codice troppo semplice per lui, chi vuole farsi un weekend con gli amici, chi si annoia a morte e ha bisogno di sentire di aver fatto qualcosa di importante, e così via.
Queste diverse direzioni di intenti naturalmente tendono a collidere un po', e le differenze emergono sia durante la fase di brainstorming sia durante la parte di integrazione.
La forza di questo processo è che alla fine facciamo qualcosa di cui siamo tutti abbastanza orgogliosi,  ma ha comunque delle inerenti <esiste questa parola> debolezze: a volte si discute tanto per cose abbastanza irrilevanti, ma probabilmente è la cosa che per la certa persona X è importante, visto che è il motivo per cui sta partecipando. Altre volte si discute di cose irrilevanti e basta.

Per me, la cosa importante da ricordarsi è che siamo hobbisti: non c'è nessuna metrica particolare da massimizzare. Questo ha portato naturalmente a creare specifici modi per risolvere alcune diatribe: l'artista ha l'ultima parola sul tema artistico, perchè se gli fa cagare non ha molta voglia di disegnarlo; il musicista ha carta bianca sulla musica (devo dire che non saprei nemmeno come partecipare :D ), e così via.

Quello che secondo me ancora non è stato risolto, è il design. Ci saranno un milione di tassonomie sui diversi tipi di giocatori, e diversi tipi di giocatori ovviamente implementeranno quello che per loro è divertente. Credo che da parte del gruppo c'è ancora tanta resistenza ad affidarsi ai nostri ottimi designer e semplicemente mappare delle idee di alto livello. Se siamo disposti a dire all'artista "ok, mi fido" e vedere due giorni dopo qualcosa di completamente inimmaginabile, ancora non siamo in grado di lasciare le redini al nostro team di game design.

Un buon punto contro questa visione è dire: "Beh, sto facendo un gioco, potrò dire com'è che voglio il gioco". Non è una posizione di per sè errata, e anzi è qualcosa che **deve** essere discusso in fase di brainstorming, ma per me bisogna sempre ricordarsi che *non stiamo massimizzando niente*, tanto vale dare libertà al designer come al resto del team. E' un argomento delicato e onestamente penso che ancora queste mie opinioni possono cambiare considerevolmente nei prossimi giorni <struttura frase strana>.

## Implementazione
Parlerà ovviamente del mio punto di vista.
Di me dovete sapere che ho usato 25 ore [Aseprite](https://www.aseprite.org/) per disgnare un paio di lanterne e un limone. Inoltre, non ho nessun tipo di formazione artistica, e scuole elementari e media hanno fallito alla grande nell'insegnarmi qualcosa.

E' evidente che non sono nemmeno considerabile un amatoriale.
La parte interessante di cui parlare è quindi non tanto come ho disegnato (cercare reference, implorare l'aiuto dell'artista, etc), ma è stato dover affrontare tutta una serie di insicurezze: cavolo, sta panchina ha una forma strana; ommioddio sti colori fanno schifo; aspetta un attimo... ma rischio che il mio lavoro non venga inserito nel gioco finale???

Detto questo, in qualche maniera, e grazie all'aiuto degli altri, sono riuscito a produrre ben quattro sprite
<images>
Far vedere le quattro immagini, scalate nearest nebour.
< panchina > < idrante >
< autobus  > < cancello>
</images>

Alla fine, i colori della panchina sono stati cambiati da un altro perchè cozzavano troppo con il resto dello stile, l'idrante sono stati ritoccati i colori, l'autobus è arrivato intero, anche se un'ora su due ho co-disegnato, e infine il cancello è arrivato intero nel gioco!

La cosa piacevole è comunque vedere questa progressione in cui il primo sprite è stato praticamente buttato mentre l'ultimo è stato tenuto nella sua interezza: evidentemente qualcosa ho imparato, ma penso che sia anche perchè piano piano ho capito come dovevo integrarmi con il resto dello stile.
Mannaggia a te Vittorio che non mi molli le palette!!!

### Limitazioni e cose imparate

Quando si impara qualcosa, in generale vedono grandi miglioramenti in due modi:
- fare fare fare fare fare fare all'infinito
- assimilare nuovi concetti o prospettive

Mi sento di dire con 43 ore di pixel art, direi che dovrei fare fare fare.
Detto questo, penso che mi manchino proprio dei concetti di natura fondamentale: è disarmante la consistenza con cui scelgo il colore sbagliato per ombre e punti luce.
Inoltre sono anche uno che impara guardando fare gli altri <strana struttura>, quindi dovrei passare un po' di tempo a vedermi qualche video di qualcuno che fa cose. Detto questo, che palle...

### L'Artista Programmatore

Capita di frequente che nelle ultime due ore prima della consegna, si realizza che non c'è tempo di aggiungere una certa musica o un certo asset. E' un momento molto doloroso per tutti.
Per chi sta programmando da due giorni, è evidente che gli è impossibile aggiungere quegli asset, perchè c'è la funzionalità X che è così rotta che è ingiocabile, c'è un merge conflict che ha distrutto metà dei file, cose del genere.

A questo giro, avendo un ruolo mooolto diverso dal solito, e avendo sudato sangue per quei 4 pixel che ho disegnato, mi sono trovato in una situazione diversa:
- sono troppo fuori dallo sviluppo per interessarmi spontaneamente a risolvere bug di funzionalità
- ehi ci sono già 5 persone che stanno risolvendo bug
- SE IL MIO SPRITE NON FINISCE NEL GIOCO FINALE FACCIO UN MACELLO

Sabato sera quindi ho aperto Godot, ho notato che l'autobus era lo sprite di Godot tutto tirato, e ho detto "Ok, metto apposto gli asset grafici". E piano piano ho sostituito tutti gli asset, ho aggiunto animazioni mancanti, ho aggiunto effetti visivi per rendere chiare le hitbox e così via. Il bello è che ho dovuto capire molto poco del design: aprivo il file, capivo vagamente cosa e dove dovevo chiamare le funzioni di disegno, scrivevo la mia riga, e andavo al prossimo.

Ho anche iniziato a pensare un po' come designer e meno come ingegnere: bisognava aggiungere allo sprite dell'autobus una scia che flashava a frequenza sempre più alta quando più era vicino il momento dell'impatto. Ho iniziato a scrivere una equazione con un seno a frequenza variabile, ma poi ho pensato: "Ma se usassi una Curve2D e disegnasssi a mano la funzione di trasparenza?". Per quanto questa cosa sembri una cazzata, è stato davvero strano procedere con questo modo che trovo diciamo poco naturale, ma molto efficace per quello che doveva fare in quel momento.

## Risultati
Siamo arrivati X in questa posizione, Y in quest'altra posizione e così via.
Che gran fighi che siamo

## Conclusione
Magari la prossima volta aiuto con i suoni il musicista, e vediamo se questo connubio programmazione / artista fuynziona.
Di sicuro non ha molto senso artistare due giorni di file, ma passare il secondo giorno a scrivere codice "artistico" è un'ottima idea: i programmatori mettono apposto i bug, i disegnatori disegnano sapendo che il loro lavoro non viene buttato.
