/*2.	Qual total de vendas geral consolidado(Geral) por empresa
##### TABELAS ENVOLVIDAS  #####
#                             #   
# NOTA_FISCAL				  #	
# EMPRESA                     #   
#                             #   
###############################
 */
 /* REGRAS TIPO NOTA DE VENDA SAIDA ='S' */
 /*3552807.36 */
 --SOLUÇÃO 1

 SELECT A.FANTASIA, SUM(B.TOTAL_NF) AS TOTAL
	FROM EMPRESA A
	INNER JOIN NOTA_FISCAL B
	ON A.COD_EMPRESA=B.COD_EMPRESA
	WHERE B.TIP_NF='S'
	GROUP BY FANTASIA



--SOLUÇÃO 2

 SELECT ISNULL(A.FANTASIA,'TOTAL') AS FANTASIA, SUM(B.TOTAL_NF) AS TOTAL
	FROM EMPRESA A
	INNER JOIN NOTA_FISCAL B
	ON A.COD_EMPRESA=B.COD_EMPRESA
	WHERE B.TIP_NF='S'
	GROUP BY A.FANTASIA WITH ROLLUP




  

 

