
# 🎮 2048 Game Deployment with Docker 🚀

## 📌 Overview
This project sets up an **Nginx** web server inside a Docker container to serve the **2048 game**. The Dockerfile automates the entire setup process, making deployment seamless and efficient.

---

## 🛠️ Prerequisites
Before you begin, ensure you have:
- ✅ **Docker** installed on your system.
- ✅ A stable **internet connection** to download dependencies.

---

## 🏗️ Step-by-Step Process

### 1️⃣ **Pull the Base Image**
```dockerfile
FROM ubuntu:22.04
```
- Uses **Ubuntu 22.04** as the foundation for the container.

### 2️⃣ **Install Required Packages** 🛠️
```dockerfile
RUN apt-get update
RUN apt-get install -y nginx zip curl unzip
```
- Updates package lists.
- Installs essential tools:
  - 🌐 `nginx` (Web server)
  - 📦 `zip` & `unzip` (For file extraction)
  - 🔄 `curl` (For file downloads)

### 3️⃣ **Configure Nginx** ⚙️
```dockerfile
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
```
- Ensures **Nginx** runs in the foreground inside the container.

### 4️⃣ **Download 2048 Game Source Code** 🎮
```dockerfile
RUN curl -o /var/www/html/main.zip -L https://github.com/Sachin2815/2048-Game/archive/refs/heads/main.zip
```
- Downloads the **2048 game** source code from GitHub.
- Saves it as `main.zip` inside `/var/www/html/`.

### 5️⃣ **Unzip and Organize Files** 📂
```dockerfile
RUN cd /var/www/html && unzip main.zip && mv 2048-Game-main/* . && rm -rf 2048-Game-main main.zip
```
- Extracts `main.zip` into `/var/www/html/`.
- Moves game files to the correct directory.
- Cleans up unnecessary files.

### 6️⃣ **Expose Port 80** 🌍
```dockerfile
EXPOSE 80
```
- Opens **port 80** to allow external access.

### 7️⃣ **Start Nginx Server** 🚀
```dockerfile
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
```
- Runs **Nginx** as the primary process inside the container.

---

## 🚀 Running the Container

### 🔹 **Build the Docker Image**
```sh
docker build -t 2048-game .
```
- Builds a Docker image named `2048-game`.

### 🔹 **Run the Container** 🏃‍♂️
```sh
docker run -d -p 8080:80 2048-game
```
- Runs the container in detached mode (`-d`).
- Maps **port 80** in the container to **port 8080** on the host.

### 🔹 **Access the Game** 🌐
- Open a browser and visit:  
  **[http://localhost:8080](http://localhost:8080)**

---

## ⏹️ Stopping and Removing the Container

### 🔸 Stop the container:
```sh
docker ps  # Find container ID
docker stop <container_id>
```

### 🔸 Remove the container:
```sh
docker rm <container_id>
```

### 🔸 Remove the image:
```sh
docker rmi 2048-game
```

---

## 🎉 Conclusion
- This Docker setup **automates** the deployment of the **2048 game**.
- Uses **Nginx** to serve the game on **port 80**.
- Can be easily executed with a few Docker commands.

🔹 **Enjoy the game & have fun!** 🎮🚀

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/1175750/8614312/280e5dc2-26f1-11e5-9f1f-5891c3ca8b26.png" alt="Screenshot"/>
</p>

That screenshot is fake, by the way. I never reached 2048 :smile:
