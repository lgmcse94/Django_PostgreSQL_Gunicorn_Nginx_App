#!/bin/bash
SOURCE="/home/linga/projects/python/countriesAPI/venv/bin/activate"
SOCKFILE=localhost:8000
DJANGODIR="/home/linga/projects/python/countriesAPI"	# Django project directory

cd $DJANGODIR
source $SOURCE

NAME="django_app"                                   # Name of the application
USER="linga"                                         # the user to run as
GROUP="linga"                                        # the group to run as
NUM_WORKERS=3                                       # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE="worldCountries.settings"      # which settings file should Django use
DJANGO_WSGI_MODULE="worldCountries.wsgi"             # WSGI module name
echo "Starting $NAME as `whoami`"
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH
#RUNDIR=$(dirname $SOCKFILE)
#test -d $RUNDIR || mkdir -p $RUNDIR

exec gunicorn worldCountries.wsgi:application --name 'django_app' --workers 3 --user='linga' --group='linga' --bind=$SOCKFILE --log-level=debug --log-file=-

