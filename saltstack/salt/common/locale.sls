locale_present:
  locale.present:
    - name: fr_FR.UTF-8

locale_installed:
  locale.system:
    - name: fr_FR.UTF-8
    - require:
      - locale: locale_present

timezone_set:
  timezone.system:
    - name: Pacific/Noumea

keyboard_set:
  keyboard.system:
    - name: fr
