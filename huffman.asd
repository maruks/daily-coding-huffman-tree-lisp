(defsystem "huffman"
  :name "huffman"
  :version "0.0.1"
  :author "Maris Orbidans"
  :licence "Public Domain"
  :depends-on (:cl-heap)
  :serial t
  :components ((:module "src"
		:serial t
		:components ((:file "huffman"))))
  :in-order-to ((test-op (test-op "huffman/tests"))))

(defsystem "huffman/tests"
  :licence "Public Domain"
  :depends-on (:huffman
	       :fiasco)
  :serial t
  :components ((:module "tests"
		:components ((:file "huffman-tests"))))
  :perform (test-op (o c) (symbol-call 'fiasco 'all-tests)))
