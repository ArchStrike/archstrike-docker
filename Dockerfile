# How to use:
#   docker build -t archstrike/archstrike .
# I. Install the ArchStrike Repository (https://archstrike.org/wiki/setup)
FROM archlinux:latest
# 1. Setup the master ArchStrike repository mirror
RUN printf '[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' >> /etc/pacman.conf;
RUN cp /etc/pacman.conf{,.pre-archstrike}
RUN printf '[archstrike]\nServer = https://mirror.archstrike.org/$arch/$repo\n' >> /etc/pacman.conf;
RUN pacman -Syy;
RUN pacman -S --noconfirm man-db vim-minimal iproute2;
# 2. Bootstrap and install the ArchStrike keyring
RUN pacman-key --init;
RUN dirmngr < /dev/null;
COPY keyfile.asc /etc/pacman.d/
RUN printf ''\
'46997d19790b15f023b5e7c548d35f17f745a879ed035b8d1dbfc970dee50250'\
'8951cf7ac1cd037921e2c7812c6bbe05f492d5df400882bf6c5ffdf1a10214e4'\
'  /etc/pacman.d/keyfile.asc' > /etc/pacman.d/keyfile.sha512
RUN cat /etc/pacman.d/keyfile.sha512 | sha512sum -c -
RUN pacman-key -r 9D5F1C051D146843CDA4858BDE64825E7CBC0D51 || pacman-key --add /etc/pacman.d/keyfile.asc;
RUN pacman-key --lsign-key 9D5F1C051D146843CDA4858BDE64825E7CBC0D51;
# 3. Install required packages
RUN pacman -S --noconfirm archstrike-keyring archstrike-mirrorlist;
# 4. Configure pacman to use the mirrorlist and cleanup image
RUN mv /etc/pacman.conf.pre-archstrike /etc/pacman.conf;
RUN printf '[archstrike]\nInclude = /etc/pacman.d/archstrike-mirrorlist\n' >> /etc/pacman.conf;
RUN pacman -Syy;
RUN rm /etc/pacman.d/keyfile.{asc,sha512};
RUN pacman -Sc --noconfirm;
# II. Groups and Packages
#   The list of ArchStrike packages can be viewed by running:
#       $ pacman -Sl archstrike
#   The list of ArchStrike groups available can be viewed by running:
#       $ pacman -Sg | grep archstrike
#   The list of packages in a specific group can be viewed by running:
#       $ pacman -Sgg | grep archstrike-<groupname>
CMD ["/bin/bash"]
