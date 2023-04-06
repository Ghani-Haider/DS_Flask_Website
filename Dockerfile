# choose a base image (here linux OS with python installed)
FROM python:3.7
# copy all content from here to an /app directory in the base image
COPY . /app
# make /app as the working directory
WORKDIR /app
# install any libraries and necessary dependencies
RUN pip install -r requirements.txt
# defining network port container will listen on runtime (in this case $PORT means cloud arch (heroku) will define)
EXPOSE $PORT
# defining the executable, create 4 threads, binding the port to the ip cloud gives, accessing app.py to run app()
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app