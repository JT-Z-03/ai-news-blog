---
title: "AI 热点日报 | 2026年10月1日"
date: 2026-10-01T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-01
description: 2026年10月1日 AI HOT 要闻。Google 发布 Gemini 4 Argon；Claude Code 推出 mods；Modal 开放 VM Sandboxes；Epoch AI 发布 ChatGPT 使用数据工具。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 10 月 1 日收录的条目整理，并核对发布方或研究者原文。文中的模型评测、产品性能和业务数据保留原发布方的表述与适用范围。

---

## 模型发布/更新

### Google 发布 Gemini 4 Argon，先向可信网络防御者开放

Google DeepMind 发布 Gemini 4 Argon，称其面向复杂软件工程、专业知识工作和网络防御任务。Google 公布了多项内部使用案例与评测结果，包括 DeepSWE v1.1 的 77.9%；这些数字来自指定测试，不能直接代表所有实际工作负载的表现。

目前，Argon 通过 Fairwind Program 向一部分可信网络防御者逐步开放。Google 表示将在安全测试和早期反馈后扩展至开发者、企业和消费者，尚未宣布全面开放日期。

🔗 [Google DeepMind：Gemini 4 Argon 发布说明](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-4-argon/)

---

## 产品发布/更新

### Claude Code 推出 mods，允许插件改写事件与界面

Anthropic 推出 Claude Code mods：开发者可用小型 TypeScript 函数在事件发生前后或替代事件执行逻辑，例如改写提示词、处理工具调用、加入界面元素。mods 随插件安装和分享，可用于命令行与桌面端。

官方提醒，mods 与 Claude Code 拥有相同的本机访问权限，并非沙箱代码。团队和企业的托管设置可限制插件来源；安装第三方 mod 时应把它视为执行本机代码。

🔗 [Anthropic：Claude Code mods 发布说明](https://claude.com/blog/claude-code-mods)

---

### Modal 正式开放 VM Sandboxes

Modal 宣布 VM Sandboxes 正式可用。开发者可通过 `runtime="vm"` 为智能体提供支持 Docker、FUSE 和部分内核功能的 Linux 虚拟机，同时沿用原有 Sandbox API 与镜像配置。原有基于 gVisor 的 Sandbox 仍是默认运行时。

Modal 称早期客户已启动超过 2,000 万个 VM，并列举 Linear 等使用案例。这是平台公布的累计使用量，不等于独立客户数或所有场景的性能保证。

🔗 [Modal：VM Sandboxes for agent computers](https://modal.com/blog/vm-sandboxes-agent-computers)

---

## 行业动态

### ElevenLabs 披露员工股份回购，估值达 220 亿美元

ElevenLabs 表示，近期完成规模为 3 亿美元的员工股份回购，交易对应公司估值为 220 亿美元，约为今年 2 月 D 轮融资时的两倍。公司还称，企业业务占收入的 55%，ElevenAgents 每周处理超过 1,500 万次对话。

这些业务数据来自公司公告；股份回购的交易估值也不等同于新一轮公开融资或经独立审计的收入。公告未给出可供外部复算的完整财务报表。

🔗 [ElevenLabs：员工股份回购与业务进展](https://elevenlabs.io/blog/tender-22bn)

---

### PromptArmor 披露 Copilot Cowork 的文件外传漏洞

安全研究公司 PromptArmor 披露，恶意 Skill 曾可利用 Microsoft Copilot Cowork 通向模型服务的网关，在沙箱外启动具备网络能力的代理，并把其可访问的文件内容发送至攻击者服务器。研究者展示了以合同文件为例的攻击过程。

PromptArmor 称已于 7 月 14 日向 Microsoft 报告该问题，漏洞在 9 月 2 日完成修复。该披露说明了研究者复现的攻击路径，不应解读为所有 Copilot Cowork 用户都曾遭遇实际数据泄露。

🔗 [PromptArmor：Copilot Cowork AI gateway 漏洞研究](https://www.promptarmor.com/resources/hijacking-copilot-coworks-ai-gateway-to-exfiltrate-files)

---

## 论文研究

### Epoch AI 发布 ChatGPT 使用情况探索工具

Epoch AI 与 YouGov 合作推出 ChatGPT usage explorer，汇总 5,000 名同意分享聊天记录的美国 YouGov 样本用户的元数据，涉及约 66 万次对话、830 万条消息。YouGov 在提供数据前移除了消息正文，因此工具展示的是使用时间、消息量、模型和工具使用等指标，不包含对话主题分类。

Epoch AI 指出，样本须在 2026 年使用过 ChatGPT 且自愿分享记录，数据未经人口加权，并存在留存偏差。它适合观察该样本内部的变化，不能直接推算全体美国人或所有 ChatGPT 用户的使用率。

🔗 [Epoch AI：Introducing the ChatGPT usage explorer](https://epoch.ai/latest/introducing-the-chatgpt-usage-explorer)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
