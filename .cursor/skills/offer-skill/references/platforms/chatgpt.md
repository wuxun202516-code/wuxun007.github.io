# ChatGPT

## 上传统一 Skill 包

1. 打开 ChatGPT 侧边栏的「Plugins / 插件」，进入「Skills」。
2. 选择「Create / 创建」→「Upload from your computer / 从电脑上传」。
3. 上传 `offer-campus-recruit-skill-v0.1.zip`，等待安全扫描完成。
4. 在当前工作区允许的私密凭据位置配置 `OFFER_CAMPUS_API_KEY`，不把 Key 写入 Skill 正文或对话。
5. 新建对话，用“查询最近 24 小时更新的校招”验证。

Skill 可以包含指令、参考文件和脚本；实际发起请求仍受 ChatGPT 工作区的外部网络、脚本执行和管理员权限限制。如当前会话不能执行 `curl` 或不提供私密凭据，不得编造查询结果，应改用受控 App/MCP 连接器。

## 多人工作区发布

管理员可以安装并共享本 Skill，但不能在共享包内携带同一个生产 Key。需要集中访问时，使用受控 `offer-campus` App/MCP，仅开放 `recent`、`upcoming-deadline`、`search` 三项只读能力。

官方参考：[Skills in ChatGPT](https://help.openai.com/articles/20001066-skills-in-chatgpt)。
