RaspPiStatusReport
==================

Report Raspberry Pi's Status via Gmail


## What is This?
This Script send a Raspberry Pi's status reporting mail via Gmail.

Now, it is available to notify current CPU temperature and current CPU frequency.

## What is Need

-Ruby(2.0.0or1.9.3)

* I've checked this script only in 2.0.0

## HOW TO USE
Please Write these infomation into reportstatus.rb.

YOUR_NAME           : Senders' name in mail body

ADDRESS_FROM        : FROM Address.

ADDRESS_TO          : TO Address.

YOUR_GMAIL_ACCOUNT  : Your Gmail Account Name

YOUR_GMAIL_PASS     : Your Gmail Password


Now, just type following command in your directory!

    $ ruby reportstatus.rb

And, status reporting mail will be sent to ADDRESS_TO.
