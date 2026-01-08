# Sử dụng image Node.js chính thức, phiên bản nhẹ
FROM node:22-slim

# Tạo và chuyển thư mục làm việc trong container
WORKDIR /app

# Copy file khai báo thư viện và cài đặt dependency
COPY package.json ./
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Khai báo cổng ứng dụng sử dụng (3000)
EXPOSE 3000

# Lệnh chạy ứng dụng khi container khởi động
CMD ["npm", "start"]