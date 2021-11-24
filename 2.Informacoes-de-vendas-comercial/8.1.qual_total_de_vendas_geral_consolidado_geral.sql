/*1.	Qual total de vendas geral consolidado(Geral) 
##### TABELAS ENVOLVIDAS  #####
#                             #   
# NOTA_FISCAL				  #	
#                             #   
###############################
 */
 /* REGRAS TIPO NOTA DE VENDA SAIDA ='S' */

/*SELECT TOP 5 * FROM NOTA_FISCAL A */

SELECT SUM(A.TOTAL_NF) AS TOTAL_FAT FROM NOTA_FISCAL A
WHERE A.TIP_NF='S'

 /*3552807.36 */




