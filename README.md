<p align="center"><b>Language</b>: English · <a href="./README.zh-CN.md">中文</a></p>

<p align="center">
  <img src="assets/banner.png" alt="yotta-anti-shallow banner" width="100%" />
</p>

<h1 align="center">yotta-anti-shallow · 元谨 (Yuanjin)</h1>

<p align="center">A general-purpose anti-shallow AI output rules engine: <b>analyze first · then execute · self-check after</b>, curbing surface-level output. For any scenario that needs correctness and rigor — development, bug fixing, data analysis, architecture design, documentation, open-ended Q&amp;A.</p>
<p align="center">Activates automatically when it detects intent for deep analysis / end-to-end verification / root-cause tracing / rigorous execution / detailed checking; also applies automatically to any task at L3 (complex) and above — <b>judged by task nature, not keyword luck</b>.</p>
<p align="center">Pure rule text, zero dependencies, no injection, no execution takeover; install once, works across 78+ agents such as Claude Code / Codex / Cursor / OpenCode.</p>

<p align="center">
  <a href="LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-blue" /></a>
  <a href="https://agentskills.io/"><img alt="Standard: agentskills.io" src="https://img.shields.io/badge/standard-agentskills.io-orange" /></a>
  <a href="https://www.npmjs.com/package/@yottameta/yotta-anti-shallow"><img alt="npm package" src="https://img.shields.io/npm/v/@yottameta/yotta-anti-shallow" /></a>
  <a href="https://github.com/YottaMeta/yotta-anti-shallow"><img alt="GitHub stars" src="https://img.shields.io/github/stars/YottaMeta/yotta-anti-shallow" /></a>
  <a href="https://github.com/YottaMeta/yotta-anti-shallow/commits/main"><img alt="last commit" src="https://img.shields.io/github/last-commit/YottaMeta/yotta-anti-shallow" /></a>
  <a href="https://github.com/YottaMeta/yotta-anti-shallow"><img alt="PRs welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen" /></a>
</p>

## What it is

AI’s common shallow behavior on complex tasks: guessing when information is insufficient, giving a “perfect answer” with no derivation, stacking empty jargon, editing many files without explaining impact, faking completion without verifying. yotta-anti-shallow turns these recurring problems into executable rules, constraining output quality with a forced loop of **analyze first · then execute · self-check after**.

It is not a platform-specific feature; it is an agent-agnostic rule text: drop it into any agent that supports Agent Skills and it takes effect, constraining only output quality — it never takes over execution permissions and needs no resident service.

## Core value

- **Force analyze-before-execute** — for code changes / bug fixes / architecture refactor / doc writing / data analysis / open-ended Q&amp;A, first output the four-element analysis, then act.
- **Graded by complexity to avoid formalistic burden** — L1 simple tasks answer directly; L2 brief analysis then act; L3 full analysis + user confirmation; L4 break into multiple L3s.
- **Transparency assurance** — speculative conclusions must declare confidence (certain / high / medium / low / guess); pseudo-certainty is forbidden.
- **Self-check on completion** — proactively output a self-check report at task end, surfacing doubts and uncovered points.
- **Bottom line cannot be turned off** — when information is insufficient you must say so; never fake completion without verification; if the user interrupts, redo it — these stay in effect even when “rules off” is said.

## Core advantages

| Advantage | Description |
|---|---|
| **Dual-channel activation** | explicit wake-up (“rules on”) + automatic at L3+ tasks; automatic is judged by task nature, not keywords, closing the “didn’t say it, so no scrutiny” loophole |
| **Complexity-graded execution** | L1–L4 grading + length caps (L1 ≤ 200 / L2 analysis ≤ 300 / L3 analysis ≤ 600), neither shallow nor padded |
| **Complete confidence system** | five-tier confidence standard + declaration-strength grading (high confidence one line; medium-and-below full format), transparent without verbosity |
| **Closable but with a floor** | user can temporarily turn off process rules (R001/R003/R004), but the L1 hard floor (F001/F008/R005) can never be turned off |
| **Explicit instruction priority** | if user clearly says “no analysis”, comply and explicitly mark “rules temporarily adjusted”, without arguing |
| **Clear boundary** | pure creative / chat / results-only / pure factual retrieval are not forced to apply, avoiding formalistic burden |
| **Lightweight zero-dependency** | pure rule text, no daemon / no database / no injection; any agent supporting Agent Skills is install-and-use |
| **Ecosystem distribution** | GitHub + npm dual-source synced; three install methods (npx / install.sh / manual copy) covering 17+ agent directories |

## Rules (R001–R008)

| Rule | Effect |
|---|---|
| R001 Analyze before execute | complex tasks first output a four-element analysis; at L3+ execute after confirmation |
| R002 Forbidden behavior | F001–F009: nine forbidden items, e.g. no guessing, no jargon stacking, no faking completion |
| R003 Self-check protocol | proactively self-check after task completion (light / full ≤ 300) |
| R004 Confidence declaration | speculative conclusions labeled with five-tier confidence |
| R005 Interruption handling | user says “stop” → stop immediately, admit gap, re-analyze |
| R006 Complexity grading | L1–L4 graded execution + length caps |
| R007 Closing channel | can temporarily close; the L1 hard floor cannot |
| R008 Explicit instruction priority | user explicit instruction > rule default; conflicts handled per rules |

## Usage

In daily work, this skill activates in two ways: explicitly waking it (“shallow-proof rules on” / “apply the anti-shallow rules”), or automatically when the task reaches L3 (complex) and above. For typical shallow-prone tasks, the flow is:

```text
[REQUEST]  user asks a task
[ANALYZE]   L3+: output four-element analysis (goal / input / uncertainty / plan)
[EXECUTE]   carry out the task (at L3+ wait for user confirmation before acting)
[SELF-CHECK] output a self-check report at the end (confirmed / unconfirmed / risks)
```

The four analysis elements: **goal, input, uncertainty, plan** — state what you want to achieve, what (possibly insufficient) input you have, what is uncertain/unverified, and how you will proceed.

## Trigger

Use it when the user needs deep analysis, end-to-end verification, root-cause tracing, rigorous execution, or careful checking; or when the task is L3 (complex) and above. It is not needed for one-off simple Q&amp;A, pure creative work, or cases where the user only wants a result.

## Installation

Pick any of the three methods; skill files are always fetched from **npm** (GitHub can be slow without a proxy; npm supports mirrors).

### Method 1: npm (recommended, one-liner)
```bash
# Optional China mirror: npm config set registry https://registry.npmmirror.com
npx -y @yottameta/yotta-anti-shallow -g
npx -y @yottameta/yotta-anti-shallow --dir <your skills dir>   # any agent: install to a custom directory
```
> Agent not in the preset list? Use `--dir` to point at its skills directory, or copy manually (Method 3). `--list` shows the default directory of each agent. To grab the files yourself, run `npm pack @yottameta/yotta-anti-shallow` and unpack, then use Method 2 or 3.

### Method 2: install.sh
After obtaining the skill folder (`npm pack` unpack or `git clone`), enter the folder:
```bash
bash install.sh -g    # user-level; bash install.sh --list shows all directories
bash install.sh --agent codex   # a specific agent (see --list)
bash install.sh       # project-level: auto-detect existing skills directories
bash install.sh --dir /path/to/skills
```
> Covers 17 agent families, including Trae / Qwen / Comate / CodeBuddy / Kimi.

### Method 3: manual copy
Copy the whole `yotta-anti-shallow` folder into the target agent's skills directory. Common user-level locations (`%USERPROFILE%` on Windows, `~` on Linux/macOS):

| Agent | User-level directory | Project-level directory |
|---|---|---|
| Codex | `%USERPROFILE%\.codex\skills\yotta-anti-shallow\` | `.codex\skills\` |
| Claude Code | `%USERPROFILE%\.claude\skills\yotta-anti-shallow\` | `.claude\skills\` |
| Cursor | `%USERPROFILE%\.cursor\skills\yotta-anti-shallow\` | `.cursor\skills\` |
| Windsurf | `%USERPROFILE%\.codeium\windsurf\skills\yotta-anti-shallow\` | `.windsurf\skills\` |
| opencode | `%USERPROFILE%\.config\opencode\skills\yotta-anti-shallow\` | `.opencode\skills\` |
| Gemini | `%USERPROFILE%\.gemini\skills\yotta-anti-shallow\` | `.gemini\skills\` |
| Goose | `%USERPROFILE%\.config\goose\skills\yotta-anti-shallow\` | `.goose\skills\` |
| Amp | `%USERPROFILE%\.config\agents\skills\yotta-anti-shallow\` | `.agents\skills\` |
| Kiro | `%USERPROFILE%\.kiro\skills\yotta-anti-shallow\` | `.kiro\skills\` |
| WorkBuddy | `%USERPROFILE%\.workbuddy\skills\yotta-anti-shallow\` | `.workbuddy\skills\` |
| Trae Code CLI | `%USERPROFILE%\.traecli\skills\yotta-anti-shallow\` | `.traecli\skills\` |
| Trae IDE (CN) | `%USERPROFILE%\.trae-cn\skills\yotta-anti-shallow\` | `.trae\skills\` |
| Qwen Code | `%USERPROFILE%\.qwen\skills\yotta-anti-shallow\` | `.qwen\skills\` |
| Comate | `%USERPROFILE%\.comate\skills\yotta-anti-shallow\` | `.comate\skills\` |
| CodeBuddy | `%USERPROFILE%\.codebuddy\skills\yotta-anti-shallow\` | `.codebuddy\skills\` |
| Kimi | `%USERPROFILE%\.kimi\skills\yotta-anti-shallow\` | `.kimi\skills\` |
| Generic AGENTS.md | `%USERPROFILE%\.agents\skills\yotta-anti-shallow\` | `.agents\skills\` |

> If Codex's `CODEX_HOME` is set, it overrides the default; the same applies to opencode's `XDG_CONFIG_HOME`. `.agents\skills` is not a universal directory — only OpenCode / Cursor / Cline / Amp / Kimi / Gemini CLI / GitHub Copilot etc. read it; **Claude Code and Codex do not read it by default**. When unsure, use `--dir` or let the agent install it.

> Project-level: run `npx -y @yottameta/yotta-anti-shallow` or `bash install.sh` inside the project to install into the detected project-level directory.

## Upgrade / uninstall

- **Upgrade**: reinstall the latest version to overwrite — `npx -y @yottameta/yotta-anti-shallow -g` or rerun `bash install.sh -g`. Old rule files inside the skill directory are overwritten; other files already in the project are unaffected.
- **Uninstall**: delete the `yotta-anti-shallow` folder under the target agent’s skills directory (see the table above). After uninstalling, this rules engine no longer takes effect.

## FAQ

- **Will it trigger even for simple tasks?** No. L1 simple tasks (common-sense Q&amp;A, obvious answers) answer directly without forcing the analysis flow.
- **I don’t want to go through the analysis flow every time?** You can say “rules off / skip rules”; R001/R003/R004 close temporarily; the floor rules (F001/F008/R005) still apply.
- **Does it conflict with the host’s built-in Plan / thinking mode?** No. yotta-anti-shallow only constrains output quality; it does not take over execution permissions and is not a substitute for the host’s mode switches.
- **Which tasks suit it?** Tasks that need correctness and rigor: development, troubleshooting, architecture, docs, data analysis, open-ended Q&amp;A. Pure creative / chat / results-only are not forced.

## Related skills

Same family in the YottaMeta skill matrix (quality & engineering): [yotta-code-quality](https://github.com/YottaMeta/yotta-code-quality) (code quality review) complements yotta-anti-shallow — one prevents shallow output, the other checks whether quality is met.

## Development & checks

Inside this project run: `python tools/validate-skill.py yotta-anti-shallow`.

## License

MIT © YottaMeta — see [LICENSE](./LICENSE).
