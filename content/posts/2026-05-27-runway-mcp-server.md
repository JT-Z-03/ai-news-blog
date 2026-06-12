---
title: "Runway 推出 MCP 服务器：让 AI 智能体直接生成图像和视频"
date: 2026-05-27T22:10:00+08:00
tags: ["Runway", "MCP", "多模态", "工具", "AI生成"]
categories: ["AI 新闻"]
summary: "Runway 正式推出 MCP 服务器，Claude、ChatGPT、Cursor 等主流 AI 工具现在可以直接调用 Gen-4.5、Seedance 2.0、Kling 3.0 等顶级模型生成图像和视频，无需切换工作流。"
description: "Runway 推出 MCP 服务器，让 Claude、ChatGPT、Cursor 等 AI 工具直接调用图像和视频生成模型。"
slug: "runway-mcp-server"
aliases: ["/posts/2026-05-27-runway-mcp-server/"]
sources:
  - title: "Runway 官方公告"
    url: "https://runwayml.com/news/mcp"
  - title: "Runway MCP 接入地址"
    url: "https://runwayml.com/mcp"
draft: false
---

## 核心要点

- **MCP 服务器**：Runway 推出 Model Context Protocol 服务器，兼容所有支持 MCP 的 AI 智能体
- **集成模型**：Gen-4.5、Seedance 2.0、GPT Image 2、Kling 3.0、Nano Banana Pro 等全部最新 SOTA 模型
- **零配置接入**：无需申请 API Key，用现有 Runway 账号登录即可，支持 Claude、ChatGPT、Cursor
- **场景覆盖**：产品营销视频、网站视觉素材、角色广告、应用内视觉内容

## 详细解读

今天，Runway 正式发布了 **Runway MCP（Model Context Protocol）服务器**，这是一个能让 AI 智能体直接在对话窗口里调用 Runway 全部图像和视频生成能力的连接器。

### 解决了什么问题？

在这之前，AI 智能体想要生成一张产品图或一段营销视频，需要：
1. 退出当前工作流
2. 打开 Runway 或 Midjourney
3. 手动输入提示词
4. 等待生成
5. 下载并传回原工作流

这个过程打断了 AI 的"思维连贯性"。现在 MCP 打通之后，**你告诉 AI "帮我做一个产品的宣传视频"，它直接在你的 Cursor 或 Claude 窗口里调用 Runway 模型生成并返回**，整个过程不离开你的工作流。

### 接入方式

1. 打开 Claude/ChatGPT/Cursor
2. 添加 Runway 为自定义 MCP 服务器（地址：`runwayml.com/mcp`）
3. 用现有 Runway 账号登录，无需单独申请 API Key

生成次数和权限与你已有的 Runway 订阅计划挂钩。

### 对 Agent 工作流的影响

这是多模态 Agent 发展的重要一步。之前 AI Agent 的短板在于"说得出一张图，但画不出一张图"——现在这个短板补上了。做产品宣发、内容营销、视觉素材自动化，这些场景的门槛大幅降低。

## 参考来源

- [Runway 官方公告](https://runwayml.com/news/mcp)
- [Runway MCP 接入指南](https://runwayml.com/mcp)
