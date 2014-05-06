
printf 'Greetings my omnipotent master!\n' >> /etc/motd.tail:
  cmd.run:
    - unless: cat /etc/motd.tail | grep -q 'omnipotent'
