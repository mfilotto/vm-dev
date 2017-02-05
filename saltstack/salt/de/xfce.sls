X_Window_System_installed:
  pkg.group_installed:
    - name: 'X Window System'

Xfce_installed:
  pkg.installed:
    - pkgs:
      - Thunar
      - xfce4-panel
      - xfce4-session
      - xfce4-settings
      - xfconf
      - xfdesktop
      - xfwm4
      - gdm
      - openssh-askpass
      - orage
      - polkit-gnome
      - thunar-archive-plugin
      - thunar-volman
      - tumbler
      - xfce4-appfinder
      - xfce4-power-manager
      - xfce4-session-engines
      - xfce4-terminal
      - xfwm4-themes
      - pinentry-gtk
    - require:
      - pkg: X_Window_System_installed

Graphical_started:
  cmd.run:
    - name : 'systemctl set-default graphical.target; systemctl isolate graphical.target'
    - require:
      - pkg: Xfce_installed
