#!/usr/bin/env bash
# anti-shallow 多智能体安装脚本（YottaSkills 模板）
# 用法: bash install.sh [-g|--global] [--dir PATH] [--list]
set -euo pipefail
SKILL_NAME="anti-shallow"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Git Bash / MSYS：转 Windows 风格路径，避免 /tmp 路径在外部 cp 的运行时里映射不一致
case "$(uname -s)" in
  MINGW*|MSYS*)
    SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -W)"
    ;;
esac

PROJECT_PAIRS=".claude/skills .cursor/skills .agents/skills .codex/skills .windsurf/skills .opencode/skills .gemini/skills .workbuddy/skills"
USER_PAIRS="$HOME/.claude/skills $HOME/.cursor/skills $HOME/.codex/skills $HOME/.config/agents/skills $HOME/.windsurf/skills $HOME/.config/opencode/skills $HOME/.gemini/skills $HOME/.workbuddy/skills"

install_to() {
  local dest="$1"
  mkdir -p "$dest/$SKILL_NAME"
  cp -r "$SOURCE_DIR/." "$dest/$SKILL_NAME/"
  rm -rf "$dest/$SKILL_NAME/.git"
  echo "installed -> $dest/$SKILL_NAME"
}

case "${1:-}" in
  --list)
    echo "项目级目录（检测已存在）: $PROJECT_PAIRS"
    echo "用户级目录（-g 创建）: $USER_PAIRS"
    exit 0
    ;;
  --dir)
    install_to "${2:?--dir 需要路径}"
    exit 0
    ;;
esac

if [ "${1:-}" = "-g" ] || [ "${1:-}" = "--global" ]; then
  echo "安装到用户级目录..."
  for pair in $USER_PAIRS; do install_to "$pair"; done
else
  echo "检测项目级智能体目录..."
  for pair in $PROJECT_PAIRS; do
    if [ -d "$pair" ]; then install_to "$pair"; fi
  done
fi

echo "完成。未检测到目标目录时，请手动复制到对应智能体的 skills 目录。"
