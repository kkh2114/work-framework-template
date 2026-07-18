# work-framework-template — LLM 중심 워크스페이스 구조 템플릿

LLM 중심 `~/work` 워크스페이스를 **구조·규칙만** 추출한 템플릿이다.
실제 프로젝트 내용물(계약·개인·업무 데이터)은 **전부 제외**했고, 빈 폴더 골격 + 라우터 문서만 담았다.

## 무엇이 들어있나
- **라우터·규칙 문서**: `README.md`(구조 정본) · `AGENTS.md`(작업 규칙 정본) · `CLAUDE.md`·`GEMINI.md`(엔진 어댑터) · `CHANGELOG.md`(재설계 이력)
- **인덱스 생성기**: `update-structure.sh` → `STRUCTURE.md` 자동 생성
- **빈 폴더 골격**: 가-process(생애주기) · 나-routine(반복) · 다-parking(미분류) · 라-custom-system(실가동 시스템)
- **스킬 의존성 지도**: `SKILLS.md` — 이 구조가 함께 쓰는 스킬과 그 의존성, 설치법

## 시작하기
1. 이 레포를 원하는 위치에 클론/복사.
2. `SKILLS.md`를 읽고 필요한 스킬 설치 (`kkh2114/claude-skills`의 `install.sh` 하나로 대부분 해결).
3. `bash update-structure.sh` 로 STRUCTURE.md 갱신하며 사용 시작.
4. 규칙 정본은 `README.md`·`AGENTS.md`. 스킬 없이도 규칙은 문서에 있다.
