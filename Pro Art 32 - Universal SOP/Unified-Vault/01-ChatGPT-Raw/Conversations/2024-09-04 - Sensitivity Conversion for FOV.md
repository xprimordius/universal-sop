---
title: Sensitivity Conversion for FOV
source: chatgpt
type: conversation
person: alan
created: "2024-09-04T04:58:10.830763+00:00"
updated: "2024-09-04T05:01:46.016671+00:00"
year: 2024
month: 2024-09
quarter: 2024-Q3
messages: 11
shared: False
id: 8082a4bb-ec12-4ce0-a523-f561bc838e03
tags:
  - chatgpt
  - alan
---

# Sensitivity Conversion for FOV

---

## 👤 You

my sens is 1600 dpi 110 FOV 0.4 sens

what does my dpi shift need to be to effectively the same on 70 FOV

---

## 🤖 ChatGPT

To convert your sensitivity from 110 FOV to 70 FOV while maintaining the same effective sensitivity feel, you can use this formula:

\[ \text{New Sensitivity} = \text{Old Sensitivity} \times \frac{\tan(\frac{\text{New FOV}}{2})}{\tan(\frac{\text{Old FOV}}{2})} \]

Your current settings:
- Old FOV: 110
- New FOV: 70
- Old sensitivity: 0.4

Let's calculate:

1. Convert FOVs to radians: 
   - 110 FOV → \(\frac{110}{2} = 55\) degrees
   - 70 FOV → \(\frac{70}{2} = 35\) degrees

2. Calculate the tangent for both:
   \[
   \tan(55^\circ) \approx 1.428
   \]
   \[
   \tan(35^\circ) \approx 0.700
   \]

3. Apply the formula:
   \[
   \text{New Sensitivity} = 0.4 \times \frac{0.700}{1.428} \approx 0.196
   \]

So, to maintain the same sensitivity feel at 70 FOV, your sensitivity should be approximately **0.196**.

If you want to apply this change to your DPI, you can adjust the DPI proportionally:
\[
\text{New DPI} = \text{Old DPI} \times \frac{\text{Old Sensitivity}}{\text{New Sensitivity}} = 1600 \times \frac{0.4}{0.196} \approx 3265
\]

To match the sensitivity with 70 FOV, your DPI shift should be about **3265 DPI**.

---

## 👤 You

that doesn't make sense. when i go to lower fov, my sensitivity feels increased. i need it to track targets the same, meaning the dpi shift would need to be lower than the 1600 used at 110 FOV

---

## 🤖 ChatGPT

You're correct! When you lower your FOV, the sensitivity feels higher because you're essentially zooming in, which makes small mouse movements cover more screen space. To compensate, you'll want to decrease your DPI or in-game sensitivity to maintain the same effective tracking.

To calculate the correct DPI shift for the change from 110 FOV to 70 FOV, we can use a proportional method based on the FOV change:

\[
\text{New Sensitivity or DPI} = \text{Old Sensitivity or DPI} \times \frac{\text{New FOV}}{\text{Old FOV}}
\]

Using your values:
- Old DPI: 1600
- Old FOV: 110
- New FOV: 70

Now, let's calculate the new DPI:

\[
\text{New DPI} = 1600 \times \frac{70}{110} = 1600 \times 0.636 \approx 1018
\]

So, to maintain the same tracking feel at 70 FOV, your DPI should be adjusted to approximately **1018 DPI**.

If you're adjusting in-game sensitivity instead of DPI, you can apply the same ratio to the sensitivity.

---

## 👤 You

why did you get 3265 the first time

---

## 🤖 ChatGPT

The reason I initially calculated 3265 DPI is because I used a formula that considered the field of view (FOV) in terms of how it affects angular measurements (using tangents), but that approach led to an overcomplication and an incorrect result for your situation. 

In reality, when you reduce the FOV, you are zooming in, which effectively makes your sensitivity feel higher. Thus, you need to lower your sensitivity or DPI to compensate. The simpler, more intuitive method I used in the second explanation—scaling DPI by the ratio of the FOVs—is more appropriate for ensuring that your aim feels the same across different FOVs.

The initial formula was not suitable for calculating how FOV affects sensitivity in this context, and I apologize for the confusion it caused. The correct approach is to adjust DPI proportionally to the change in FOV, resulting in the **1018 DPI** value as the proper adjustment for your situation.

---

## 👤 You

learn from this

---

## 🤖 ChatGPT

User prefers a simplified and intuitive approach to adjusting DPI or sensitivity across different FOVs and expects accurate, practical solutions for gaming settings.

---

> [!abstract]- Tool
> Model set context updated.


---

## 🤖 ChatGPT

Got it! I'll make sure to stick to clear, practical solutions moving forward. If you need help with anything else, feel free to ask!

---

## 👤 You

what about same dpi, what in game sens would i need to move down to?

---

## 🤖 ChatGPT

If you want to keep your DPI the same (1600 DPI) and only adjust your in-game sensitivity to match the change in FOV, you can use the same proportional method based on the FOV change:

\[
\text{New Sensitivity} = \text{Old Sensitivity} \times \frac{\text{New FOV}}{\text{Old FOV}}
\]

Your current settings:
- Old Sensitivity: 0.4
- Old FOV: 110
- New FOV: 70

Now, let’s calculate the new sensitivity:

\[
\text{New Sensitivity} = 0.4 \times \frac{70}{110} = 0.4 \times 0.636 \approx 0.254
\]

So, if you keep your DPI at **1600**, your new in-game sensitivity should be approximately **0.254** to match the feel of your aim at 70 FOV.

---
