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
	curl -i -XPOST -H"Content-Type: application/json" localhost:8081/allocations -d"{\"projectId\": ${PROJECT_ID}, \"userId\": ${USER_ID}, \"firstDay\": \"2015-05-17\", \"lastDay\": \"2015-05-18\"}"

getAllocations:
	curl -i localhost:8081/allocations?projectId=$(projectId)

stories:
	curl -i -XPOST -H"Content-Type: application/json" localhost:8082/stories -d"{\"projectId\": ${PROJECT_ID}, \"name\": \"Find some reeds\"}"

getStories:
	curl -i localhost:8082/stories?projectId=$(projectId)

time:
	curl -i -XPOST -H"Content-Type: application/json" localhost:8084/time-entries/ -d"{\"projectId\": ${PROJECT_ID}, \"userId\": ${USER_ID}, \"date\": \"2015-05-17\", \"hours\": 6}"

getTime:
	curl -i localhost:8084/time-entries?userId=$(userId)

