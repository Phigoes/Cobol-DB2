//EAD316EX JOB MSGCLASS=X,CLASS=C,NOTIFY=EAD316,TIME=1
//*
//*---------------------------------------------------*
//*  JOB PARA EXECUCAO DE PROGRAMA BATCH DB2          *
//*---------------------------------------------------*
//STEP1A   EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD DISP=SHR,DSN=DSN810.SDSNLOAD
//DBRMLIB  DD DSN=DSN810.DBRMLIB.DATA,DISP=SHR
//SYSTSPRT DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSTSIN  DD *
 DSN SYSTEM(DB8G)
 RUN  PROGRAM(NOMEDOPROGRAMA) PLAN(NOMEDOPROGRAMA) -
      LIB('GR.GERAL.LOADLIB')
 END
//*---------------------------------------------------*
//*  INCLUA A PARTIR DESSE PONTO OS DEMAIS            *
//*  ARQUIVOS UTILIZADOS PELO PROGRAMA                *
//*---------------------------------------------------*