# Recomendador de objetos de aprendizagem baseado em filtragem colaborativa

Gerador de recomendações para usuários voluntários do repositório MERLOT (www.merlot.org) baseado em filtragem colaborativa.

Usam-se 2 métodos diferentes: um que considera a base de dados total das avaliações do Merlot (arquivo general.txt) e outro que considera bases de dados "clusterizadas" com base em conteúdo (arquivos k6-cluster****.txt) 

As recomendações são exportadas para o arquivo recommendatios.json e também inseridas numa base de dados MySql cujo schema está contido no arquivo db_struct.sql.

As configurações da base de dados MySql (nome, senha e host) devem ser alteradas no arquivo config/config.xml. Neste mesmo arquivo deve ser inserida a lista de IDs de usuários voluntários (aqueles que terão as recomendações calculadas)

Autores: Henrique Lemos dos Santos - hlsantos@inf.ufrgs.br Cristian Cechinel - contato@cristiancechinel.pro.br
