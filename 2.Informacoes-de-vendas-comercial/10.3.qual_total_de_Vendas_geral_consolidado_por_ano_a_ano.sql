/*3.	Qual total de vendas geral consolidado(Geral) Ano a Ano.
##### TABELAS ENVOLVIDAS  #####
#                             #   
# NOTA_FISCAL				  #	
# EMPRESA                     #   
#                             #   
###############################
 */
 /* REGRAS TIPO NOTA DE VENDA SAIDA ='S' */
 /*3552807.36 */
 --SOLUCAO 1
  SELECT A.FANTASIA,
         YEAR(B.DATA_EMISSAO) ANO,
         SUM(B.TOTAL_NF) AS TOTAL 
   FROM EMPRESA A
   INNER JOIN NOTA_FISCAL B
   ON A.COD_EMPRESA=B.COD_EMPRESA
   WHERE B.TIP_NF='S'
   GROUP BY A.FANTASIA,YEAR(B.DATA_EMISSAO)
   ORDER BY A.FANTASIA, YEAR(B.DATA_EMISSAO)
 

 --SOLUCÃO 2
  SELECT ISNULL(A.FANTASIA,'Total Geral') as Fantasia,
         ISNULL(CAST(YEAR(B.DATA_EMISSAO)as varchar(10)),'Total Ano') ANO,
         SUM(B.TOTAL_NF) AS TOTAL 
   FROM EMPRESA A
   INNER JOIN NOTA_FISCAL B
   ON A.COD_EMPRESA=B.COD_EMPRESA
   WHERE B.TIP_NF='S'
   GROUP BY ROLLUP(A.FANTASIA,YEAR(B.DATA_EMISSAO))
 
 
