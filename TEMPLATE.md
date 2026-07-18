# work-framework-template — LLM 중심 워크스페이스 구조 템플릿

LLM 중심 `~/work` 워크스페이스를 **구조·규칙만** 추출한 템플릿이다.
실제 프로젝트 내용물(계약·개인·업무 데이터)은 **전부 제외**했고, 빈 폴더 골격 + 라우터 문서만 담았다.

## 무엇이 들어있나
- **라우터·규칙 문서**: `README.md`(구조 정본) · `AGENTS.md`(작업 규칙 정본) · `CLAUDE.md`·`GEMINI.md`(엔진 어댑터) · `CHANGELOG.md`(재설계 이력)
- **인덱스 생성기**: `update-structure.sh` → `STRUCTURE.md` 자동 생성
- **빈 폴더 골격**: 가-process(생애주기) · 나-routine(반복) · 다-parking(미분류) · 라-custom-system(실가동 시스템)
- **스킬 의존성 지도**: `SKILLS.md` — 이 구조가 함께 쓰는 스킬과 그 의존성, 설치법

## 시작하기 (팀 온보딩)
1. 이 레포를 원하는 위치에 클론/복사 (`business-folder-creator` 프로젝트 스킬은 함께 딸려옴).
2. **[SKILLS.md](./SKILLS.md)를 읽고 "이 워크스페이스 운영에 필요한 스킬 목록"을 파악** → **워크스페이스 관리자에게 요청해 받는다.**
   (스킬 실물은 이 레포로 배포하지 않는다. 관리자가 선택적으로 지급.)
3. 받은 스킬을 `~/.claude/skills/` 에 넣는다. 의존성 있는 스킬은 SKILLS.md의 `dependsOn`도 함께.
4. `bash update-structure.sh` 로 STRUCTURE.md 갱신하며 사용 시작.
5. 규칙 정본은 `README.md`·`AGENTS.md`. 스킬 없이도 규칙은 문서에 있다.

> 전제: Claude Code(또는 Codex/Gemini) CLI가 설치돼 있어야 스킬이 작동한다.
