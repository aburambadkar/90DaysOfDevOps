import psutil
import sys

def check_system_stats():
    # Fetching CPU and Memory usage
    cpu_usage = psutil.cpu_percent(interval=1)
    memory_info = psutil.virtual_memory()
    
    print(f"--- System Stats ---")
    print(f"CPU Usage: {cpu_usage}%")
    print(f"Memory Usage: {memory_info.percent}%")
    
    # Logic for CI/CD failure testing
    # If CPU usage is reported as over 100 (impossible) or if we manually trigger a fail
    if cpu_usage > 80:
        return False
    return True

if __name__ == "__main__":
    if check_system_stats():
        print("System Health Check: PASSED")
        sys.exit(0)
    else:
        print("System Health Check: FAILED")
        sys.exit(1)
