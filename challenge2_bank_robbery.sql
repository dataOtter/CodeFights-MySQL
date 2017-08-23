/*There was a robbery from the ATM at the bank where you work. Some unauthorized withdrawals were made, and you need to help your bank find out more about those withdrawals. But the only information you have is that there were more than 1 withdrawals and that all of them were done in 10-second gaps.

You have a table customer_transactions with the following columns:

    id - the unique transaction ID;
    customer_name - the name of the customer of the bank;
    transaction_time - the date and time when this transaction was made;
    transaction_amount - the amount of money involved in this transaction.

You need to retrieve all the customer_names (ordered) whose transactions have a 10-second gap from each other.*/


/*Please add ; after each select statement*/
CREATE PROCEDURE bankRobbery()

SELECT q.customer_name FROM

(SELECT t1.customer_name, COUNT(t1.customer_name) as z

FROM customer_transactions AS t1 INNER JOIN customer_transactions AS t2 

ON t1.customer_name = t2.customer_name 

WHERE TIMESTAMPDIFF(SECOND, t1.transaction_time, t2.transaction_time) = 10

GROUP BY t1.customer_name) as q 

INNER JOIN (SELECT customer_name, COUNT(customer_name) as c 
            
FROM customer_transactions 
            
GROUP BY customer_name) as w

ON q.customer_name = w.customer_name

AND z = c - 1

ORDER BY q.customer_name;



CREATE PROCEDURE bankRobbery()

SELECT qone.customer_name FROM

(SELECT t1.customer_name, COUNT(t1.customer_name) as total

FROM customer_transactions AS t1 INNER JOIN customer_transactions AS t2 

ON t1.customer_name = t2.customer_name 

WHERE TIMESTAMPDIFF(SECOND, t1.transaction_time, t2.transaction_time) = 10

GROUP BY t1.customer_name) as qone 

INNER JOIN (SELECT customer_name, COUNT(customer_name) as c 
            
FROM customer_transactions 
            
GROUP BY customer_name) as qtwo

ON qone.customer_name = qtwo.customer_name

AND total = c - 1

ORDER BY qone.customer_name;
