# 🌳 Elm + Node.js Hacker News Client — Functional Data Processing & UI Framework

This project is a small **Hacker News client** built using a hybrid **Elm + Node.js** workflow.  
It focuses on functional programming, interactive UI updates, clean data modeling, and a fully testable architecture.

The application loads Hacker News top stories, lets users browse them in a table, and provides multiple configuration options such as sorting, filtering, and controlling how many posts appear at once.

Alongside the Elm application, a Node/TypeScript toolchain is included for running automated tests, validating functionality, and managing build workflows.

---

## 🚀 Features

- 📰 Hacker News Top Stories Viewer – Fetch and display stories in a dynamic, sortable table  
- 🔍 Filtering & Selection Controls – Choose how many posts to display (10/25/50), include/exclude job posts, or hide text-only posts  
- ↕️ Flexible Sorting – Sort by score, title, or post date  
- ⏳ Human-Readable Time Format – Friendly “time since posted” formatting  
- 🧭 Cursor-Based Navigation Utilities – Abstractions for stepping through lists  
- 🧪 Complete Test Suite – Public, hidden, and example-based tests included  
- ⚡ Live UI Updates – Configuration changes are immediately reflected  
- 🧱 Clear Elm Architecture – Strongly typed model, updates, views  
- 🔧 Node.js Integration – Scripts for automation and project utilities

---

## 🧰 Technologies Used

- Elm 0.19  
- elm/html, elm/http, elm/json  
- Node.js  
- TypeScript  
- elm-test & elm-verify-examples  
- NPM  
- Elm Reactor & local dev server utilities  

---

## 🛠️ Project Overview

This project combines Elm for UI and domain logic with Node.js for tooling and automation.

### Elm handles:
- Defining the Model (posts, config, cursor, etc.)  
- Fetching top stories from the Hacker News API  
- Decoding JSON into typed Elm structures  
- Rendering the posts table and configuration panel  
- Implementing filtering, sorting, pagination, and time formatting  
- Handling user interactions and updating state  

### Node/TypeScript handles:
- Running tests and grading scripts  
- Offline development mode (local server with static data)  
- Utility scripts for verifying examples  
- Compiling TypeScript helpers  
- Generating the final ECMAScript output in `dist/`

---

## 📂 Project Structure

project/
├── dist/               Compiled JS build output
├── elm-stuff/          Elm build artifacts
├── logs/               App logs
├── node_modules/       NPM dependencies
├── scripts/            Helper scripts
├── src/                Elm source (Main/Model/View/Utils)
├── tests/              Automated tests
├── elm.json            Elm config
├── package.json        Metadata & deps
├── package-lock.json   Locked deps
└── tsconfig.json       TypeScript config

---

## ▶️ How to Run the Project

### 1. Install Dependencies

```bash
npm install
```

### 2. Build the Project

Compile Elm + TypeScript into dist/:

```bash
npm run build
```

### 3. Run Tests

Use the test runner from the scripts or dist folder:

```bash
npm test
```

### 4. Run a Script Manually

Example:

```bash
node dist/run-tests.js
```

or:

```bash
node scripts/some-tool.js
```

---

## 🧪 Testing System

The tests/ directory includes:

- Test specifications for all functional requirements
- Dataset files used for verification
- Test-tree structures for navigating hierarchies
- Post decoding tests (PostIds, Post, PostsConfig)
- Cursor module tests (forward, back, fromList, toList, length)
- Sorting tests (score, title, date, unsorted)
- Filtering tests (job posts, text-only posts, post limits)
- Time formatting tests (formatDuration, durationBetween)

These tests verify the entire Elm logic layer, ensuring correct implementation of all features.

---

## 🧩 Core Concepts Demonstrated

- Functional Architecture (Elm Model–View–Update)
- JSON decoding for real-world APIs
- Human-readable time formatting with computed durations
- Cursor utilities for list navigation
- Sorting and filtering pipelines
- Elm composition patterns (pipelines, mapping, error handling)
- Clean coding style & descriptive naming
- Automated test-driven workflow
- Node.js as a development companion to Elm

---

## 🔨 Build & Development Commands

These can be added to your package.json if needed:

```json
{
  "scripts": {
    "build": "elm make src/Main.elm --output=dist/main.js && tsc",
    "test": "node dist/run-tests.js",
    "start": "node dist/main.js"
  }
}
```

---

## 📝 Conclusion

This project demonstrates a complete small-scale Elm application integrated with a modern Node.js toolchain. It combines:

- clean functional architecture
- fully typed data models
- realistic UI rendering
- dynamic configuration controls
- data fetching, sorting, filtering, and formatting
- a thorough automated test suite
