# DSA Mock Interview Prep

Data Structures & Algorithms questions commonly asked at Canadian banks.

---

## Easy Questions

### 1. Find First Non-Repeating Character in a String

**Asked at:** RBC, TD, Scotiabank, CIBC

**Problem:**  
Given a string `s`, find the first non-repeating character in it and return its index. If it does not exist, return `-1`.

**Constraints:**
- `1 <= s.length <= 10^5`
- `s` consists of only lowercase English letters

**Examples:**
```
Input: s = "leetcode"
Output: 0
Explanation: The character 'l' at index 0 is the first character that does not occur elsewhere.

Input: s = "loveleetcode"
Output: 2
Explanation: The character 'v' at index 2 is the first non-repeating character.

Input: s = "aabbcc"
Output: -1
Explanation: All characters repeat.
```

---

### 2. Reverse a Linked List

**Asked at:** RBC, TD

**Problem:**  
Given the head of a singly linked list, reverse the list, and return the reversed list.

**Constraints:**
- The number of nodes in the list is in the range `[0, 5000]`
- `-5000 <= Node.val <= 5000`

**Examples:**
```
Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]

Input: head = [1,2]
Output: [2,1]

Input: head = []
Output: []
```

**Follow-up:** Can you solve it both iteratively and recursively?

---

### 3. Binary Search

**Asked at:** TD (LeetCode #704)

**Problem:**  
Given an array of integers `nums` which is sorted in ascending order, and an integer `target`, write a function to search `target` in `nums`. If `target` exists, return its index. Otherwise, return `-1`.

You must write an algorithm with `O(log n)` runtime complexity.

**Constraints:**
- `1 <= nums.length <= 10^4`
- `-10^4 < nums[i], target < 10^4`
- All the integers in `nums` are unique
- `nums` is sorted in ascending order

**Examples:**
```
Input: nums = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in nums and its index is 4.

Input: nums = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in nums so return -1.
```

---

## Medium Questions

### 4. Integer to Roman Numeral

**Asked at:** TD (LeetCode #12)

**Problem:**  
Given an integer, convert it to a Roman numeral.

Roman numerals are represented by seven symbols:

| Symbol | Value |
|--------|-------|
| I | 1 |
| V | 5 |
| X | 10 |
| L | 50 |
| C | 100 |
| D | 500 |
| M | 1000 |

Roman numerals are formed by appending the conversions of decimal place values from highest to lowest. There are six instances where subtraction is used:
- `I` before `V` (5) and `X` (10) makes 4 and 9
- `X` before `L` (50) and `C` (100) makes 40 and 90
- `C` before `D` (500) and `M` (1000) makes 400 and 900

**Constraints:**
- `1 <= num <= 3999`

**Examples:**
```
Input: num = 3749
Output: "MMMDCCXLIX"
Explanation: 3000 = MMM, 700 = DCC, 40 = XL, 9 = IX

Input: num = 58
Output: "LVIII"
Explanation: 50 = L, 5 = V, 3 = III

Input: num = 1994
Output: "MCMXCIV"
Explanation: 1000 = M, 900 = CM, 90 = XC, 4 = IV
```

---

### 5. Merge K Sorted Lists

**Asked at:** RBC (CodeSignal)

**Problem:**  
You are given an array of `k` linked-lists, each linked-list is sorted in ascending order.

Merge all the linked-lists into one sorted linked-list and return it.

**Constraints:**
- `k == lists.length`
- `0 <= k <= 10^4`
- `0 <= lists[i].length <= 500`
- `-10^4 <= lists[i][j] <= 10^4`
- `lists[i]` is sorted in ascending order
- The sum of `lists[i].length` will not exceed `10^4`

**Examples:**
```
Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
  1->4->5
  1->3->4
  2->6
Merging them into one sorted list: 1->1->2->3->4->4->5->6

Input: lists = []
Output: []

Input: lists = [[]]
Output: []
```

---

### 6. Queue Simulation with Size Limit

**Asked at:** RBC (CodeSignal)

**Problem:**  
You are building a processing system that handles incoming requests. The system has a queue with a maximum capacity of 4 items.

Given an array of incoming requests with their processing times, simulate the queue behavior:
- If the queue is not full, add the request to the queue
- If the queue is full, reject the request
- Process requests in FIFO order

Return the number of successfully processed requests and the number of rejected requests.

**Constraints:**
- `1 <= requests.length <= 1000`
- `1 <= processing_time[i] <= 100`
- Queue max size = 4

**Example:**
```
Input: requests = [1, 2, 3, 4, 5, 6, 7]
        (assuming each request takes 1 unit of time to process)

Simulation:
- Request 1: Queue = [1], processed
- Request 2: Queue = [1,2], processed
- Request 3: Queue = [1,2,3], processed
- Request 4: Queue = [1,2,3,4], processed
- Request 5: Queue full, REJECTED
- ...

Output: Return count of processed and rejected requests
```

---

## Summary

| # | Problem | Difficulty | Asked At |
|---|---------|------------|----------|
| 1 | First Non-Repeating Character | Easy | RBC, TD, Scotiabank, CIBC |
| 2 | Reverse Linked List | Easy | RBC, TD |
| 3 | Binary Search | Easy | TD |
| 4 | Integer to Roman | Medium | TD |
| 5 | Merge K Sorted Lists | Medium | RBC |
| 6 | Queue Simulation | Medium | RBC |
