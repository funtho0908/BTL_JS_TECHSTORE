# TechZone Store - README

## Cách cài đặt và chạy

---

### Bước 1: Khởi tạo Database

**Cách 1 - Tự động** (khuyến nghị):
```bash
cd backend
node init-db.js
```

**Cách 2 - Thủ công** (MySQL Workbench):
1. Mở MySQL Workbench
2. Mở file: `backend/database/01_schema.sql` -> **Run**
3. Mở file: `backend/database/02_seed_data.sql` -> **Run**

Sau khi khởi tạo xong, database `techzone_db` sẽ có: 20 sản phẩm, 5 đơn hàng, 5 mã giảm giá, 2 người dùng, 1 admin.

---

### Bước 2: Cấu hình Backend

1. Mở file `backend/.env`
2. Sửa thông tin database:
```
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=techzone_db
```
3. Thêm Gemini API Key (lấy tại https://aistudio.google.com/apikey):
```
GEMINI_API_KEY=your_actual_gemini_api_key_here
```

---

### Bước 3: Chạy Backend

```bash
cd backend
npm install        # (đã cài rồi, bỏ qua nếu cần)
npm start
# Server chạy tại http://localhost:3000
```

---

### Bước 4: Mở Website

- **Người dùng**: Mở file `index.html` hoặc truy cập `http://localhost:3000`
- **Admin Dashboard**: `http://localhost:3000/admin`

---

### Tài khoản mẫu

| Email | Mật khẩu | Vai trò |
|-------|----------|---------|
| `admin@techzone.vn` | `admin123` | Admin |
| `minh.nguyen@email.com` | `user123` | Người dùng |
| `lan.tran@email.com` | `user123` | Người dùng |

---

## Tính năng

### Người dùng
- Landing page với slider, filter, tìm kiếm
- Xem chi tiết sản phẩm, thêm vào giỏ hàng
- Yêu thích sản phẩm
- Đặt hàng (COD / Banking / MoMo)
- Áp dụng mã giảm giá: `TECH10`, `SUMMER15`, `NEWUSER`, `SAVE500K`, `FREESHIP`
- **Chat Widget** với AI (Gemini) và Realtime Admin
- Đăng ký / Đăng nhập

### Admin Dashboard
- **Dashboard**: Thống kê doanh thu, đơn hàng, sản phẩm, biểu đồ Chart.js
- **Quản lý sản phẩm**: Thêm / Sửa / Xóa sản phẩm
- **Quản lý đơn hàng**: Xem chi tiết, cập nhật trạng thái (pending → confirmed → processing → shipping → delivered)
- **Quản lý người dùng**: Khóa / Mở khóa tài khoản
- **Quản lý mã giảm giá**: Tạo / Sửa / Xóa coupon
- **Chat hỗ trợ**: Nhận tin nhắn realtime từ khách hàng

### AI Chatbot
- Trả lời tự động về sản phẩm, giá cả, chính sách
- Chuyển tiếp sang chat với nhân viên khi cần
- Dùng Gemini API (model: gemini-2.0-flash)

---

## Cấu trúc project

```
Do-An-JS/
├── index.html              # Trang người dùng (Landing page)
├── css/
│   └── style.css          # CSS chính
├── frontend/
│   ├── css/
│   │   └── admin.css      # CSS Admin Dashboard
│   ├── js/
│   │   ├── admin.js      # Logic Admin Dashboard
│   │   ├── chatbot.js     # Chat Widget (AI + Realtime)
│   │   ├── products.js   # Logic sản phẩm
│   │   ├── cart.js       # Logic giỏ hàng
│   │   ├── auth.js        # Logic đăng nhập/đăng ký
│   │   ├── app.js         # Main app entry
│   │   └── utils.js       # Utilities
│   └── admin/
│       └── index.html     # Admin Dashboard
└── backend/
    ├── server.js          # Express + Socket.io
    ├── db/
    │   └── mysql.js       # MySQL connection pool
    ├── routes/
    │   ├── auth.js        # Đăng nhập / Đăng ký
    │   ├── products.js    # CRUD sản phẩm
    │   ├── orders.js      # CRUD đơn hàng
    │   ├── coupons.js     # CRUD mã giảm giá
    │   ├── chat.js        # Chat history API
    │   ├── ai.js          # Gemini AI Chat
    │   └── users.js       # Quản lý người dùng
    ├── middleware/
    │   └── auth.js        # JWT + Admin middleware
    ├── database/
    │   ├── 01_schema.sql  # Database schema
    │   └── 02_seed_data.sql # Sample data
    └── .env               # Environment config
```

---

## Nếu không có Gemini API Key

Nếu chưa có API key, AI chatbot vẫn hoạt động với **câu trả lời mẫu**. Để bật AI thật:

1. Vào https://aistudio.google.com/apikey
2. Tạo API Key
3. Paste vào `backend/.env` dòng `GEMINI_API_KEY=AIza...`
4. Restart backend
