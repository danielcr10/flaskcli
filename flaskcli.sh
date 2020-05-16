
# Fazer uma opcao -c para limpar o projeto
# flaskcli -c __APPNAME__
# tratar para quando nao receber variaveis (nome do app)

if [ $# -eq 2 ]
then
  if [ $1 = '-c' ]
  then
    rm config.py requirements.txt run.py
    rm -r instance/ $2/
  fi
fi

if [ $# -eq 0 ]
then
  echo "Passe o nome do app como parametro" 
  exit 0
fi

if [ $# -eq 1 ]
then
  mkdir instance $1 $1/static $1/templates
  printf "'''\nThis is the file that is invoked to start up a development server. It gets a copy of the app from your package and runs it. This won’t be used in production, but it will see a lot of mileage in development.\n''' " > run.py 

  printf "'''\n This file lists all of the Python packages that your app depends on. You may have separate files for production and development dependencies. To update use pip freeze > requirements.txt\n'''" > requirements.txt

  printf "'''\nThis file contains most of the configuration variables that your app needs.\n'''" > config.py

  printf "'''\nThis file contains configuration variables that shouldn’t be in version control. This includes things like API keys and database URIs containing passwords. This also contains variables that are specific to this particular instance of your application. For example, you might have DEBUG = False in config.py, but set DEBUG = True in instance/config.py on your local machine for development. Since this file will be read in after config.py, it will override it and set DEBUG = True.\n'''" > instance/config.py

  printf "'''\nThis file initializes your application and brings together all of the various components.\n'''" > $1/__init__.py

  printf "'''\nThis is where the routes are defined. It may be split into a package of its own (yourapp/views/) with related views grouped together into modules.\n'''" > $1/views.py

  printf "'''\nThis is where you define the models of your application. This may be split into several modules in the same way as views.py.\n'''" > $1/models.py

  printf "'''\nThis is where you define the forms of your application. This may be split into several modules in the same way as forms.py.\n'''" > $1/forms.py

  printf "<!-- \nThis directory contains the public CSS, JavaScript, images and other files that you want to make public via your app. It is accessible from yourapp.com/static/ by default.\n -->" > $1/static/readme.md

  printf "<!-- \nThis is where you’ll put the Jinja2 templates for your app.\n -->" > $1/templates/readme.md

  echo "Done"
fi