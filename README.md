# DevOps Project - CI/CD Demo

Đồ án môn học: Mạng Máy Tính Nâng Cao - Demo quy trình CI/CD tự động.

## Thông Tin Nhóm
1. **Trương Thái Nguyên** - 23120308
2. **Mã Tuyết Ngân** - 23120302

## Giới Thiệu
Dự án này xây dựng một hệ thống CI/CD pipeline tự động để build và deploy một ứng dụng Node.js đơn giản. Môi trường Server được tự động hóa hoàn toàn bằng Vagrant, giúp việc triển khai trở nên nhất quán và dễ dàng.

## Công Nghệ Sử Dụng
*   **Vagrant**: Tự động hóa việc tạo và cấu hình máy ảo.
*   **Ubuntu 22.04 LTS**: Hệ điều hành cho Jenkins server.
*   **Docker**: Đóng gói ứng dụng (Containerization).
*   **Jenkins**: Công cụ CI/CD để thực thi pipeline.
*   **Node.js**: Nền tảng phát triển ứng dụng demo.

## Hướng Dẫn Cài Đặt & Chạy

### 1. Yêu cầu tiên quyết
Máy tính cần cài đặt sẵn:
*   Vagrant
*   VMware Desktop hoặc VirtualBox.

### 2. Khởi chạy môi trường
Mở terminal tại thư mục dự án và chạy lệnh:

```bash
vagrant up
```
*Lệnh này sẽ tự động tải Box Ubuntu, cài đặt Docker, Jenkins và các dependency cần thiết (Java 21, etc.).*

### 3. Truy cập hệ thống
Sau khi lệnh `vagrant up` hoàn tất:
*   **Jenkins Server**: [http://localhost:8080](http://localhost:8080)
*   **Ứng dụng Demo**: [http://localhost:3000](http://localhost:3000) (Sau khi chạy pipeline thành công)

### 4. Thông tin đăng nhập
*   **SSH vào máy ảo**: `vagrant ssh`
*   **Jenkins Admin Password** (lần đầu):
    ```bash
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
    ```

## Cấu Trúc Dự Án
*   `Vagrantfile`: Script cấu hình máy ảo và tự động cài đặt môi trường.
*   `Jenkinsfile`: Định nghĩa các bước trong Pipeline (Checkout -> Build -> Deploy).
*   `Dockerfile`: File cấu hình để đóng gói ứng dụng Node.js.
*   `server.js`: Mã nguồn ứng dụng web đơn giản.
*   `report.md`: Báo cáo chi tiết quá trình thực hiện đồ án.
