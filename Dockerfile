FROM debian:bullseye-20240904-slim
ENV DEBIAN_FRONTEND=noninteractive

COPY scripts/build_bela.sh \
	scripts/build_packages.sh \
	scripts/build_env.sh \
	scripts/build_settings \
	./

# Build Bela dependencies and libraries
RUN ./build_packages.sh && rm build_packages.sh
RUN ./build_bela.sh && rm build_bela.sh && rm build_settings
RUN ./build_env.sh && rm build_env.sh

# Update and upgrade
RUN apt-get update && apt-get upgrade -y

SHELL ["/bin/bash", "-c"]