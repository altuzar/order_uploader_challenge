# Rails Code Challenge

## Challenge

Your company has just acquired a new company and needs to import their data. Unfortunately, the acquired company has never stored their data in a database and instead uses a plain text file. Create a web-based application that fulfills the following requirements:

1. Accepts (via a form) a tab delimited file with the following columns: purchaser name, item description, item price, purchase count, merchant address, merchant name. Assume the columns will always be in that order, that there will always be data in each column, and that there will always be a header line. An example input file named example_input.tab is included in this repo.
2. Parses input file and stores the information in a relational database.
3. After upload, displays the total amount gross revenue represented by the uploaded file.

Example of the file:

`example_input.tab`

```
purchaser name	item description	item price	purchase count	merchant address	merchant name
Snake Plissken	$10 off $20 of food	10.0	2	987 Fake St	Bob's Pizza
Amy Pond	$30 of awesome for $10	10.0	5	456 Unreal Rd	Tom's Awesome Shop
Marty McFly	$20 Sneakers for $5	5.0	1	123 Fake St	Sneaker Store Emporium
Snake Plissken	$20 Sneakers for $5	5.0	4	123 Fake St	Sneaker Store Emporium
```

Note: This code was done in < 1 hour for a challenge, sorry for the typos hehe.
