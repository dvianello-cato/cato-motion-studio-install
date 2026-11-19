# Cato Motion Studio: come iniziare

Con il Cato Motion Studio fai i video di Cato sul tuo Mac, parlando con Claude: spot di prodotto con la musica a tempo e video di te che parli con sottotitoli e grafiche sopra, in orizzontale (16:9) e verticale (9:16).

**Non serve saper programmare.** Si installa una volta sola, in circa 15–20 minuti, seguendo i passi qui sotto.

---

## Prima di iniziare: 4 cose

1. **Un Mac.** Lo studio funziona solo su Mac.
2. **La password del tuo Mac**, quella che usi per accendere il computer. Serve una volta sola durante l'installazione.
3. **Un account GitHub.** Se non ce l'hai, crealo gratis su [github.com/signup](https://github.com/signup) con la tua email di lavoro. Poi **manda a Diego il tuo nome utente GitHub**.
4. **L'invito di Diego.** Ti arriva un'email da GitHub con scritto *"invited you to collaborate on cato-motion-studio"*: aprila e clicca **Accept invitation**. Senza questo passaggio l'installazione si ferma a metà.

Ti serve anche un **account Claude di Cato**: se non ce l'hai, chiedilo a Diego.

---

## Installazione (una volta sola)

### 1. Apri il Terminale
Premi **⌘ Cmd + Spazio**, scrivi **Terminale** e premi **Invio**. Si apre una finestra con del testo: è normale, ti basta incollare un comando.

### 2. Incolla questo comando e premi Invio
Clicca l'icona di copia a destra del riquadro qui sotto, poi nel Terminale premi **⌘ Cmd + V** e **Invio**.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dvianello-cato/cato-motion-studio-install/main/install.sh)"
```

### 3. Segui quello che ti chiede
L'installatore fa quasi tutto da solo. Ogni tanto si ferma e ti chiede qualcosa:

| Quando vedi… | Cosa fai |
|---|---|
| **`Password:`** | Scrivi la password del Mac e premi **Invio**. **Mentre scrivi non vedi niente, nemmeno i puntini: è normale.** |
| **`Press RETURN/ENTER to continue`** | Premi **Invio**. |
| **`First copy your one-time code: XXXX-XXXX`** | Copia o annota il codice, premi **Invio**: si apre il browser. Entra in GitHub, incolla il codice e clicca **Authorize**. Poi torna al Terminale. |
| Una domanda che finisce con **`(Y/n)`** | Premi **Invio**. |

Alcuni passaggi durano qualche minuto. Lascia il Terminale aperto finché non si apre **Claude Code**.

### 4. Il primo avvio di Claude Code
Alla fine si apre Claude Code, sempre nel Terminale. La prima volta:
- se ti chiede un **tema di colori**, scegli quello che preferisci con le frecce e premi **Invio**;
- **entra con il tuo account Claude di Cato**: si apre il browser, fai il login e torna al Terminale;
- quando ti chiede se **ti fidi della cartella** (*"Do you trust the files in this folder?"*), rispondi **Yes**;
- quando ti chiede di **installare il plugin HyperFrames**, rispondi **sì**.

Claude poi controlla da solo che tutto funzioni e alla fine ti mostra una **tabella tutta verde**. Se qualcosa non è verde, ti dice lui cosa fare.

**Fatto.** Sulla Scrivania ora hai la cartella **cato-motion-studio**.

---

## Ogni volta che vuoi fare un video

1. Apri il **Terminale** (⌘ Cmd + Spazio → *Terminale*).
2. Incolla questo e premi **Invio**:
   ```bash
   cd ~/Desktop/cato-motion-studio && claude
   ```
3. Scrivi cosa vuoi fare:
   - **uno spot di prodotto:** `/spot-cato` seguito da cosa vuoi, come ti viene. Per esempio: *`/spot-cato uno spot di 20 secondi sui nuovi connettori, orizzontale e verticale`*
   - **un video di te che parli**, con sottotitoli e grafiche: scrivi `/video-parlato` e trascina il tuo video nella finestra.
4. Rispondi alle domande di Claude e approva quello che ti propone. Prima del tuo ok non costruisce niente.

I video finiti li trovi in `cato-motion-studio/films/<nome-del-video>/video/`.

**Non devi mai aggiornare niente:** ogni volta che apri Claude Code nello studio, si aggiorna da solo. Se ti chiede di chiudere e riaprire Claude Code, fallo: scrivi `/exit`, poi ripeti il passo 2.

La guida completa, con ritocchi, esportazione e consigli, è nel file **`COME-SI-USA.md`** dentro la cartella dello studio. Oppure chiedilo direttamente a Claude: *"come faccio a…?"*

---

## Se qualcosa va storto

| Problema | Soluzione |
|---|---|
| *"il tuo utente GitHub non vede il repo"* | Non hai ancora accettato l'invito di Diego: cerca l'email di GitHub, clicca **Accept invitation** e **rilancia il comando del passo 2**. |
| L'installazione si è interrotta | Rilancia lo stesso comando: riparte e fa solo quello che manca. |
| *"command not found: claude"* | Chiudi il Terminale (⌘ Cmd + Q), riaprilo e riprova. |
| Qualcosa non funziona dentro Claude Code | Scrivi `/setup-studio`: ricontrolla tutto e ti dice cosa fare. |
| Niente di tutto questo | Scrivi a Diego con uno screenshot del Terminale. |

---

<sub>Questa pagina è pubblica perché serve prima di avere accesso allo studio. Contiene solo lo script di installazione, `install.sh`: lo studio vero, con il brand e i progetti, resta privato.</sub>
