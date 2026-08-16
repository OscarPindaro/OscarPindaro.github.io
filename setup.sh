#!/bin/bash
set -e  # Exit on error
# Initialize rbenv for this session
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init - bash)"
fi
# Check if rbenv is installed
if ! command -v rbenv &> /dev/null; then
    echo "❌ Error: rbenv is not installed."
    echo "Please install rbenv first:"
    echo "  sudo dnf install -y rbenv ruby-build"
    echo "  echo 'eval \"\$(rbenv init - bash)\"' >> ~/.bashrc"
    echo "  source ~/.bashrc"
    exit 1
fi
# Check if ruby-build plugin is installed (provides 'rbenv install')
if ! rbenv commands | grep -q "^install$"; then
    echo "Installing ruby-build plugin..."
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
else
    echo "✓ ruby-build plugin is already installed"
fi
# Check if .ruby-version exists
if [ ! -f ".ruby-version" ]; then
    echo "❌ Error: .ruby-version file not found in project directory."
    exit 1
fi
# Read required Ruby version
REQUIRED_RUBY=$(cat .ruby-version)
echo "Required Ruby version: $REQUIRED_RUBY"
# Check if required Ruby version is installed
if ! rbenv versions | grep -q "$REQUIRED_RUBY"; then
    echo "Installing Ruby $REQUIRED_RUBY..."
    rbenv install "$REQUIRED_RUBY"
else
    echo "✓ Ruby $REQUIRED_RUBY is already installed"
fi
# Set local Ruby version
echo "Setting local Ruby version to $REQUIRED_RUBY..."
rbenv local "$REQUIRED_RUBY"
# Verify active Ruby version
ACTIVE_RUBY=$(rbenv version | awk '{print $1}')
if [ "$ACTIVE_RUBY" != "$REQUIRED_RUBY" ]; then
    echo "❌ Error: Failed to set Ruby version to $REQUIRED_RUBY"
    echo "Active version is: $ACTIVE_RUBY"
    exit 1
fi
echo "✓ Ruby $REQUIRED_RUBY is active"
# Install bundler if not already installed
if ! command -v bundle &> /dev/null; then
    echo "Installing bundler..."
    gem install bundler
else
    echo "✓ bundler is already installed"
fi
# Install gems from Gemfile if it exists
if [ -f "Gemfile" ]; then
    echo "Installing gems from Gemfile..."
    bundle install
else
    echo "No Gemfile found, skipping bundle install"
fi
# Check if cargo is installed
if ! command -v cargo &> /dev/null; then
    echo "Installing cargo (Rust package manager)..."
    sudo dnf install -y cargo
else
    echo "✓ cargo is already installed"
fi
# Check if lychee is installed
if ! command -v lychee &> /dev/null; then
    echo "Installing lychee link checker..."
    cargo install lychee
    # Ensure cargo bin is in PATH for current session
    export PATH="$HOME/.cargo/bin:$PATH"
else
    echo "✓ lychee is already installed"
fi
# Add cargo bin to fish shell PATH if not already present
FISH_CONFIG="$HOME/.config/fish/config.fish"
if [ -f "$FISH_CONFIG" ]; then
    if ! grep -q "\.cargo/bin" "$FISH_CONFIG"; then
        echo "Adding cargo bin to fish shell PATH..."
        echo 'set -gx PATH $HOME/.cargo/bin $PATH' >> "$FISH_CONFIG"
        echo "✓ Added to fish config"
    else
        echo "✓ cargo bin already in fish PATH"
    fi
    if ! grep -q "rbenv init" "$FISH_CONFIG"; then
        echo "Adding rbenv init to fish shell..."
        echo 'status --is-interactive; and source (rbenv init - fish|psub)' >> "$FISH_CONFIG"
        echo "✓ Added rbenv init to fish config"
    else
        echo "✓ rbenv init already in fish config"
    fi
else
    echo "Fish config not found, skipping fish PATH configuration"
fi
# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment in .venv..."
    python3 -m venv .venv
fi
# Installing dependencies
echo "Installing system dependencies..."
sudo dnf install -y ImageMagick aspell
# Activate virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate
# Install pre-commit
echo "Installing pre-commit..."
pip install --upgrade pip
pip install pre-commit
# Make the hook executable
echo "Making hook script executable..."
chmod +x hooks/jekyll-tabs-formatter.py
# Install pre-commit hooks
echo "Installing pre-commit hooks..."
pre-commit install
echo ""
echo "✓ Setup complete!"
echo ""
echo "To activate the virtual environment in the future, run:"
echo "  source .venv/bin/activate"
echo ""
echo "To check for broken links, run:"
echo "  lychee --user-agent 'curl/7.54' --verbose --no-progress './_posts/**' './_pensierini/**'"
