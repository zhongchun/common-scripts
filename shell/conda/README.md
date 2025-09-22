# conda-local

A powerful tool similar to `pyenv local` for managing Conda environments in directories. Automatically activate Conda environments when you enter a directory, just like `pyenv local` does for Python versions.

## 🚀 Features

- **Automatic Environment Activation**: Automatically activate Conda environments when you `cd` into a directory
- **Smart Conda Detection**: Auto-detects conda installation across multiple distributions (Anaconda, Miniconda)
- **Cross-Platform Support**: Works on macOS, Linux, and Windows (with WSL)
- **Multiple Shell Support**: Supports bash, zsh, and fish shells
- **Environment Management**: Create, list, and manage Conda environments
- **direnv Integration**: Seamless integration with direnv for automatic loading
- **Rich CLI Options**: Comprehensive command-line interface with help, remove, and list options

## 📋 Requirements

- **Conda**: Miniconda or Anaconda installed
- **direnv**: For automatic environment activation (optional but recommended)
- **Bash**: The script is written in bash for maximum compatibility

## 🛠️ Installation

### 1. Download the Script

```bash
# Download the script
curl -O https://github.com/zhongchun/common-scripts/blob/master/shell/conda/conda-local

# Make it executable
chmod +x conda-local

# Optional: Move to a directory in your PATH
sudo mv conda-local /usr/local/bin/conda-local
```

### 2. Install direnv (Recommended)

```bash
# macOS
brew install direnv

# Linux
curl -sfL https://direnv.net/install.sh | bash

# Or visit: https://direnv.net/docs/installation.html
```

### 3. Configure Your Shell

Add the following to your shell configuration file:

**For zsh** (add to `~/.zshrc`):
```bash
eval "$(direnv hook zsh)"
```

**For bash** (add to `~/.bashrc`):
```bash
eval "$(direnv hook bash)"
```

**For fish** (add to `~/.config/fish/config.fish`):
```fish
direnv hook fish | source
```

## 📖 Usage

### Basic Usage

```bash
# Set up conda-local for an environment
conda-local myenv

# Create environment if it doesn't exist
conda-local myenv --create

# Remove conda-local configuration
conda-local --remove

# List available environments
conda-local --list

# Show help
conda-local --help
```

### Command Line Options

| Option | Description |
|--------|-------------|
| `--help, -h` | Show help message |
| `--remove, -r` | Remove conda-local configuration from current directory |
| `--list, -l` | List all available Conda environments |
| `--create, -c` | Create environment if it doesn't exist |
| `--shell <type>` | Specify shell type (bash/zsh/fish) for direnv hook |

### Examples

```bash
# Basic setup
conda-local myproject

# Auto-create environment
conda-local myproject --create

# Specify shell type
conda-local myproject --shell zsh

# Remove configuration
conda-local --remove

# List environments
conda-local --list
```

## 🔧 How It Works

### 1. Configuration Files

When you run `conda-local myenv`, it creates two files:

- **`.conda-env`**: Contains the environment name
- **`.envrc`**: Contains the direnv configuration for automatic activation

### 2. Automatic Activation

When you `cd` into a directory with conda-local configuration:

1. **direnv** detects the `.envrc` file
2. **direnv** loads the conda environment
3. Your shell automatically activates the specified Conda environment

### 3. Environment Detection

The script automatically detects conda installation by checking:

- Common installation paths
- `which conda` command output
- Multiple conda distributions (Anaconda, Miniconda)

## 📁 File Structure

After running `conda-local myenv`, your directory will contain:

```
your-project/
├── .conda-env          # Environment name
├── .envrc              # direnv configuration
└── your-files...
```

## 🎯 Use Cases

### 1. Project-Specific Environments

```bash
# Set up different environments for different projects
cd project-a
conda-local project-a-env

cd ../project-b
conda-local project-b-env
```

### 2. Development Workflows

```bash
# Create a new project with conda-local
mkdir my-new-project
cd my-new-project
conda-local my-new-project --create
```

### 3. Team Collaboration

```bash
# Share environment configuration
git add .conda-env .envrc
git commit -m "Add conda-local configuration"
```

## 🐛 Troubleshooting

### Common Issues

#### 1. "direnv not detected"
```bash
# Install direnv
brew install direnv  # macOS
# or
curl -sfL https://direnv.net/install.sh | bash  # Linux

# Add to your shell config
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```

#### 2. "Conda not found"
```bash
# Check if conda is in PATH
which conda

# If not found, add conda to PATH
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.zshrc
```

#### 3. "Environment doesn't exist"
```bash
# Create the environment first
conda create -n myenv

# Or use --create flag
conda-local myenv --create
```

#### 4. "Permission denied"
```bash
# Make script executable
chmod +x conda-local
```

### Debug Mode

For debugging, you can run the script with bash debugging:

```bash
bash -x conda-local myenv
```

## 🔄 Migration from pyenv

If you're coming from `pyenv local`, the workflow is very similar:

```bash
# pyenv local
pyenv local 3.9.0

# conda-local equivalent
conda-local myenv
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

```bash
# Clone the repository
git clone https://github.com/zhongchun/common-scripts.git
cd common-scripts/shell/conda

# Test the script
./conda-local --help
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by `pyenv local` functionality
- Built with `direnv` for automatic environment loading
- Designed for the Conda ecosystem

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Troubleshooting](#-troubleshooting) section
2. Open an issue on GitHub
3. Check the [direnv documentation](https://direnv.net)

---

**Happy coding with conda-local! 🐍✨**
