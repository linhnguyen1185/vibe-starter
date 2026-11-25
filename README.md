# Vibe Starter – Bộ cấu hình Claude Code cho VibeCoding

## Có gì bên trong
| Thành phần | Tác dụng |
|---|---|
| `claude/CLAUDE.md` | Quy tắc chung: trả lời tiếng Việt, lập kế hoạch trước, chạy thử sau mỗi bước, ngăn xếp mặc định, bảo mật |
| `claude/settings.json` | Cho phép sẵn các lệnh an toàn (git, npm, pnpm, uv, pytest…) để bớt hỏi quyền; chặn đọc `.env`, `sudo`, force push; luôn hỏi trước khi `git push` hoặc deploy production |
| `claude/agents/` | 7 AI agent: **planner**, **code-reviewer**, **debugger**, **test-writer**, **ui-builder**, **doc-writer**, **vercel-deployer** |
| `claude/commands/` | Lệnh tắt: `/new-app`, `/fix`, `/review`, `/ship`, `/explain`, `/deploy` |

## Cài trên máy của bạn (macOS / Linux / WSL)
Tải thư mục này về, mở terminal trong đó và chạy `./install.sh`.
Sau đó mở terminal trong thư mục dự án bất kỳ và gõ `claude`.

## Cách dùng
- `/new-app app ghi chú có đăng nhập` → lên kế hoạch, dựng dự án, chạy thử.
- `/fix <dán lỗi>` → agent debugger tìm nguyên nhân và sửa.
- `/review` → rà soát code vừa viết. `/ship` → kiểm tra & commit.
- `/deploy` → build thử, deploy bản preview lên Vercel và gửi URL. `/deploy prod` → deploy chính thức (hỏi xác nhận trước).
- Gọi agent trực tiếp: "dùng ui-builder làm trang landing page".
- Gõ `/agents` trong Claude Code để xem/sửa agent.

## Tuỳ chỉnh
Sửa các file `.md` trong `claude/` rồi chạy lại `./install.sh`. Muốn áp dụng riêng cho một dự án: chép `claude/agents`, `claude/commands`, `claude/settings.json` vào `<dự-án>/.claude/` và `CLAUDE.md` vào gốc dự án.

## Triển khai lên Vercel
1. Tạo tài khoản miễn phí tại https://vercel.com (đăng nhập bằng GitHub).
2. Lần đầu, trong thư mục dự án chạy `npx vercel login`.
3. Trong Claude Code gõ `/deploy`.

Cách tự động hơn: vào https://vercel.com/new → Import repo GitHub của dự án. Từ đó mỗi lần push lên `main` Vercel tự deploy.
