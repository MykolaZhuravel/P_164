LOAD DATA INFILE 'E:\02PROJETS\P_Soutien_164\TF2\lottery_numbers.csv'
INTO TABLE t_lottery_numbers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(lottery_name, drawing_date, numbers);