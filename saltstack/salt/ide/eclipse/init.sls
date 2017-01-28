eclipse_installed:
  cmd.run:
    - name: "curl -s http://mirror.internode.on.net/pub/eclipse/technology/epp/downloads/release/neon/2/eclipse-java-neon-2-linux-gtk-x86_64.tar.gz | tar xzvf - -C /opt/"
    - unless: test -f /usr/bin/eclipse

eclipse_symlinked:
  file.symlink:
    - name: "/usr/bin/eclipse"
    - target: "/opt/eclipse/eclipse"
    - require: 
      - cmd: eclipse_installed

eclipse_launcher_installed:
  file.managed:
    - name: "/usr/share/applications/eclipse.desktop"
    - source: salt://ide/eclipse/eclipse.desktop
    - require:
      - file: eclipse_symlinked
