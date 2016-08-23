//EAD316CL JOB 'EAD316',CLASS=C,MSGCLASS=X,NOTIFY=EAD316,TIME=(0,10)
//*****************************************************
//*      EXIBIR VENDAS POR MES                        *
//*****************************************************
//EXECUTE  EXEC PGM=ALUNO11
//STEPLIB  DD   DSN=GR.GERAL.LOADLIB,DISP=SHR
//VENDAS   DD   DSN=GR.EAD316.VENDAS,DISP=OLD