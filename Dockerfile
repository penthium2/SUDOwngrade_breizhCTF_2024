FROM debian
RUN apt update && apt install -y bind9 sudo vim openssh-server 
RUN mkdir /var/run/sshd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN useradd -m -s /bin/bash -p '$6$LfNJKlHtnS.3opaJ$LG00lLe39HOeTmtA3xUdZnVGVI8/Btn9m.J7NKNPzyUvYxMXxHhsdkB6xPGO.EI1aC.IUE4akRfgvqd5aZSZ80' penthium
RUN mkdir /home/penthium/.ssh && echo "ssh-ed25519 ACDCC3NzaC1lZDI1NTE5ACDCIE54SI2pvTaN9k666cBLThbBUv55JVC_lolqev+wqU penthium2@bzhack.breizhCTF" > /home/penthium/.ssh/authorized_keys && chmod 700 /home/penthium/.ssh && chown penthium:penthium /home/penthium/.ssh && chmod 600 /home/penthium/.ssh/authorized_keys && chown penthium:penthium /home/penthium/.ssh/authorized_keys

COPY edit.sh /opt
COPY edit_downgrade.sh /opt
RUN chmod +x /opt/edit.sh
RUN chmod +x /opt/edit_downgrade.sh
RUN sed -i '$apenthium ALL=(ALL:ALL) NOPASSWD: /opt/edit.sh, NOPASSWD: /opt/edit_downgrade.sh' /etc/sudoers
WORKDIR /home/penthium
####### Lancement du container
ADD script.sh /
RUN chmod +x /script.sh
ENTRYPOINT ["/script.sh"]
CMD [ "sleep", "infinity" ]


