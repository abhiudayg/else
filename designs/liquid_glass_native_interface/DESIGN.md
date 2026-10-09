---
name: Liquid Glass Native Interface
colors:
  surface: '#131313'
  surface-dim: '#131313'
  surface-bright: '#393939'
  surface-container-lowest: '#0e0e0e'
  surface-container-low: '#1b1b1b'
  surface-container: '#1f1f1f'
  surface-container-high: '#2a2a2a'
  surface-container-highest: '#353535'
  on-surface: '#e2e2e2'
  on-surface-variant: '#c1c6d7'
  inverse-surface: '#e2e2e2'
  inverse-on-surface: '#303030'
  outline: '#8b90a0'
  outline-variant: '#414755'
  surface-tint: '#adc6ff'
  primary: '#adc6ff'
  on-primary: '#002e69'
  primary-container: '#4b8eff'
  on-primary-container: '#00285c'
  inverse-primary: '#005bc1'
  secondary: '#b4c5ff'
  on-secondary: '#002a78'
  secondary-container: '#0053db'
  on-secondary-container: '#cdd7ff'
  tertiary: '#ffb595'
  on-tertiary: '#571e00'
  tertiary-container: '#ef6719'
  on-tertiary-container: '#4c1a00'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#d8e2ff'
  primary-fixed-dim: '#adc6ff'
  on-primary-fixed: '#001a41'
  on-primary-fixed-variant: '#004493'
  secondary-fixed: '#dbe1ff'
  secondary-fixed-dim: '#b4c5ff'
  on-secondary-fixed: '#00174b'
  on-secondary-fixed-variant: '#003ea8'
  tertiary-fixed: '#ffdbcc'
  tertiary-fixed-dim: '#ffb595'
  on-tertiary-fixed: '#351000'
  on-tertiary-fixed-variant: '#7c2e00'
  background: '#131313'
  on-background: '#e2e2e2'
  surface-variant: '#353535'
typography:
  verdict-xl:
    fontFamily: Inter
    fontSize: 56px
    fontWeight: '700'
    lineHeight: 60px
    letterSpacing: -0.03em
  verdict-xl-mobile:
    fontFamily: Inter
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 44px
    letterSpacing: -0.025em
  headline-lg:
    fontFamily: Inter
    fontSize: 34px
    fontWeight: '700'
    lineHeight: 41px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 34px
    letterSpacing: -0.015em
  headline-sm:
    fontFamily: Inter
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  title:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 25px
    letterSpacing: -0.008em
  body-lg:
    fontFamily: Inter
    fontSize: 17px
    fontWeight: '400'
    lineHeight: 22px
    letterSpacing: -0.005em
  body-md:
    fontFamily: Inter
    fontSize: 15px
    fontWeight: '400'
    lineHeight: 20px
    letterSpacing: 0em
  body-bold:
    fontFamily: Inter
    fontSize: 17px
    fontWeight: '600'
    lineHeight: 22px
    letterSpacing: -0.005em
  caption:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
    letterSpacing: 0.01em
  caption-bold:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '600'
    lineHeight: 18px
    letterSpacing: 0.01em
  label-caps:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 13px
    letterSpacing: 0.06em
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-mobile: 0.75rem
  margin: 1.25rem
  margin-mobile: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system establishes an Apple-first utility standard grounded in pure native ergonomics, spatial restraint, and crystal-clear decision support. Built around the core mission of providing an unclouded, trustworthy second opinion for real-world scenarios, the visual identity pairs edge-to-edge sensor feeds and high-fidelity media with a refined floating control plane.

The aesthetic philosophy draws directly from Cupertino system software evolution:
- **Restrained Translucency:** Optical glass materials that composite backdrop blurs with micrometric specular inner strokes, avoiding decorative visual noise.
- **Calm Authority:** Understated, clinical precision where content and high-confidence verdicts command the screen.
- **Physical Utility:** Strict adherence to 44pt+ tactile touch ergonomics, system standard haptic readiness, and seamless integration with hardware constraints like the Dynamic Island, sensor housings, and the home indicator.
- **Systematic Directness:** Instantaneous readability under intense sunlight or dark field conditions, treating typography as a structural anchor rather than ornamentation.

## Colors

The color architecture is built around a pure OLED dark canvas, engineering infinite depth behind translucent glass planes:

- **System Canvas & Surfaces:**
  - Base canvas sits at `#000000` (Pure System Black) to conserve energy and merge invisibly into device hardware bezels.
  - Floating Liquid Glass surfaces utilize tiered alpha formulations over neutral darks: Ultra-Thin (`rgba(255, 255, 255, 0.04)`), Thin (`rgba(255, 255, 255, 0.08)`), Regular (`rgba(255, 255, 255, 0.12)`), and Thick (`rgba(255, 255, 255, 0.18)`).
- **Key Accents:**
  - `Primary` (`#007AFF`): The classic system blue, reserved strictly for primary interactive confirmations, selected states, and confidence metrics.
  - `Secondary` (`#2563EB`): Deep indigo-blue supporting interactive gradients, focus rims, and active status indicators.
- **System Neutrals & Typography Tiers:**
  - `Label Primary`: `#FFFFFF` (100% white) for prominent verdicts, data outputs, and primary action text.
  - `Label Secondary`: `rgba(235, 235, 245, 0.60)` for subtitles, secondary metrics, and utility labels.
  - `Label Tertiary`: `rgba(235, 235, 245, 0.30)` for inactive glyphs, subtle separators, and metadata timestamps.
- **Functional Glass Strokes:**
  - Specular edge highlights use linear gradient borders running from `rgba(255, 255, 255, 0.28)` at the top light source down to `rgba(255, 255, 255, 0.05)` at the base, creating genuine optical refraction.

## Typography

The typography scale utilizes native grotesque ergonomics, engineered for immediate scanning and zero ambiguity. 

- **Verdict Scale:** The top-tier display roles (`verdict-xl`, `verdict-xl-mobile`) provide instantaneous confidence scoring and direct guidance. Letter tracking is tightened progressively as size scales upward to maintain dense cohesion.
- **Body Hierarchy:** The core text experience centers on the 17pt base (`body-lg`), matching native iOS standards with matched leadings to guarantee rhythmic line separation across multi-line synthesis breakdowns.
- **Numeric & Metric Tabulation:** All numerals within analytical cards, probabilities, and timer controls should enable tabular figures (`font-variant-numeric: tabular-nums`) to prevent layout shifting during real-time updates.
- **Labels & Metas:** `label-caps` operates in all-caps with generous tracking (`+0.06em`) for categorical pills, confidence tags, and sensor state chips.

## Layout & Spacing

Layout geometry follows an edge-to-edge spatial model built around hardware-safe enclosures and dynamic viewport inserts:

- **Safe Boundaries & Hardware Enclosures:**
  - Content must float precisely relative to the native safe area insets (top status bar/Dynamic Island and bottom home indicator).
  - Floating action pods sit pinned `16px` above the bottom home indicator envelope, suspended over active background imagery.
- **Grid Architecture:**
  - Mobile operates on a 4-column adaptive layout with `16px` outer margins and `12px` interior gutters.
  - Tablet and expanded viewports transition to an 8-column layout with `20px` margins, keeping central floating verdict sheets confined to a max width of `640px` to maintain focused peripheral awareness of underlying media.
- **Rhythm & Touch Disciplines:**
  - Spacing internally uses an 8pt base grid with 4pt subdivisions (`space-xs` = 4px, `space-sm` = 8px, `space-md` = 16px, `space-lg` = 24px, `space-xl` = 32px).
  - Tap targets strictly adhere to Apple HIG minimum bounding boxes: no interactable surface may drop below `44px x 44px` regardless of internal glyph or label geometry.

## Elevation & Depth

Visual hierarchy is communicated via optical physics rather than heavy drop shadows:

- **Liquid Glass Stack:**
  - **Level 0 (Sensor / World Surface):** Native camera stream, scan imagery, or rich photographic evidence occupying 100% of the canvas.
  - **Level 1 (Ambient Scrim):** Dynamic subtle gradient vignetting (`linear-gradient(180deg, rgba(0,0,0,0.4) 0%, transparent 20%, transparent 80%, rgba(0,0,0,0.6) 100%)`) protecting system text readouts.
  - **Level 2 (Liquid Glass Panels & Sheets):** Backdrop blur of `40px` with a saturating boost (`saturate(190%) blur(40px)`), an alpha base of `rgba(20, 20, 24, 0.65)`, and a `0.5px` high-precision top-down specular border.
  - **Level 3 (Floating Pill Controls & Floating Modals):** Backdrop blur of `60px`, `rgba(30, 30, 35, 0.75)` surface, paired with an ambient soft bloom: `0 12px 32px -4px rgba(0, 0, 0, 0.45)`.
- **Specular Refraction:** All elevated glass modules incorporate an interior glow: a hairline inner box-shadow (`inset 0 1px 1px 0 rgba(255, 255, 255, 0.20)`) to simulate light grazing physical polished crystal edges.

## Shapes

The geometric signature uses pill contours, continuous curves, and circle-constrained triggers:

- **Pill Primitives:** Buttons, category badges, dynamic verdict pills, and floating navigation bars adopt full-pill radii (`rounded-full` / `9999px`), delivering a fluid, handheld aesthetic.
- **Continuous Curve Sheets (Squircle Cards):** Larger cards, bottom sheets, and diagnostic readouts leverage Apple continuous curvature (`rounded-3xl` / `32px` to `40px`), eliminating harsh visual corners and directing focus toward the center of the display.
- **Circular Interactive Anchors:** Secondary trigger buttons (close, capture, toggle flash, scan mode switch) use pure circular geometry with matched height-width values (minimum `48px x 48px`).

## Components

### Buttons & Interactive Pills
- **Primary Action Pill:** Height `52px`, full-pill radius. Background is `#007AFF` with a subtle top specular inner stroke (`inset 0 1px 0 rgba(255, 255, 255, 0.35)`). Typography is `body-bold`, colored `#FFFFFF`. Active press scale contracts to `0.97` with spring physics.
- **Glass Action Pill:** Height `48px`, full-pill radius. Background is `rgba(255, 255, 255, 0.12)`, backdrop filter `blur(30px)`. Border is `0.5px solid rgba(255, 255, 255, 0.22)`. Text is `body-bold` in `#FFFFFF`.
- **Circular Sensor Trigger:** Outer diameter `72px`, composed of a double concentric glass ring. Core button is `60px` diameter glass fill, capturing tap input with instant haptic acknowledgment.

### Chips & Status Tags
- **Verdict Assessment Tag:** Height `28px`, full-pill radius, horizontal padding `12px`. Features a `6px` status dot (e.g., `#007AFF` or emerald green) accompanied by `label-caps` text. Surface uses `rgba(255, 255, 255, 0.08)` with backdrop blur.

### Lists & Cell Groups
- **Inset Grouped Table Cells:** Floating within glass sheets. Each row holds a minimum height of `48px`. 
- **Separators:** Inset from the left icon boundary by `48px`, styled with `0.5px solid rgba(255, 255, 255, 0.08)`, vanishing cleanly at the right margin.
- **Accessory Views:** Chevron disclosures use `Label Tertiary` with smooth active highlighting.

### Checkboxes, Radios & Toggles
- **System Switch:** Dimensions `51px x 31px`, full-pill outline. Off state: `rgba(255, 255, 255, 0.16)`. On state: `#007AFF`. Thumb: `#FFFFFF` with drop shadow `0 3px 8px rgba(0,0,0,0.3)`.
- **Selection Cell:** Radio and checkbox mechanics employ clean circular check rings with smooth scale-in transitions on selection.

### Input Fields
- **Search & Query Capsule:** Height `44px`, full-pill radius, background `rgba(255, 255, 255, 0.09)`. Specular top border `0.5px solid rgba(255, 255, 255, 0.15)`. Leading magnifying glass glyph in `Label Secondary`, placeholder text in `Label Secondary`.

### Cards & Diagnostic Verdict Sheets
- **The Verdict Panel:** A bottom-anchored or centered floating glass card with `32px` corner curvature. Features a top grabber handle (`36px x 5px`, `rgba(255, 255, 255, 0.3)`, pill-shaped). Displays high-hierarchy synthesis with an oversized confidence readout (`verdict-xl-mobile`), an analytical summary paragraph (`body-lg`), and pill-shaped action groupings.
- **Media Overlay Cards:** Floated directly over camera viewports with `24px` radius, housing visual comparison sliders or real-time bounding box details without occluding scene context.