base:
  '*':
    - base

  'web*':
    - nginx

  'db*':
    - db

#  '* and not G@proxyOnly:True':
#    - match: compounds
#    - nginx