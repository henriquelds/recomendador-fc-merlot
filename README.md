Recommendations provider for voluntaries at the MERLOT repository.

The recommendations file (recommendations.json) is used in order to show the recommended objects for each user later.

Two methods used: traditional collaborative filtering (using database general.txt) and clustering method (using k6-cluster****.txt files)

Also, the recommendations are stored in a MySql table called generated_recs, that can be imported with the file db_struct.sql

Database name, user and password must be set at config/config.xml file.