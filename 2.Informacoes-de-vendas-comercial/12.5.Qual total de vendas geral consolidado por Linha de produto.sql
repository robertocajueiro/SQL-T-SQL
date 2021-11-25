/*
	5. Qual total de vendas geral consolidado por linha de produto
	#### Tabelas envolvidas ###

	NOTA_FISCAL
	NOTA_FISCAL_ITEMS
	MATERIAL
	LINHA_PRODUTO
*/
/* REGRAS TIPO NOTA DE VENDA SAIDA = 'S'*/
/*3552807.36*/

--SOLUCAO 1

SELECT D.DESC_LINHA, SUM(B.QTD*B.VAL_UNIT) AS TOTAL
	 FROM NOTA_FISCAL A
	 INNER JOIN NOTA_FISCAL_ITENS B
	 ON A.COD_EMPRESA=B.COD_EMPRESA
	 AND A.NUM_NF=B.NUM_NF
	 INNER JOIN MATERIAL C
	 ON A.COD_EMPRESA=C.COD_EMPRESA
	 AND B.COD_MAT=C.COD_MAT
	 INNER JOIN LINHA_PRODUTO D
	 ON A.COD_EMPRESA=D.COD_EMPRESA
	 AND C.COD_LINHA=D.COD_LINHA
	 WHERE A.TIP_NF='S'
	 GROUP BY D.DESC_LINHA

	 --SOLUCAO 2

SELECT ISNULL(D.DESC_LINHA, 'TOTAL') AS DESC_LINHA, SUM(B.QTD*B.VAL_UNIT) AS TOTAL
	 FROM NOTA_FISCAL A
	 INNER JOIN NOTA_FISCAL_ITENS B
	 ON A.COD_EMPRESA=B.COD_EMPRESA
	 AND A.NUM_NF=B.NUM_NF
	 INNER JOIN MATERIAL C
	 ON A.COD_EMPRESA=C.COD_EMPRESA
	 AND B.COD_MAT=C.COD_MAT
	 INNER JOIN LINHA_PRODUTO D
	 ON A.COD_EMPRESA=D.COD_EMPRESA
	 AND C.COD_LINHA=D.COD_LINHA
	 WHERE A.TIP_NF='S'
	 GROUP BY ROLLUP (D.DESC_LINHA)