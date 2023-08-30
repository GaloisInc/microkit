FROM trustworthysystems/camkes:latest

RUN apt update
RUN apt install -y python3.9-venv pandoc texlive-latex-base texlive-fonts-recommended texlive-latex-extra
RUN wget https://musl.libc.org/releases/musl-1.2.2.tar.gz
RUN tar -xf musl-1.2.2.tar.gz
RUN cd musl-1.2.2 && ./configure && make install
RUN cp musl-1.2.2/obj/musl-gcc /usr/bin/
RUN python3.9 -m venv pyenv
RUN ./pyenv/bin/pip install --upgrade pip setuptools wheel six future
RUN wget https://raw.githubusercontent.com/Ivan-Velickovic/sel4cp/dev/requirements.txt
RUN ./pyenv/bin/pip install -r requirements.txt
RUN wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz
RUN tar -xf riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz --strip-components=1 -C /usr
RUN rm riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf.tar.xz?revision=79f65c42-1a1b-43f2-acb7-a795c8427085
RUN mv gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf.tar.xz\?revision\=79f65c42-1a1b-43f2-acb7-a795c8427085 gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf.tar.xz
RUN tar -xf gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf.tar.xz --strip-components=1 -C /usr
RUN rm gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf.tar.xz
