//EAD316CB JOB 'EAD316',CLASS=C,MSGCLASS=X,NOTIFY=&SYSUID               
//*-----------------------------------------------------------*         
//*  JOB DE COMPILACAO DE PROGRAMA COBOL COM DB2 BATCH        *         
//*-----------------------------------------------------------*         
// JCLLIB ORDER=GR.GERAL.PROCLIB                                        
//COMPDB2B EXEC DFHCODB2,NAME='NOMEDOPROGRAMA',INSTR='EAD316'                  
//LKED.SYSIN    DD   *                                                  
  NAME NOMEDOPROGRAMA(R)                                                       
/*                                                                      
//BIND.SYSTSIN  DD *                                                    
DSN SYSTEM(DB8G)                                                        
BIND PLAN(NOMEDOPROGRAMA) MEM(NOMEDOPROGRAMA) ACT(REP) ISOLATION(CS) -                 
     LIB('DSN810.DBRMLIB.DATA')                                         
END                                                                     
/*                                                                      