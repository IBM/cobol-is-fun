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
      
      *-----------------------
       IDENTIFICATION DIVISION.
      *-----------------------
       PROGRAM-ID.    FXSORT
       AUTHOR.        Jeff Bisti
      *--------------------
       ENVIRONMENT DIVISION.
      *--------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FXLIST-B ASSIGN TO FXBOSS.
           SELECT FXLIST-M ASSIGN TO FXMXR.
           SELECT FXLIST-J ASSIGN TO FXJHS.
           SELECT FXLIST-WORK ASSIGN TO WRK.
           SELECT FXLIST-MERGE ASSIGN TO FXLSTMRG.
           SELECT FXLIST-SORTED ASSIGN TO FXSORTED.
      *-------------
       DATA DIVISION.
      *-------------
       FILE SECTION.
       SD  FXLIST-WORK.
       01  FX-REC.
           05 FX-NAME-W      PIC X(50).
           05 FX-PRICE-W     PIC $$,$$$,$$9.99.
           05 FILLER PIC X(17).
      *
       FD  FXLIST-MERGE RECORDING MODE F.
       01 FX-MERG.
           05 FX-NAME-M      PIC X(50).
           05 FX-PRICE-M     PIC $$,$$$,$$9.99.
           05 FILLER PIC X(17).

       FD  FXLIST-SORTED RECORDING MODE F.
       01  PRINT-REC.
           05  FX-NAME-S      PIC X(50).
           05  FX-PRICE-S     PIC $$,$$$,$$9.99.
           05  FILLER PIC X(17).
      *
       FD  FXLIST-B RECORDING MODE F.
       01  BOSS-FIELDS.
           05  FX-NAME-B      PIC X(50).
           05  FX-PRICE-B     PIC $$,$$$,$$9.99.
           05  FILLER PIC X(17).
      *
       FD  FXLIST-M RECORDING MODE F.
       01  MXR-FIELDS.
           05  FX-NAME-M       PIC X(50).
           05  FX-PRICE-M     PIC $$,$$$,$$9.99.
           05  FILLER PIC X(17).
      *
       FD  FXLIST-J RECORDING MODE F.
       01  JHS-FIELDS.
           05  FX-NAME-I       PIC X(50).
           05  FX-PRICE-I     PIC $$,$$$,$$9.99.
           05  FILLER PIC X(17).
      *

      *------------------
       PROCEDURE DIVISION.
      *------------------


       PROCESS-RECORDS.
           DISPLAY "MERGING FILES"
           MERGE FXLIST-WORK ON ASCENDING KEY FX-NAME-W IN FX-REC
           USING FXLIST-B, FXLIST-M, FXLIST-J GIVING FXLIST-MERGE

           DISPLAY "SORTING RECORDS".
           SORT FXLIST-WORK ON ASCENDING KEY FX-PRICE-W IN FX-REC
           USING FXLIST-MERGE GIVING FXLIST-SORTED
           .

       CLOSE-STOP.
           DISPLAY "NOW I'M STOPPING".
           STOP RUN.