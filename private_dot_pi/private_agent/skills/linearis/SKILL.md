---
name: linearis
description: Interacts with Linear.app for ticket management using the linearis CLI tool. ALWAYS run `linearis usage` first to see available commands and options. Use when working with Linear issues, tickets, comments, documents, projects, teams, cycles (sprints), or file uploads/downloads.
Keywords: Linear, tickets, issues, sprints, backlogs, task management, project tracking.
license: MIT
compatibility: Requires the linearis CLI tool (npm install -g linearis) and LINEAR_API_TOKEN environment variable or ~/.linear_api_token file.
---

# Linearis Skill

Use the `linearis` CLI tool to interact with Linear for ticket management.

> **Important:** Always run `linearis usage` first to see the full command reference and available options.

> **Important:** Always check for tasks relative to my user ID - access the user ID through the `LINEAR_USER_ID` environment variable.

> **Important:** When searching for my tasks **ALWAYS** use the `linearis issues search --assignee $(echo "$LINEAR_USER_ID") ""` command.

## Authentication

Linearis checks for credentials in this order:
1. `--api-token <token>` flag
2. `LINEAR_API_TOKEN` environment variable
3. `~/.linear_api_token` file (create once with `echo "<token>" > ~/.linear_api_token`)

### User ID

For commands that require a user ID (e.g., filtering issues by assignee), use the `LINEAR_USER_ID` environment variable:

## Quick Reference

```bash
# Show all available commands
linearis usage

# Show sub-commands
linearis issues
linearis labels
linearis projects
```

## Issues

```bash
# List recent issues (default: 10)
linearis issues list -l 10

# Search issues
linearis issues search "authentication" --team Platform

# Create issue
linearis issues create "Fix login timeout" \
  --team Backend \
  --assignee user123 \
  --labels "Bug,Critical" \
  --priority 1 \
  --description "Users can't stay logged in"

# Read issue (supports ABC-123 format)
linearis issues read DEV-456

# Update issue
linearis issues update ABC-123 --status "In Review" --priority 2

# Add labels
linearis issues update ABC-123 --labels "Frontend,UX" --label-by adding

# Clear labels
linearis issues update ABC-123 --clear-labels

# Set parent (for sub-tasks)
linearis issues update SUB-001 --parent-ticket EPIC-100
```

## Comments

```bash
# Add comment
linearis comments create ABC-123 --body "Fixed in PR #456"
```

## Files

```bash
# Download file from issue embeds
linearis embeds download "<url>" --output ./file.png

# Upload file
linearis embeds upload ./screenshot.png
# Returns: { "success": true, "assetUrl": "...", "filename": "..." }

# Use in comment
URL=$(linearis embeds upload ./bug.png | jq -r .assetUrl)
linearis comments create ABC-123 --body "See: ![$URL]($URL)"
```

## Documents

```bash
# Create document
linearis documents create --title "API Design" --content "# Overview"

# Create in project, attach to issue
linearis documents create --title "Bug Analysis" --project Backend --attach-to ABC-123

# List/Read/Update/Delete
linearis documents list
linearis documents read <id>
linearis documents update <id> --title "New Title"
linearis documents delete <id>
```

## Projects & Labels

```bash
# List projects
linearis projects list

# List labels for team
linearis labels list --team Backend
```

## Teams & Users

```bash
# List teams
linearis teams list

# List users
linearis users list --active
```

When filtering issues by assignee or other user-specific queries, use the `LINEAR_USER_ID` environment variable (set above) instead of hardcoding user IDs.

## Cycles (Sprints)

```bash
# List cycles for team
linearis cycles list --team Backend --limit 10

# Active cycle only
linearis cycles list --team Backend --active

# Active ± 3 cycles
linearis cycles list --team Backend --around-active 3
```

## Tips

- **Ticket IDs** follow format `ABC-123` — always use this format
- **JSON output** — pipe to `jq` for parsing: `linearis issues list | jq '.[] | .identifier'`
- **Priority** values: 1=Urgent, 2=High, 3=Medium, 4=Low
- **When creating tickets**, ask user which project/team if unclear
- **For sub-tasks**, use the parent ticket's project by default
- **Progress updates** > checkbox changes → add as comment, not update description
- **File downloads** include signed URLs with expiration — download promptly
