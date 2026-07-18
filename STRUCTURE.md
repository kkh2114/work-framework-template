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

최종 자동 갱신: 2026-07-18

## 현재 배치 (폴더만 · 클릭하면 Finder/탐색기에서 열림)

- [가-process/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process)
  - [1-research/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/1-research)
    - [10-reference/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/1-research/10-reference)
    - [11-inbox/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/1-research/11-inbox)
    - [12-action/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/1-research/12-action)
    - [13-result/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/1-research/13-result)
    - [14-share/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/1-research/14-share)
  - [2-business/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/2-business)
    - [20-reference/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/2-business/20-reference)
    - [21-inbox/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/2-business/21-inbox)
    - [22-action/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/2-business/22-action)
    - [23-result/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/2-business/23-result)
    - [24-share/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/2-business/24-share)
  - [3-personal/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/3-personal)
    - [30-reference/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/3-personal/30-reference)
    - [31-inbox/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/3-personal/31-inbox)
    - [32-action/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/3-personal/32-action)
    - [33-result/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/3-personal/33-result)
    - [34-share/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EA%B0%80-process/3-personal/34-share)
- [나-routine/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine)
  - [1-research/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine/1-research)
    - [10-routines/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine/1-research/10-routines)
    - [11-outputs/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine/1-research/11-outputs)
  - [2-business/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine/2-business)
    - [20-routines/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine/2-business/20-routines)
    - [21-outputs/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine/2-business/21-outputs)
  - [3-personal/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine/3-personal)
    - [30-routines/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine/3-personal/30-routines)
    - [31-outputs/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%82%98-routine/3-personal/31-outputs)
- [다-parking/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%8B%A4-parking)
- [라-custom-system/](file:///private/tmp/claude-501/-Users-kimgilho-work/75b8aea8-2b76-433c-a359-7dfc4989f94c/scratchpad/work-template/%EB%9D%BC-custom-system)
