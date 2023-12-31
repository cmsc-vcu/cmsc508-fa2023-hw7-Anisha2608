---
title: Homework 7 - Creating a resume database
author: Anisha Vijay
date: last-modified
format:
    html:
        theme: cosmo
        toc: true
        embed-resources: true
        code-copy: true
---

The project involves creating a database to manage the skills, certifications, and roles of employees in a company led by a group of designers and developers. The goal is to identify specific skills, list employee skills, and pinpoint skill gaps in roles. The schema includes tables for skills, people, roles, peopleskills, and peopleroles. Skills and certifications are detailed with names, descriptions, URLs, and time commitments. Employee information includes names, contact details, and a brief bio. Roles are defined with names and priorities. The database maintains associations between skills and employees, as well as between employees and roles, capturing acquisition dates and anticipated skill acquisition dates.


GITHUB URL:  https://github.com/cmsc-vcu/cmsc508-fa2023-hw7-Anisha2608/tree/main

```{python}
#| eval: true
#| echo: false
import os
import sys
import pandas as pd
from tabulate import tabulate
from dotenv import load_dotenv
from sqlalchemy import create_engine, text
from sqlalchemy.exc import OperationalError, ProgrammingError
from IPython.display import display, Markdown
```
```{python}
#| eval: true
#| echo: false

# modify config_map to reflect credentials needed by this program
config_map = {
    'user':'23FA_vijaykumaa',
    'password':'Shout4_vijaykumaa_GOME',
    'host':'cmsc508.com',
    'database':'23FA_hr_vijaykumaa'
}
# load and store credentials
load_dotenv()
config = {}
for key in config_map.keys():
    config[key] = os.getenv(config_map[key])
flag = False
for param in config.keys():
    if config[param] is None:
        flag = True
        print(f"Missing {config_map[param]} in .env file")
#if flag:
#    sys.exit(1)
```
```{python}
#| eval: true
#| echo: false

# build a sqlalchemy engine string
engine_uri = f"mysql+pymysql://{config['user']}:{config['password']}@{config['host']}/{config['database']}"

# create a database connection.  THIS IS THE ACTUAL CONNECTION!
try:
    cnx = create_engine(engine_uri)
except ArgumentError as e:
    print(f"create_engine: Argument Error: {e}")
    #sys.exit(1)
except NoSuchModuleError as e:
    print(f"create_engine: No Such Module Error: {e}")
    #sys.exit(1)
except Exception as e:
    print(f"create_engine: An error occurred: {e}")
    #sys.exit(1)
```
```{python}
#| echo: false
#| eval: true

# Do a quick test of the connection and trap the errors better!
try:
    databases = pd.read_sql("show databases",cnx)
except ImportError as e:
    print(f"Error: {e}")
except OperationalError as e:
    print(f"Database/SQL Error:\n{str(e)}\n")
except ProgrammingError as e:
    print(f"Programming Error:\n{str(e)}\n")
except Exception as e:
    print(f"An error occurred:\n{str(e)}\n")

```

## Overview and description

The project involves creating a database to manage the skills, certifications, and roles of employees in a company led by a group of designers and developers. The goal is to identify specific skills, list employee skills, and pinpoint skill gaps in roles. The schema includes tables for skills, people, roles, peopleskills, and peopleroles. Skills and certifications are detailed with names, descriptions, URLs, and time commitments. Employee information includes names, contact details, and a brief bio. Roles are defined with names and priorities. The database maintains associations between skills and employees, as well as between employees and roles, capturing acquisition dates and anticipated skill acquisition dates.

## Crows-foot diagram

(add a description of the diagram and what the reader is seeing.)

```{mermaid}
%%| echo: false
erDiagram
    CUSTOMER ||--o{ ORDER : places
    CUSTOMER }|..|{ DELIVERY-ADDRESS : uses
    CUSTOMER{
        int id
        string first_name
        string last_name
    }
    DELIVERY-ADDRESS {
        int id
    }
```

## Examples of data in the database

For the people, skills, and roles tables, provide a description of each table and it's contents. Then provide a listing of the entire table.

### People table

The *people* table contains elements that describe ... 

Below is a list of data in the *people* table.

```{python}
#| echo: false
#| eval: true
sql = f"""
select * from people;
"""
## Add code to list roles table here
try:
    df = pd.read_sql(sql,cnx)
    df
except Exception as e:
    message = str(e)
    print(f"An error occurred:\n\n{message}\n\nIgnoring and moving on.")
    df = pd.DataFrame()
df
```

### Skills table

The *skills* table contains elements that describe ... 

Below is a list of data in the *skills* table.

```{python}
#| echo: false
#| eval: true

## Add code to list roles table here
```

### Roles table

The *roles* table contains elements that describe ... 

Below is a list of data in the *roles* table.

```{python}
#| echo: false
#| eval: true

## Add code to list roles table here
```


## Sample queries

Let's explore the database!

# List skill names, tags, and descriptions ordered by name

(here a sample query)

```{python}
sql = f"""
select * from people
"""
```


(and here is a sample result from the query)

```{python}
#| echo: false
#| eval: true
try:
    df = pd.read_sql(sql,cnx)
    df
except Exception as e:
    message = str(e)
    print(f"An error occurred:\n\n{message}\n\nIgnoring and moving on.")
    df = pd.DataFrame()
df

```


### List people names and email addresses ordered by last_name

SELECT people_first_name, people_last_name, email FROM people ORDER BY people_last_name;

John
Person 1
john@example.com

Eva1
Person 10
eva@example.com
	

Jane
Person 2
jane@example.com
	

Bob
Person 3
bob@example.com
	

Alice
Person 4
alice@example.com
	

Charlie
Person 5
charlie@example.com
	

Eva
Person 6
eva@example.com
	

Bob1
Person 7
bob@example.com
	

Alice1
Person 8
alice@example.com
	

Charlie1
Person 9
charlie@example.com

### List skill names of Person 1

skill_name	
Python Ninja
Ruby Alchemist
Polyglot Linguist

SELECT s.name AS skill_name
FROM people p
JOIN peopleskills ps ON p.people_id = ps.people_id
JOIN skills s ON ps.skills_id = s.id
WHERE p.people_id = 1;


### List people names with Skill 6

people_first_name	
people_last_name	
John
Person 1
Charlie
Person 5
Bob1
Person 7
Alice1
Person 8
Charlie1
Person 9


SELECT p.people_first_name, p.people_last_name
FROM people p
JOIN peopleskills ps ON p.people_id = ps.people_id
JOIN skills s ON ps.skills_id = s.id
WHERE s.tag = 'Skill 6';


### List people with a DEVELOPER role

people_first_name	
people_last_name	
John
Person 1
Bob
Person 3
Eva
Person 6
Charlie1
Person 9
Eva1
Person 10

SELECT p.people_first_name, p.people_last_name
FROM people p
JOIN peopleroles pr ON p.people_id = pr.people_id
JOIN roles r ON pr.role_id = r.id
WHERE r.name = 'Developer';


### List names and email addresses of people without skills

Alice
Person 4
alice@example.com

SELECT people_first_name, people_last_name, email
FROM people p
WHERE NOT EXISTS (
    SELECT 1
    FROM peopleskills ps
    WHERE p.people_id = ps.people_id
);


### List names and tags of unused skills

Mindful Debugger
Skill 7
	

Ninja Tools Engineer
Skill 8

SELECT name, tag
FROM skills s
WHERE NOT EXISTS (
    SELECT 1
    FROM peopleskills ps
    WHERE s.id = ps.skills_id
);


### List people names and skill names with the BOSS role

Jane
Person 2
Problem-solving Sensei
Jane
Person 2
C# Infiltrator
Jane
Person 2
Ruby Alchemist

SELECT p.people_first_name, p.people_last_name, s.name AS skill_name
FROM people p
JOIN peopleroles pr ON p.people_id = pr.people_id
JOIN roles r ON pr.role_id = r.id
LEFT JOIN peopleskills ps ON p.people_id = ps.people_id
LEFT JOIN skills s ON ps.skills_id = s.id
WHERE r.name = 'Boss';


### List ids and names of unused roles

None

SELECT id, name
FROM roles r
WHERE NOT EXISTS (
    SELECT 1
    FROM peopleroles pr
    WHERE r.id = pr.role_id
);


## Reflection

SQL assignment was an enriching learning experience. It provided me with a platform to put theoretical database concepts into practice. Designing the schema required thoughtful consideration of primary keys, foreign keys, and relationships between tables. The insertion of sample data allowed me to visualize how a real-world database might look. Writing SQL queries, especially those involving joins and filtering, reinforced my understanding of data retrieval and manipulation. I found value in the task of identifying unused roles, as it required a careful examination of the relationships between different tables. Overall, this assignment not only improved my SQL skills but also deepened my appreciation for the connection between theoretical knowledge and its practical implementation in database design and querying.


