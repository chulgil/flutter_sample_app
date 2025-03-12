# 플러터 샘플 앱

## 프로젝트 구조

> **클린 아키텍처를 적용한 확장성 높은 플러터 프로젝트**를 유지보수하기 쉬운 방식으로 디자인 함 🚀

### 📌 클린 아키텍처와 매칭:

- **data/** → `DataSource` + `Repository`
- **domain/** → `Entities` + `UseCase`
- **presentation/** → `View (UI) + ViewModel`
- **ui/** → 앱의 스타일 관리 (UI 레이어)

### 📂 프로젝트 폴더 구조 설명 (클린 아키텍처 적용)

| **폴더/파일**                 | **설명**                                 |
|---------------------------|----------------------------------------|
| **core/**                 | 프로젝트의 핵심적인 설정과 공통 기능을 포함               |
| ├── **presentation/**     | 앱 전반에서 사용될 공통적인 UI 관련 클래스 및 위젯         |
| ├── **routing/**          | 앱의 라우팅 및 네비게이션 관련 코드                   |
| **data/**                 | 데이터 레이어로, 외부 소스(API, DB 등)에서 데이터를 가져옴  |
| ├── **data_source/**      | 실제 데이터를 가져오는 계층 (API, Local Storage 등) |
| ├── **repository/**       | UseCase에서 데이터 요청 시 사용하는 인터페이스 구현체      |
| **domain/**               | 비즈니스 로직을 담당하는 핵심 계층                    |
| ├── **data_source/**      | `Repository`에서 사용할 데이터 소스 인터페이스 정의     |
| ├── **model/**            | 앱의 핵심 도메인 모델 (Entities)                |
| ├── **repository/**       | `UseCase`에서 사용할 Repository 인터페이스 정의    |
| ├── **usecase/**          | 특정 기능을 수행하는 비즈니스 로직 (UseCases)         |
| **main.dart**             | 앱의 진입점 (entry point)                   |
| **presentation/**         | 개별 화면(View)들이 위치하는 폴더 (UI 계층)          |
| ├── **home/**             | 홈 화면 관련 UI 및 상태 관리                     |
| ├── **main/**             | 앱의 주요 화면 레이아웃                          |
| ├── **notifications/**    | 알림 화면 관련 UI 및 상태 관리                    |
| ├── **profile/**          | 프로필 화면 관련 UI 및 상태 관리                   |
| ├── **saved_recipes/**    | 저장된 레시피 화면 UI 및 상태 관리                  |
| ├── **search/**           | 검색 화면 UI 및 상태 관리                       |
| ├── **sign_in/**          | 로그인 화면 UI 및 상태 관리                      |
| ├── **sign_up/**          | 회원가입 화면 UI 및 상태 관리                     |
| ├── **splash/**           | 스플래시 화면 (앱 로딩 초기 화면)                   |
| **ui/**                   | UI 관련 스타일을 관리하는 폴더                     |
| ├── **color_styles.dart** | 앱의 색상 스타일을 관리하는 파일                     |
| ├── **text_styles.dart**  | 앱의 텍스트 스타일을 관리하는 파일                    |

---
