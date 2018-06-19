
FROM teego/system:artful

MAINTAINER Aleksandr Zykov <tiger@plexrayinc.com>

ENV DEBIAN_FRONTEND noninteractive

RUN ( \
        apt-get update -q \
    &&  apt-get upgrade -qy --no-install-recommends \
    &&  apt-get clean -qy \
    )
    
RUN ( \
        apt-get install -qy --no-install-recommends \
            software-properties-common \
            iproute2 \
    &&  apt-get clean -qy \
    )

RUN ( \
        apt-get update -q \
    &&  apt-get upgrade -qy --no-install-recommends \
    &&  apt-get clean -qy \
    )
    
RUN ( \
        apt-get install -qy --no-install-recommends \
            openjdk-9-jdk \
            gradle \
    &&  apt-get clean -qy \
    )
    
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"