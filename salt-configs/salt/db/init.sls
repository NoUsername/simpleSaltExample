/var/www/index.html:
  file.managed:
    - user: www-data
    - group: www-data
    - mode: 644
    - source: salt://db/dummy.html
