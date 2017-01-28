sublime_installed:
  cmd.run:
    - name: "curl -s https://download.sublimetext.com/Sublime%20Text%202.0.2%20x64.tar.bz2 | tar jxvf - -C /opt/"
    - unless: test -f /usr/bin/sublime

sublime_symlinked:
  file.symlink:
    - name: "/usr/bin/sublime"
    - target: "/opt/Sublime Text 2/sublime_text"
    - require: 
      - cmd: sublime_installed

sublime_launcher_installed:
  file.managed:
    - name: "/usr/share/applications/sublime.desktop"
    - source: salt://ide/sublime/sublime.desktop
    - require:
      - file: sublime_symlinked
