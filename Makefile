
new:
	@test -n "$(FILE)"
	hugo new posts/$(FILE).md

deploy:
	@sh deploy.sh

server:
	hugo server --buildDrafts --watch