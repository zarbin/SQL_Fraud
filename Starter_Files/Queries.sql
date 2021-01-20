--How can you isolate (or group) the transactions of each cardholder?
SELECT ch.name, t.date, t.amount, t.card
FROM transaction as t
INNER JOIN credit_card as c ON t.card = c.card
INNER JOIN card_holder ch ON c.chardholder_id = ch.id;

--Count the transactions that are less than $2.00 per cardholder.
SELECT ch.name, COUNT (t.amount)
FROM transaction as t
INNER JOIN credit_card as c ON t.card = c.card
INNER JOIN card_holder ch ON c.chardholder_id = ch.id
WHERE t.amount < 2.00
GROUP BY name
ORDER BY Count DESC;

--Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.


--What are the top 100 highest transactions made between 7:00 am and 9:00 am?
SELECT ch.name, t.date, t.amount, t.card
FROM transaction as t
INNER JOIN credit_card as c ON t.card = c.card
INNER JOIN card_holder ch ON c.chardholder_id = ch.id
WHERE CAST(t.date as TIME) BETWEEN '07:00' and '09:00'
ORDER BY AMOUNT DESC
LIMIT 100;

--Do you see any anomalous transactions that could be fraudulent?


--Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?


--If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.