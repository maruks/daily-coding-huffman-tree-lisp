(fiasco:define-test-package :huffman-tests
    (:use :huffman :fiasco))

(in-package :huffman-tests)

(defconstant *values*
  '((A . 5)
    (B . 25)
    (C . 7)
    (D . 15)
    (E . 4)
    (F . 12)))

(deftest huffman-encoding-test ()
  (= (huffman-encoding values) '((F . #*00)
				 (D . #*01)
				 (C . #*100)
				 (E . #*1010)
				 (A . #*1011)
				 (B . #*11))))
