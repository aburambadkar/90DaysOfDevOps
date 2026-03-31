from flask import Flask, request, jsonify
import psycopg2
import os
import time

app = Flask(__name__)

# Fetching DB config from Environment Variables (DevOps Task!)
DB_NAME = os.getenv('DB_NAME', 'tasksdb')
DB_USER = os.getenv('DB_USER', 'admin')
DB_PASS = os.getenv('DB_PASS', 'password')
DB_HOST = os.getenv('DB_HOST', 'db')

def get_db_connection():
    # Adding a small retry logic because DBs take time to wake up
    for i in range(5):
        try:
            conn = psycopg2.connect(host=DB_HOST, database=DB_NAME, user=DB_USER, password=DB_PASS)
            return conn
        except Exception as e:
            print(f"Connection failed, retrying... {e}")
            time.sleep(2)
    return None

@app.route('/')
def home():
    return "Task Tracker API is live! Use /tasks to view or POST to add."

@app.route('/tasks', methods=['GET', 'POST'])
def tasks():
    conn = get_db_connection()
    cur = conn.cursor()
    
    if request.method == 'POST':
        new_task = request.json.get('task')
        cur.execute('INSERT INTO tasks (content) VALUES (%s)', (new_task,))
        conn.commit()
        return jsonify({"status": "Task added!"}), 201
    
    cur.execute('SELECT content FROM tasks;')
    tasks = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(tasks)

if __name__ == '__main__':
    # Initial Table Setup
    conn = get_db_connection()
    if conn:
        cur = conn.cursor()
        cur.execute('CREATE TABLE IF NOT EXISTS tasks (id serial PRIMARY KEY, content varchar(100));')
        conn.commit()
        cur.close()
        conn.close()
    app.run(host='0.0.0.0', port=5000)
