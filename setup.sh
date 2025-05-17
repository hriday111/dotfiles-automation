set -e 

echo "Setting up dotfiles..."

DOTFILES_DIR="$(pwd)/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

FILES=(
    ".bashrc"
    ".vimrc"
)

for file in "${FILES[@]}"; do
    TARGET="$HOME/$file"
    SOURCE="$DOTFILES_DIR/$file"
    if [-e "$TARGET"]; then
        echo "Backing up existing $file to $BACKUP_DIR"
        mv "$TARGET" "$BACKUP_DIR/"
    fi
    echo "Creating symlink for $file"
    ln -s "$SOURCE" "$TARGET"
done
echo "Dotfiles setup complete."