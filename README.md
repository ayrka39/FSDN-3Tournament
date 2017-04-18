# FSND-03 Tournament Results


## Description
This is an Udacity project to develop a database schema to store the game matches between players, based on a Swiss tournament system.


## Requirements
[Python 2.7 or above](https://www.python.org/) and
[PostgreSQL](http://www.postgresql.org/)


## Set Up
1. Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/).

2. Clone [the files](https://github.com/ayrka39/FSDN-3Tournament.git) in this repo.


## Usage

1. Go to the folder where the files are and launch VM as follows

  `vagrant up`

  `vagrant ssh`

2. Create the necessary tables inside the database

  `cd /your/folder`

  `psql`

  `\i tournament.sql`

3. Run the test and see the output

  `python tournament_test.py`
