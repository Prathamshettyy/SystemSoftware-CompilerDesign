# ⚙️ System Software & Compiler Design Lab – Flex & Bison on Windows

This repository contains lab programs for the **System Software and Compiler Design** course, implemented using **Flex (Lex)** and **Bison (Yacc)** on a **Windows** platform.

---

## 📌 Objective

To set up and execute lexical and syntax analysis programs using **Flex** and **Bison** tools on a Windows machine with the **MinGW (GCC)** compiler.

---

## 🛠️ Tools & Technologies

- 🐉 **Flex** – Lexical Analyzer Generator
- 🧠 **Bison** – Parser Generator
- 🧰 **GCC (MinGW)** – C Compiler
- 💻 **Windows Command Prompt** – For execution

---

## 🔧 Installation Guide

### ✅ Step 1: Install GCC (MinGW)

1. Check installation:
   gcc --version


2. If not installed:

   * Download [MinGW](http://www.mingw.org/)
   * Install and add to environment `Path`:

     ```
     C:\MinGW\bin
     ```

---

### ✅ Step 2: Install Flex & Bison for Windows

* Download from GnuWin32:

  * [Flex](https://gnuwin32.sourceforge.net/packages/flex.htm)
  * [Bison](https://gnuwin32.sourceforge.net/packages/bison.htm)
* Run `.exe` setup installers

---

### ✅ Step 3: Configure Environment Variables

Add the following path to System `Environment Variables > Path`:

```
C:\Program Files (x86)\GnuWin32\bin
```

---

### ✅ Step 4: Verify Installation

```
flex --version
bison --version
```

---

## 🚀 Running the Programs

### 🧾 Lex + Yacc Programs

```
flex filename.l
bison -d filename.y
gcc lex.yy.c y.tab.c -o output.exe
./output.exe
```

### 🧾 Lex-only Programs

```
flex filename.l
gcc lex.yy.c -lfl -o output.exe
./output.exe
```

> ℹ️ Ensure `.l` and `.y` files are in the current working directory.

---

## 📂 Repository Structure

Each program is organized in its respective folder (e.g., `p1`, `p2`, ..., `p8`). Inside each folder, you'll find:

* `.l` and `.y` source files
* Compiled `output.exe` (if applicable)
* Sample input/output files demonstrating program execution

---

## 📚 Conclusion

This repository demonstrates how to compile and execute Lex & Yacc programs on Windows using Flex, Bison, and GCC. It serves as a practical guide for understanding compiler construction concepts.

---

