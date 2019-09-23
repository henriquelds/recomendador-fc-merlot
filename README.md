# Learning Objects recommender using collaborative filtering

We generate recommendations for volunteers users from MERLOT repository (www.merlot.org).

There are two different appŕoaches currently coded: the first one considers the entire Merlot database (file general.txt) and the second one considers only the clustered (by content -- title and description of the learning object) databases (files k6-cluster****.txt)

The recommendations are then exported to a file named recommendations.json and also inserted into a MYSql database (schema is described in db_struct.sql)

Database configs (login, psswd and host) should be modified in config/config.xml. In this same file, one may insert the volunteers users IDs list.

Authors: Henrique Lemos dos Santos - hlsantos@inf.ufrgs.br Cristian Cechinel - contato@cristiancechinel.pro.br
