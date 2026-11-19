# Cato Motion Studio

**[English](#english) · [Italiano](#italiano)**

---

<a id="english"></a>
## 🇬🇧 English: getting started

With Cato Motion Studio you make Cato videos on your Mac by talking to Claude: product spots with music in sync, and videos of you speaking with captions and graphics on top, in landscape (16:9) and vertical (9:16).

**No coding needed.** You install it once, in about 15–20 minutes, by following the steps below.

### Before you start: 3 things

1. **A Mac.** The studio only works on Mac.
2. **Your Mac password**, the one you use to log in. It's needed once during installation.
3. **A Cato Claude account.** If you don't have one, ask Diego.

You don't need a GitHub account.

### Installation (once)

#### 1. Open Terminal
Press **⌘ Cmd + Space**, type **Terminal** and press **Return**. A window with some text opens: that's normal, you only need to paste one command.

#### 2. Paste this command and press Return
Click the copy icon on the right of the box below, then in Terminal press **⌘ Cmd + V** and **Return**.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dvianello-cato/cato-motion-studio-install/main/install.sh)"
```

#### 3. Follow what it asks
The installer does almost everything by itself. Now and then it stops and asks you something:

| When you see… | What to do |
|---|---|
| **`Password:`** | Type your Mac password and press **Return**. **Nothing appears while you type, not even dots: that's normal.** |
| **`Press RETURN/ENTER to continue`** | Press **Return**. |
| A question ending in **`(Y/n)`** | Press **Return**. |

Some steps take a few minutes. Keep Terminal open until **Claude Code** opens.

#### 4. First launch of Claude Code
At the end Claude Code opens, still inside Terminal. The first time:
- if it asks for a **color theme**, pick one with the arrow keys and press **Return**;
- **sign in with your Cato Claude account**: the browser opens, log in and go back to Terminal;
- when it asks whether you **trust the folder** (*"Do you trust the files in this folder?"*), answer **Yes**;
- when it asks to **install the HyperFrames plugin**, answer **yes**.

Claude then checks that everything works and ends with an **all-green table**. If something isn't green, it tells you what to do.

**Done.** On your Desktop you now have the **cato-motion-studio** folder, with Cato's whole design system inside: logos, fonts, colors, music and icons.

### Every time you want to make a video

1. Open **Terminal** (⌘ Cmd + Space → *Terminal*).
2. Paste this and press **Return**:
   ```bash
   cd ~/Desktop/cato-motion-studio && claude
   ```
3. Write what you want:
   - **a product spot:** `/spot-cato` followed by what you want, in your own words. For example: *`/spot-cato a 20-second spot about the new connectors, landscape and vertical`*
   - **a video of you speaking**, with captions and graphics: type `/video-parlato` and drag your video into the window.
4. Answer Claude's questions and approve what it proposes. Nothing gets built before your ok.

Finished videos are in `cato-motion-studio/films/<video-name>/video/`.

**You never need to update anything:** every time you open Claude Code in the studio, it updates itself. If it asks you to close and reopen Claude Code, do it: type `/exit`, then repeat step 2.

The full guide, with edits, exporting and tips, is the **`COME-SI-USA.md`** file inside the studio folder (in Italian). Or just ask Claude: *"how do I…?"*

### If something goes wrong

| Problem | Solution |
|---|---|
| You already had the studio | Run the step 2 command again: it downloads the new version and puts your films back in. The old one stays on your Desktop as *cato-motion-studio-vecchio-…*. |
| The installation stopped | Run the same command again: it picks up and only does what's missing. |
| *"command not found: claude"* | Quit Terminal (⌘ Cmd + Q), reopen it and try again. |
| Something doesn't work inside Claude Code | Type `/setup-studio`: it checks everything again and tells you what to do. |
| None of the above | Write to Diego with a screenshot of Terminal. |

---

<a id="italiano"></a>
## 🇮🇹 Italiano: come iniziare

Con il Cato Motion Studio fai i video di Cato sul tuo Mac, parlando con Claude: spot di prodotto con la musica a tempo e video di te che parli con sottotitoli e grafiche sopra, in orizzontale (16:9) e verticale (9:16).

**Non serve saper programmare.** Si installa una volta sola, in circa 15–20 minuti, seguendo i passi qui sotto.

### Prima di iniziare: 3 cose

1. **Un Mac.** Lo studio funziona solo su Mac.
2. **La password del tuo Mac**, quella che usi per accendere il computer. Serve una volta sola durante l'installazione.
3. **Un account Claude di Cato.** Se non ce l'hai, chiedilo a Diego.

Non serve nessun account GitHub.

### Installazione (una volta sola)

#### 1. Apri il Terminale
Premi **⌘ Cmd + Spazio**, scrivi **Terminale** e premi **Invio**. Si apre una finestra con del testo: è normale, ti basta incollare un comando.

#### 2. Incolla questo comando e premi Invio
Clicca l'icona di copia a destra del riquadro qui sotto, poi nel Terminale premi **⌘ Cmd + V** e **Invio**.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dvianello-cato/cato-motion-studio-install/main/install.sh)"
```

#### 3. Segui quello che ti chiede
L'installatore fa quasi tutto da solo. Ogni tanto si ferma e ti chiede qualcosa:

| Quando vedi… | Cosa fai |
|---|---|
| **`Password:`** | Scrivi la password del Mac e premi **Invio**. **Mentre scrivi non vedi niente, nemmeno i puntini: è normale.** |
| **`Press RETURN/ENTER to continue`** | Premi **Invio**. |
| Una domanda che finisce con **`(Y/n)`** | Premi **Invio**. |

Alcuni passaggi durano qualche minuto. Lascia il Terminale aperto finché non si apre **Claude Code**.

#### 4. Il primo avvio di Claude Code
Alla fine si apre Claude Code, sempre nel Terminale. La prima volta:
- se ti chiede un **tema di colori**, scegli quello che preferisci con le frecce e premi **Invio**;
- **entra con il tuo account Claude di Cato**: si apre il browser, fai il login e torna al Terminale;
- quando ti chiede se **ti fidi della cartella** (*"Do you trust the files in this folder?"*), rispondi **Yes**;
- quando ti chiede di **installare il plugin HyperFrames**, rispondi **sì**.

Claude poi controlla da solo che tutto funzioni e alla fine ti mostra una **tabella tutta verde**. Se qualcosa non è verde, ti dice lui cosa fare.

**Fatto.** Sulla Scrivania ora hai la cartella **cato-motion-studio**, con dentro tutto il design system di Cato: loghi, font, colori, musica e icone.

### Ogni volta che vuoi fare un video

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

### Se qualcosa va storto

| Problema | Soluzione |
|---|---|
| Avevi già lo studio | Rilancia il comando del passo 2: scarica la versione nuova e ci rimette dentro i tuoi film. Quella vecchia resta sulla Scrivania come *cato-motion-studio-vecchio-…*. |
| L'installazione si è interrotta | Rilancia lo stesso comando: riparte e fa solo quello che manca. |
| *"command not found: claude"* | Chiudi il Terminale (⌘ Cmd + Q), riaprilo e riprova. |
| Qualcosa non funziona dentro Claude Code | Scrivi `/setup-studio`: ricontrolla tutto e ti dice cosa fare. |
| Niente di tutto questo | Scrivi a Diego con uno screenshot del Terminale. |

---

<sub>The studio itself lives in / Lo studio vero sta in [cato-motion-studio](https://github.com/dvianello-cato/cato-motion-studio): tools, brand and templates / strumenti, brand e modelli. Your videos stay on your Mac / I video che fai restano sul tuo Mac.</sub>
