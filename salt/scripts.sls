deploy the http.conf file:
  file.managed:
    - name: /root/logger.sh
    - source: salt://scripts/logger.sh
    - mode: 544

/root/logger.sh:
  cron.present:
    - user: root
    - minute: '*/30'
