fish_shell_repo_installed:
  pkgrepo.managed:
    - name: shells-fish-release-2
    - humanname: Fish shell - 2.x release series (CentOS_7)
    - baseurl: http://download.opensuse.org/repositories/shells:/fish:/release:/2/CentOS_7/
    - gpgkey: http://download.opensuse.org/repositories/shells:/fish:/release:/2/CentOS_7//repodata/repomd.xml.key
    - gpgcheck: 1

fish_shell_installed:
  pkg.latest:
    - name: fish
    - require:
      - pkgrepo: fish_shell_repo_installed

