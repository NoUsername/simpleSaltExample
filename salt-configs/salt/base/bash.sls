
bash:
  pkg.installed

/home/vagrant/.bash_aliases:
  file.blockreplace:
      - content: "alias computer,='sudo '"
      - append_if_not_found: True