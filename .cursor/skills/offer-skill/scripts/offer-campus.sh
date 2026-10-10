#!/usr/bin/env sh
set -eu

BASE_URL="${OFFER_CAMPUS_BASE_URL:-https://openapi.offerxiansheng.com/backend-service}"
BASE_URL="${BASE_URL%/}"
API_KEY="${OFFER_CAMPUS_API_KEY:-}"

usage() {
  printf '%s\n' \
    'Usage:' \
    '  offer-campus.sh recent [limit] [cursor]' \
    '  offer-campus.sh deadline <1|3|7> [limit] [cursor]' \
    "  offer-campus.sh search '<json-body>'" >&2
}

fail() {
  printf 'offer-campus: %s\n' "$1" >&2
  exit 2
}

validate_limit() {
  case "$1" in
    ''|*[!0-9]*) fail 'limit 必须是 1–100 的整数' ;;
  esac
  [ "$1" -ge 1 ] && [ "$1" -le 100 ] || fail 'limit 必须在 1–100 之间'
}

command_name="${1:-}"
case "$command_name" in
  -h|--help|'')
    usage
    exit 0
    ;;
esac

[ -n "$API_KEY" ] || fail '未配置 OFFER_CAMPUS_API_KEY'
command -v curl >/dev/null 2>&1 || fail '当前环境未安装 curl'

case "$command_name" in
  recent)
    limit="${2:-20}"
    cursor="${3:-}"
    validate_limit "$limit"
    if [ -n "$cursor" ]; then
      curl -sS --get \
        -H "Authorization: Bearer $API_KEY" \
        --data-urlencode "limit=$limit" \
        --data-urlencode "cursor=$cursor" \
        "$BASE_URL/open/v1/campus-recruit/recent"
    else
      curl -sS --get \
        -H "Authorization: Bearer $API_KEY" \
        --data-urlencode "limit=$limit" \
        "$BASE_URL/open/v1/campus-recruit/recent"
    fi
    ;;
  deadline)
    within_days="${2:-}"
    limit="${3:-20}"
    cursor="${4:-}"
    case "$within_days" in
      1|3|7) ;;
      *) fail 'within_days 只能是 1、3 或 7' ;;
    esac
    validate_limit "$limit"
    if [ -n "$cursor" ]; then
      curl -sS --get \
        -H "Authorization: Bearer $API_KEY" \
        --data-urlencode "within_days=$within_days" \
        --data-urlencode "limit=$limit" \
        --data-urlencode "cursor=$cursor" \
        "$BASE_URL/open/v1/campus-recruit/upcoming-deadline"
    else
      curl -sS --get \
        -H "Authorization: Bearer $API_KEY" \
        --data-urlencode "within_days=$within_days" \
        --data-urlencode "limit=$limit" \
        "$BASE_URL/open/v1/campus-recruit/upcoming-deadline"
    fi
    ;;
  search)
    body="${2:-}"
    [ -n "$body" ] || fail 'search 需要一个 JSON 请求体'
    curl -sS -X POST \
      -H "Authorization: Bearer $API_KEY" \
      -H 'Content-Type: application/json' \
      --data "$body" \
      "$BASE_URL/open/v1/campus-recruit/search"
    ;;
  *)
    usage
    fail '未知命令'
    ;;
esac

printf '\n'
