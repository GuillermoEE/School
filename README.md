# EduTrack
![Estado](https://img.shields.io/badge/Estado-Release%201.0.0-green.svg)

EduTrack es una herramienta de proceso de admisión de alumnos adaptado para las necesidades de los CBTis de forma
general, acomodando a todos los aspirantes en especialidades, turnos, grupos y cupos de salón de forma personalizable desde distintos niveles administrativos para que los encargados del plantel puedan trabajar simultaneamente.

Para más información pónganse en contacto con Strongly Typed: nutriadevelopers@gmail.com

## ¿Quieres probar el sistema?:

* Ruby version: ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-linux]

* Rails version: Rails 5.0.0.1

* mysql version: mysql  Ver 14.14 Distrib 5.7.17, for Linux (x86_64)

* JavaScript runtime (nodeJS): nodejs v6.11.2



## Como iniciar

1. Clone nuestro proyecto utilizando `git clone`
2. Ejecute `bundle install` para descargar las gemas que no tiene instaladas en su ordenador
3. Ejecute `rake db:create` para crear una nueva base de datos local en mysql
4. En el archivo `config\database.yml` en las lineas 11 y 12 configure su nombre de usuario y contraseña de mysql
5. Ejecute `rake db:migrate` para inicializar la base de datos
6. Ejecute `rails s` para iniciar el servidor

Listo, ahora puedes explorar nuestra aplicación ingrensando en su navegador a `localhost:3000`.
