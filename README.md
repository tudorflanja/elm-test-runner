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

