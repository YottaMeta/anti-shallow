#!/usr/bin/env bash
# anti-shallow 多智能体安装脚本（YottaSkills 模板）
# 用法: bash install.sh [-g|--global]
set -euo pipefail
SKILL_NAME="anti-shallow"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_to() {
  local dest="$1"
  mkdir -p "$dest/$SKILL_NAME"
  cp -r "$SOURCE_DIR/." "$dest/$SKILL_NAME/"
  echo "installed -> $dest/$SKILL_NAME"
}

echo "检测项目级智能体目录..."
for pair in ".claude/skills" ".cursor/skills" ".agents/skills" ".codex/skills"; do
  if [ -d "$pair" ]; then install_to "$pair"; fi
done

if [ "${1:-}" = "-g" ] || [ "${1:-}" = "--global" ]; then
  echo "安装到用户级目录..."
  for pair in "$HOME/.claude/skills" "$HOME/.cursor/skills" "$HOME/.codex/skills" "$HOME/.config/agents/skills"; do
    install_to "$pair"
  done
fi

echo "完成。未检测到目标目录时，请手动复制到对应智能体的 skills 目录。"
