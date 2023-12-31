### Build + Push Images
.PHONY: build-push
build-push:
  cd ../06-building-container/client-react && N=5 $(MAKE) build-N && N=5 $(MAKE) push-N
	cd ../06-building-container/api-node && N=9 $(MAKE) build-N && N=9 $(MAKE) push-N
  cd ../06-building-container/api-golang && N=7 $(MAKE) build-N && N=7 $(MAKE) push-N