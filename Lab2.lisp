;1 task

(defun remove-seconds-and-thirds (list)
  (cond
    ((null list) nil)
    ((null (cdr list)) (list (car list)))
    ((null (cdr (cdr list))) (list (car list)))
    (t
     (cons (car list)
           (remove-seconds-and-thirds (cdr (cdr (cdr list))))))))




(defun run-remove-seconds-and-thirds-tests ()
  (format t "Test 1: remove-seconds-and-thirds ~%")
  (format t "~a~%" (equal (remove-seconds-and-thirds '(A B C D)) '(A D)))
  (format t "Test 2: remove-seconds-and-thirds ~%")
  (format t "~a~%" (equal (remove-seconds-and-thirds '(A B C D E F G)) '(A D G)))
  (format t "Test 3: remove-seconds-and-thirds (short list) ~%")
  (format t "~a~%" (equal (remove-seconds-and-thirds '(A B)) '(A))))



(run-remove-seconds-and-thirds-tests)           


;2 task

(defun element-in-list (elem lst)
  (cond
    ((null lst) nil)               
    ((eql elem (car lst)) t)         
    (t (element-in-list elem (cdr lst)))))  
ELEMENT-IN-LIST

(defun list-set-intersection (list1 list2)
 
  (cond
    ((null list1) nil)  
    ((element-in-list (car list1) list2)
     (cons (car list1)  
           (list-set-intersection (cdr list1) list2)))  
    (t (list-set-intersection (cdr list1) list2))))  


(defun run-list-set-intersection-tests ()
  (format t "Test 1: list-set-intersection ~%")
  (format t "~a~%" (equal (list-set-intersection '(1 2 3 4) '(3 4 5 6)) '(3 4)))
  (format t "Test 2: list-set-intersection ~%")
  (format t "~a~%" (equal (list-set-intersection '(1 2 4 3) '(3 4 5 6)) '(4 3)))
  (format t "Test 3: list-set-intersection ~%")
  (format t "~a~%" (equal (list-set-intersection '(1 2) '(3 4)) nil)))


(run-list-set-intersection-tests)
