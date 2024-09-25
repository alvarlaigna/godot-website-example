#!/bin/bash

# Tested only on MacOS. Not guaranteed to work.
# Open Project first on Godot (import) and then use this cmd script.

is_macos() {
    [[ "$OSTYPE" == "darwin"* ]]
}

get_godot_executable() {
    if is_macos; then
        if [ -d "/Applications/Godot.app" ]; then
            echo "/Applications/Godot.app/Contents/MacOS/Godot"
        else
            echo "godot"
        fi
    else
        echo "godot"
    fi
}

open_browser() {
    local url=$1
    if is_macos; then
        open "$url"
    elif [ -n "$DISPLAY" ]; then
        xdg-open "$url" &> /dev/null &
    else
        echo "Please open $url in your browser"
    fi
}

find_available_port() {
    port=8000
    while ! nc -z localhost $port; do
        port=$((port+1))
    done
    echo $port
}

GODOT_EXECUTABLE=$(get_godot_executable)

if ! command -v $GODOT_EXECUTABLE &> /dev/null
then
    echo "Godot is not found. Please make sure it's installed and accessible from the command line."
    exit 1
fi

PROJECT_DIR="$(pwd)"

EXPORT_DIR="$PROJECT_DIR/build"

mkdir -p "$EXPORT_DIR"

echo "Cleaning previous export..."
rm -rf "$EXPORT_DIR"/*  

echo "Exporting project..."
$GODOT_EXECUTABLE --headless --export-release "Web" --verbose --path "$PROJECT_DIR" "$EXPORT_DIR/index.html"

if [ $? -eq 0 ]; then
    echo "Export successful."
    
    echo "Compressing files..." 
    find "$EXPORT_DIR" -type f \( -name "*.html" -o -name "*.js" -o -name "*.wasm" \) -exec gzip -f -9 -k {} \;
        
    echo "Starting local web server..."
    PORT=$(find_available_port)
    
    if command -v python3 &> /dev/null
    then
        python3 -m http.server $PORT --directory "$EXPORT_DIR" &
    elif command -v python &> /dev/null
    then
        (cd "$EXPORT_DIR" && python -m SimpleHTTPServer $PORT) &
    else
        echo "Python is not installed. Please install Python to run a local server."
        exit 1
    fi
    
    sleep 2
    if ! nc -z localhost $PORT; then
        echo "Failed to start the web server."
        exit 1
    fi
        
    open_browser "http://localhost:$PORT"
    
    echo "Website is now running at http://localhost:$PORT"
    echo "Press Ctrl+C to stop the server"
     
    wait
else
    echo "Export failed. Please check the error messages above for more details."
    exit 1
fi