# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;

# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    tag VARCHAR(50),
    url VARCHAR(255),
    time_commitment INT
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (name, description, tag, url, time_commitment) VALUES
    ('Python Ninja', 'Mastery of Python programming language, including advanced concepts like decorators and generators.', 'Skill 1', 'https://example.com/python-ninja', 200),
    ('JavaScript Sorcerer', 'Expertise in client-side scripting with a focus on modern JavaScript frameworks like React and Vue.', 'Skill 2', 'https://example.com/js-sorcerer', 150),
    ('Ruby Alchemist', 'Proficiency in Ruby programming language, with a deep understanding of Rails framework for web development.', 'Skill 3', 'https://example.com/ruby-alchemist', 180),
    ('C# Infiltrator', 'Master of C# programming language, specializing in .NET development and backend systems.', 'Skill 4', 'https://example.com/csharp-infiltrator', 220),
    ('Problem-solving Sensei', 'Exceptional problem-solving skills using algorithms and data structures in various programming languages.', 'Skill 5', 'https://example.com/problem-solving-sensei', 160),
    ('Polyglot Linguist', 'Fluent in multiple programming languages, including Python, JavaScript, Ruby, Java, and C++.', 'Skill 6', 'https://example.com/polyglot-linguist', 120),
    ('Mindful Debugger', 'Advanced meditation and focus techniques for efficient debugging and code optimization.', 'Skill 7', 'https://example.com/mindful-debugger', 200),
    ('Ninja Tools Engineer', 'Expertise in developing and maintaining ninja tools and gadgets using various programming languages.', 'Skill 8', 'https://example.com/ninja-tools-engineer', 180);

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id INT AUTO_INCREMENT PRIMARY KEY,
    people_first_name VARCHAR(50),
    people_last_name VARCHAR(256) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(255),
    headshot_url VARCHAR(255),
    discord_handle VARCHAR(255),
    brief_bio TEXT,
    date_joined varchar(255) NOT NULL DEFAULT 'CURR Date'
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 1', 'John', 'john@example.com', 'https://www.linkedin.com/in/john', 'https://example.com/john.jpg', 'john#1234', 'Bio for John', CURDATE());
INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 2', 'Jane', 'jane@example.com', 'https://www.linkedin.com/in/jane', 'https://example.com/jane.jpg', 'jane#5678', 'Bio for Jane', CURDATE());
INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 3', 'Bob', 'bob@example.com', 'https://www.linkedin.com/in/bob', 'https://example.com/bob.jpg', 'bob#91011', 'Bio for Bob', CURDATE());
INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 4', 'Alice', 'alice@example.com', 'https://www.linkedin.com/in/alice', 'https://example.com/alice.jpg', 'alice#121314', 'Bio for Alice', CURDATE());
INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 5', 'Charlie', 'charlie@example.com', 'https://www.linkedin.com/in/charlie', 'https://example.com/charlie.jpg', 'charlie#151617', 'Bio for Charlie', CURDATE());
INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 6', 'Eva', 'eva@example.com', 'https://www.linkedin.com/in/eva', 'https://example.com/eva.jpg', 'eva#181920', 'Bio for Eva', CURDATE());

INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 7', 'Bob1', 'bob@example.com', 'https://www.linkedin.com/in/bob', 'https://example.com/bob.jpg', 'bob#91011', 'Bio for Bob', CURDATE());
INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 8', 'Alice1', 'alice@example.com', 'https://www.linkedin.com/in/alice', 'https://example.com/alice.jpg', 'alice#121314', 'Bio for Alice', CURDATE());
INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 9', 'Charlie1', 'charlie@example.com', 'https://www.linkedin.com/in/charlie', 'https://example.com/charlie.jpg', 'charlie#151617', 'Bio for Charlie', CURDATE());
INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES ('Person 10', 'Eva1', 'eva@example.com', 'https://www.linkedin.com/in/eva', 'https://example.com/eva.jpg', 'eva#181920', 'Bio for Eva', CURDATE());



# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.


CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired varchar(255) NOT NULL DEFAULT 'CURR Date'
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills (people_id,skills_id) values(1,1),(1,3),(1,6),(2,3),(2,4),(2,5),(3,1),(3,5),(5,3),(5,6),(6,2),(6,3),(6,4),(7,3),(7,5),(7,6),(8,1),(8,3),(8,5),(8,6),(9,2),(9,5),(9,6),(10,1),(10,4),(10,5);

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sort_priority INT NOT NULL
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (name, sort_priority) VALUES ('Designer', 10);
INSERT INTO roles (name, sort_priority) VALUES ('Developer', 20);
INSERT INTO roles (name, sort_priority) VALUES ('Recruit', 30);
INSERT INTO roles (name, sort_priority) VALUES ('Team Lead', 40);
INSERT INTO roles (name, sort_priority) VALUES ('Boss', 50);
INSERT INTO roles (name, sort_priority) VALUES ('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (1, 2, '2001-01-01');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (2, 5, '2002-02-03');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (2, 6, '2002-03-04');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (3, 2, '2003-04-10');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (3, 4, '2003-05-11');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (4, 3, '2004-06-12');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (5, 3, '2005-07-01');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (6, 2, '2006-08-04');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (6, 1, '2006-09-05');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (7, 1, '2007-10-04');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (8, 1, '2008-11-06');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (8, 4, '2008-12-10');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (9, 2, '2009-12-11');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (10, 2, '2010-10-09');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (10, 1, '2010-11-04');



