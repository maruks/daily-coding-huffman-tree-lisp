(defpackage :huffman
  (:use cl cl-heap)
  (:import-from cl-heap add-to-heap add-all-to-heap pop-heap heap-size)
  (:export huffman-encoding))

(in-package :huffman)

(defstruct node
  (frequency 0)
  (value nil)
  (left nil)
  (right nil))

(defun ->node (value-frequency)
  (make-node :value (car value-frequency) :frequency (cdr value-frequency)))

(defun make-heap (nodes)
  (let ((heap (make-instance 'cl-heap:fibonacci-heap :key #'node-frequency)))
    (add-all-to-heap heap nodes)))

(defun build-tree (queue)
  (let ((size (heap-size queue)))
    (cond ((= 1 size) (pop-heap queue))
	  (t (let* ((node-1 (pop-heap queue))
		    (node-2 (pop-heap queue))
		    (new-frequency (+ (node-frequency node-1) (node-frequency node-2)))
		    (new-node (make-node :frequency new-frequency :left node-1 :right node-2)))
	       (add-to-heap queue new-node)
	       (build-tree queue))))))

(defun encodings (tree bits)
  (let ((value (node-value tree)))
    (if value
	(list (cons value (coerce (reverse bits) 'bit-vector)))
	(let ((left (encodings (node-left tree) (cons 0 bits)))
	      (right (encodings (node-right tree) (cons 1 bits))))
	  (append left right)))))

(defun huffman-encoding (values)
  (encodings (build-tree (make-heap (mapcar #'->node values)) ) nil))
