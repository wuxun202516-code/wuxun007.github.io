# Codex

## 本地或项目安装

Codex 会从当前工作目录向上扫描 `.agents/skills`，也可从个人目录加载 Skills。下载并解压 `offer-campus-recruit-skill-v0.1.zip`。

1. 项目级：复制整个目录到 `.agents/skills/offer-campus-recruit/`。
2. 个人级：复制到 `~/.agents/skills/offer-campus-recruit/`。
3. 在运行 Codex 的本机环境私密设置 `OFFER_CAMPUS_API_KEY`；不要提交到仓库或写入 Skill。
4. 重新开启会话后，使用 `$offer-campus-recruit` 或直接提出校招查询请求。
5. 首次执行 `sh scripts/offer-campus.sh recent 1`，随后测试三类查询与翻页。

## 团队或云端分发

代码仓库可以分发不含密钥的 Skill。若要让云端/团队成员直接调用真实数据，应再封装为 Codex 插件和受控 MCP 连接器，让每位用户完成授权或由组织密钥库注入凭据。

官方参考：[Codex Skills](https://learn.chatgpt.com/docs/build-skills)。
