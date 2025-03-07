;;   Copyright 2013 Google Inc.
;;
;;   Licensed under the Apache License, Version 2.0 (the "License");
;;   you may not use this file except in compliance with the License.
;;   You may obtain a copy of the License at
;;
;;       http://www.apache.org/licenses/LICENSE-2.0
;;
;;   Unless required by applicable law or agreed to in writing, software
;;   distributed under the License is distributed on an "AS IS" BASIS,
;;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;   See the License for the specific language governing permissions and
;;   limitations under the License.

"vectors are just like rank 1 arrays"

(define-test test-vector-types
  " #(x y z) defines a vector literal containing x y z"
  (true-or-false? t (typep #(1 11 111) 'vector))
  (assert-equal 11 (aref #(1 11 111) 1)))


(define-test test-length-works-on-vectors
    (assert-equal (length #(1 2 3)) 3))


(define-test test-bit-vector
  "#*0011 defines a bit vector literal with four elements, 0, 0, 1 and 1"
  (assert-equal #*0011 (make-array '4 :element-type 'bit :initial-contents '(0 0 1 1)))
  (true-or-false? t (typep #*1001 'bit-vector))
  (assert-equal 0 (aref #*1001 1)))


(define-test test-some-bitwise-operations
    (assert-equal #*1000 (bit-and #*1100 #*1010))
  (assert-equal #*1110 (bit-ior #*1100 #*1010))
  (assert-equal #*0110 (bit-xor #*1100 #*1010)))


(defun list-to-bit-vector (my-list)
  (make-array (length my-list) :element-type 'bit :initial-contents my-list))

(define-test test-list-to-bit-vector
  "you must complete list-to-bit-vector"
  (assert-true (typep (list-to-bit-vector '(0 0 1 1 0)) 'bit-vector))
  (assert-equal (aref (list-to-bit-vector '(0)) 0) 0)
  (assert-equal (aref (list-to-bit-vector '(0 1)) 1) 1)
  (assert-equal (length (list-to-bit-vector '(0 0 1 1 0 0 1 1))) 8))


