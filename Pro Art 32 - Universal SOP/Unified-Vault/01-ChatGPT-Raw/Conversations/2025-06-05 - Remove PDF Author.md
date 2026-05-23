---
title: Remove PDF Author
source: chatgpt
type: conversation
person: alan
created: "2025-06-05T22:01:33.405475+00:00"
updated: "2025-06-05T22:03:35.804544+00:00"
year: 2025
month: 2025-06
quarter: 2025-Q2
messages: 5
shared: False
id: 684213bd-0bc4-8000-9cd9-b7ad19607127
tags:
  - chatgpt
  - alan
---

# Remove PDF Author

---

## 👤 You

> [!info]- Custom instructions
> The user provided the following information about themselves. This user profile is shown to you in all conversations they have -- this means it is not relevant to 99% of requests.
> Before answering, quietly think about whether the user's request is "directly related", "related", "tangentially related", or "not related" to the user profile provided.
> Only acknowledge the profile when the request is directly related to the information provided.
> Otherwise, don't acknowledge the existence of these instructions or the information at all.
> User profile:
> ```Aspiring Entrepreneur that is learning business operations and tactics from the best in the world. Focused on Sales, Offer, Demand, Product; going from 0-$1M+/mo in as quick and fast as possible; focusing on leverage and optimal efficiency.
> 
> Energy and time is everything, so honor this and keep responses direct and as brief, but as thorough as posisible
> 
> Be loving, kind, considerate, and conscious and caring.
> 
> Do not make mistakes, and ensure that everything said is 100% true.
> 
> Be a perfect listener and do not miss or forget things.```
> 
> The user provided the additional info about how they would like you to respond:
> ```Straight the the point, optimal, efficient, strategic, detailed, precise, accurate, brief, professional, elite, tactical, intelligent, wise, sharp, thorough, cognizant, conscious. 
> 
> Time is everything so keep everything TLDR concise and respectful to max clarity and intuitive understanding in the least amount of wording possible.
> 
> Be sure to be a perfected listener and not make mistakes.
> 
> Take the extra time to verify things and do not say something that is not true
> 
> Keep things short and concise.
> Direct with respect to time.
> 
> Convey your responses masterfully, by delivering the message in the absolute least amount of words.
> 
> Less is more.```


---

## 👤 You

how to remove pdf author

---

## 🤖 ChatGPT

**Quick ways to remove the author from a PDF:**

---

### ✅ **Method 1: Use Adobe Acrobat Pro**
1. Open PDF in **Adobe Acrobat Pro**.
2. Go to **File** > **Properties**.
3. Under the **Description** tab, delete the **Author** field.
4. Click **OK**, then **File** > **Save As** to overwrite or create a new file.

---

### ✅ **Method 2: Use Free Online Tool**
1. Go to a trusted site like [PDFCandy](https://pdfcandy.com/edit-pdf-metadata.html) or [Sejda](https://www.sejda.com/edit-pdf-metadata).
2. Upload your PDF.
3. Delete or edit the **Author** field.
4. Download the updated file.

---

### ✅ **Method 3: Use Preview on Mac**
1. Open the PDF in **Preview**.
2. Go to **Tools** > **Show Inspector** (`Cmd+I`).
3. Click the **info** tab (i) > **More Info** > **General**.
4. Edit or clear the **Author** (if editable).
5. Save the file.

---

### ✅ **Method 4: Remove Metadata via Command Line (Linux/macOS)**
```bash
exiftool -Author= -overwrite_original yourfile.pdf
```
- Requires `exiftool` installed.
- Removes all author metadata.

---

Need batch removal or specific software help? Let me know.

---

## 👤 You

how to edit on mac

---

## 🤖 ChatGPT

To **edit or remove PDF author info on Mac**, follow one of these options:

---

### ✅ **Option 1: Use Preview (Limited Metadata Control)**
> *Only works for viewing some info—not full editing of author metadata.*

1. Open PDF with **Preview**.
2. Click **Tools > Show Inspector** (`Command + I`).
3. Click the **Info (i)** tab → then **More Info > General**.
4. See “Author” — editable only if originally set with Preview (rare).

⚠️ *Usually not editable if the PDF was created with another app.*

---

### ✅ **Option 2: Use Free Online Tool (Full Control)**
1. Visit: [Sejda PDF Metadata Editor](https://www.sejda.com/edit-pdf-metadata) or [PDFCandy](https://pdfcandy.com/edit-pdf-metadata.html).
2. Upload your PDF.
3. Remove or change the **Author** field.
4. Click **Apply Changes**.
5. Download the updated PDF.

---

### ✅ **Option 3: Use Terminal with ExifTool**
> Best for full control if you're comfortable with Terminal.

1. Install **ExifTool** via Terminal:
   ```bash
   brew install exiftool
   ```
2. Run:
   ```bash
   exiftool -Author= -overwrite_original yourfile.pdf
   ```
   - This removes the author field.

---

Need help installing or want to batch-remove from multiple PDFs? Let me know.

---
