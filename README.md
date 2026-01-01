### 🛠 Yêu cầu hệ thống (Prerequisites)

Trước khi bắt đầu, cài đặt các công cụ sau:

* **Node (>= v20.18.3)**
* **Yarn (v1 hoặc v2+)**
* **Git**

---

### 🚀 Hướng dẫn khởi chạy từng Challenge

**Lưu ý quan trọng:** Mỗi Challenge trong repository này là một dự án độc lập. Do đó, cần thực hiện quy trình cài đặt dưới đây **cho mỗi thư mục Challenge** muốn kiểm tra.

#### Bước 1: Di chuyển vào thư mục Challenge và Cài đặt

Giả sử muốn kiểm tra **Challenge 6**:

```powershell
cd challenge-stablecoins
yarn install

```

*(Nếu sau đó muốn chuyển sang kiểm tra **Challenge khác**, phải quay trở ra thư mục gốc, `cd [folder-tương-ứng]` và tiếp tục chạy lại `yarn install` cho thư mục đó).*

#### Bước 2: Khởi chạy các Terminal khác nhau tương ứng

Sau khi đã install thành công trong thư mục Challenge, thực hiện các lệnh sau (luôn đảm bảo đang đứng trong đúng thư mục đó):

* **Terminal 1 (Blockchain):** `yarn chain`
* **Terminal 2 (Deploy):** `yarn deploy`
* **Terminal 3 (Frontend):** `yarn start`

---

#### 5. Truy cập và Tương tác

* Mở trình duyệt tại địa chỉ: **http://localhost:3000** để xem và sử dụng ứng dụng.
* **Tự động cập nhật:** Mỗi khi thay đổi mã nguồn Smart Contract, chỉ cần chạy lại `yarn deploy` để cập nhật các thay đổi lên giao diện.

---

### Kiểm tra (Verification)

Để xác minh các tính năng đã đáp ứng đủ yêu cầu của Speedrun Ethereum, có thể chạy lệnh kiểm tra tự động:

```powershell
cd challenge-stablecoins
yarn test

```

---
