# Path resolver for symlink safety
SCRIPT_PATH=$(realpath "${BASH_SOURCE[0]:-${(%):-%N}}")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
ROOT_DIR=$(dirname "$SCRIPT_DIR")
