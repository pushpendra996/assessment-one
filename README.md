# ✅ Valid Parentheses – SwiftUI Live Coding Solution

This repository contains a SwiftUI-based solution for the classic coding problem: **Valid Parentheses**.  
This is a live coding project where I solve the problem using Swift and SwiftUI — combining algorithm logic with a simple UI to demonstrate how it works in real time.

---

## 📌 Problem Statement

Given a string `s` containing just the characters:

```

'(', ')', '{', '}', '\[' and ']'

```

Determine if the input string is **valid**.

### A string is valid if:
- Open brackets must be **closed by the same type** of brackets.
- Open brackets must be **closed in the correct order**.

---

## 💡 Examples

| Input     | Output   |
|-----------|----------|
| `()`      | valid    |
| `()[]{} ` | valid    |
| `(]`      | invalid  |
| `([)]`    | invalid  |
| `{[]}`    | valid    |

---

## 🔧 Constraints

- `1 <= s.length <= 10^4`
- `s` consists only of the characters `'()[]{}'`

---

## 🧠 Logic Explanation

We use a **stack** to match opening and closing brackets:

- Push opening brackets (`(`, `{`, `[`) onto the stack.
- For every closing bracket, pop the top of the stack and check if it matches.
- If the stack is empty too early or the brackets don't match → invalid.
- If the stack is empty at the end → valid.

This ensures correct nesting and closure.

---

## 🖥 SwiftUI Integration

In this SwiftUI version:

- A `TextField` is used for user input.
- A `Button` triggers validation logic.
- The result (`valid` or `invalid`) is shown using a `Text` view.
- The core logic is kept in a separate `Validator.swift` file.

---

## 📹 Live Coding Walkthrough

🎥 **I’ll be recording a live coding session solving this problem in SwiftUI.**

👉 Video link will be updated here once published:  
**[📺 Watch on YouTube](#)**

---

## 📁 Project Structure

```

📦 ValidParenthesesSwiftUI
├── 📄 ContentView\.swift       # SwiftUI interface
├── 📄 Validator.swift         # Bracket validation logic
├── 📄 ValidParenthesesApp.swift  # App entry point
├── 📄 README.md               # This file

```

---

## 🙋‍♂️ Author

**Pushpendra Kumar**  
🔗 [LinkedIn – Pushpendra Kumar](https://www.linkedin.com/in/pushpendra-kumar/)

---

## ⭐️ Support the Project

If you found this helpful:

- Star the repository ⭐️  
- Share with fellow devs 🤝  
- Fork and play with the UI 🍴  
- Try enhancing the logic or adding animations 🎯  

---

Happy coding! 🧑‍💻✨
