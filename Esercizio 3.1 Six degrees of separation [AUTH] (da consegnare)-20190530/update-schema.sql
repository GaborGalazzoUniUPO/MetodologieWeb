create table user
(
    id int auto_increment
        primary key,
    username varchar(50) not null,
    password varchar(512) not null,
    constraint user_username_uindex
        unique (username)
);

INSERT INTO user (id, username, password) VALUES (1, 'admin', '$2y$12$jDwsl1XUO5VRz3r3.bFGJu1H3h2GlAmkpOrjOHL7IcPT4QrU1flPG'); /* pw: admin */
INSERT INTO user (id, username, password) VALUES (2, 'user', '$2y$12$rPS7kBmpkvkA579J2c7EVux0lhsUqNp1qolmf4unh2gTqTOdYH/Ma'); /* pw: user */