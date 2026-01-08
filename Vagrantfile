Vagrant.configure("2") do |config|
  # Khai báo sử dụng chuẩn cú pháp version 2
  
  # Sử dụng box Ubuntu 22.04 LTS (tối ưu cho DevOps)
  config.vm.box = "bento/ubuntu-22.04"

  # Đặt tên máy ảo
  config.vm.hostname = "devops-vm"

  # Forward port Jenkins (chạy 8080 trong VM -> ra 8080 máy thật)
  config.vm.network "forwarded_port",
    guest: 8080,
    host: 8080,
    auto_correct: true  
  
  # Forward port App (chạy 3000 trong VM -> ra 3000 máy thật)
  config.vm.network "forwarded_port",
    guest: 3000,
    host: 3000,
    auto_correct: true

  # Cấu hình tài nguyên (2GB RAM, 2 CPU)
  config.vm.provider "vmware_desktop" do |vmware|
    vmware.memory = 2048
    vmware.cpus  = 2
  end

  # Tự động cài đặt Jenkins và Docker khi chạy 'vagrant up'
  config.vm.provision "shell", inline: <<-SHELL
    set -e # Dừng ngay nếu có lỗi

    echo "===== Cập nhật danh sách gói ====="
    sudo apt update -y

    echo "===== Cài các gói nền tảng (Java 21 require for Jenkins) ====="
    sudo apt install -y fontconfig openjdk-21-jre
    java -version

    echo "===== Cài Docker ====="
    sudo apt install -y docker.io
    # Cho Docker tự khởi động khi boot (nhưng chưa start ngay)
    sudo systemctl enable docker

    echo "===== Thêm repository Jenkins chính thức ====="
    # Tải key
    sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
      https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    # Thêm repo
    echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
      https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
      /etc/apt/sources.list.d/jenkins.list > /dev/null

    echo "===== Cài Jenkins ====="
    sudo apt update -y
    sudo apt install -y jenkins
    sudo systemctl enable jenkins

    echo "===== Provision hoàn tất ====="
  SHELL

end
