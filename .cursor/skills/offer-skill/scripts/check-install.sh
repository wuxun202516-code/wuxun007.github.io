#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SKILL_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

fail() {
  printf 'offer-campus-install: %s\n' "$1" >&2
  exit 2
}

for required_file in \
  "$SKILL_ROOT/SKILL.md" \
  "$SKILL_ROOT/scripts/offer-campus.sh" \
  "$SKILL_ROOT/references/api-contract.md" \
  "$SKILL_ROOT/references/data-fields.md" \
  "$SKILL_ROOT/references/query-guidance.md" \
  "$SKILL_ROOT/references/platforms/index.md"
do
  [ -f "$required_file" ] || fail "安装包不完整，缺少 ${required_file#$SKILL_ROOT/}"
done

command -v curl >/dev/null 2>&1 || fail '当前环境未安装 curl'
sh "$SKILL_ROOT/scripts/offer-campus.sh" --help >/dev/null

printf '%s\n' \
  'Skill 文件：完整' \
  '查询依赖：curl 可用'

if [ -n "${OFFER_CAMPUS_API_KEY:-}" ]; then
  printf '%s\n' 'API Key：已配置（未回显）'
else
  printf '%s\n' 'API Key：未配置，请在当前产品的私密凭据或本机环境变量中配置'
fi

printf '%s\n' '安装检查：通过'
