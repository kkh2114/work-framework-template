# ~/work 재설계 작업 기록

## 2026-06-24 — 위상체계 한글 전환 (카테고리 가/나/다 + 코드 1자리 축소)
- **카테고리 폴더 한글화**: `1-process`→`가-process` · `2-routine`→`나-routine` · `0-parking`→`다-parking`.
- **하위 코드 1단계 축소(맨 앞 카테고리 자리 제거)**: 도메인 `11-research`→`1-research`(가 하위)·`21-research`→`1-research`(나 하위); 단계 `110`→`10`·`112`→`12`; inbox 하위 `1311`→`311`; 루틴 버킷 `210`→`10`.
- 부모(가/나/다)가 카테고리를 구분 → 숫자코드는 더 이상 전역 유일이 아니며 **부모로 식별**(예 `1-research`가 process·routine 양쪽 존재).
- 폴더 일괄 rename(스켈레톤만, 프로젝트/날짜 폴더 불변) + `update-structure.sh`(카테고리 목록·헤더) + README·AGENTS·CLAUDE·GEMINI·STRUCTURE·business-folder-creator 스킬 동기화.
- 적용 범위: 라이브 `~/work`만. GitHub `file-system-creator` repo는 미적용(기존 숫자 체계 유지).

## 2026-06-15 — Cartesian Review 정비 (5렌즈 검토 후 즉시조치)
- ① 날짜 규칙 적용범위 정정: "모든 폴더"→"프로젝트/콘텐츠 폴더", 시스템 코드폴더·루틴 정의폴더는 예외 명시(불일치 제거).
- ② 넘버링 풀범례 중복 제거: AGENTS는 README(정본) 참조로 → "정본 1곳" 회복(drift 위험↓).
- ③ 규칙 위반 1건 시정: `1회차 탄넨바움 연주회 준비자료`에 날짜 프리픽스 부여(2025_05_09).
- ④ `_routine.md` 양식·예시를 AGENTS §4에 추가(푸시 프로토콜 작동 보장).
- ⑤ README에 "문서 지도(정본 맵)" 표 추가.

## 2026-06-15 — 넘버링 정정: 도메인 폴더에 카테고리 자리 추가
- **도메인 폴더 = `[카테고리][도메인]`**: `1-process/1-research`→`1-process/11-research`, `2-routine/1-research`→`2-routine/21-research` (business/personal 동일: 12/13, 22/23).
- 단계코드는 3자리 `[카테고리][도메인][단계]` 유지(reference=0): `110-reference`·`112-action`·`1311-new`·`210-routines`.
- 전 도메인 폴더 6개 rename + 단계 정합 + 문서·스크립트·STRUCTURE.md 동기화.
- (중간에 단계를 2자리로 바꾼 오해석이 있었으나 되돌림 — 최종은 위와 같음.)

## 2026-06-14 — 위상 재설계 v2 (Process / Routine 2-카테고리)
- 최상위를 **카테고리 계층**으로 재편: `0-parking` · `1-process`(생애주기형) · `2-routine`(반복업무형).
- 기존 3-Lab → `1-process` 밑 도메인으로 이동(`1-research`/`2-business`/`3-personal`, `-lab` 제거).
- **넘버링에 카테고리 자리 추가**: `12-action`→`112-action`, `311-new`→`1311-new` (Process 단계 3자리, inbox 하위 4자리).
- **Routine** 신설: 도메인별 `2D0-routines`(양식·작업공간) / `2D1-outputs`(결과). 푸시 프로토콜로 결과 커밋(AGENTS §4).
- 단계 의미 문서화(reference/inbox/action/result/share), README를 "LLM 중심 FS" 정체로 갱신.
- 문서 일괄 갱신: README·AGENTS(넘버링 3-레벨·Routine 푸시 §4)·CLAUDE·GEMINI·update-structure.sh(3-레벨 walker).
- 정리: 마이그레이션 후 옛 경로에 고정돼 돌던 좀비 Remotion studio 프로세스 종료 + 재생성된 stray `1-research-lab`(webpack 캐시) 제거.

## 2026-06-05 ~ 06-07 — 위상 전면 재설계 (3-Lab + Parking)

### 배경
기존 구조는 분류축 3개(주체/도구/상태)가 한 레벨에 섞이고, 빈 스캐폴드 30~40%,
Inbox 15G 적체, 동일 프로젝트의 다중 생애주기 분산으로 "새 파일 둘 곳이 매번 모호한" 상태였다.
→ 활동 성격 기준 **3개 랩 + 주차장**, 각 랩 내부 **Johnny-Decimal 생애주기 단계**로 재편.
(구조 규칙 정본은 [README.md](./README.md))

### 한 일
**신설**
- `1-research-lab` `2-business-lab` `3-personal-lab` `4-parking` + 단계 폴더(10~34, inbox 하위 111/112…)

**이동 (요약)**
- 개발앱(Field_Labor·g2b-radar·namecard_llm_wiki·sud-ax-academy·work-journal) → `1-research-lab/12-action`
  - ※ "개발앱=연구활동" 정의에 따름 (비즈니스랩은 회사 운영 업무용)
- R&D·지식시스템(SU_RND_PROJECT·AutoDesignFlow·process-blueprint·llm wiki/RAG·사내지식관리·위키테스트·옵시디언교안·카톡디깅·ClassMap·퍼스날브랜딩) → `1-research-lab/12-action`
- 참고자산(development tool/flutter·AI/agents·gpters·프로세스 청사진·zip류) → `1-research-lab/10-reference`
- 개인 결과물(Coaching·건기회 명찰·실내건축기술사) → `3-personal-lab/33-result`
- 음악회 영상 2개(10.7G) → `3-personal-lab/31-inbox/311-new`
- 경영자밋업 → `3-personal-lab/31-inbox/312-renewal`

**삭제**
- 빈 스캐폴드: Installers, Security, Archive, AI/{docs,mcp,prompts,python,node,skills,flutter-projects}, Personal/{Contents,Lectures}, Company/{References,Approvals,Reports,app,경영자의 밋업(빈)}, Research Project(빈)
- my-video 2벌 (~769M, 손 안 댄 Remotion 기본 템플릿)
- temp/ (외부 GitHub 클론 2개 — 재클론 복구 가능)
- add-youtube 스킬 (youtube-analyzer로 일원화, GitHub 반영)
- travel plan, 카카오대시보드, 전자명함 (사용자 판단)
- Workspace/ 전체 (잔여 Playwright 로그·구 설정만 남아 정리)

**구출 (중요)**
- `research-lab` 스킬 — Inbox에 프로젝트 로컬로만 있던 유일본(백업 없음).
  4-에이전트 Council 리서치 워크플로우. → 글로벌 활성(`~/.claude/skills`) + GitHub 백업 + 레퍼런스 사본 3중화.

### 남은 후속 과제
- `1-research-lab/12-action`이 17개로 붐빔 → 완료분을 13-result/14-share로 단계 정리
- `2-business-lab`는 비어있음 (회사 운영 업무는 주로 다른 PC) → 추후 채움
- `~/work/.claude` 루트 설정 폴더 정리 여부 검토
- 이 프로젝트를 위키로 구성 (README.md를 진입점으로)
