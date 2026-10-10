# Gemini CLI

## 本地安装

Gemini CLI 支持从本地目录安装 Skills，也支持工作区与个人目录。先下载并解压 `offer-campus-recruit-skill-v0.1.zip`。

1. 进入包含本 Skill 的本地目录，执行：

   ```bash
   gemini skills install /absolute/path/to/offer-campus-recruit --scope workspace
   ```

   也可复制到 `.gemini/skills/offer-campus-recruit/`（项目级）或 `~/.gemini/skills/offer-campus-recruit/`（个人级）。
2. 在本机私有环境设置 `OFFER_CAMPUS_API_KEY`。
3. 使用 `gemini skills list --all` 检查 Skill 是否已发现。
4. 开启新会话，按提示启用 Skill，再用“查询最近更新的校招”验证。
5. 使用 `sh scripts/offer-campus.sh recent 1` 检查请求，不将密钥传入命令行参数或提交到仓库。

## 团队分发

可共享没有密钥的目录或内部仓库。每位使用者独立设置凭据；集中托管访问时改用受控 MCP/HTTP 连接器。

官方参考：[Gemini CLI Skills](https://geminicli.com/docs/cli/skills/)。
