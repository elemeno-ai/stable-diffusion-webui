.PHONY: pack

DOCKER_REPO ?= 361265061473.dkr.ecr.us-east-1.amazonaws.com
DOCKER_TAG ?= v0

prepare:
	pack builder create local-builder --config .build/paketo-nvidia-builder/builder.toml
	mv environment-wsl2.yaml environment.yaml
	rm -rf requirements.txt

pack: prepare
	pack build "$(DOCKER_REPO)/genai/ui/stable-diffusion:$(DOCKER_TAG)" --buildpack paketo-buildpacks/python \
  	--builder local-builder

push:
	docker push "$(DOCKER_REPO)/genai/ui/stable-diffusion:$(DOCKER_TAG)"