FROM nghiant2710/armv7-rpi

#enables systemd init system in the container
ENV INITSYSTEM on

RUN mkdir rust && \
	cd rust && \ 
	wget https://www.dropbox.com/sh/qfbt03ys2qkhsxs/AAAz65QBvs0Od9Y7It8QVsiMa/1.0.0-beta/rust-1.0.0-beta-arm-unknown-linux-gnueabihf-e4f2e2730200645934a328821f7de35152bad374.tar.gz && \
	tar xzf rust-1.0.0-beta-arm-unknown-linux-gnueabihf-e4f2e2730200645934a328821f7de35152bad374.tar.gz && \
	rm rust-1.0.0-beta-arm-unknown-linux-gnueabihf-e4f2e2730200645934a328821f7de35152bad374.tar.gz && \
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:lib 

#RUN wget https://www.dropbox.com/sh/qfbt03ys2qkhsxs/AABRHLkClatLFTTdA01-xO-va/cargo-2015-04-27-e3a6425-arm-unknown-linux-gnueabihf-fb223765dc3ddc5d82e776d3b21b65952401e7f2.tar.gz && \

COPY /src /usr/src/app

WORKDIR /usr/src/app

CMD bin/rustc -V