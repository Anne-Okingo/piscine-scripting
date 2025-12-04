#!/bin/bash

# Path to Desktop myBins directory
BIN_DIR="$HOME/Desktop/myBins"

# Create folder if missing
mkdir -p "$BIN_DIR"

# Create binary 01exec if it doesn't exist
if [ ! -f "$BIN_DIR/01exec" ]; then
    cat << 'EOF' > "$BIN_DIR/01exec"
#!/bin/bash
printf "Hello 01 Scripting Pool\n"
EOF
    chmod +x "$BIN_DIR/01exec"
fi

# Add Desktop/myBins to PATH if not already included
case ":$PATH:" in
    *":$BIN_DIR:"*) ;;
    *)
        export PATH="$BIN_DIR:$PATH"
        ;;
esac
