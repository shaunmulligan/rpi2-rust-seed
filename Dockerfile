FROM nghiant2710/armv7-rpi

#enables systemd init system in the container
ENV INITSYSTEM on

RUN mkdir rust && \
	cd rust && \ 
	wget https://www.dropbox.com/sh/qfbt03ys2qkhsxs/AAAz65QBvs0Od9Y7It8QVsiMa/1.0.0-beta/rust-1.0.0-beta-arm-unknown-linux-gnueabihf-e4f2e2730200645934a328821f7de35152bad374.tar.gz && \
	tar xzf rust-1.0.0-beta-arm-unknown-linux-gnueabihf-e4f2e2730200645934a328821f7de35152bad374.tar.gz && \
	rm rust-1.0.0-beta-arm-unknown-linux-gnueabihf-e4f2e2730200645934a328821f7de35152bad374.tar.gz && \
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:lib 

COPY /src /usr/src/app

RUN /rust/bin/rustc /usr/src/app/main.rs

WORKDIR /usr/src/app

CMD ./main