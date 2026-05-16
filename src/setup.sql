-- ========================================
-- CREATE ORGANIZATION TABLE
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);
-- ========================================
-- INSERTING SAMPLE DATA: ORGANIZATIONS
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES (
        'BrightFuture Builders',
        'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
        'info@brightfuturebuilders.org',
        'brightfuture-logo.png'
    ),
    (
        'GreenHarvest Growers',
        'An urban farming collective promoting food sustainability and education in local neighborhoods.',
        'contact@greenharvest.org',
        'greenharvest-logo.png'
    ),
    (
        'UnityServe Volunteers',
        'A volunteer coordination group supporting local charities and service initiatives.',
        'hello@unityserve.org',
        'unityserve-logo.png'
    );
-- ========================================
-- CREATE CATEGORY TABLE
-- ========================================
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);
-- ============================================
-- CREATE PROJECT TABLE
-- ============================================
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL
);
-- ============================================
-- CREATE JUNCTION TABLE
-- MANY-TO-MANY RELATIONSHIP
-- A project can have many categories
-- A category can have many projects
-- ============================================
CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (project_id, category_id),
    CONSTRAINT fk_project FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);
-- ============================================
-- INSERT CATEGORIES
-- ============================================
INSERT INTO category (name)
VALUES ('Environmental'),
    ('Educational'),
    ('Community Service'),
    ('Health and Wellness');
-- ============================================
-- INSERT PROJECTS
-- ============================================
INSERT INTO project (name, description)
VALUES (
        'Park Cleanup',
        'Join us to clean up local parks and make them beautiful!'
    ),
    (
        'Food Drive',
        'Help collect and distribute food to those in need.'
    ),
    (
        'Community Tutoring',
        'Volunteer to tutor students in various subjects.'
    );
-- ============================================
-- ASSOCIATE PROJECTS WITH CATEGORIES
-- ============================================
-- Food Drive -> Health and Wellness
INSERT INTO project_category (project_id, category_id)
VALUES (2, 4);
-- Park Cleanup -> Environmental
INSERT INTO project_category (project_id, category_id)
VALUES (1, 1);
-- Food Drive -> Community Service
INSERT INTO project_category (project_id, category_id)
VALUES (2, 3);
-- Community Tutoring -> Educational
INSERT INTO project_category (project_id, category_id)
VALUES (3, 2);