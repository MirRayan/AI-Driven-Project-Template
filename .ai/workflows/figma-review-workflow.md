# Figma Review Workflow

**Purpose:** How to process Figma design deliveries into developer-ready module specifications.
**When to use:** When Figma designs arrive for a module that was previously marked "⏳ Pending Figma."
**Output:** Updated module breakdown file with detailed UI screen specs, confirmed component list, and brand token extraction.

---

## Overview

```
Figma Delivery Received
        ↓
1. Identify modules affected
        ↓
2. Extract brand tokens (if new)
        ↓
3. Review each screen systematically
        ↓
4. Update module breakdown file(s)
        ↓
5. Update design system / theme docs
        ↓
6. Note open questions / deviations
```

---

## Step 1 — Identify Affected Modules

Before reviewing designs, determine which modules the Figma delivery covers:

- [ ] Match screen names to the module breakdown list
- [ ] Identify if any screens span multiple modules
- [ ] Note if new screens appear that have no corresponding module ticket
- [ ] Check if any existing tickets need to be split or merged based on designs

---

## Step 2 — Extract Brand Tokens (First-Time or Updated)

If this is the first Figma delivery or a major design update, extract and document:

**Colors:**
```markdown
| Token Name | Hex Value | Usage |
|------------|-----------|-------|
| Primary | #XXXXXX | Buttons, active states, CTA |
| Primary Dark | #XXXXXX | Pressed / hover states |
| Accent | #XXXXXX | Highlights, success states |
| Error | #XXXXXX | Error borders, error text |
| Input Background | #XXXXXX | Text field backgrounds |
| Text Primary | #XXXXXX | Body text, headings |
| Text Secondary | #XXXXXX | Subtitles, hints |
| Background | #XXXXXX | Screen backgrounds |
| Surface | #XXXXXX | Card backgrounds |
| Disabled | #XXXXXX | Disabled buttons/text |
```

**Typography:**
```markdown
| Style | Font | Size | Weight | Usage |
|-------|------|------|--------|-------|
| Heading Large | {font} | {size}sp | {weight} | Screen titles |
| Body | {font} | {size}sp | {weight} | Body text |
| Caption | {font} | {size}sp | {weight} | Labels, hints |
```

→ Update `core/theme/Color.kt` (Android) and `DesignSystem.swift` / `ColorPalette.swift` (iOS) with these values.

---

## Step 3 — Review Each Screen Systematically

For each screen in the Figma file, capture:

```markdown
### {Screen Name}

**Route/Navigation:** {Where does this screen appear in the nav flow?}

**Layout:**
- {Describe the main layout sections top to bottom}
- {Note any sticky/fixed elements (headers, footers, FABs)}
- {Note scroll behaviour}

**Components / Elements:**
- {List each interactive element with its state(s)}
- {Note reusable components vs screen-specific ones}

**States:**
- Empty state: {How does screen look with no data?}
- Loading state: {Skeleton? Spinner? Shimmer?}
- Error state: {How are errors shown?}
- Success state: {Confirmation visual?}

**Navigation Triggers:**
- Tap {element} → {destination screen}
- Back button → {destination}

**Edge Cases Shown in Design:**
- {List any edge cases the designer explicitly handled}

**Open Questions:**
- [ ] {Anything unclear or missing from the design}
```

---

## Step 4 — Update the Module Breakdown File

After reviewing all screens, update `docs/05-breakdown/modules/{NN}-{module-name}.md`:

1. **Remove** the `⚠️ Pending Figma` warning banner from the UI section
2. **Update** each UI ticket row — add Figma status `✅ Designed` and expand the description
3. **Add** `Figma Status` column to the UI table if not present:

```markdown
| ID | Title | Platform | Figma Status |
|----|-------|----------|--------------|
| MOD-006 | {Screen} screen ({description from Figma}) | Both | ✅ Designed |
```

4. **Split tickets** if a single high-level ticket now covers multiple distinct screens
5. **Add new tickets** if the Figma reveals screens not previously captured

**Key design decisions to document as notes:**
```markdown
> **Key design decisions from Figma review:**
> - {Decision 1: e.g. "Empty cart shows illustration + CTA, not just text"}
> - {Decision 2: e.g. "Address form uses bottom sheet, not new screen"}
> - {Decision 3: e.g. "Error states show inline, not toast"}
```

---

## Step 5 — Update Design System / Theme Docs

- [ ] Update `docs/03-architecture/` design system doc (if it exists)
- [ ] Update platform theme files if new colors/typography found
- [ ] Document new reusable components discovered in Figma that need to be built

---

## Step 6 — Log Open Questions

Track anything that needs designer or product owner clarification:

```markdown
## Open Questions — {Module Name} Figma Review
Date: {YYYY-MM-DD}

| # | Screen | Question | Status |
|---|--------|----------|--------|
| 1 | {Screen} | {Question} | ⏳ Pending |
| 2 | {Screen} | {Question} | ✅ Resolved: {answer} |
```

File this in `docs/05-breakdown/modules/{NN}-{module}-open-questions.md` or add to the module file.

---

## Completion Checklist

- [ ] All screens identified and reviewed
- [ ] Brand tokens extracted and documented
- [ ] Module breakdown file updated (Pending Figma warning removed)
- [ ] All UI ticket descriptions expanded with Figma details
- [ ] New tickets created for any screens not previously captured
- [ ] Open questions logged
- [ ] Design system / theme files updated
- [ ] Figma review summary committed

---

## Output Quality Bar

A Figma review is complete when a developer can:
1. Know exactly what screens to build (no ambiguity)
2. Know the exact states each screen must handle
3. Know which UI components are reusable vs screen-specific
4. Know the navigation flow from that screen
5. Have no blocking questions before starting implementation
