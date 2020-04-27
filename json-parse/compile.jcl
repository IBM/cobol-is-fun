//****************************************************************************
//* Copyright 2020 IBM Corp. All Rights Reserved.
//*
//*  Licensed under the Apache License, Version 2.0 (the "License");
//*  you may not use this file except in compliance with the License.
//*  You may obtain a copy of the License at
//*
//*       http://www.apache.org/licenses/LICENSE-2.0
//*
//*   Unless required by applicable law or agreed to in writing, software
//*   distributed under the License is distributed on an "AS IS" BASIS,
//*   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//*   See the License for the specific language governing permissions and
//*   limitations under the License.
//****************************************************************************
//COBOLCP  JOB REGION=0M,MSGCLASS=1,NOTIFY=&SYSUID                
//***********************************************************     
//CLEAN EXEC PGM=IEFBR14                                          
//OLDDS  DD DSN=IBMUSER.COBOL.OBJ,DISP=(SHR,DELETE),              
//   VOL=SER=A4DBAR,UNIT=3390                                     
//***********************************************************     
//COMPILE EXEC PGM=IGYCRCTL                                       
//STEPLIB  DD   DSNAME=IGY630.SIGYCOMP,DISP=SHR                   
//         DD   DSNAME=CEE.SCEERUN,DISP=SHR                       
//         DD   DSNAME=CEE.SCEERUN2,DISP=SHR                      
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))                      
//SYSUT2   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))                      
//SYSUT3   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))                      
//SYSUT4   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))                      
//SYSUT5   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))                      
//SYSUT6   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))                      
//SYSUT7   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))                      
//SYSUT8   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))                    
//SYSUT9   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))                    
//SYSUT10  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))                    
//SYSUT11  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))                    
//SYSUT12  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))                    
//SYSUT13  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))                    
//SYSUT14  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))                    
//SYSUT15  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))                    
//SYSMDECK DD   UNIT=SYSDA,SPACE=(CYL,(1,1))                      
//SYSPRINT DD   SYSOUT=A                                          
//SYSLIN   DD   DSNAME=IBMUSER.COBOL.OBJ,VOL=SER=A4DBAR,UNIT=3390,
//  DISP=(NEW,KEEP,KEEP),SPACE=(TRK,(30,30))                      
//SYSIN    DD   DSNAME=IBMUSER.JCL(COBOL),DISP=SHR                