FROM fedora:25

RUN dnf install -y ruby node zsh bash python3 python2 ddate cowsay figlet
RUN dnf groupinstall -y "C Development Tools and Libraries"
RUN dnf install -y ruby-devel
RUN dnf install -y redhat-rpm-config zlib-devel patch
RUN gem install json mime-types i18n tzinfo nokogiri diff-lcs
