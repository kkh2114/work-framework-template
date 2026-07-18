# SKILLS.md — 이 워크스페이스가 의존하는 스킬

> 이 템플릿(폴더 구조 + 라우터 문서)은 **에이전트 스킬**과 함께 작동하도록 설계됐다.
> 아래 스킬이 없어도 폴더 구조 자체는 동작하지만, `/graphify`·비즈니스 폴더 생성·리서치 등
> **자동화 기능은 해당 스킬이 설치돼 있어야** 작동한다.
> 이 문서는 "무엇을 더 내려받아야 하는지"를 알려주는 **의존성 지도**다.

## 한 번에 설치 (권장)

대부분은 아래 하나로 끝난다 — `install.sh`가 각 스킬의 `dependsOn`을 **자동으로 함께** 설치한다:

```bash
git clone https://github.com/kkh2114/claude-skills
cd claude-skills
bash install.sh            # global 스킬 전체를 ~/.claude/skills 에 설치 (의존성 자동 포함)
bash install.sh --list     # 무엇이 설치되는지 + 각자의 의존성 미리 보기
```

## 이 워크스페이스가 쓰는 스킬 (출처: [kkh2114/claude-skills](https://github.com/kkh2114/claude-skills))

### 라우터가 직접 부르는 스킬 (CLAUDE.md·AGENTS.md 명시)
| 스킬 | 용도 | 트리거 | dependsOn(하드) |
|------|------|--------|-----------------|
| `graphify` | 지식 그래프 생성 | `/graphify` | (없음) |
| `research-lab` | Council 방식 리서치 | `/research-lab`·"리서치 시작" | (없음) |

### 운영 전반에 쓰는 스킬
| 스킬 | 용도 | dependsOn(하드) | optional(소프트) |
|------|------|-----------------|------------------|
| `content-to-wiki` | URL/영상 → 위키 노트 | (없음) | — |
| `cartesian-review` | 데카르트 5렌즈 검토 | (없음) | — |
| `harness-designer-workspace` | 워크스페이스 하네스 설계 | (없음) | cartesian-review |
| `harness-designer-coding` | 코딩 하네스 설계 | (없음) | cartesian-review |
| `harness-redesign` | 하네스 구조·규칙 변경 + 전파·일관성검증 | harness-designer-workspace · harness-designer-coding | (전이적) cartesian-review |
| `harness-retrofit` | 기존 코드 → 루프 검증 구조 개편 | harness-designer-coding | (전이적) cartesian-review |
| `safe-move` | 경로 이동/rename 시 참조 무결 전파 | harness-designer-coding · harness-redesign | (전이적) cartesian-review |

**의존성 두 종류**
- **하드(`dependsOn`)** — 참조를 재사용. 없으면 그 스킬이 **작동 안 함**. install.sh가 자동 포함.
- **소프트(`optionalDependsOn`)** — 없어도 작동하나 **있으면 품질↑**. install.sh가 `[권장]`으로 포함.

`safe-move` 하나만 설치해도 → `harness-designer-coding`·`harness-redesign`·`harness-designer-workspace`(전이적)·`cartesian-review`(권장)가 전부 딸려온다.

## ⚠️ 별도로 구해야 하는 스킬 (claude-skills에 없음)
| 스킬 | 용도 | 출처 |
|------|------|------|
| `business-folder-creator` | 수주·계약 비즈니스 폴더 생성 (`가-process/2-business` 전용) | **claude-skills 레포에 미포함** — 이 워크스페이스 소유자의 로컬/플러그인 스킬. 없으면 AGENTS.md §5의 비즈니스 폴더 절차를 **평문으로 직접 수행**하면 된다(스킬 없이도 규칙은 문서에 있음). |

## 스킬이 없을 때
이 템플릿의 **철학은 "스킬 없이도 규칙은 문서에 있다"** 이다. 스킬은 그 규칙을 자동 실행하는 어댑터일 뿐:
- `business-folder-creator` 없음 → AGENTS.md §5 절차를 손으로 수행
- `graphify` 없음 → 지식 그래프 자동화만 비활성 (구조·문서는 정상)
- 하네스 스킬 없음 → 구조 변경·이동을 수동으로 (단, safe-move 같은 무결성 검증은 직접 챙겨야 함)

정본 규칙은 항상 `README.md`·`AGENTS.md`에 있다. 스킬은 편의 자동화다.
