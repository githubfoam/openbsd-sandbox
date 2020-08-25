IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-openbsd:
	bash scripts/deploy-openbsd.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

push-image:
	docker push $(IMAGE)
.PHONY: deploy-vagrant deploy-libvirt push-image
