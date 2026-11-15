# 망한 아이디어 박물관

실패한 사업 아이템, 거절당한 기획서, 접어둔 사이드 프로젝트를 익명으로 나누고 서로 응원하는 온라인 전시관입니다.

## 미리 보기

`index.html`을 브라우저에서 열면 예시 전시품이 표시됩니다. Supabase 설정 전 새 이야기는 현재 브라우저에만 저장됩니다.

## Supabase 연결

1. 사용할 Supabase 프로젝트의 SQL Editor에서 `supabase.sql` 전체를 실행합니다.
2. Project Settings → API Keys에서 Project URL과 publishable key를 복사합니다. `service_role` 또는 secret key는 브라우저에 넣지 마세요.
3. GitHub 저장소의 **Settings → Secrets and variables → Actions → Variables**에 `SUPABASE_URL`, `SUPABASE_PUBLISHABLE_KEY` 변수를 등록합니다.
4. GitHub 저장소 **Settings → Pages → Build and deployment → Source**에서 **GitHub Actions**를 선택합니다.
5. `main`에 push하면 `.github/workflows/deploy.yml`이 자동 배포합니다. 배포 주소는 저장소 Settings → Pages에서 확인할 수 있습니다.

프런트엔드는 publishable key를 사용하며, RLS로 읽기와 등록만 허용합니다. 누구나 익명으로 게시할 수 있어 초기 버전에는 스팸 방지와 신고/관리 기능이 없습니다. 공개 운영 전에 CAPTCHA나 승인 절차를 추가하세요.

## 파일

- `index.html`, `style.css`, `app.js`: 정적 웹앱
- `supabase.sql`: 공개 게시와 응원 기능을 위한 테이블 및 RLS 정책
- `.github/workflows/deploy.yml`: GitHub Pages 배포

