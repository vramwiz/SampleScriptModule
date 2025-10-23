# SampleScriptModule for AviUtl2 (Delphi)

A **Delphi-based AviUtl2 module (.mod2)** that performs simple addition through a script.  
This project demonstrates that **AviUtl2 plugins can be created in Delphi**, not just in C++.

---

## 🧩 概要

This repository contains a working example of an AviUtl2 plugin written in **Delphi**.  
It defines two files:

- `SampleScript.obj2` — Lua script defining trackbars (`value1`, `value2`)
- `SampleScriptModule.mod2` — Delphi module performing addition and returning the result

---

## ⚙️ 使い方

1. Copy `SampleScript.obj2` to your AviUtl2 `script` folder  
2. Build `SampleScriptModule.dpr` with Delphi  
3. Run **`BuildCopy.bat`**  
   - Copies the compiled DLL to your AviUtl module folder  
   - Automatically renames it to `.mod2`

Then, in AviUtl2:

- Add the “サンプル” object  
- Adjust the two trackbars  
- The sum of both values is displayed in real-time

---

## 🧠 動作例

| value1 | value2 | 表示結果 |
|--------:|--------:|-----------:|
| 100 | 250 | 合計: 350 |

---

## 🔧 開発メモ

- Implemented in **Delphi 11**  
- Compatible with **AviUtl2 .mod2** format  
- Uses exported functions defined in `module2.h`

---

## 📄 ライセンス

MIT License © [vramwiz](https://github.com/vramwiz)  
See [LICENSE](LICENSE) for details.
