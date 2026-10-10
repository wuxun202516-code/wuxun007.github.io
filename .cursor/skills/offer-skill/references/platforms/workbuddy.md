# WorkBuddy

## 适用方式

WorkBuddy 提供自定义 Skill 与本地执行能力。使用同一个 `offer-campus-recruit-skill-v0.1.zip`；安装包内只有说明、参考契约和 cURL 脚本，不含 API Key。

## 安装与配置

1. 下载安装包，在 WorkBuddy 的 Skill 管理中选择导入；若当前版本仅支持通过任务创建 Skill，则解压后把整个 `offer-campus-recruit/` 目录作为任务附件，要求安装该 Skill。
2. 在 WorkBuddy 可读取的本机私密环境中设置 `OFFER_CAMPUS_API_KEY`。
3. 允许本 Skill 读取 `references/`并执行 `scripts/offer-campus.sh`。
4. 使用 `sh scripts/offer-campus.sh recent 1` 验证，或直接请求“查询最近 24 小时更新的校招”。
5. 确认执行记录不回显 API Key。

## 发布前检查

若当前 WorkBuddy 租户禁止本地 Shell、外部 HTTP 或私密凭据，改用其 MCP 连接器配置受控 `offer-campus` 服务。禁止让所有用户共用写在提示词里的 Key。

官方参考：[WorkBuddy 创建自定义 Skill](https://www.workbuddy.ai/docs/workbuddy/From-Beginner-to-Expert-Guide/Practice-Cases/Create-Skills)。
