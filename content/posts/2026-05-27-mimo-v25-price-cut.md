---
title: "小米 MiMo V2.5 系列 API 永久降价，最高降幅达 99%"
date: 2026-05-27T09:00:00+08:00
tags: ["小米", "MiMo", "大模型", "API", "降价"]
categories: ["AI 新闻"]
summary: "小米宣布 MiMo V2.5 系列 API 永久降价，最高降幅达 99%，不再区分上下文窗口长度，Token Plan 用量提升 5-8 倍。"
sources:
  - title: "小米 MiMo 官微"
    url: "https://www.miomi.com"
  - title: "腾讯新闻报道"
    url: "https://new.qq.com/rain/a/20260527A01RVD00"
draft: false
---

## 核心要点

- **降幅惊人**：最高 99%，这是大模型 API 领域史无前例的降价幅度
- **上下文不再区别计价**：之前 256k 以上上下文消耗 4 倍 Credits，现在统一 2 倍
- **Token Plan 用量提升 5-8 倍**：同等价格下，用户能用的量大幅增加

## 具体变化

### 降价前（V2 系列）
| 模型 | 上下文 | Credit 消耗 |
|------|--------|------------|
| MiMo-V2-Pro | ≤256k | 2x |
| MiMo-V2-Pro | >256k | **4x** |

### 降价后（V2.5 系列）
| 模型 | Credit 消耗 |
|------|------------|
| MiMo-V2.5-Pro | 2x |
| MiMo-V2.5 | 1x |

## 我的分析

这次降价的意义不只是价格本身，而是**彻底取消了长文本场景的惩罚性定价**。之前用 MiMo 处理长文档要付 4 倍代价，现在终于和其他模型站在同一起跑线上。

结合之前 DeepSeek V4-Pro 降价 75%，国产大模型的价格战已经进入白热化阶段。对开发者来说是绝对的利好——**成本已经低到几乎可以忽略不计了**。

## 关于 Token Plan 四档套餐（折后价）

| 套餐 | 价格 | Credits | V2.5-Pro 可用 |
|------|------|---------|--------------|
| Lite | ¥39/月 | 60M | 30M Tokens |
| Standard | ¥99/月 | 200M | 100M Tokens |
| Pro | ¥329/月 | 700M | 350M Tokens |
| Max | ¥659/月 | 1600M | 800M Tokens |

## 参考来源

- [小米 MiMo 官方公告](https://www.miomi.com)
- [腾讯新闻《MiMo-V2.5系列API永久降价》](https://new.qq.com/rain/a/20260527A01RVD00)