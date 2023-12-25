.PHONY: build-sample
build-sample:
	DOCKER_BUILDKIT=1 docker build \
		--build-arg BASE_IMAGE_TAG=18.9.0-bullseye-slim \
		--secret id=secret.txt,src=local-secret.txt \
		-t sample \
		-f Dockerfile.sample \
		.

.PHONY: build-multiarch
build-multiarch:
	# Requires having container registry to push to
	# Here it uses https://hub.docker.com/r/sidpalas/multi-arch-test
	docker buildx build \
		--platform linux/amd64,linux/arm64,linux/arm/v7 \
		--secret id=secret,src=local-secret.txt \
		-t haorui215/multi-arch-test:latest \
		-f Dockerfile.sample \
		--push \
		.

.PHONY: run-sample-entrypoint-cmd
run-sample-entrypoint-cmd: build-sample
	@echo "$$ENTRYPOINT_CMD_DESCRIPTION"

	@echo "Run with no arguments:"
	docker run sample

	@echo "#######################"
	@echo "Run with argument (CMD is ignored):"
	docker run sample "+ (argument)"

	@echo "#######################"
	@echo "Overriden entrypoint with no argument (CMD is ignored):"
	docker run --entrypoint echo sample

	@echo "#######################"
	@echo "Overriden entrypoint with argument (CMD is ignored):"
	docker run --entrypoint echo sample "Hey Team 👋 (Overriden entrypoint + arguments)"

define ENTRYPOINT_CMD_DESCRIPTION

✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅

See Dockerfile.sample for image define.

This series fo docker run commands is meant
to help you understand the interraction between
CMD and ENTRYPOINT.

The image has the following:
	ENTRYPOINT ["echo", "Hey Team 👋(entrypoint)"]
	CMD [" + (cmd)"]

✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅

endef
export ENTRYPOINT_CMD_DESCRIPTION
