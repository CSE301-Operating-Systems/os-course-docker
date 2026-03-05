# OS Course Docker Environment
This repository provides a reproducible Linux development environment for the Operating Systems course.  
You do NOT need to install gcc, gdb, or other development tools on your host OS.
All tools are provided inside a Docker container.

## Environment Overview

- **Base image:** `ubuntu:22.04`

- **Architecture:** Automatically matches your Docker platform
  - Apple Silicon (M1/M2/M3) → `ARM64`
  - Intel Mac / Windows → `x86_64`

- Your local `workspace/` directory is mounted into the container at:
```bash
/workspace
```
- Files stored in `workspace/` persist on your machine even after the container exits.

---

# Getting Started

## Initial Setup (Run Once)

### 1. Install Docker Desktop for your platform:
- **macOS**: https://docs.docker.com/desktop/install/mac-install/
- **Windows**: https://docs.docker.com/desktop/install/windows-install/
- **Linux**: https://docs.docker.com/desktop/install/linux/

Make sure Docker Desktop (Docker daemon) is running before executing Docker commands.

### 2. Create a working directory

```bash
mkdir -p ~/os_homework
cd ~/os_homework
```

### 3. Clone the repository

```bash
git clone https://github.com/CSE301-Operating-Systems/os-course-docker.git
cd os-course-docker
```

### 4. Build the Docker image

```bash
docker compose build
```

## Start the Environment

### 4. Start the container

```bash
docker compose up -d
```

### 5. Connect to the container

```bash
docker exec -it os-lab bash
```
- This opens a Linux shell inside the container. You are now inside the OS lab environment.
- For subsequent sessions, start from Step 5 if the Docker container is already running.
- You can open multiple terminal sessions in the same container by running the same command (`docker exec -it os-lab bash`) in additional terminals.
- This is useful when working with multiple tools or capturing the screen.

- The `./workspace/` folder on your local machine is mounted to `/workspace` inside the container, so any files you edit locally are immediately available in the container.

- When you're done working, simply type `exit`. The container keeps running in the background, so you can reconnect at any time with the same `docker exec` command.

### 6. Stop and remove the container

When you no longer need the environment, stop and remove it:

```bash
docker compose down
```

> **Note:** Files in ./workspace/ are stored on your local machine and will NOT be deleted.
The Docker image is also preserved. You can recreate the container at any time using (`docker compose up -d`).

### 7. Build and run your code inside the container

```bash
cd /workspace
gcc -o my_program my_program.c
./my_program
```

---

## Included Tools

| Tool | Purpose |
|------|---------|
| gcc, g++ | C/C++ compilation |
| make, cmake | Build systems |
| python3 | Python execution |
| gdb | Debugging |
| valgrind | Memory leak detection |
| strace | System call tracing |
| man | Manual pages (POSIX) |

## Useful Commands

```bash
# Process Inspection
ps aux                      # List all running processes
htop                        # Real-time process monitor
pstree                      # Show process tree hierarchy
cat /proc/<PID>/status      # Detailed process status
cat /proc/<PID>/maps        # Process memory map
cat /proc/<PID>/wchan       # Show kernel function the process is waiting in

# Memory Inspection
free -h                     # System memory usage
cat /proc/meminfo           # Detailed memory info

# File Descriptors
lsof -p <PID>              # List open file descriptors

# Signals
kill -l                    # List all signals
kill -9 <PID>              # Send SIGKILL to a process

# Trace system calls
strace ./my_program

# Check for memory leaks
valgrind --leak-check=full ./my_program

# Debug with gdb
gdb ./my_program

# Read manual pages
man fork
man pthread_create
man pipe
```

---

## Troubleshooting

TBA
