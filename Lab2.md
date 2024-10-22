<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 2</b><br/>
"Рекурсія"<br/>
</p>
<p align="right">Студент: Бойко Дмитро Павлович КВ-11<p>
<p align="right">Рік: 2024<p>

## Загальне завдання

  Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за можливості/
  необхідності використовуючи різні види рекурсії. Функції, які необхідно реалізувати, задаються варіантом (п. 
  2.1.1). Вимоги до функцій:
  
  1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового списку, а не зміни 
    наявного (вхідного).
  2. Не допускається використання функцій вищого порядку чи стандартних функцій для роботи зі списками, 
    що не наведені в четвертому розділі навчального посібника.
  3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції в якості аргументів.
  4. Не допускається використання псевдофункцій (деструктивного підходу).
  5. Не допускається використання циклів. Кожна реалізована функція має бути протестована для різних тестових 
    наборів. Тести мають бути оформленні у вигляді модульних тестів (див. п. 2.3). Додатковий бал за лабораторну 
    роботу можна отримати в разі виконання всіх наступних умов: робота виконана до дедлайну (включно з датою 
    дедлайну) крім основних реалізацій функцій за варіантом, також реалізовано додатковий варіант однієї чи 
    обох функцій, який працюватиме швидше за основну реалізацію, не порушуючи при цьому перші три вимоги до 
    основної реалізації (вимоги 4 і 5 можуть бути порушені), за виключенням того, що в разі необхідності можна 
    також використати стандартну функцію copy-list.


## Варіант 2

   1. Написати функцію remove-seconds-and-thirds , яка видаляє зі списку кожен другий і третій елементи:
      ```lisp
       CL-USER> (remove-seconds-and-thirds '(A B C D E F G))
       (A D G)
      ```
   2. Написати функцію list-set-intersection , яка визначає перетин двох множин, заданих списками атомів:
      ```lisp
       CL-USER> (list-set-intersection '(1 2 3 4) '(3 4 5 6))
       (3 4) ; порядок може відрізнятись
      ```

## Лістинг функції remove-seconds-and-thirds
```lisp
;1-st task
[1]> (defun remove-seconds-and-thirds (list)
  (cond
    ((null list) nil)
    ((null (cdr list)) (list (car list)))
    ((null (cdr (cdr list))) (list (car list)))
    (t
     (cons (car list)
           (remove-seconds-and-thirds (cdr (cdr (cdr list))))))))
REMOVE-SECONDS-AND-THIRDS
```

## Тестові набори
```lisp
[2]> (defun run-remove-seconds-and-thirds-tests ()
  (format t "Test 1: remove-seconds-and-thirds ~%")
  (format t "~a~%" (equal (remove-seconds-and-thirds '(A B C D)) '(A D)))
  (format t "Test 2: remove-seconds-and-thirds ~%")
  (format t "~a~%" (equal (remove-seconds-and-thirds '(A B C D E F G)) '(A D G)))
  (format t "Test 3: remove-seconds-and-thirds (short list) ~%")
  (format t "~a~%" (equal (remove-seconds-and-thirds '(A B)) '(A))))
RUN-REMOVE-SECONDS-AND-THIRDS-TESTS
```

## Тестування функції remove-seconds-and-thirds

```lisp
[3]> (run-remove-seconds-and-thirds-tests)
Test 1: remove-seconds-and-thirds
T
Test 2: remove-seconds-and-thirds
T
Test 3: remove-seconds-and-thirds (short list)
T
NIL
```

## Лістинг функції list-set-intersection

```lisp
;2-nd task
[4]> (defun element-in-list (elem lst)
  (cond
    ((null lst) nil)               
    ((eql elem (car lst)) t)         
    (t (element-in-list elem (cdr lst)))))  
ELEMENT-IN-LIST

[5]> (defun list-set-intersection (list1 list2)
 
  (cond
    ((null list1) nil)  
    ((element-in-list (car list1) list2)
     (cons (car list1)  
           (list-set-intersection (cdr list1) list2)))  
    (t (list-set-intersection (cdr list1) list2))))  
LIST-SET-INTERSECTION
```

## Тестові набори
```lisp
[6]> (defun run-list-set-intersection-tests ()
  (format t "Test 1: list-set-intersection ~%")
  (format t "~a~%" (equal (list-set-intersection '(1 2 3 4) '(3 4 5 6)) '(3 4)))
  (format t "Test 2: list-set-intersection ~%")
  (format t "~a~%" (equal (list-set-intersection '(1 2 4 3) '(3 4 5 6)) '(4 3)))
  (format t "Test 3: list-set-intersection ~%")
  (format t "~a~%" (equal (list-set-intersection '(1 2) '(3 4)) nil)))
RUN-LIST-SET-INTERSECTION-TESTS
```

## Тестування функції list-set-intersection

```lisp
[7]> (run-list-set-intersection-tests)
Test 1: list-set-intersection
T
Test 2: list-set-intersection 
T
Test 3: list-set-intersection
T
NIL
```


