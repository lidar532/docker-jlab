build:
	docker build \
		--tag jupyterlab:5 \
		./
runner:
	cp -fv  jlab.run ~/bin

run:
	docker run \
        	-p 11000:8888 \
        	--user 1000:1000 \
        	--rm \
        	--mount type=bind,src="/",target=/jlab \
        	-h "JLAB" \
        	--name JLAB \
        	-it \
        	jupyterlab:5
