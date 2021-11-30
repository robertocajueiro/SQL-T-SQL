/* 7. Qual total de vendas geral consolidado por Tipo de material
########3 TABELAS ENVOLVIDAS ########
# 
# NOTA_FISCAL
# NOTA_FISCAL_ITENS
# MATERIAL
# TIP_MAT
#
################################

REGRAS TIPO NOTA DE VENDA SAIDA = 'S'
3552807.36

*/
-- solucao 1

SELECT D.DESC_TIP_MAT, SUM(B.QTD*B.VAL_UNIT) TOTAL
FROM NOTA_FISCAL A
	INNER JOIN NOTA_FISCAL_ITENS B
	ON A.COD_EMPRESA=B.COD_EMPRESA
	AND A.NUM_NF=B.NUM_NF
	INNER JOIN MATERIAL C
	ON A.COD_EMPRESA=C.COD_EMPRESA
	AND B.COD_MAT=C.COD_MAT
	INNER JOIN TIPO_MAT D
	ON A.COD_EMPRESA=D.COD_EMPRESA
	AND C.COD_TIP_MAT=D.COD_TIP_MAT
	WHERE A.TIP_NF='S'
	GROUP BY D.DESC_TIP_MAT

	-- solucao 2

SELECT  ISNULL(D.DESC_TIP_MAT, 'TOTAL') DESC_TIP_MAT, 
		SUM(B.QTD*B.VAL_UNIT) TOTAL
FROM NOTA_FISCAL A
	INNER JOIN NOTA_FISCAL_ITENS B
	ON A.COD_EMPRESA=B.COD_EMPRESA
	AND A.NUM_NF=B.NUM_NF
	INNER JOIN MATERIAL C
	ON A.COD_EMPRESA=C.COD_EMPRESA
	AND B.COD_MAT=C.COD_MAT
	INNER JOIN TIPO_MAT D
	ON A.COD_EMPRESA=D.COD_EMPRESA
	AND C.COD_TIP_MAT=D.COD_TIP_MAT
	WHERE A.TIP_NF='S'
	GROUP BY ROLLUP (D.DESC_TIP_MAT)