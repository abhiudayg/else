# ELSE: Product Draft v2

*Your second opinion for real life. Siri-first by default, bring your own model if you prefer, and free for good.*

## 1. Positioning

ELSE is **the second opinion you can point at anything.** It is not "AI that understands real life," which is good internal philosophy but weak consumer marketing.

**Tagline:** See it. Ask it. Know what to do.

**Core promise to the user:** an answer you can trust, in about two seconds, from the moment you open the app.

**Always free.** No subscription, no ads, no paywall, now or later. Section 3 explains how that stays sustainable.

## 2. What changed from v1

| Area | v1 | v2 (this revision) |
| --- | --- | --- |
| Default AI | Not specified | Siri as the entry point, Apple's on-device and Private Cloud Compute models as the engine |
| Model choice | None | Bring your own API key and pick a model (Claude, Gemini or another provider) |
| Pricing | Not specified | Free forever, with no ads or paywall |
| Moat | A memory layer | Five layers: decision graph, outcomes, engine neutrality, system reach, trust |
| UX depth | Three screens | First-minute flow, a day in the life, four screens, and error and edge-case states |
| Saving | "Save this decision? Yes / No" prompt | Saves automatically, with a one-tap undo |
| Speed | Not specified | Opens straight to the camera, verdict target under 3 seconds |
| Trust | One confident verdict | Verdict plus confidence, a "why" and the caveat that matters |
| Memory payoff | Six months away | A visible benefit within the first 2 to 3 uses |
| Entry points | In-app only | Siri, Action Button, Lock Screen, widget, share sheet |
| Privacy | Not addressed | Plain-language controls, on-device first, keys held in Keychain |
| Onboarding | Implicit | One screen, then straight to the first verdict |

## 3. Always free

ELSE is free forever: no subscription, no ads, no paywall and no usage cap set by ELSE. Every feature in this document ships to every user.

That promise only holds if each verdict costs ELSE close to nothing, and the default engine design is what makes that possible.

| Cost driver | How ELSE keeps it near zero |
| --- | --- |
| Default AI engine | Apple's on-device model, which needs no cloud call. Heavier questions use Apple's Private Cloud Compute model, which Apple provides at no cloud API cost to Small Business Program apps with fewer than 2 million first-time downloads ([Apple](https://developer.apple.com/wwdc26/guides/ios/)) |
| Other models | The user pastes their own API key and pays the provider directly, so ELSE carries none of that cost |
| Memory and history | Stored on the phone and synced through the user's own iCloud, not on ELSE servers |
| Backend | None needed for V1: no accounts and no servers to run |
| Revenue | None. Free is a product principle, not a launch promotion |

**Risk to the promise.** Apple's no-cost Private Cloud Compute terms depend on the Small Business Program and the 2 million download threshold, and developer apps get a daily quota on that model ([Yage, Sep 2026](https://yage.ai/share/ios27-siri-app-intents-foundation-models-en-20260919.html)). A hit app could outgrow both. The answer is to keep the on-device model as an unmetered floor, so ELSE gets slightly less capable under load and never turns paid.

## 4. AI engine: Siri-first by default, your own model optional

ELSE runs on Apple's iOS 27 AI stack by default, and any user can switch to their own model by adding an API key. One constraint shapes the design: apps can't replace Siri's own reasoning or call it directly ([Yage](https://yage.ai/share/ios27-siri-app-intents-foundation-models-en-20260919.html)). So "Siri by default" means two separate layers.

| Layer | Default | How it works |
| --- | --- | --- |
| Entry | Siri | Users say "Hey Siri, ask ELSE about this." ELSE exposes its actions through App Intents and maps its screens to entities with View Annotations, so people can refer to what's on screen ([Apple](https://developer.apple.com/wwdc26/guides/ios/)) |
| Reasoning | Apple Foundation Models | ELSE calls the same on-device model that powers Apple Intelligence through the Foundation Models framework, including image input and on-device text and barcode reading ([Apple](https://developer.apple.com/wwdc26/guides/ios/)) |

### Engine modes

| Mode | For | Runs on | Cost to the user | Setup |
| --- | --- | --- | --- | --- |
| Automatic (default) | Everyone | On-device first, Apple's Private Cloud Compute for harder questions | Free | None |
| On-device only | Privacy-first users | The phone alone, works offline | Free | One toggle |
| My own model | Power users | Claude, Gemini or any provider that supports Apple's language model protocol ([Apple](https://developer.apple.com/wwdc26/guides/ios/)) | The provider's API pricing, paid directly by the user | Paste a key, pick a model |

### How bringing your own model works

1. **Settings, then Engine, then My own model.** The user picks a provider.
2. **Paste an API key.** ELSE stores it in the iOS Keychain on the device and never sends it to an ELSE server.
3. **Test and choose.** ELSE makes one small test request, lists the models the key can use, and the user picks a default.
4. **Per-job models, after V1.** The user can assign a different model to Decide, Understand and Act.
5. **Consent before the first photo leaves the phone.** A sheet names the provider and says what gets sent. Apple's review rules require telling users and getting consent before sending their data to a third-party AI service ([Yage](https://yage.ai/share/ios27-siri-app-intents-foundation-models-en-20260919.html)).
6. **Always show the engine.** Each verdict carries a small label such as "Apple on-device" or "Claude", so the user knows who answered.
7. **Fail kindly.** If a key is rejected or a quota runs out, ELSE says so plainly and offers to retry on Apple's model.

### Behaviors that make the engine choice useful

- **Ask another model.** A button on every verdict reruns the question on a different engine. This is the "second opinion" brand promise applied to the AI itself.
- **Automatic routing.** Simple reads (text in a photo, a barcode, a two-item comparison) stay on the phone. Questions that need more reasoning go to Private Cloud Compute.
- **Memory is engine-independent.** History and preferences live in ELSE, so switching engines never loses them.
- **Small on-device context.** The on-device model's context window is small (about 4,096 tokens as of Sep 2026, per [Yage](https://yage.ai/share/ios27-siri-app-intents-foundation-models-en-20260919.html)), so ELSE retrieves only the few past decisions that matter to each question.

### Availability

- Siri's rebuilt AI is delayed in the EU, per Apple's own statement as cited by [Yage](https://yage.ai/share/ios27-siri-app-intents-foundation-models-en-20260919.html). ELSE detects this and hides Siri-only entry points where they aren't available.
- Phones without Apple Intelligence support, or with it turned off, fall back to My own model with a clear prompt in Engine settings.
- Apple notes that some features vary by region and language ([Apple](https://developer.apple.com/wwdc26/guides/ios/)), so each engine and entry point is checked at launch rather than assumed.

## 5. The moat, refined

ELSE's moat is the user's own decision history, kept privately on their phone and usable with any AI engine. The model is deliberately not the moat: users can swap Apple, Claude or Gemini in settings, so ELSE competes on what it remembers and how close it sits to the user.

| Layer | What it is | Why it's hard to copy |
| --- | --- | --- |
| Personal decision graph | Every verdict, photo, deadline and outcome, linked by item, place and time | It takes months of real use to build and can't be imported |
| Outcome feedback | What the user actually chose, bought, kept or returned after a verdict | It needs the full loop of see, decide, act and remember, not a one-off answer |
| Engine neutrality | Memory belongs to ELSE, not to any model | Single-model apps lose the user's history if they change provider, ELSE doesn't |
| System-level reach | Siri, Action Button, share sheet, widgets and Spotlight | Apple says Siri leans toward apps people use often ([Yage](https://yage.ai/share/ios27-siri-app-intents-foundation-models-en-20260919.html)), so frequent use compounds distribution |
| Trust | Free forever, on-device first, keys held in Keychain, no ELSE servers holding photos | Trust takes years to earn and can't be faked with a landing page |

### How the moat shows up for the user

- **Day 1:** a fast verdict from the default engine. Nothing to configure.
- **Day 3:** ELSE says "you looked at a similar jacket on Tuesday" and links the two.
- **Week 2:** history is searchable by photo and by Siri ("what did I decide about that lamp?").
- **Month 3:** verdicts are visibly personal, because ELSE knows what the user kept and what they sent back.
- **Month 6:** clean-out and review questions ("which shirts should I get rid of?") become possible, as in the original pitch.

### What is not the moat

The camera, the verdict card and the model itself can all be copied in a weekend. The same goes for any single answer, since Apple, Google and OpenAI all offer camera-based assistants.

### Risks to the moat

- **Apple builds a native second opinion into Siri.** This is likely over time. ELSE's response is depth Apple's general assistant won't prioritize: outcome tracking, cross-engine second opinions and a personal history the user controls.
- **Memory only matters if people keep using ELSE.** The early payoffs in section 9 and the entry points in section 10 carry the retention load.
- **Privacy claims must be provable.** Show what is stored and where in plain language, and make deleting everything one tap.

## 6. Design principles

1. **Zero to answer in one tap.** The app opens on a live camera. No home screen to navigate first.
2. **Verdict first, explanation second.** Lead with the answer in a large, readable form; details sit one tap away.
3. **Honest about uncertainty.** Say how sure ELSE is, and say so plainly when a question needs a professional.
4. **Never add friction at the moment of delight.** No save prompts, rating prompts or sign-up walls after a good answer.
5. **Memory should feel like a gift, not a chore.** The user never manages it; they just notice ELSE getting better.
6. **The user stays in control.** Anything ELSE remembers can be seen, edited and deleted.
7. **Siri is the front door, not the engine room.** Siri gets users to ELSE quickly; the user always sees which engine answered.
8. **Free means free.** No feature is gated, and the default path costs the user nothing.

## 7. The core experience: three jobs

| Job | Example | Output |
| --- | --- | --- |
| **Decide** | "Which shirt?" | A clear pick plus the main reason |
| **Understand** | "What's wrong with this?" | A plain explanation plus the next step |
| **Act** | "Do I need to do anything?" | An action, a deadline and a reminder option |

ELSE picks the job automatically from what it sees and what the user says. The user can switch jobs with one tap if it guessed wrong.

## 8. The iOS experience in detail

A new user should get a useful verdict within 30 seconds of first launch, with no account, payment or API key. Everything else in this section serves that.

### The first minute

1. **0:00** The app opens on a live camera with the prompt "What are you unsure about?" and one tappable example.
2. **0:05** iOS asks for camera access, after a one-line reason from ELSE.
3. **0:10** The user taps the shutter, or the example.
4. **0:11** A skeleton card appears and the verdict starts streaming, with a label showing the engine ("Apple on-device").
5. **0:20** The verdict is complete and saved automatically, with a short "Saved · Undo" toast.
6. **0:30** Follow-up chips appear ("What if it's for work?").
7. **0:45** One soft, dismissible offer: "Add ELSE to the Action Button and Siri?" It never repeats if declined.

### A day in the life

| Moment | How the user gets to ELSE | What ELSE does |
| --- | --- | --- |
| In a store, comparing two items | Action Button opens the camera | Takes two photos, gives a pick and the main reason |
| A letter arrives | Share sheet from a photo or screenshot | Explains it, names any deadline, offers a reminder |
| Evening, deciding on a purchase | "Hey Siri, what did I decide about that jacket?" | Pulls the earlier verdict from history and answers |
| Weekend | Opens the history screen | Shows patterns in an "ELSE noticed" strip |
| Week 2, a hard question | Settings, Engine | User adds their own model key for tougher questions |

### Screen 1: Capture

- Live camera is the home screen, with a large shutter button in the bottom third.
- Input row: **Photo, Screenshot, Paste, Voice**.
- Optional question field: type, or hold the shutter and speak.
- Job chips (**Decide, Understand, Act**) default to automatic. A tap overrides the guess.
- A multi-shot tray holds two or three photos for comparisons.
- An engine chip shows the current engine. Tapping it switches engine for this question only.
- Light on-device hints (frames around detected text or objects) show that ELSE can see the subject before the shot.

### Screen 2: Verdict

- **Top to bottom:** verdict in large type, confidence in words, one-to-two-sentence reason, engine label.
- **Why?** expands the full reasoning.
- **Ask another model** reruns the question on a different engine and shows both answers side by side.
- **Follow-up chips** continue the conversation without typing.
- **Act results** show one primary button ("Remind me Friday", "Add to Calendar", "Draft a reply").
- **Share** sends the verdict as an image card.
- **Thumbs up or down** is optional and never blocks anything.
- The decision saves automatically and "Undo" stays visible for a few seconds.

### Screen 3: Your ELSE (history)

- Timeline grouped by day and topic (Clothes, Home, Paperwork, Food).
- Search by words or by photo.
- Open any item to ask a follow-up, edit it or delete it.
- An "ELSE noticed" strip at the top surfaces patterns gently.
- Decisions are indexed so Siri and Spotlight can find them, with attribution back to ELSE ([Apple](https://developer.apple.com/wwdc26/guides/ios/)).

### Screen 4: Engine settings

- Three choices: **Automatic**, **On-device only**, **My own model**.
- For My own model: provider, key field with a paste button, a **Test key** button, and a model picker.
- Optional per-job model for Decide, Understand and Act.
- A plain-language note: the key stays on this phone, and photos go only to the provider the user chose.
- Privacy controls, memory on or off, export, and delete everything live here too.

### States and edge cases

| Situation | What the user sees | What they can do |
| --- | --- | --- |
| First words not yet ready | Skeleton card, then streaming text | Swipe down to cancel |
| Blurry or unclear photo | A message saying what to retake ("I can't read the small print. Move closer.") | Retake, or ask anyway |
| No connection | Capture is queued, and on-device answers still work | Wait, or use on-device only |
| Apple Intelligence unavailable | A banner explaining why and offering My own model | Open Engine settings |
| API key rejected or provider limit hit | A plain message naming the provider | Retry on Apple's model, or fix the key |
| Low confidence | "Not certain" plus the one thing that would help | Add a photo or a detail |
| Legal, medical or financial question | A softer verdict with a note on when to ask a professional | Ask a follow-up |

## 9. Making memory pay off quickly

The v1 draft relied on a six-month payoff ("Which shirts should I get rid of?"). Most users won't wait that long, so v2 adds early payoffs:

- **After 2 saves:** "You asked about two jackets this week. Want to compare them side by side?"
- **After 3 saves in a topic:** a lightweight style or preference summary the user can correct ("You tend to choose neutral colors").
- **On a repeat item:** "You looked at this one on March 3rd. You decided against it because of the price."
- **On deadlines:** unanswered Act items resurface with a gentle nudge.

The six-month wardrobe moment remains the long-term story, but it is no longer the first proof of value.

## 10. Getting to ELSE faster (iOS and Siri integrations)

- **Action Button and Control Center:** launch straight into capture.
- **Lock Screen widget:** one tap to camera.
- **Home Screen widget:** shows the latest verdict or an upcoming deadline.
- **Share sheet extension:** send a screenshot, link or photo from any app to ELSE.
- **Siri and App Shortcuts:** "Hey Siri, ask ELSE about this."
- **Live Activities (later):** countdown for time-sensitive Act items.

**Siri in depth.** ELSE adopts App Intents so Siri can start a capture, look up past decisions and set reminders from ELSE results. It also uses View Annotations so people can refer to what's on screen in plain language ([Apple](https://developer.apple.com/wwdc26/guides/ios/)). Siri decides which app handles an ambiguous request, and apps people open often are favored ([Yage](https://yage.ai/share/ios27-siri-app-intents-foundation-models-en-20260919.html)), so daily use matters more than any setup.

## 11. Trust, safety and privacy

- **Confidence is shown in plain words**, not percentages.
- **Act answers about legal, medical or financial matters** include clear guidance on when to consult a professional, and ELSE avoids stating a firm conclusion where it can't be sure.
- **On-device preprocessing** (Apple's Vision framework for text recognition, object detection, and blurring or cropping obvious personal details such as faces where possible) reduces what leaves the phone.
- **Plain-language privacy screen** explaining what is sent, what is stored and for how long.
- **Memory controls:** view, edit, delete individual items, pause memory, or delete everything in one place.
- **No dark patterns:** deleting data is as easy as saving it.

* **API keys** live in the iOS Keychain on the device, never reach an ELSE server, and can be removed in one tap.
* **Other providers** receive only what the user asks about, after a one-time consent sheet that names the provider.
* **Engine label** on every verdict shows who answered.
* **No ads and no data sales**, so free never depends on user data.

## 12. Onboarding

One screen, no account wall:

1. A single line: **"Point at anything. Get a second opinion."**
2. Camera permission request with a one-sentence reason.
3. Straight into capture with a pre-filled example the user can tap to try immediately.

Account creation and notifications are requested later, only after the user's first useful verdict (for example, "Sign in to keep your history across devices").

Engine choice is never part of onboarding. Automatic is the default, and My own model sits in Settings for people who want it.

## 13. Polish that makes it feel good

- **Haptics:** a light tap on capture, a soft confirmation when the verdict lands.
- **Streaming text and a skeleton card** so the app never feels frozen.
- **Offline behavior:** captures queue locally and resolve when the connection returns, with clear status.
- **Accessibility:** full VoiceOver labels, Dynamic Type, high-contrast support and voice input from day one.
- **Dark mode and one-handed reach:** primary controls in the bottom third of the screen.
- **Localization-ready** copy and formats from the start.
- **Graceful failure:** if an image is blurry or unclear, ELSE says exactly what to retake ("I can't read the small print. Try moving closer.").

## 14. Product loop

**See → Understand → Decide → Act → Remember → better next decision**

The memory layer is the long-term moat. The decision layer is the hook. Users download ELSE because they want a second opinion, and they stay because it gets noticeably better at giving it.

## 15. Architecture

All inputs (camera, photo, screenshot, text or link) flow into a single **context extraction** step that produces a **Context Object**. Decide, Explain and Act all run off that object through an **engine layer** that routes each request to Apple's on-device model, Apple's Private Cloud Compute model or the user's own provider, behind one shared model interface. Results flow into memory, which sits outside the engine layer so it survives any engine change. Siri reaches the same pipeline through App Intents.

**Context Object fields:** source, content, entities, observations, user intent, decision, confidence, actions, deadline, location, timestamp, relationships.

One addition for v2: a **user-visible flag** on each object (saved, edited, deleted, hidden from memory) so the privacy controls described above are built into the data model rather than bolted on later.

Further additions in this revision:

- An **engine record** on each Context Object (engine, mode, provider) powers the verdict label and "Ask another model."
- **Keychain-only key storage**, with no key ever written to the Context Object or to logs.
- **App Intents entities** for decisions, so Siri and Spotlight can find them.

## 16. V1 scope

**Build:** Capture, Verdict, auto-save with undo, the history screen, Engine settings (Automatic, On-device only, My own model with key entry and a test button), Ask another model, the share sheet and Action Button entry points, Siri through App Intents, and the three jobs (Decide, Understand, Act).

**Defer:**

- Per-job model assignment (V1 has one model choice)
- Full personal search
- Automatic location history
- Comprehensive object inventory
- Sophisticated change detection
- Autonomous reminders (manual reminders are in; automatic ones are out)
- Shopping affiliate engine
- Social features
- A complex chat UI

## 17. Success metrics

- **Time to first verdict** (target: under 30 seconds from first launch).
- **Verdict latency** (target: first words in about 1 second, full answer in about 3).
- **Day-1 and Day-7 retention.**
- **Questions per active user per week.**
- **Follow-up rate** (a sign the verdict was useful enough to continue).
- **Undo rate on auto-save** (a sign the default is wrong).
- **Thumbs-down rate, especially on Act answers.**
- **History opened within 7 days** (early signal that the moat is forming).
- **Verdicts that use a past decision** (share of all verdicts).
- **Users who add their own model key**, and how their retention compares with default users.
- **Ask another model** usage rate.
- **Cloud cost per active user** (target: zero to ELSE on the default path).

## 18. Open questions

- What happens to the free Private Cloud Compute tier if ELSE passes 2 million downloads or hits Apple's daily quota, and is the on-device model alone a good enough floor?
- Which of the three jobs genuinely need Private Cloud Compute or a user-supplied model, and which run well on-device? This needs testing.
- Is the on-device context window big enough for memory-aware verdicts, or does retrieval need to be tighter?
- Which regions and languages get the rebuilt Siri at launch, and what does ELSE show where it isn't available?
- Does Apple's review process need more than the consent sheet in section 4 when users send photos to a provider with their own key?
- How should ELSE handle photos containing other people (privacy and consent)?
- Should memory default to on with clear controls, or opt-in after the first few uses?

## 19. Suggested next steps

1. Prototype Capture and Verdict in SwiftUI on Apple's on-device model through the Foundation Models framework, and test with five to ten real users.
2. Add a second engine (Claude or Gemini) through the shared model interface to prove the swap, and test the Keychain key flow end to end.
3. Add App Intents for "ask ELSE" and decision lookup, and test them with real Siri phrasing on a physical device.
4. Define the Context Object and engine record schemas.
5. Compare on-device and Private Cloud Compute quality for each of the three jobs.
6. Draft the privacy and consent copy, and the App Store pitch for testing: *ELSE. Your second opinion for real life. See it. Ask it. Know what to do.*
