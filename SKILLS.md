# SKILLS.md — 이 워크스페이스 운영에 필요한 스킬 목록

> 이 문서는 **"이 구조를 제대로 쓰려면 어떤 스킬이 필요한지"** 를 알려주는 **필요 목록**이다.
> **스킬 실물은 이 레포로 배포하지 않는다.** 워크스페이스 관리자가 팀원에게 **선택적으로 지급**한다.
> 팀원은 아래 목록으로 "무엇이 필요한지"만 파악하고, 관리자에게 요청해 받으면 된다.

## 전제 조건
- **에이전트 CLI**: Claude Code(권장) / Codex / Gemini CLI 중 하나. 스킬은 이 CLI가 있어야 작동한다.
- 스킬 설치 위치: 받은 스킬 폴더를 `~/.claude/skills/<스킬명>/` 에 넣으면 된다(전역). 프로젝트 전용은 `<이 레포>/.claude/skills/` 에.

## 받은 스킬 설치법 (관리자에게 받은 뒤)
```bash
# 관리자가 준 <스킬명> 폴더를 전역 스킬 위치로 복사
cp -R <받은-스킬폴더> ~/.claude/skills/
# 의존성이 있는 스킬은, 아래 표의 dependsOn 스킬도 함께 받아 같이 넣어야 작동한다.
```

---

## 필요 스킬 목록

### A. 라우터가 직접 부르는 스킬 (CLAUDE.md·AGENTS.md가 명시적으로 호출)
| 스킬 | 용도 | 트리거 | 없으면 |
|------|------|--------|--------|
| `graphify` | 지식 그래프 생성 | `/graphify` | 그래프 자동화만 비활성(구조·문서 정상) |
| `research-lab` | Council 방식 리서치 | `/research-lab`·"리서치 시작" | 리서치 자동화 비활성 |

### B. 운영 전반에 쓰는 스킬 (있으면 자동화, 없으면 수동)
| 스킬 | 용도 | **함께 받아야 할 것(dependsOn)** | 권장(optional) |
|------|------|-------------------------------|----------------|
| `content-to-wiki` | URL/영상 → 위키 노트 | — | — |
| `cartesian-review` | 데카르트 5렌즈 검토 | — | — |
| `harness-designer-workspace` | 워크스페이스 하네스 설계 | — | cartesian-review |
| `harness-designer-coding` | 코딩 하네스 설계 | — | cartesian-review |
| `harness-redesign` | 하네스 구조·규칙 변경 + 전파·일관성검증 | harness-designer-workspace, harness-designer-coding | (전이적) cartesian-review |
| `harness-retrofit` | 기존 코드 → 루프 검증 구조 개편 | harness-designer-coding | (전이적) cartesian-review |
| `safe-move` | 경로 이동/rename 시 참조 무결 전파 | harness-designer-coding, harness-redesign | (전이적) cartesian-review |

> **의존성 읽는 법**: `dependsOn`에 적힌 스킬을 **함께 받아 같이 넣어야** 그 스킬이 작동한다.
> 예) `safe-move`를 받으려면 → `harness-designer-coding` + `harness-redesign`(+ 그게 다시 부르는 `harness-designer-workspace`)도 함께. 권장(soft)인 `cartesian-review`는 없어도 되나 있으면 검토 품질↑.

### C. 이 레포에 이미 포함된 프로젝트 전용 스킬 (지급 불필요)
| 스킬 | 위치 | 용도 |
|------|------|------|
| `business-folder-creator` | `.claude/skills/`(→`.agents/skills/` 심링크) | 수주·계약 비즈니스 폴더 생성(`가-process/2-business`) + 커밋 메시지. **클론하면 바로 딸려옴** |

---

## 스킬이 하나도 없어도
이 템플릿의 철학은 **"스킬 없이도 규칙은 문서에 있다"** — 스킬은 그 규칙을 자동 실행하는 어댑터일 뿐이다. 정본 규칙은 항상 `README.md`·`AGENTS.md`에 있으므로, 스킬이 없으면 해당 절차를 **평문으로 직접 수행**하면 된다. 스킬은 "있으면 자동화, 없으면 수동"이다.
