DROP TABLE COMPUTER CASCADE CONSTRAINTS;
CREATE TABLE COMPUTER(
    computer_no NUMBER CONSTRAINT computer_no_pk PRIMARY KEY,
    processor VARCHAR(25),
    ram VARCHAR(25), 
    manufacturer VARCHAR(25), 
    cost FLOAT, 
    date_made DATE,
    tipo VARCHAR(7) NOT NULL CHECK(tipo IN('LAPTOP','DESKTOP')),
    UNIQUE (computer_no, tipo)  
);

DROP TABLE LAPTOP CASCADE CONSTRAINTS;
CREATE TABLE LAPTOP(
    computer_no NUMBER PRIMARY KEY REFERENCES COMPUTER(computer_no),
    weigth NUMBER,
    scren_size NUMBER, 
    color VARCHAR2(10),
    tipo VARCHAR2(6) DEFAULT 'LAPTOP',
    FOREIGN KEY(computer_no,tipo) REFERENCES COMPUTER(computer_no,tipo),
    CONSTRAINT tipo_LAPTOP CHECK (tipo='LAPTOP'),
    component_no NUMBER,
    FOREIGN KEY (component_no) REFERENCES MEMORY(component_no)
);

DROP TABLE DESKTOP CASCADE CONSTRAINTS;
CREATE TABLE DESKTOP(
    computer_no NUMBER PRIMARY KEY REFERENCES COMPUTER(computer_no),
    tipo VARCHAR2(7) DEFAULT 'DESKTOP',
    FOREIGN KEY(computer_no,tipo) REFERENCES COMPUTER(computer_no,tipo),
    CONSTRAINT tipo_DESKTOP CHECK (tipo='DESKTOP'),
    component_no NUMBER,
    FOREIGN KEY (component_no) REFERENCES COMPONENT(component_no)  
);

DROP TABLE COMPONENT CASCADE CONSTRAINTS;
CREATE TABLE COMPONENT(
    component_no NUMBER CONSTRAINT component_no_pk PRIMARY KEY,
    manufacturer VARCHAR2(25),
    cost FLOAT,
    tipo VARCHAR(10) NOT NULL CHECK(tipo IN('MEMORY','SOUND_CARD','VIDEO_CARD')),
    UNIQUE (component_no, tipo),
    computer_no NUMBER UNIQUE,
    FOREIGN KEY (computer_no) REFERENCES DESKTOP(computer_no)
);

DROP TABLE MEMORY CASCADE CONSTRAINTS;
CREATE TABLE MEMORY(
    component_no NUMBER PRIMARY KEY REFERENCES COMPONENT(component_no),
    type_memory VARCHAR2(25),
    capacity NUMBER,
    speed NUMBER,
    tipo VARCHAR2(6) DEFAULT 'MEMORY',
    FOREIGN KEY(component_no,tipo) REFERENCES COMPONENT(component_no,tipo),
    CONSTRAINT tipo_memory CHECK (tipo='MEMORY'),
    computer_no NUMBER,
    FOREIGN KEY (computer_no) REFERENCES LAPTOP(computer_no)
);

DROP TABLE SOUND_CARD CASCADE CONSTRAINTS;
CREATE TABLE SOUND_CARD(
    component_no NUMBER PRIMARY KEY REFERENCES COMPONENT(component_no),
    nameSC VARCHAR2(25),
    polyphony VARCHAR(25),
    tipo VARCHAR2(10) DEFAULT 'SOUND_CARD',
    FOREIGN KEY(component_no,tipo) REFERENCES COMPONENT(component_no,tipo),
    CONSTRAINT tipo_SC CHECK (tipo='SOUND_CARD')
);

DROP TABLE VIDEO_CARD CASCADE CONSTRAINTS;
CREATE TABLE VIDEO_CARD(
    component_no NUMBER PRIMARY KEY REFERENCES COMPONENT(component_no),
    name_video_card VARCHAR2(25),
    capacity NUMBER,
    tipo VARCHAR2(10) DEFAULT 'VIDEO_CARD',
    FOREIGN KEY(component_no,tipo) REFERENCES COMPONENT(component_no,tipo),
    CONSTRAINT tipo_VC CHECK (tipo='VIDEO_CARD')
);

DROP TABLE SOFTWARE CASCADE CONSTRAINTS;
CREATE TABLE SOFTWARE(
    license_no NUMBER CONSTRAINT license_no_pk PRIMARY KEY,
    name_software VARCHAR2(25),
    version_software VARCHAR(25),
    size_software NUMBER,
    company VARCHAR2(25)
);

DROP TABLE OPERATING_SYSTEM CASCADE CONSTRAINTS;
CREATE TABLE OPERATING_SYSTEM(
    license_no NUMBER PRIMARY KEY REFERENCES SOFTWARE(license_no),
    type_operating_system VARCHAR2(25),
    edition_operating_system VARCHAR(25)
);

DROP TABLE ACCESORY CASCADE CONSTRAINTS;
CREATE TABLE ACCESORY(
    accesory_no NUMBER CONSTRAINT accesory_no_pk PRIMARY KEY,
    cost FLOAT,
    manufacturer VARCHAR2(25),
    tipo VARCHAR(8) NOT NULL CHECK(tipo IN('KEYBOARD','MONITOR','MOUSE')),
    UNIQUE(accesory_no,tipo)
);

DROP TABLE KEYBOARD CASCADE CONSTRAINTS;
CREATE TABLE KEYBOARD(
    accesory_no NUMBER PRIMARY KEY REFERENCES ACCESORY(accesory_no),
    backlight VARCHAR2(25),
    layout VARCHAR2(25),
    no_of_keys NUMBER,
    tipo VARCHAR(8) DEFAULT 'KEYBOARD',
    FOREIGN KEY(accesory_no,tipo) REFERENCES ACCESORY(accesory_no,tipo),
    CONSTRAINT tipo_KEYBOARD CHECK (tipo='KEYBOARD')
);

DROP TABLE MONITOR CASCADE CONSTRAINTS;
CREATE TABLE MONITOR(
    accesory_no NUMBER PRIMARY KEY REFERENCES ACCESORY(accesory_no),
    scren_size NUMBER,
    color VARCHAR2(15),
    tipo VARCHAR(7) DEFAULT 'MONITOR',
    FOREIGN KEY(accesory_no,tipo) REFERENCES ACCESORY(accesory_no,tipo),
    CONSTRAINT tipo_MONITOR CHECK (tipo='MONITOR')
);

DROP TABLE MOUSE CASCADE CONSTRAINTS;
CREATE TABLE MOUSE(
    accesory_no NUMBER PRIMARY KEY REFERENCES ACCESORY(accesory_no),
    wire VARCHAR2(25),
    no_of_buttons NUMBER,
    tipo VARCHAR(5) DEFAULT 'MOUSE',
    FOREIGN KEY(accesory_no,tipo) REFERENCES ACCESORY(accesory_no,tipo),
    CONSTRAINT tipo_MOUSE CHECK (tipo='MOUSE')
);

-- relacion sold_with accesory con computer

DROP TABLE SOLD_WITH CASCADE CONSTRAINTS;
CREATE TABLE SOLD_WITH(
    computer_no NUMBER UNIQUE,
    FOREIGN KEY (computer_no) REFERENCES COMPUTER(computer_no),
    accesory_no NUMBER,
    FOREIGN KEY (accesory_no) REFERENCES ACCESORY(accesory_no),
    warranty VARCHAR2(25)
);

-- relacion SUPPORTS  COMPONENT CON SOFTWARE

DROP TABLE SUPPORTS CASCADE CONSTRAINTS;
CREATE TABLE SUPPORTS(
    license_no NUMBER,
    FOREIGN KEY (license_no) REFERENCES SOFTWARE(license_no),
    component_no NUMBER,
    FOREIGN KEY (component_no) REFERENCES COMPONENT(component_no),
    removable VARCHAR2(1)
);

-- relacion INSTALLED COMPUTER con SOFTWARE

DROP TABLE INSTALLED CASCADE CONSTRAINTS;
CREATE TABLE INSTALLED(
    license_no NUMBER,
    FOREIGN KEY (license_no) REFERENCES SOFTWARE(license_no),
    computer_no NUMBER,
    FOREIGN KEY (computer_no) REFERENCES COMPUTER(computer_no),
    date_ins DATE
);

-- relacion INSTALLED_OS COMPUTER con OPERATING_SYSTEM

DROP TABLE INSTALLED_OS CASCADE CONSTRAINTS;
CREATE TABLE INSTALLED_OS(
    license_no NUMBER UNIQUE,
    FOREIGN KEY (license_no) REFERENCES OPERATING_SYSTEM(license_no),
    computer_no NUMBER,
    FOREIGN KEY (computer_no) REFERENCES COMPUTER(computer_no),
    reason VARCHAR2(25)
);