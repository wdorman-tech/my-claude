---
description: Deep research a domain/industry to build a references knowledge base for Claude Code. Usage: /research [topic or industry]
argument-hint: [topic - e.g. "veterinary clinic management" or "commercial HVAC scheduling"]
allowed-tools: Agent, WebSearch, WebFetch, Write, Bash(mkdir:*), Bash(ls:*)
---

## Arguments
$ARGUMENTS

## Your task
Create a comprehensive `references/` knowledge base in the current project directory so that Claude Code has deep domain context for building software in this niche.

### Step 1: Create the references directory
- Run `mkdir -p references` in the current working directory
- This is where all research output goes

### Step 2: Plan the research
Before spawning any agents, think carefully about the topic "$ARGUMENTS" and determine the subtopics that would give a developer everything they need to build excellent software for this domain. Consider:

**Domain/Theory subtopics** (the "what" and "why"):
- Industry overview, key terminology, and mental models practitioners use
- Workflows and processes -- how do people in this field actually work day-to-day?
- Pain points, inefficiencies, and where software typically fails them
- Regulatory, compliance, or legal considerations
- Key personas/user types and what they care about

**Technical/Implementation subtopics** (the "how"):
- Data models -- what entities, relationships, and states matter?
- UI/UX patterns -- what do existing best-in-class tools in this space look like? What visual language and features do users expect?
- Integrations -- what third-party systems, APIs, file formats, or hardware does software in this space typically need to talk to?
- Industry-specific technical standards or protocols

**Competitive landscape**:
- What existing software serves this niche? What do they do well and poorly?
- Gaps and opportunities

Use your judgment on how many subtopics to research. Aim for **5-10 subtopics** for typical domains, but scale up as needed for complex or heavily regulated industries. A narrow niche like "dog grooming appointment booking" might need 5. A broad domain like "construction project management" might need 15+. Let the domain's complexity dictate the count -- prioritize sufficient depth over artificial limits.

### Step 3: Execute research in parallel
For EACH subtopic, spin up a **researcher** subagent (subagent_type: "researcher") that:
1. Performs deep web research on that subtopic as it relates to "$ARGUMENTS"
2. Writes a well-structured .md file to `references/` with its findings
3. Uses clear headers, bullet points, and concrete examples -- not vague summaries
4. Includes specific names, numbers, standards, and URLs where relevant
5. Focuses on information that would actually change how you build the software

**File naming**: `references/XX-slug.md` where XX is a zero-padded number and slug is a short kebab-case descriptor. Examples:
- `references/01-industry-overview.md`
- `references/02-user-workflows.md`
- `references/03-data-models.md`
- `references/04-ui-patterns.md`
- `references/05-integrations.md`
- `references/06-competitive-landscape.md`
- `references/07-compliance-regulations.md`

Launch ALL subagents in parallel (one Agent call per subtopic, all in the same message). Each agent should write its own file directly.

### Step 4: Create the index
After all subagents complete, create `references/README.md` with:
- The research topic
- Date of research
- A table of contents linking to each file with a one-line description of what it covers
- A "Key Takeaways for Development" section: 5-10 bullet points summarizing the most important things that should influence software design decisions for this domain

### What makes good research output
- **Specific > generic**: "Veterinary clinics typically use SOAP notes (Subjective, Objective, Assessment, Plan)" is useful. "Healthcare providers need good documentation" is not.
- **Actionable > academic**: Focus on what changes how you'd build the software.
- **Concrete examples**: Reference real products, real standards, real workflows.
- **Honest gaps**: If information is hard to find or uncertain, say so rather than padding with fluff.

### When done
Report: how many reference files were created, total approximate word count, and the 3 most surprising or non-obvious findings that would most impact software design for this domain.
