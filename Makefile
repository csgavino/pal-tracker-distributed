users:
	curl -i -XPOST -H"Content-Type: application/json" localhost:8083/registration -d'{"name": "Pete"}'

getUser:
	curl -i localhost:8083/users/$(userId)

accounts:
	curl -i localhost:8083/accounts?ownerId=1

projects:
	curl -i -XPOST -H"Content-Type: application/json" localhost:8083/projects -d"{\"name\": \"Basket Weaving\", \"accountId\": ${ACCOUNT_ID}}"

getProjects:
	curl -i localhost:8083/projects?accountId=$(projectId)

allocations:
	curl -i -XPOST -H"Content-Type: application/json" localhost:8081/allocations -d"{\"projectId\": 1, \"userId\": 1, \"firstDay\": \"2015-05-17\", \"lastDay\": \"2015-05-18\"}"

getAllocations:
	curl -i localhost:8081/allocations?projectId=$(projectId)

stories:
	curl -i -XPOST -H"Content-Type: application/json" localhost:8082/stories -d"{\"projectId\": 1, \"name\": \"Find some reeds\"}"

getStories:
	curl -i localhost:8082/stories?projectId=$(projectId)

time:
	curl -i -XPOST -H"Content-Type: application/json" localhost:8084/time-entries/ -d"{\"projectId\": 1, \"userId\": 1, \"date\": \"2015-05-17\", \"hours\": 6}"

getTime:
	curl -i localhost:8084/time-entries?userId=1

run:
	./gradlew bootRun --parallel

a:
	./gradlew :applications:allocations-server:bootRun

b:
	./gradlew :applications:backlog-server:bootRun

c:
	./gradlew :applications:timesheets-server:bootRun

d:
	./gradlew :applications:registration-server:bootRun
