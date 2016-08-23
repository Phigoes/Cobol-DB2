//EAD316CL JOB 'EAD316',CLASS=C,MSGCLASS=X,NOTIFY=EAD316,TIME=(0,10)
//*****************************************************
//*      LER E EXIBIR ARQUIVO CLIENTES                *
//*****************************************************
//EXECUTE  EXEC PGM=ALUNO08
//STEPLIB  DD   DSN=GR.GERAL.LOADLIB,DISP=SHR
//CLIENTES DD   DSN=GR.EAD316.CLIENTES,DISP=OLD