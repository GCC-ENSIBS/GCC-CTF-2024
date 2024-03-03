##################################################################
# This app is vulnerable to several attacks as it was created    #
# for the GCC-CTF 2024, don't use in in production.              #
#                                                                #
# @Author : Drahoxx                                              #
# @Created : 15 feb. 2024                                        #
# @LastModified : 15 feb. 2024                                   #
# @Comments : Good luck!                                         #
##################################################################

from flask import Flask, render_template, request, redirect, session, url_for, jsonify, flash, render_template_string
import os
import hashlib
import subprocess
import traceback
import base64

app = Flask(__name__)

# Route 1: Default static page
@app.route('/')
def default_page():
    return render_template("default.html")

# Route 2: Login using SQLite database
@app.route('/compile', methods=['POST'])
def compile_code():
    # Check if the request contains JSON data
    if not request.is_json:
        return jsonify({"error": "Invalid JSON data"}), 400

    try:
        data = request.json
        code = data.get('code', '')
        gcc_options = data.get('gcc_options', [])
        gcc_envars = data['gcc_envars']
        
        # Generate a unique filename using SHA256 hash of the code
        file_hash = hashlib.sha256(code.encode()).hexdigest()
        file_name = f"/tmp/{file_hash}.c"
        
        # Write the code to a temporary file
        with open(file_name, 'w') as file:
            file.write(code)

        # Check for banned options
        try:
            with open('/data/15e94765365729ab9599cd8ba2a4634aa8bcd9ec3961daf633f611d9f575a48b/banlist.txt', 'r') as banlist_file:
                banned_options = [line.strip() for line in banlist_file.readlines()]
        except:
            banned_options = []

        for option in gcc_options:
            if option == "":
                gcc_options.remove("")
            if option in banned_options:
                os.remove(file_name)  # Remove temporary file
                return jsonify({"error": f"Error: {option} is banned in the banlist.txt"}), 400

        # Compile the code using gcc system command
        try:
            compile_command = ['gcc', file_name] + gcc_options + ["-o",file_name[:-2]]
            gcc_envars["PATH"] = os.getenv("PATH")
            
            print(compile_command)
            p = subprocess.run(compile_command, env=gcc_envars, check=True, capture_output=True)

        except Exception as e:
            try:
                os.remove(file_name[:-2])  # Remove temporary file
            except:
                pass
            return jsonify({"error": f"Compilation error: {e.stdout.decode()}\n\n\n{e.stderr.decode()}"}), 500

        try:
            # Read the compiled binary and return it in the response
            with open(file_name[:-2], 'rb') as binary_file:
                binary_data = binary_file.read()

            os.remove(file_name)  # Remove temporary file
            os.remove(file_name[:-2])  # Remove compiled binary
            return jsonify({"result": "Compilation successful", "binary": base64.b64encode(binary_data).decode(), "out":p.stdout.decode(), "warn":p.stderr.decode()})
        except Exception as e:
            return jsonify({"result": "Compilation error", "out":p.stdout.decode(), "warn":p.stderr.decode(), "python_error":traceback.format_exc()})
    except Exception as e:
        return jsonify({"error": traceback.format_exc()}), 500

if __name__ == '__main__':
    app.run(debug=False)
