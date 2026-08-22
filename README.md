# anti-shallow · 防 AI 敷衍规则引擎

> 一套通用的「防 AI 敷衍」规则引擎技能，适用于开发、写作、数据分析、架构设计等所有场景。
> 它通过「先分析 · 再执行 · 后自检」的强制流程，遏制表面化输出。

## 这是什么

`anti-shallow` 是一个可插拔的规则引擎技能。当它被激活时，会强制 AI 在动手前先给出含 **根因 / 推理 / 影响范围 / 不确定性** 的分析报告；推测性结论必须附带置信度声明；任务结束前强制自检并主动暴露疑虑；用户一句「停」即可触发重新分析。

## 触发方式

在对话中表达「需要深入分析 / 全链路验证 / 根因追溯 / 严谨执行 / 细致检查」的意图时自动激活，例如：

- 「深入看看」「严谨点」「仔细查」「全链路」
- 「根因」「追溯」「审视」「反思」「自我检查」「验证」「证明」
- 「别糊弄」「上规则」「不要敷衍」
- 也可显式调用技能：`anti-shallow`

规则可临时关闭（「关掉规则 / 暂停规则」），但「信息不足须明说」与「打断必重来」为**不可关闭的底线**。

## 安装

三种方式任选其一，技能文件统一从 **npm** 获取（GitHub 无代理时较慢，npm 可配国内镜像加速）。

### 方式一：npm（推荐，一行安装）
```bash
# 国内加速（可选）：npm config set registry https://registry.npmmirror.com
npx -y @yottameta/anti-shallow -g
```
> 想手动拿文件也可 `npm pack @yottameta/anti-shallow` 解包后按方式二/三安装。

### 方式二：install.sh 一键安装
获取技能文件夹后（`npm pack` 解包或 `git clone`），进入技能文件夹：
```bash
bash install.sh -g    # 用户级；bash install.sh --list 查看全部目录
bash install.sh       # 项目级：自动检测已存在的 .claude/.cursor/.agents/.codex/.windsurf/.opencode/.gemini/.workbuddy/skills
bash install.sh --dir /path/to/skills
```
> 覆盖 8 类智能体：Claude Code / Cursor / Codex / Windsurf / opencode / Gemini / WorkBuddy / 通用 Agent。Windows 用户：装有 Git Bash 即可用；否则用方式三手动复制。

### 方式三：手动复制
把整个 `anti-shallow` 文件夹复制到目标 skills 目录：

| 智能体 | 用户级目录 |
|---|---|
| Codex | `%USERPROFILE%\.codex\skills\anti-shallow\` |
| Claude Code | `%USERPROFILE%\.claude\skills\anti-shallow\` |
| Cursor | `%USERPROFILE%\.cursor\skills\anti-shallow\` |
| 通用 | `%USERPROFILE%\.agents\skills\anti-shallow\` |
## 核心规则（节选）

- **R001 强制先分析，再执行**：代码修改 / Bug 排查 / 架构重构 / 文档写作 / 数据分析 / 开放问答，必须先输出分析（根因、受影响范围、方案取舍、局限性），不得直接产出。
- **分析四要素**：根因 / 核心判断、影响范围、可选方案、不确定性声明——缺一不可，缺一则视为敷衍。
- **置信度声明**：推测性结论必须标注置信度，禁止伪确定。
- **结束自检**：任务完成后强制自检并主动暴露疑虑与未覆盖点。

## 使用示例

1. 将本仓库的 `SKILL.md` 接入任意 AI 智能体的技能/规则系统（见上方安装）。
2. 在对话中自然表达深入分析意图，或显式说「上 anti-shallow 规则」。
3. 需要关闭时直接说「关掉规则」，底线规则仍生效。

## 开发与校验

本项目内运行：`python tools/validate-skill.py anti-shallow`。

## 许可证

MIT © YottaMeta —— 详见 [LICENSE](./LICENSE)。
