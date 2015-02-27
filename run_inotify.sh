#!/bin/bash
src=/opt/www/kz_sitemap/
/usr/local/bin/inotifywait -mrq --timefmt '%d/%m/%y %H:%M' --format '%T %w%f' \
--exclude "\.swp$" \
-e close_write,modify,delete,create,attrib,move \
${src} \
| while read file
do
csync2 -x >/dev/null 2>&1
done
