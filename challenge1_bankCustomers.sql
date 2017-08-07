/*You just started working at a bank. Unfortunately, you've discovered that this bank isn't great at keeping records. Some of the entries in your database are really messed up! There are records about customers in the wrong format. There are even records about people who aren't customers of this bank!

The records table contains the following columns:

    id - the unique ID of the customer;
    customer_name - the unique name of the customer;
    card - the number of the customer's bank card (it's guaranteed that each customer has only one card);
    issue_date - the date when this card was issued.

For each id, return "true" or "false" in the column result, depending on whether the records have the right format.

Here's the description of the correct record format:

    customer_name - should consist of two words, both starting with a capital letter, separated by a single whitespace (e.g. "John Smith");
    card - should start with the digits "1234" (since this is the code of your bank) and have the format "1234-dddd-dddd-dddd", where "d" stands for any digit from 0 to 9.
    issue_date - your bank's first day of operation was 01-01-2000, so all dates before this day are incorrect. We won't consider any records after 31-12-2016 either. The format of this column should be "dd-mm-yyyy", where "dd" stands for the day, "mm" stands for the month, and "yyyy" stands for the year. To make task easier, let's say that every month has 31 days.
*/


CREATE PROCEDURE bankCustomers()

SELECT id, 

IF (
   
   customer_name RLIKE BINARY '^[A-Z]{1}[a-z]* [A-Z]{1}[a-z]*$' && 
   
   card RLIKE '^1234-[0-9]{4}-[0-9]{4}-[0-9]{4}$' && 
   
   issue_date RLIKE '^(0[1-9]|[1-2][0-9]|3[0-1])-(0[1-9]|1[0-2])-20(0[0-9]|1[0-6])$', 
   
   "true", "false"
   
  ) result

FROM records