#!/usr/bin/env bash
# STRUCTURE.md 자동 재생성기 (Process/Routine 2-카테고리 구조).
# 추적 범위: 폴더만, 날짜 프로젝트 폴더(`YYYY_MM_DD_…`)·프로젝트성 폴더 깊이까지.
#   = "코드 폴더"(이름 앞부분이 순수 숫자: 카테고리/도메인/단계/루틴버킷)는 재귀,
#     그 외(날짜폴더·이름폴더 = 프로젝트/루틴/결과)는 나열만 하고 내부는 추적 안 함.
# 각 폴더는 file:// 절대경로 링크로 출력 → 클릭 시 OS 파일 탐색기(Finder/탐색기)에서 열림.
# 골격이 실제로 바뀐 경우에만 다시 쓴다. 어느 엔진에서도 동일 실행 — 모델 중립.
cd "$(dirname "$0")" || exit 1
ROOT="$PWD"                 # file:// 링크용 절대경로 베이스 (이 머신 기준)
OUT="STRUCTURE.md"
TODAY="$(date +%Y-%m-%d)"

walk() {  # $1=경로  $2=깊이(정수)  → "깊이<TAB>절대경로<TAB>이름" 줄을 emit
  find "$1" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort | while read -r d; do
    local n code; n=$(basename "$d"); code="${n%%-*}"
    printf '%s\t%s\t%s\n' "$2" "$ROOT/$d" "$n"
    if [[ "$code" =~ ^[0-9]+$ ]]; then   # 코드 폴더만 재귀(프로젝트/날짜/이름 폴더에서 멈춤)
      walk "$d" "$(($2 + 1))"
    fi
  done
}

emit_tree() {  # 카테고리부터 walk → 탭 구분 트리 줄 emit
  for cat in 가-process 나-routine 다-parking 라-custom-system; do
    [ -d "$cat" ] || continue
    printf '%s\t%s\t%s\n' 0 "$ROOT/$cat" "$cat"
    walk "$cat" 1
  done
}

# 탭 구분 트리 줄 → 중첩 마크다운 목록 + file:// 인코딩 링크 (python 1회 호출)
format_tree() {
  python3 -c '
import sys, urllib.parse
for line in sys.stdin.read().splitlines():
    if not line.strip():
        continue
    parts = line.split("\t")
    if len(parts) != 3:
        continue
    depth, abspath, name = parts
    # 공백·한글·괄호 등 퍼센트 인코딩(슬래시는 보존) → Finder/탐색기가 정상 인식
    url = "file://" + urllib.parse.quote(abspath, safe="/")
    label = name.replace("[", "(").replace("]", ")")  # 링크 텍스트 깨짐 방지
    print("  " * int(depth) + "- [%s/](%s)" % (label, url))
'
}

gen() {
cat <<'HEADER'
# STRUCTURE.md — ~/work 구조 인덱스 (자동 생성)

> **용도**: 위치를 알 때 find/ls 전체 탐색 말고 이 파일을 먼저 읽는다 (탐색 토큰 절약).
> **자동 생성 파일 — 직접 편집 금지.** `update-structure.sh`가 구조 변경 시 재생성한다.
> **추적 범위**: 폴더만. 코드 폴더(카테고리/도메인/단계/루틴버킷)는 끝까지, **프로젝트·날짜·루틴 폴더는 나열만**(내부 미추적 → 필요하면 직접 `ls`).
> **링크**: 각 폴더는 `file://` 절대경로 링크 — **클릭 시 OS 파일 탐색기(Finder/탐색기)에서 열린다**. (절대경로라 이 머신 기준)
> 규칙·철학 정본은 README.md·AGENTS.md.

## 넘버링 즉시 해석 (자릿수 = 위치)
- 카테고리(폴더): **가**=process(생애주기형) · **나**=routine(반복업무형) · **다**=parking(미분류) · **라**=custom-system(커스텀 시스템)
- 도메인 폴더(1자리): **1**=research **2**=business **3**=personal → 예 `가-process/1-research`, `나-routine/1-research`
- Process 단계코드 = `[도메인][단계]` 2자리: 단계 **0**ref **1**inbox **2**action **3**result **4**share (inbox는 하위 구분 없이 프로젝트 직속)
  - 예: `10`=research·reference · `12`=action · `31`=personal·inbox
- Routine 버킷코드 = `[도메인][버킷]` 2자리: **0**routines(양식·작업공간) **1**outputs(결과) → 예 `10`=research·routines
- 프로젝트/결과 폴더 = `YYYY_MM_DD_이름`(생성일 순). 루틴 폴더 = 기능명(날짜 없음).
- 카테고리(가/나/다/라)가 부모로 구분하므로, 같은 숫자코드가 process·routine 양쪽에 있을 수 있다(부모로 식별).
HEADER
echo
echo "최종 자동 갱신: $TODAY"
echo
echo '## 현재 배치 (폴더만 · 클릭하면 Finder/탐색기에서 열림)'
echo
emit_tree | format_tree
}

new="$(gen)"
if [ -f "$OUT" ] && diff <(grep -v '^최종 자동 갱신:' "$OUT" 2>/dev/null) <(printf '%s\n' "$new" | grep -v '^최종 자동 갱신:') >/dev/null 2>&1; then
  exit 0
fi
printf '%s\n' "$new" > "$OUT"
echo "✓ STRUCTURE.md 갱신 ($TODAY)"
