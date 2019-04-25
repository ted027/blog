FILE := `date +'%m%d_%H%M'`

new:
	@test -n "$(FILE)"
	hugo new post/$(FILE).md

deploy:
	@sh deploy.sh

server:
	hugo server --buildDrafts --watch