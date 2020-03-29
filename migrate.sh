## run the following commands only once inside the webserver container
mv migrations migrations-bkup
flask db init
flask db migrate
flask db upgrade 