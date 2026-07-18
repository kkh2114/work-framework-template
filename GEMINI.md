# GEMINI.md — ~/work 에이전트 진입점 (Gemini / Google Antigravity)

> Gemini·Antigravity용 **얇은 어댑터**. 내용 정본은 따로 있고 여기서는 가리키기만 한다.
> 이 파일은 **200줄 이하**로 유지한다. (카파시 위키 단순화 원칙)

## 이 워크스페이스 — LLM 중심 파일 시스템
최상위 2 활동 카테고리 + 주차장 + 운영 시스템. **구조·배치·단계의미 정본은 → [README.md](./README.md)**
- `가-process` 생애주기형(idea→develop→result→share) · `나-routine` 반복업무형(routines/outputs) · `다-parking` 미분류 · `라-custom-system` 이 맥에서 실제 가동 중인 시스템(자체 MCP·스크립트 등, 평평)
- 도메인(`가`·`나` 공통): `1-research`(개발앱·지식·R&D) · `2-business`(회사운영) · `3-personal`(개인) — `다`·`라`는 도메인 없음
- ⚠️ `라` vs `1-research`: 연구·개발 중이면 research, **실가동에 투입되면 라**

## 작업 규칙 (엔진 중립 정본 → [AGENTS.md](./AGENTS.md))
- 작업·문서 규칙의 **정본은 `AGENTS.md`** 다. Claude Code도 같은 파일을 따른다.
- Gemini / Antigravity는 슬래시 커맨드가 없을 수 있으니, `AGENTS.md`의 절차를 **평문으로 직접 수행**한다.
- 핵심:
  1. 새 항목 배치는 README의 "배치 규칙"대로 (반복=routine/흐름=process/애매=`다-parking`)
  2. 넘버링: 카테고리=가/나/다/라, 도메인폴더 1자리(예 `1-research`), 단계코드 2자리 `[도메인][단계]`(예 `10`·`12`·`31`=personal·inbox), 루틴버킷 2자리(예 `10`), 프로젝트 폴더는 `YYYY_MM_DD_이름`. inbox는 하위 구분(new/renewal) 없이 프로젝트 직속.
  3. 삭제·이동 전 내용 확인, git 아닌 폴더의 영구삭제 주의. **단계 간 이동 시 `.git` 유지/제거를 반드시 문답**(AGENTS §2)
  4. 문서는 AGENTS.md §1 작성 규칙(≤200줄·정본1곳·상세분리) 준수
  5. **파일찾기 요청 시** AGENTS.md §3 필수 절차 따름 (검색 전 범위 확인[대상·매칭] → 검색 → 클릭 링크 제시)
  6. **"푸시해/아웃풋해"** = AGENTS.md §4 Routine 푸시 프로토콜 수행 (결과→outputs, 작업공간 정리)
  7. **비즈니스(수주/계약) 폴더 생성** = AGENTS.md §5 절차 따름 (`가-process/2-business` 하위, 폴더명·git·태그·커밋 헬퍼)
- `STRUCTURE.md` 갱신: Antigravity엔 훅이 없으니 폴더 변경 직후 `bash update-structure.sh`를 직접 실행한다.

## 링크
- [STRUCTURE.md](./STRUCTURE.md) — 현재 폴더 배치 인덱스 (탐색 대신 먼저 읽기)
- [README.md](./README.md) — 구조·배치 정본
- [AGENTS.md](./AGENTS.md) — 작업·문서 규칙 정본 (엔진 중립)
- [CLAUDE.md](./CLAUDE.md) — Claude Code 어댑터 (이 파일의 형제)
