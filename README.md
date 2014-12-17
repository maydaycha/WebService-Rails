WebService-Rails
================
This web service is for serving customers data and the data of the company. Customers can browse the products of the company and receive e-mails when new products is launched. The staff of this company can scan the Barcode or QRcode to add products to the database.

You can find the client app for this web service [here](https://github.com/maydaycha/QRcode_Android).

Environment
-----------
  
    ruby 2.0.0
    rails 4.0.3

使用 SQL Server
---------------

    brew install freetds(for tiny_tds gem)

Automation
----------
Clear tmp, log and then do db:drop, db:create, db:migrate.
    
    rake dev:build

Clear tmp, log and then do db:drop, db:create, db:migrate, db:seed.
    
    rake dev:rebuilt


