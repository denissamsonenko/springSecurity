INSERT INTO users (id, first_name, email, password)
VALUES (1, 'us@r', 'us@r@mail.ru', '$2a$10$uKF34nhzy0LS3xopMTw2/ekfsq8hgGib3wBYieEnvvotqMdSblFiy'), (2, 'adm!n', 'adm!n@mail.ru','$2a$10$mP51z9tsWybHAYKoTah4wOrGrlH1/zLRmuK760ujJ11aRVU8fyqhm');

INSERT INTO authorities (id, authority)
VALUES (1,'ROLE_USER'), (2, 'ROLE_ADMIN');
