---
name: business-folder-creator
description: "Use when creating a BUSINESS (수주·계약) project folder under ~/work's business domain 가-process/2-business/. Triggers: 비즈니스 폴더 만들어, 수주/계약 프로젝트 시작, 발주 프로젝트, 2-business에 폴더 만들어, create business project folder. Also drives commit message writing for these folders (커밋해줘). NOT for research/personal folders."
user-invocable: true
argument-hint: "/business-folder-creator [2-business 단계 경로]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Bash
  - AskUserQuestion
---

# business-folder-creator — 비즈니스 폴더 크리에이터

## Overview
회사 **수주·계약(발주자 있는)** 프로젝트 폴더를 만들 때 **문답으로 한 단계씩** 안내해 폴더명·git·커밋 규칙을 세운다.

> 엔진 중립 정본은 `~/work/AGENTS.md §5` — 이 스킬과 **같은 절차**다(한쪽 고치면 다른 쪽도 맞춘다). 다른 엔진(Antigravity·Codex)은 §5를 직접 따른다.

## 작동 범위 (제한)
- **`가-process/2-business/` 하위에서만** 작동한다 (신규 수주는 보통 `21-inbox`, 진행 건은 `22-action`).
- 대상이 `2-business` 밖(연구 `1-research`·개인 `3-personal`·parking 등)이면 → "이 스킬은 비즈니스(수주/계약) 폴더 전용"이라 안내하고 **중단**한다.

## 언제 쓰나
- "비즈니스 폴더 만들어줘", "새 수주/계약 프로젝트 시작", "2-business에 프로젝트 만들어"
- 발주자·계약 기반 업무를 새 폴더로 시작할 때 / 이 폴더에 "커밋해줘" 할 때

## 진행 원칙
**한 번에 한 가지만 묻는다.** 사용자가 이미 준 정보는 건너뛴다.

## 1단계 — 폴더명 (`YYYY_MM_DD_발주자_계약명_생성자`)
순서대로 묻는다: 1) **발주자**(예 `ABC건설`) 2) **계약명**(예 `○○동-수장공사`) 3) **생성자**(예 `담당자`) 4) **날짜**(기본 오늘).
→ 필드 내부 공백은 `-`, 필드 구분은 `_`. 예: `2026_06_15_ABC건설_○○동-수장공사_담당자`
→ **대상 단계** 확인: 기본 `가-process/2-business/21-inbox`(신규 수주). 진행 건이면 `22-action` 등. 확정 후 `mkdir -p`.

## 2단계 — git 관리 여부·저장소 위치
1. git으로 관리할까요? (예/아니오 — 아니오면 3·4단계 생략)
2. 예면 위치: **로컬만**(`git init`) / **GitHub 원격**(레포명·공개여부 묻고 `gh repo create <name> --private|--public --source=. --remote=origin`) / **기타 원격**(URL 받아 `git init`+`git remote add origin`)

## 3단계 — git 관리 원칙 (커밋 태그 분류)
- **이 프로젝트의 커밋 태그 분류는?** (예: `도면`/`문서`/`엑셀`/`사진·현장`/`발주자제공자료`/`계약·공문` …)
→ 합의 목록을 폴더 루트 `_project.md`의 `commit_tags`에 기록(커밋 헬퍼가 참조).

## 4단계 — 커밋 헬퍼 ("커밋해줘" 할 때마다)
1. **태그 선택** — `_project.md`의 `commit_tags` 중 하나.
2. **제목** — **한글 25자 / 영문 50자 이내** (초과 시 줄여 다시 받음).
3. **내용(본문)** — 무엇을·왜.
→ 메시지 = `[태그] 제목` + 빈 줄 + 본문. 그 뒤 `git add -A && git commit`.

## `_project.md` 양식 (폴더 루트)
```markdown
---
project: <계약명>
client: <발주자>
creator: <생성자>
created: <YYYY-MM-DD>
git: local | github:<repo> | remote:<url> | none
commit_tags: ["도면", "문서", "엑셀", "사진/현장", "발주자제공자료"]
---
<발주자> 발주 — <계약명> 프로젝트.
```

## Quick Reference
| 단계 | 묻는 것 | 산출 |
|------|---------|------|
| 0 | (작동 범위 확인) | `2-business` 밖이면 중단 |
| 1 | 발주자·계약명·생성자·날짜·단계 | `가-process/2-business/<단계>/YYYY_MM_DD_발주자_계약명_생성자/` |
| 2 | git 관리? 저장소 위치? | git init (+remote) |
| 3 | 커밋 태그 분류? | `_project.md`의 `commit_tags` |
| 4 | 태그·제목(≤25/50)·내용 | `[태그] 제목` + 본문 커밋 |

## 주의
- 폴더명 날짜는 `~/work` 규칙(`YYYY_MM_DD`)과 일치.
- 4단계 제목 길이 초과 시 통과시키지 말고 다시 받는다.
- `2-business` 외 도메인에는 만들지 않는다(범위 제한).
