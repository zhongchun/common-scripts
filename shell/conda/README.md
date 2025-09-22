已对 `conda-local.sh` 脚本进行了全面优化，主要改进包括：

### 🚀 **新增功能**

1. **命令行选项支持**
   - `--help, -h`: 显示帮助信息
   - `--remove, -r`: 移除配置
   - `--list, -l`: 列出所有 conda 环境
   - `--create, -c`: 自动创建环境
   - `--shell <type>`: 指定 shell 类型

2. **智能 conda 检测**
   - 预定义路径检测
   - 从 `which conda` 推导路径
   - 更全面的路径覆盖

3. **环境管理**
   - 自动环境创建 (`--create` 选项)
   - 环境存在性验证
   - 更好的错误提示

4. **多 shell 支持**
   - 自动检测 shell 类型 (zsh, bash, fish)
   - 针对不同 shell 的 direnv 配置
   - 跨平台兼容性

### �� **用户体验改进**

1. **彩色输出**
   - 成功/警告/错误信息有不同颜色
   - 更清晰的视觉反馈

2. **详细日志**
   - 结构化的日志函数
   - 更好的错误处理
   - 操作状态反馈

3. **智能提示**
   - 安装指导更详细
   - 多种安装方式支持
   - 使用技巧提示

### 🛡️ **健壮性提升**

1. **错误处理**
   - 完善的错误检查
   - 优雅的失败处理
   - 清理机制

2. **兼容性**
   - 支持多种 conda 发行版
   - 跨平台路径检测
   - 不同 shell 环境

### 📋 **使用示例**

```bash
# 基本使用
conda-local myenv

# 自动创建环境
conda-local myenv --create

# 移除配置
conda-local --remove

# 列出环境
conda-local --list

# 指定 shell 类型
conda-local myenv --shell zsh

# 查看帮助
conda-local --help
```

现在这个脚本已经是一个功能完整、用户友好的专业工具了！
