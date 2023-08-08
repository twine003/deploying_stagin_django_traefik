# Ready to use Django Postgres over Devcontainers

This is a modern web application built on the Django framework, leveraging the robustness and reliability of PostgreSQL as its database backend. It's crafted using Django version 4.1.7 and served using the powerful Gunicorn web server, version 20.1.0. Developed with a containerized approach, it ensures consistency across different development environments, streamlining the setup process and eliminating the common "it works on my machine" issue. Whether you're a developer looking to contribute or a user aiming to leverage its features, this project offers a seamless experience right from the get-go.

## Key Dependencies
- Django: 4.1.7
- Gunicorn: 20.1.0

For a complete list of dependencies, refer to the `requirements.txt` file.

## Requirements

- Docker
- Docker Compose
- Visual Studio Code (optional, if using Devcontainers)

## Environment Configuration
You can configure the behavior of the application using the following environment variables:

DEBUG=1                               # Enables debug mode (0 for production)
SECRET_KEY=foo                        # Secret key for your Django application
SQL_ENGINE=django.db.backends.postgresql # if not specified uses as default sqllite engine
POSTGRES_DB=postres_database_name     # Your Database name
POSTGRES_USER=postgres_yser_name      # Your PostgreSQL user
POSTGRES_PASSWORD=*****               # Your PostgreSQL user's password
SQL_HOST=db                           # Hostname for the PostgreSQL database
SQL_PORT=5432                         # Port number for the PostgreSQL database
DATABASE=postgres                     # Database type (Keep as 'postgres' for this setup)


## Initial Setup and Installation

1. **Clone the Repository**:
`git clone git@github.com:twine003/django_postgres_devcontainer.git`


2. **Environment Setup**:
Ensure you have your environment variables set up in the `.env` file.

3. **Start the Devcontainer** (if using VS Code):
Open the folder in VS Code and, when prompted, open inside the container.

If not using Devcontainers, you can start the services directly with Docker Compose:
`docker-compose up -d`

Note: Remember uncomment `python manage.py runserver 0.0.0.0:8000` and comment `sleep infinity` in the docker-compose.yml file at the root folder


4. **Perform Django Migrations**:
If using Devcontainers, open a terminal inside VS Code. Otherwise, use `docker exec` to get inside the web app container:

`python manage.py migrate`


## Usage

To start the development server:
`python manage.py runserver 0.0.0.0:8000`

# Adding a New Django Application
Django's modular approach allows you to organize your project into multiple apps. Follow these steps to add a new application:

The site should now be available at `http://localhost:8000`.

1. **Access the Development Container**:

If you're using the Devcontainer setup with Visual Studio Code, ensure you're running within the container's terminal. If you're not using Devcontainers, you'll want to ensure you're in the environment where Django is accessible.

2. **Create the Application**:

Use the startapp command followed by the name of your new application. Replace your_app_name with the desired name:


`python manage.py startapp your_app_name`

3. **Update the Project's Settings**:

In your project's settings (commonly located in settings.py), add the name of your new application to the INSTALLED_APPS list:

```python
    INSTALLED_APPS = [
        ...
        'your_app_name',
    ]
```

4. **Develop Your Application**:

Navigate to the newly created application directory. Here, you'll find a structure set up for models, views, tests, and more. Begin adding your application logic as required.

Database Migrations (If Needed):

If your application introduces new database models, you'll need to create migrations and apply them:

```python
python manage.py makemigrations your_app_name
python manage.py migrate

```

5. **Test Your Application**:

It's a good practice to test your application frequently. This ensures that new changes don't introduce unexpected issues. If you've added tests in the tests.py file (or in a tests module) of your new app, you can run them with:

```python
python manage.py test your_app_name
```

6. **Include in the Project's URL Configuration**:

To make your app accessible, you might need to include its URLs in the project's main URL configuration or in any other app's URL configuration.

## Contributing

If you wish to contribute to the project, please follow the contribution guidelines provided.

## License

This project is licensed under the [MIT License](LINK_TO_YOUR_LICENSE) - see the [LICENSE.md](LINK_TO_YOUR_LICENSE_FILE) file for details.

## Contact

- **Maintainer's Name** - [Jose W. Garcia](https://www.linkedin.com/in/jwgarciaz/) - jwgarcia003@gmail.com


