---
title: Business Account Options
source: chatgpt
type: conversation
person: alan
created: "2024-09-18T22:34:02.724506+00:00"
updated: "2024-09-18T22:41:40.462014+00:00"
year: 2024
month: 2024-09
quarter: 2024-Q3
messages: 11
shared: False
id: 66eb555a-7bac-8000-aa7e-15384b445655
tags:
  - chatgpt
  - alan
---

# Business Account Options

---

## 👤 You

i was told to open a biz checkings account with payable and receivables; but chase bank say they don't offer this. they can do checkings and savings; but i need an account that i can connect to other services like plaid where they can ONLY see the money coming in, and not the money going out

---

## 🤖 ChatGPT

To meet your need for an account that only shows incoming funds, there are a few potential workarounds or options to consider:

1. **Dedicated Receivables Account:** You can open a separate checking account specifically for receivables (money coming in). You'd use this account to link with services like Plaid or any other service where you want to show only the inflows of money. Then, you can transfer funds to another account for outgoing transactions, which would remain hidden from those connected services.

2. **Multi-Account Setup:** Some banks allow you to open multiple checking accounts under the same business, which could be structured as one for receivables (linked to external services like Plaid) and another for payables (hidden from Plaid).

3. **Virtual Accounts:** Some fintech companies and online banks offer virtual accounts or sub-accounts that you can dedicate solely for receivables or payables. These accounts can be linked separately, providing more control over what information is shared.

4. **Banking with Fintech Solutions:**
   - **Relay Financial** offers multiple checking accounts and lets you control which accounts are linked to external services like Plaid.
   - **Brex** provides business checking with multiple account features and strong control over integrations.
   - **Mercury** is another option that offers seamless integration with fintech services while allowing you to manage multiple accounts.

These solutions can give you the flexibility you're looking for by segregating receivables from payables while keeping one aspect of your transactions visible to third parties like Plaid.

---

## 👤 You

but transfering the money from checkings to savings would still show money going out via transfer?

---

## 🤖 ChatGPT

Yes, transferring money from a checking account to a savings account (or any other account) would still appear as an outgoing transfer. However, there are ways to manage this to meet your goal of hiding outgoing transactions from services like Plaid:

### Workarounds:

1. **Use a Separate Unlinked Account:**
   - You could open a **completely separate checking account** (unlinked to Plaid or any other external services) with another bank or within the same bank. This second account would handle all your outgoing transactions. The account linked to Plaid would then only show incoming funds and transfers, not withdrawals or spending.

2. **Use a Payment Processor/Third-Party Wallet:**
   - Route your receivables through a **payment processor** (like PayPal, Stripe, or Square) and then only transfer the necessary funds to your primary checking account for expenses. You can connect the payment processor to Plaid instead of your primary bank account, ensuring only your incoming money is visible. Then, from your checking account, you can make transfers to an unlinked account for payables or savings.

3. **Hold in a Clearing Account Before Transfers:**
   - Use a **clearing account** where funds sit temporarily before being transferred to your main checking/savings account. This method can keep money transfers away from the linked account that Plaid accesses.

By keeping your receivables in a segregated account and moving funds into another non-Plaid-connected account for payables and savings, you can ensure that only incoming funds are visible to external services like Plaid, without showing the outgoing transfers.

Let me know if you need further clarification on any of these strategies!

---

## 👤 You

this still doesn't make sense, because the money coming in will still need to go out, whether or not i use another account to do transactions; because there would still need to be the transfer of money

---

## 🤖 ChatGPT

I see what you're getting at—the transfer of money, even between accounts, would still show as an outgoing transaction, which doesn't solve the problem of keeping those transactions hidden. Here’s a more refined approach to solve this issue:

### Approach: **Account-Level Visibility Control**

1. **Use a Third-Party Integration that Offers Transaction Visibility Control:**
   Some financial management platforms or fintech companies let you customize what data is shared with connected services. For example, **Mercury** and **Brex** allow you to manage what is visible via integrations like Plaid. You can control access, potentially limiting visibility to only inflows or specific types of transactions.

2. **Multi-Entity Structure:**
   Create two separate business entities with their own accounts:
   - **Entity A**: This account is connected to services like Plaid and handles only incoming funds. It will not perform any outgoing transactions (transfers, payments, etc.).
   - **Entity B**: This is where you move the money for operations (expenses, payroll, etc.) from Entity A. Plaid and other services won't be connected to Entity B, so no one can see its activity. The transfer between these two entities can be managed through intercompany accounting but won’t be visible to Plaid.

3. **Payment Gateways as Intermediaries**:
   You could route receivables through a **payment gateway** like PayPal, Stripe, or Square. These platforms allow you to withhold money in their wallets before transferring it to your bank account. You could delay or batch withdrawals, making it harder for Plaid to track regular outflows, or show inflows without instantly transferring to another account.

4. **Use a Sweep Account:**
   Some banks offer **sweep accounts**, which automatically transfer funds into or out of another account based on your set parameters (like maintaining a minimum balance). You can configure the sweep to make regular movements into a hidden account for payables, but only after Plaid has captured the inflows. This process is less manual and could help disguise outgoing transfers.

In all these solutions, you're managing your transactions in a way that keeps **receivables visible** while **obscuring payables** from view by using separate accounts or intermediaries where Plaid cannot track the flow of money.

If none of these options match what you need, a consultation with a banking specialist at a fintech or digital bank may help you get a tailored solution for privacy in transaction visibility.

---

## 👤 You

how to use mercury or brex to allow plaid to only see money coming in, despite activity of money goign out

---

## 🤖 ChatGPT

User is exploring using Mercury or Brex to control Plaid's visibility, specifically to allow Plaid to see only incoming funds and not outgoing transactions.

---

> [!abstract]- Tool
> Model set context updated.


---

## 🤖 ChatGPT

To use Mercury or Brex to allow Plaid to only see incoming funds and not outgoing transactions, you'll need to leverage some of their features and integration settings. Here’s how you can approach it:

### **Mercury**
Mercury gives you control over your account integrations and visibility of transactions. To achieve the goal of showing only incoming transactions to Plaid, you would do the following:

1. **Set Up Multiple Accounts:**
   - Open two separate accounts within Mercury: one for **receivables (money in)** and another for **payables (money out)**.
   - **Receivables Account**: This account will be connected to Plaid, and all incoming payments or deposits will land here.
   - **Payables Account**: Use this for handling outgoing transactions like paying bills or making transfers, but do not link this account to Plaid.

2. **Restrict Account Access in Plaid:**
   - When you link your **receivables account** to Plaid, ensure that only this specific account is connected and that the payables account remains unlinked.
   - Plaid will then only have access to the transactions from the account where money comes in, and it won’t be able to see any transfers or outgoing payments made from the other account.

3. **Manual Transfers:**
   - After funds arrive in the receivables account, manually transfer them to your payables account. Since Plaid only tracks the account linked (receivables), these outgoing transactions won’t be visible.

### **Brex**
Brex offers more granular control over what data is shared with external platforms like Plaid.

1. **Use Brex Cash Accounts for Segmentation:**
   - Create two Brex Cash accounts: one for **receiving payments** and another for **paying out**.
   - Link only the **receivables account** to Plaid, which will capture deposits but no outgoing transactions.
   
2. **Set Permissions on Plaid Integration:**
   - Brex allows you to manage integrations with platforms like Plaid. When connecting Plaid, specify which accounts to share. Ensure that you only grant access to the account handling incoming funds.
   
3. **Fund Management and Transfers:**
   - Similar to Mercury, transfer funds from the Brex receivables account to your payables account after they are deposited. This ensures that Plaid will not see your spending activity, only the money coming in.

### Key Considerations:
- **Account Segmentation** is the primary method here, where one account handles only incoming funds and is linked to Plaid, while the other is used for outgoing transactions but is not linked.
- **Permissions**: Both Mercury and Brex allow you to control which accounts are accessible to third-party services like Plaid, ensuring that only specific transaction data is visible.

By managing this setup, you ensure Plaid only sees your inflows and none of your outgoing activity.

---

## 👤 You

how would manual transfers not be visable? for example $3K coming in. $3K manually transfered to other payables outgoing account. They would then see the total balance went from $3k to $0 right?

---

## 🤖 ChatGPT

You are correct in pointing out that, even with manual transfers, Plaid would still see a reduction in the balance after the transfer, which means the movement of funds would be visible. While they may not see where the money was transferred, they could see the reduction in the account balance, which effectively shows money going out. 

Given this, the challenge is hiding the **balance changes** or **outgoing movement** after money is transferred.

Here are a few refined strategies to manage this:

### **Refined Solution: Use an Intermediary (e.g., Payment Processor)**

Instead of transferring funds directly from the **receivables account** to the **payables account**, consider routing the funds through a **third-party service** (such as a payment processor or a wallet account like Stripe or PayPal). Here's how:

1. **Incoming Funds Received in Receivables Account:**
   - The $3K arrives in your receivables account.
   - Plaid can see this incoming payment, but you don’t immediately move it out to another account.

2. **Move the Money to a Payment Processor (not visible in Plaid):**
   - Instead of transferring the money directly from the receivables account to the payables account, move the funds to a payment processor like **PayPal, Stripe, or Square**.
   - Plaid will see the outgoing transaction to this payment processor, but won’t track what happens inside the payment processor (because it’s not connected to Plaid).

3. **Manage Payables from the Payment Processor:**
   - Use the funds in your payment processor’s balance to pay bills, make transfers, or handle outgoing transactions.
   - Plaid won’t see any activity beyond the initial transfer to the payment processor.

4. **Minimal Balance in Receivables Account:**
   - After transferring the funds to the payment processor, the receivables account balance will drop (e.g., from $3K to $0), but the actual outgoing payments and transaction details are not visible to Plaid.
   
   In this case, Plaid will know that the money has left the receivables account but won’t have visibility on the subsequent activity happening within the payment processor or what the money was used for.

### **Alternative: Buffering Funds via Virtual Wallets**
If you're comfortable with holding money temporarily in virtual wallets (such as **PayPal Balance**, **Venmo**, or other fintech options), you could:

- Receive money into your receivables account.
- Transfer the funds out to a virtual wallet, then spend from there. 
- The wallet would function as your hidden intermediary, not visible to Plaid.

### **Key Takeaways:**
- While Plaid will always see the balance changes in a linked account, by routing money through a **third-party intermediary** like a **payment processor** (which Plaid cannot track), you keep your actual payables and outgoing payments invisible.
- Plaid will only see a reduction in balance but won't track the final destination or detailed transactions if they occur outside its visibility.

This setup won’t eliminate balance changes but will ensure that the outgoing transaction details are obscured from view.

---
