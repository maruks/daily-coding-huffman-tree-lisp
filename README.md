# daily-coding-huffman-tree-lisp

> Huffman coding is a method of encoding characters based on their frequency. Each letter is assigned a variable-length
> binary string, such as 0101 or 111110, where shorter lengths correspond to more common letters. To accomplish this,
> a binary tree is built such that the path from the root to any leaf uniquely maps to a character. When traversing the path,
> descending to a left child corresponds to a 0 in the prefix, while descending right corresponds to 1.

```
  '((A . 5)
    (B . 25)
    (C . 7)
    (D . 15)
    (E . 4)
    (F . 12))
```


![Alt text](./huffman.jpg?raw=true "Huffman coding")

```
'((F . #*00)
  (D . #*01)
  (C . #*100)
  (E . #*1010)
  (A . #*1011)
  (B . #*11))
```

### Test

    ccl -e "(ql:quickload :huffman)" -e "(asdf:test-system :huffman)" -e "(quit)"
