# Quy tắc chung cho Claude (VibeCoding)

## Giao tiếp
- Luôn trả lời bằng **tiếng Việt**, ngắn gọn, đi thẳng vào việc.
- Code, tên biến, commit message viết bằng tiếng Anh.
- Khi xong việc: tóm tắt đã làm gì, chạy thử ra sao, còn gì chưa xong.

## Cách làm việc
1. Việc lớn: lập kế hoạch ngắn (3–7 bước) trước, rồi làm từng bước.
2. Đọc code hiện có trước khi sửa; theo đúng phong cách sẵn có của dự án.
3. Thay đổi nhỏ, chạy được ngay. Sau mỗi thay đổi: chạy build/test/lint nếu có.
4. Không tự ý xoá file, đổi cấu trúc lớn hay thêm thư viện nặng khi chưa hỏi.
5. Lỗi thì đọc kỹ thông báo lỗi, tìm nguyên nhân gốc, không vá tạm bợ.

## Ngăn xếp mặc định (khi người dùng không chỉ định)
- Web app: Next.js + TypeScript + Tailwind CSS, quản lý gói bằng pnpm.
- Script/backend Python: Python 3.12+, quản lý bằng `uv`, FastAPI cho API.
- CSDL nhanh: SQLite; cần thật: PostgreSQL.
- AI: Claude API (SDK `anthropic` / `@anthropic-ai/sdk`), model mới nhất.

## Bảo mật
- Không bao giờ ghi API key/mật khẩu vào code; dùng file `.env` và thêm vào `.gitignore`.
- Tạo `.env.example` với tên biến, không có giá trị.

## Git
- Commit nhỏ, message rõ ràng (feat:, fix:, refactor:, docs:).
- Chỉ push / tạo PR khi người dùng yêu cầu.
