What does this code do?
-----------------------
Emulates the oystercard system. Features include top-up, touch-in, touch-out, deduct fare etc. (See user stories below)

Startup
-------
1. Fork this repo, and clone to your local machine ##ADD HYPERLINK
2. In your terminal, run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle` ##ALL OF IT?
4. ##SOMETHING ABOUT IRB AND REQUIRING THE FILES


|    | User Story                                                    | IRB example                                   |
|:--:|---------------------------------------------------------------|-----------------------------------------------|
|  1 | In order to use public transport                              |                                               |
|    | As a customer                                                 | card.balance                                  |
|    | I want money on my card.                                      | => £0                                         |
|    |                                                               |                                               |
|    |                                                               |                                               |
|  2 | In order to keep using public transport                       |                                               |
|    | As a customer                                                 | card.top_up(15)                               |
|    | I want to add money to my card                                | => Card balance is now £15                    |
|    |                                                               |                                               |
|    |                                                               |                                               |
|  3 | In order to protect my money                                  | Max. limit is set to £90                      |
|    | As a customer                                                 | card.top_(91)                                 |
|    | I don't want to put too much money on my card                 | => Exceeds limit, retry with a smaller amount |
|    |                                                               |                                               |
|    |                                                               |                                               |
|  4 | In order to pay for my journey                                |                                               |
|    | As a customer                                                 | card.deduct(amount)                           |
|    | I need my fare deducted from my card                          | => Card balance is now ...                    |
|    |                                                               |                                               |
|    |                                                               |                                               |
|  5 | In order to get through the barriers                          |                                               |
|    | As a customer                                                 |                                               |
|    | I need to touch in and out                                    |                                               |
|    |                                                               |                                               |
|    |                                                               |                                               |
|  6 | In order to pay for my journey                                |                                               |
|    | As a customer                                                 |                                               |
|    | I need to have the minimum amount for a single journey        |                                               |
|    |                                                               |                                               |
|    |                                                               |                                               |
|  7 | In order to pay for my journey                                |                                               |
|    | As a customer                                                 |                                               |
|    | I need to pay for my journey when it's complete               |                                               |
|    |                                                               |                                               |
|    |                                                               |                                               |
|  8 | In order to pay for my journey                                |                                               |
|    | As a customer                                                 |                                               |
|    | I need to know where I've travelled from                      |                                               |
|    |                                                               |                                               |
|    |                                                               |                                               |
|  9 | In order to know where I have been                            |                                               |
|    | As a customer                                                 |                                               |
|    | I want to see to all my previous trips                        |                                               |
|    |                                                               |                                               |
|    |                                                               |                                               |
| 10 | In order to know how far I have travelled                     |                                               |
|    | As a customer                                                 |                                               |
|    | I want to know what zone a station is in                      |                                               |
|    |                                                               |                                               |
|    |                                                               |                                               |
| 11 | In order to be charged correctly                              |                                               |
|    | As a customer                                                 |                                               |
|    | I need a penalty charge deducted if I fail to touch in or out |                                               |
|    |                                                               |                                               |
|    |                                                               |                                               |
| 12 | In order to be charged the correct amount                     |                                               |
|    | As a customer                                                 |                                               |
|    | I need to have the correct fare calculated                    |                                               |
|    |                                                               |                                               |
