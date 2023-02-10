#Tested on arm64 openwrt with

IMAGE_TAG = williamjoy/ntopng:arm64
docker-build:
	docker -D build -t $(IMAGE_TAG) -f Dockerfile.ntopng-arm64 .
docker-build-shell:
	docker run -it debian:bullseye-slim
docker-shell:
	docker run -it -v $(PWD):/workspace/ntopng -v ntop-var-lib:/var/lib/ntopng -v redis-data:/var/lib/redis -p 3000:3000 --entrypoint /bin/bash $(IMAGE_TAG)
docker-run:
	docker run -it \
	-v ntop-var-lib:/var/lib/ntopng \
	-v redis-data:/var/lib/redis \
	--cap-add NET_ADMIN \
	--security-opt \
	seccomp=unconfined \
	-p 3000:3000 \
	$(IMAGE_TAG) --community
docker-push:
	docker push $(IMAGE_TAG)

#--net=host \
#	 for i in {1..100};do echo SET A$i $i| redis-cli 
