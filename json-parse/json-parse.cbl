      ******************************************************************
      * Copyright 2020 IBM Corp. All Rights Reserved.
      *
      * Licensed under the Apache License, Version 2.0 (the "License");
      * you may not use this file except in compliance with the License.
      * You may obtain a copy of the License at
      * http://www.apache.org/licenses/LICENSE-2.0
      *
      * Unless required by applicable law or agreed to in writing,
      * software distributed under the License is distributed on an
      * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
      * either express or implied.
      * See the License for the specific language governing permissions
      * and limitations under the License.
      ****************************************************************** 

      * This application defines a simple JSON string in memory and
      * then parses it, storing the results of the parse in a set of
      * variables.

CBL CODEPAGE(DCBS)
       Identification division.
         Program-id. json_parse.
       Data division.
        Working-storage section.
         1 jtxt-1047-client-data.
          3 pic x(16)  value '{"client-data":{'.
          3 pic x(28)  value ' "account-num":123456789012,'.
          3 pic x(19)  value ' "balance":-125.53,'.
          3 pic x(17)  value ' "billing-info":{'.
          3 pic x(22)  value '  "name-first":"Matt",'.
          3 pic x(22)  value '  "name-last":"CUZ",'.
          3 pic x(37)  value '  "addr-street":"2455 South Rd",'.
          3 pic x(25)  value '  "addr-city":"Pok",'.
          3 pic x(27)  value '  "addr-region":"New York",'.
          3 pic x(21)  value '  "addr-code":"12601"'.
          3 pic x(3)   value '  }'.
          3 pic x(2)   value ' }'.
          3 pic x(1)   value '}'.
        1 jtxt-1047-transactions.
          3 pic x(16)  value '{"transactions":'.
          3 pic x(14)  value ' {"tx-record":'.
          3 pic x(3)   value '  ['.
          3 pic x(4)   value '   {'.
          3 pic x(19)  value '    "tx-uid":107,'.
          3 pic x(34)  value '    "tx-item-desc":"prod a ver 1",'.
          3 pic x(30)  value '    "tx-item-uid":"ab142424",'.
          3 pic x(26)  value '    "tx-priceinUS$":12.34,'.
          3 pic x(35)  value '    "tx-comment":"express shipping"'.
          3 pic x(5)   value '   },'.
          3 pic x(4)   value '   {'.
          3 pic x(19)  value '    "tx-uid":1904,'.
          3 pic x(35)  value '    "tx-item-desc":"prod g ver 2",'.
          3 pic x(30)  value '    "tx-item-uid":"gb051533",'.
          3 pic x(27)  value '    "tx-priceinUS$":833.22,'.
          3 pic x(35)  value '    "tx-comment":"digital download"'.
          3 pic x(5)   value '   } '.
          3 pic x(3)   value '  ]'.
          3 pic x(2)   value ' }'.
          3 pic x(1)   value '}'.
         1 jtxt-1208 pic x(1000) value is all x'20'.
         77 txnum pic 999999 usage display  value zero .
         1 client-data.
          3 account-num   pic 999,999,999,999.
          3 balance       pic $$$9.99CR.
          3 billing-info.
           5 name-first  pic n(20).
           5 name-last   pic n(20).
           5 addr-street pic n(20).
           5 addr-city   pic n(20).
           5 addr-region pic n(20).
           5 addr-code   pic n(10).
          3 transactions.
           5 tx-record occurs 0 to 100 depending txnum.
            7 tx-uid       pic 99999 usage display.
            7 tx-item-desc pic x(50).
            7 tx-item-uid  pic AA/9999B99.
            7 tx-price     pic $$$9.99.
            7 tx-comment   pic n(20).
       Procedure division.
           Initialize jtxt-1208 all value.
           Move function display-of(
            function national-of(
            jtxt-1047-client-data) 1208)
             to jtxt-1208(1:function length(jtxt-1047-client-data)).

           Json parse jtxt-1208 into client-data
             with detail
             suppress transactions
             not on exception
               display "Successful JSON Parse"
           end-json.

           Display "Account Number:"
           Display "  " account-num
           Display "Balance:"
           Display "  " balance
           Display "Client Information: "
           Display "  Name:"
           Display "    " function display-of(name-last)
           Display "    " function display-of(name-first)
           Display "  Address:"
           Display "    " function display-of(addr-street)
           Display "    " function display-of(addr-city)
           Display "    " function display-of(addr-region)
           Display "    " function display-of(addr-code).

           Move 2 to txnum.
           Initialize jtxt-1208 all value.
           Move function display-of(
            function national-of(
            jtxt-1047-transactions) 1208)
             to jtxt-1208(1:function length(jtxt-1047-transactions)).

           Json parse jtxt-1208 into transactions
             with detail
             name tx-price is 'tx-priceinUS$'
             not on exception
               display "Successful JSON Parse"
           end-json.

           Display "Transactions:"
           Display "  Record 1:"
           Display "    TXID:        " tx-uid(1)
           Display "    Description: " tx-item-desc(1)
           Display "    Item ID:     " tx-item-uid(1)
           Display "    Price:       " tx-price(1)
           Display "    Comment:     "
             function display-of(tx-comment(1))
           Display "  Record 2:"
           Display "    TXID:        " tx-uid(2)
           Display "    Description: " tx-item-desc(2)
           Display "    Item ID:     " tx-item-uid(2)
           Display "    Price:       " tx-price(2)
           Display "    Comment:     "
             function display-of(tx-comment(2))

           Goback.
       End program json_parse.