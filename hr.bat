call mvn -B -s settings.xml -DskipTests=true clean package
call java -Dspring.profiles.active="heroku" -DDATABASE_URL="postgres://user:password@localhost:5432/pigustralas" -jar target/dependency/webapp-runner.jar target/*.war
