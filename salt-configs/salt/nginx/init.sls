nginx-repo:
  pkgrepo.managed:
    - ppa: nginx/stable
    - require_in:
      - nginx

nginx:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: /etc/nginx/*

/etc/nginx/ssl:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

/etc/nginx/sites-available/testSite.conf:
   file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://nginx/testSite.conf.jinja
    - template: jinja

/etc/nginx/sites-enabled/testSite.conf:
   file.symlink:
    - target: /etc/nginx/sites-available/testSite.conf
    - require:
      - file: /etc/nginx/sites-available/testSite.conf

/etc/nginx/sites-enabled/default:
   file.absent

/var/www:
  file.directory:
    - user: www-data
    - group: www-data
    - dir_mode: 755

/var/www/index.html:
  file.managed:
    - user: www-data
    - group: www-data
    - mode: 644
    - source: salt://nginx/index.html.jinja
    - template: jinja
    - context:
        pages: {{ grains.get('catcloud:pages', []) }}


{% for page in grains.get('catcloud:pages', []) %}
/var/www/{{page}}.html:
  file.managed:
    - user: www-data
    - group: www-data
    - mode: 644
    - source: salt://nginx/index.html.jinja
    - template: jinja
    - context:
        title: {{ page }}
        pages: {{ grains.get('catcloud:pages', []) }}
{% endfor %}
