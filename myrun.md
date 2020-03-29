## Step 1 build 
docker build -t fimple .

## Step 2 run the database
docker run -p 5432:5432 -v dbdata:/var/lib/postgresql/data -e POSTGRES_DB=docker -e POSTGRES_USER=docker -e POSTGRES_PASSWORD=docker postgres

## Step 3 remove the container if exists
docker rm fimple 

## Step 4 on MAC get IP and update SQLALCHEMY_DATABASE_URI on another host use localhost instead of IP
export IP=`ipconfig getifaddr en0`

## Step 5 and run the webserver 
docker run --name fimple -p 9500:5000 -e SQLALCHEMY_DATABASE_URI="postgresql://docker:docker@${IP}/docker" -e FLASK_CONFIG=development -e FLASK_APP=run.py fimple 

## Step 6 exec to the webserver 
docker exec -it fimple bash /usr/src/app/migrate.sh