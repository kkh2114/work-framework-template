# CLAUDE.md — ~/work 에이전트 진입점

> 얇은 **라우터**다. 상세는 링크된 파일에 두고 여기서는 가리키기만 한다.
> 이 파일은 **200줄 이하**로 유지한다. (카파시 위키 단순화 원칙)

## 이 워크스페이스 — LLM 중심 파일 시스템
최상위 2 활동 카테고리 + 주차장 + 운영 시스템. **구조·배치·단계의미 정본은 → [README.md](./README.md)**
- `가-process` 생애주기형(idea→develop→result→share) · `나-routine` 반복업무형(routines/outputs) · `다-parking` 미분류 · `라-custom-system` 이 맥에서 실제 가동 중인 시스템(자체 MCP·스크립트 등, 평평)
- `가`·`나` 밑 도메인: `1-research`(개발앱·지식·R&D) · `2-business`(회사운영) · `3-personal`(개인) — `다`·`라`는 도메인 없음
- ⚠️ `라` vs `1-research`: 연구·개발 중이면 research, **실가동에 투입되면 라**
- **현재 폴더 배치를 알아야 하면 → [STRUCTURE.md](./STRUCTURE.md) 를 먼저 읽는다** (find/ls 전체 탐색 금지 — 탐색 토큰 절약)

## 에이전트가 지킬 핵심 (상세는 → [AGENTS.md](./AGENTS.md))
1. 새 항목 배치는 README의 "배치 규칙"대로 (반복=routine/흐름=process/애매=`다-parking`)
2. 넘버링: 카테고리=가/나/다/라, 도메인폴더 1자리(예 `1-research`), 단계코드 2자리 `[도메인][단계]`(예 `10`=ref, `12`=action, `31`=personal·inbox), 루틴버킷 2자리(예 `나-routine/1-research/10`=routines). **inbox는 하위 구분(new/renewal) 없이 프로젝트 직속.**
3. 삭제·이동 전 내용 확인, git 아닌 폴더의 영구삭제 주의. **단계 간 이동 시 `.git` 유지/제거를 반드시 문답**(AGENTS §2 — 숨김폴더 과적재 방지)
4. 문서 작성은 아래 규칙을 따른다
5. **파일찾기 요청 시** AGENTS.md §3 필수 절차 따름 (검색 전 범위 확인[대상: 폴더/파일/둘다 · 매칭: 의미/키워드/둘다] → 검색 → 후보를 클릭 링크로 제시)
6. **"푸시해/아웃풋해"** = AGENTS.md §4 Routine 푸시 프로토콜 수행 (결과→outputs, 작업공간 정리)
7. **비즈니스(수주/계약) 폴더 생성** = `business-folder-creator` 스킬 (=AGENTS.md §5 동일 절차, `가-process/2-business` 하위)

## 문서 작성 규칙 (요약 — 정본은 AGENTS.md)
- 진입 파일(CLAUDE.md·SKILL.md·AGENTS.md)은 **200줄 이하**, 목차·라우터 역할만
- 상세(규칙·절차·프롬프트·예시)는 **별도 .md**(agents/·references/)로 분리, 진입 파일은 링크만
- **정본은 1곳에만** — 같은 내용 중복 금지(drift 방지). 고칠 땐 한 곳만
- 깊은 내용은 **필요할 때만 로드**되게 → 컨텍스트 절약

## 다중 엔진 (중립)
이 워크스페이스는 Claude Code와 Gemini/Antigravity로 함께 관리한다.
정본은 `README.md`+`AGENTS.md`(엔진 중립) 한 벌뿐이고, 각 엔진은 얇은 어댑터로 진입한다.
- Claude Code → 이 `CLAUDE.md`
- Gemini / Antigravity → [GEMINI.md](./GEMINI.md)
→ 규칙을 고칠 땐 정본(README/AGENTS)만 고친다. 어댑터는 가리키기만 하므로 동기화 불필요.

## 링크
- [STRUCTURE.md](./STRUCTURE.md) — 현재 폴더 배치 인덱스 (탐색 대신 먼저 읽기)
- [README.md](./README.md) — 구조·배치 정본 (위키 진입점)
- [AGENTS.md](./AGENTS.md) — 작업·문서 규칙 정본 (엔진 중립)
- [GEMINI.md](./GEMINI.md) — Gemini/Antigravity 어댑터 (이 파일의 형제)
- [CHANGELOG.md](./CHANGELOG.md) — 재설계 이력
