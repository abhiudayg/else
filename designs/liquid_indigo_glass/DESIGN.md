---
name: Liquid Indigo Glass
colors:
  surface: '#131315'
  surface-dim: '#131315'
  surface-bright: '#39393b'
  surface-container-lowest: '#0e0e10'
  surface-container-low: '#1c1b1d'
  surface-container: '#201f22'
  surface-container-high: '#2a2a2c'
  surface-container-highest: '#353437'
  on-surface: '#e5e1e4'
  on-surface-variant: '#c7c4d6'
  inverse-surface: '#e5e1e4'
  inverse-on-surface: '#313032'
  outline: '#918f9f'
  outline-variant: '#464554'
  surface-tint: '#c2c1ff'
  primary: '#c2c1ff'
  on-primary: '#1c0b9f'
  primary-container: '#5856d6'
  on-primary-container: '#e7e4ff'
  inverse-primary: '#4f4ccd'
  secondary: '#adc6ff'
  on-secondary: '#002e69'
  secondary-container: '#4b8eff'
  on-secondary-container: '#00285c'
  tertiary: '#ffb785'
  on-tertiary: '#502500'
  tertiary-container: '#a25100'
  on-tertiary-container: '#ffe1cf'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#e2dfff'
  primary-fixed-dim: '#c2c1ff'
  on-primary-fixed: '#0c006a'
  on-primary-fixed-variant: '#3631b4'
  secondary-fixed: '#d8e2ff'
  secondary-fixed-dim: '#adc6ff'
  on-secondary-fixed: '#001a41'
  on-secondary-fixed-variant: '#004493'
  tertiary-fixed: '#ffdcc6'
  tertiary-fixed-dim: '#ffb785'
  on-tertiary-fixed: '#301400'
  on-tertiary-fixed-variant: '#713700'
  background: '#131315'
  on-background: '#e5e1e4'
  surface-variant: '#353437'
typography:
  display:
    fontFamily: Manrope
    fontSize: 44px
    fontWeight: '700'
    lineHeight: 52px
    letterSpacing: -0.025em
  display-mobile:
    fontFamily: Manrope
    fontSize: 34px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Manrope
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 38px
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Manrope
    fontSize: 26px
    fontWeight: '600'
    lineHeight: 32px
    letterSpacing: -0.015em
  headline-md:
    fontFamily: Manrope
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.015em
  headline-sm:
    fontFamily: Manrope
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: -0.01em
  body-lg:
    fontFamily: Inter
    fontSize: 17px
    fontWeight: '400'
    lineHeight: 24px
    letterSpacing: -0.01em
  body-md:
    fontFamily: Inter
    fontSize: 15px
    fontWeight: '400'
    lineHeight: 22px
    letterSpacing: -0.005em
  body-sm:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
    letterSpacing: 0em
  label-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 18px
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
    letterSpacing: 0.04em
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-desktop: 1.5rem
  margin: 1rem
  margin-tablet: 2rem
  margin-desktop: 3rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

The design system projects an executive, ultra-calm authority for critical real-life second opinions. Built upon an advanced liquid glass philosophy, it balances optical purity, deliberate physical restraint, and effortless clarity.

The visual style merges tactile optical glass with high-contrast minimalism:
- **Optical Glass & Depth:** Multilayered dark substrates layered over pure OLED depth, utilizing high-index backdrop refraction and directional specular borders.
- **Editorial Decisiveness:** Uncluttered layouts, expansive macro whitespace, and sculptural typographic hierarchies that instill instant reassurance and analytical clarity.
- **Restrained Focus:** High-chroma indigo is reserved strictly for actionable insights, decision states, and structural confirmation, preventing cognitive fatigue.

## Colors

The palette is tuned specifically for deep OLED contrasts and translucent glass substrates:

- **Canvas & Substrates:** The base canvas sits at `#000000`, rising to `#09090B` for baseline elevation. Translucent structural containers use `rgba(24, 24, 27, 0.72)` combined with layered fills of `rgba(255, 255, 255, 0.04)` to `rgba(255, 255, 255, 0.08)`.
- **Specular Edge Highlighting:** Containers feature an inner bevel or 1px hairline border using `rgba(255, 255, 255, 0.14)` along upper horizontal surfaces, tapering to `rgba(255, 255, 255, 0.04)` on lower edges.
- **Brand Accents:** `#5856D6` serves as the primary core anchor, complemented by `#007AFF` for navigational links and interactive cues.
- **Status Accents:** Diagnostic confirmation employs System Green (`#34C759`), and advisory cautions employ Amber (`#FF9F0A`).
- **Typography Contrasts:** Primary information is rendered in sharp white (`#FFFFFF`), secondary guidance in neutral silver (`#A1A1AA`), and metadata or timestamps in muted ash (`#8E8E93`).

## Typography

The typographic hierarchy pairs the architectural presence of Manrope for titles and evaluation verdicts with the technical legibility of Inter for continuous reading, comparative evidence, and numerical metrics.

- **Weight Disciplines:** Use Regular (400) for narrative and evidence bodies to maximize airy contrast against glass containers. Semibold (600) and Bold (700) are reserved for key decisions, critical verdict categories, and actionable interface targets.
- **Micro Labels:** All sub-12px elements (capsules, status flags) require uppercase rendering with expanded tracking (`0.04em`) to ensure legibility across variable-opacity surfaces.

## Layout & Spacing

Layout geometry follows an exact 4pt/8pt baseline cadence. Structural rhythm maintains ample negative space to reinforce cognitive calm during high-stakes evaluations:

- **Mobile Rhythm:** A 4-column layout with 16px (`1rem`) outer margins and 16px gutters ensures maximum horizontal surface area for interactive cards.
- **Tablet & Split-Screen:** An 8-column layout with 32px (`2rem`) margins and 16px gutters supports dual-pane comparative views (Initial Opinion vs. Alternative Analysis).
- **Desktop & Landscape:** A 12-column layout capped at an executive maximum width of 1200px, utilizing 48px (`3rem`) margins and 24px (`1.5rem`) gutters.
- **Vertical Spacing Hierarchy:** Intra-card metadata stacks at 4px (`space-xs`) or 8px (`space-sm`), component-to-label gaps use 16px (`space-md`), and distinct analytical modules separate by 32px (`space-xl`).

## Elevation & Depth

Depth is established through optical transmittance, atmospheric diffusion, and specular refraction rather than drop shadows:

- **Layer 0 (Base Canvas):** Pure black (`#000000`) absorbing background light.
- **Layer 1 (Card Substrates):** Semi-opaque composite (`rgba(24, 24, 27, 0.75)`) backed by a hardware-accelerated 24px backdrop blur and 120% saturation boost.
- **Layer 2 (Floating Overlays & Sheets):** Translucent glass (`rgba(39, 39, 42, 0.65)`) backed by a 40px backdrop blur, bordered with a top-lit gradient highlight (`rgba(255, 255, 255, 0.20)` transitioning to `rgba(255, 255, 255, 0.05)`).
- **Ambient Shadowing:** Where separation from underlying content is needed, use deep, expansive, low-opacity ambient shadows: `box-shadow: 0 24px 48px -12px rgba(0, 0, 0, 0.65)`.

## Shapes

The interface relies on smooth curvature, blending pill shapes for interactive elements with continuous squircle geometry for content structures:

- **Interactive Elements:** Buttons, search triggers, pill badges, and contextual chips use full rounding (`border-radius: 9999px`).
- **Cards & Analysis Modules:** Structured content units use squircle geometries (`32px` to `48px` corner radii) that mirror modern mobile hardware corners.
- **Nested Containers:** Inner modules match outer curvature using the concentric radius formula (`R_inner = R_outer - Padding`) to maintain precise optical harmony.

## Components

### Buttons
- **Primary:** Pill-shaped (`rounded-full`), solid `#5856D6` or linear-gradient (`#5856D6` to `#007AFF`). Text is high-contrast white with a subtle 0.5px white inner specular crest along the upper half.
- **Secondary / Glass:** Clear liquid glass with `rgba(255, 255, 255, 0.08)` fill, `backdrop-filter: blur(20px)`, and a 1px border of `rgba(255, 255, 255, 0.15)`. Text in white.
- **Destructive / Caution:** Translucent crimson glass (`rgba(255, 69, 58, 0.12)`) with a `rgba(255, 69, 58, 0.3)` border and saturated red text.

### Chips & Badges
- Pill-shaped (`rounded-full`), height 28px–32px, padding 4px horizontal 12px.
- Background uses frosted glass (`rgba(255, 255, 255, 0.06)`) with subtle specular borders. Text in `label-sm` tracking.
- Selected state activates a saturated indigo glow (`box-shadow: 0 0 12px rgba(88, 86, 214, 0.45)`).

### Input Fields
- Height 52px, fully rounded or 20px squircle. Fill uses `rgba(24, 24, 27, 0.6)` with an inner border of `rgba(255, 255, 255, 0.1)`.
- Focused state transitions the border to a 1px `#5856D6` edge with a soft, diffused indigo outer halo (`0 0 0 3px rgba(88, 86, 214, 0.2)`).

### Cards & Analysis Containers
- Rendered in 32px squircle containers.
- Encased with a light-catching perimeter stroke: `border: 1px solid rgba(255, 255, 255, 0.12)`.
- Internal dividers are replaced with 1px inset separation channels (`rgba(255, 255, 255, 0.06)`) or intentional 24px spatial offsets.

### Checkboxes & Switches
- **Switches:** Fully rounded pill track (51px x 31px) with translucent track backing (`rgba(255, 255, 255, 0.16)`) transitioning to solid `#5856D6` when active; thumb is pure white with a soft, natural drop shadow.
- **Checkboxes:** 22px squircle (`border-radius: 6px`) with 1.5px border (`rgba(255, 255, 255, 0.25)`). Checked state fills with `#5856D6` and presents a crisp white SVG check mark.

### Second Opinion Comparison Panes
- A side-by-side or stacked split card. The original assessment rests on a muted glass substrate (`rgba(24, 24, 27, 0.5)`), while the alternative opinion is elevated with a 1px `#5856D6` illuminated perimeter and a soft indigo-tinted backlight.