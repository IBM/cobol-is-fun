### Using COBOL to Parse JSON

## Introduction
This simple COBOL application demonstrates how to parse JSON using IBM Enterprise COBOL.  It is written to work in a standalone fashion so it can run without any input files.  The JSON string is declared in memory, as are the resuts from the parse, and everything is printed out for clarity.

The first JSON text that we are going to parse contains information about our client and is defined in working storage as `jtxt-1047-client-data`.

It looks like this:<br>
<img src="images/json-clientdata.png" width="443"/>

The second JSON text that we are using contains transaction data stored in a JSON array.  We define it in working storage as `jtxt-1047-transactions`.

It looks like this:<br>
<img src="images/json-transactions.png" width="495"/>

## Prerequisites
- z/OS system access
- IBM Enterprise COBOL

## Estimated Time
It should take about 30 minutes to complete this tutorial.

## Steps
1. Copy the supplied files to your z/OS system.
2. Edit the supplied JCL to meet your environment.
3. Submit `compile.jcl` to invoke the Enterprise COBOL compiler to create an object from your source.
4. Submit `bind.jcl` to invoke the Binder to create an executable from your object file.
5. Submit `execute.jcl` to execute the program.

A successful execution should look like:<br>
<img src="images/output.png" width="398"/>

## Troubleshooting
You may encounter a problem running this code based on the default character encoding (CCSID)  in your environment.  For example, you may encounter a IGZ0339W at run time on the second JSON parse because of the square brackets in the JSON.  This is the purpose of the `CBL CODEPAGE(DCBS)` command at the top of our program.  Your mileage may vary based on environmental configuration.

## License
This code pattern is licensed under the Apache License, Version 2. Separate third-party code objects invoked within this code pattern are licensed by their respective providers pursuant to their own separate licenses. Contributions are subject to the [Developer Certificate of Origin, Version 1.1](https://developercertificate.org/) and the [Apache License, Version 2](https://www.apache.org/licenses/LICENSE-2.0.txt).

[Apache License FAQ](https://www.apache.org/foundation/license-faq.html#WhatDoesItMEAN)