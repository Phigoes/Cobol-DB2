//EAD316CL JOB 'EAD316',CLASS=C,MSGCLASS=X,NOTIFY=EAD316,TIME=(0,10)
//*****************************************************
//*      EXECUTAR IMPRESSAO DE CLIENTES               *
//*****************************************************
//EXECUTE  EXEC PGM=ALUNO10
//STEPLIB  DD   DSN=GR.GERAL.LOADLIB,DISP=SHR
//CLIENTES DD   DSN=GR.EAD316.CLIENTES,DISP=OLD
//RELATO   DD   SYSOUT=X