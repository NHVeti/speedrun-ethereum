### 🛠 Yêu cầu hệ thống (Prerequisites)

Trước khi bắt đầu, cài đặt các công cụ sau:

* **Node (>= v20.18.3)**
* **Yarn (v1 hoặc v2+)**
* **Git**

---

### Quy trình triển khai chi tiết (Execution Flow)

Vì mỗi thử thách (Challenge) được quản lý trong một thư mục riêng biệt, cần thực hiện lệnh chuyển thư mục (`cd`) trước khi khởi chạy. Dưới đây là ví dụ thực hiện cho **Challenge 6 (Stablecoins)**:

#### 1. Cài đặt thư viện (Chỉ thực hiện lần đầu)

Mở terminal và di chuyển vào thư mục challenge tương ứng:

```powershell
cd challenge-stablecoins
yarn install

```

*(Thực hiện tương tự cho các thư mục challenge-dex, challenge-dice-game, v.v.)*

#### 2. Khởi chạy mạng Blockchain cục bộ (Emulator)

Mở một terminal mới, di chuyển vào thư mục challenge và chạy:

```powershell
cd challenge-stablecoins
yarn chain

```

#### 3. Triển khai Smart Contract (Local Deploy)

Mở terminal thứ hai, di chuyển vào thư mục challenge và thực hiện deploy:

```powershell
cd challenge-stablecoins
yarn deploy

```

* **Lưu ý:** Chạy `yarn deploy --reset` nếu muốn xóa bỏ trạng thái cũ và deploy lại từ đầu một bản hoàn toàn mới.

#### 4. Khởi chạy giao diện người dùng (Frontend)

Mở terminal thứ ba, di chuyển vào thư mục challenge và chạy:

```powershell
cd challenge-stablecoins
yarn start

```

#### 5. Truy cập và Tương tác

* Mở trình duyệt tại địa chỉ: **http://localhost:3000** để xem và sử dụng ứng dụng.
* **Tự động cập nhật:** Mỗi khi thầy/cô thay đổi mã nguồn Smart Contract, chỉ cần chạy lại `yarn deploy` để cập nhật các thay đổi lên giao diện.

---

### Kiểm tra (Verification)

Để xác minh các tính năng của hợp đồng thông minh đã đáp ứng đủ yêu cầu của Speedrun Ethereum, thầy/cô có thể chạy lệnh kiểm tra tự động:

```powershell
cd challenge-stablecoins
yarn test

```

---
