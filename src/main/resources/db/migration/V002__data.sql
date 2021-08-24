INSERT INTO vet VALUES (1, 'James', 'Carter');
INSERT INTO vet VALUES (2, 'Helen', 'Leary');
INSERT INTO vet VALUES (3, 'Linda', 'Douglas');
INSERT INTO vet VALUES (4, 'Rafael', 'Ortega');
INSERT INTO vet VALUES (5, 'Henry', 'Stevens');
INSERT INTO vet VALUES (6, 'Sharon', 'Jenkins');

INSERT INTO specialty VALUES (1, 'radiology');
INSERT INTO specialty VALUES (2, 'surgery');
INSERT INTO specialty VALUES (3, 'dentistry');

INSERT INTO vet_specialty VALUES (2, 1);
INSERT INTO vet_specialty VALUES (3, 2);
INSERT INTO vet_specialty VALUES (3, 3);
INSERT INTO vet_specialty VALUES (4, 2);
INSERT INTO vet_specialty VALUES (5, 1);

INSERT INTO pet_type VALUES (1, 'cat');
INSERT INTO pet_type VALUES (2, 'dog');
INSERT INTO pet_type VALUES (3, 'lizard');
INSERT INTO pet_type VALUES (4, 'snake');
INSERT INTO pet_type VALUES (5, 'bird');
INSERT INTO pet_type VALUES (6, 'hamster');

INSERT INTO owner VALUES (1, 'George', 'Franklin', '110 W. Liberty St.', 'Madison', '6085551023');
INSERT INTO owner VALUES (2, 'Betty', 'Davis', '638 Cardinal Ave.', 'Sun Prairie', '6085551749');
INSERT INTO owner VALUES (3, 'Eduardo', 'Rodriquez', '2693 Commerce St.', 'McFarland', '6085558763');
INSERT INTO owner VALUES (4, 'Harold', 'Davis', '563 Friendly St.', 'Windsor', '6085553198');
INSERT INTO owner VALUES (5, 'Peter', 'McTavish', '2387 S. Fair Way', 'Madison', '6085552765');
INSERT INTO owner VALUES (6, 'Jean', 'Coleman', '105 N. Lake St.', 'Monona', '6085552654');
INSERT INTO owner VALUES (7, 'Jeff', 'Black', '1450 Oak Blvd.', 'Monona', '6085555387');
INSERT INTO owner VALUES (8, 'Maria', 'Escobito', '345 Maple St.', 'Madison', '6085557683');
INSERT INTO owner VALUES (9, 'David', 'Schroeder', '2749 Blackhawk Trail', 'Madison', '6085559435');
INSERT INTO owner VALUES (10, 'Carlos', 'Estaban', '2335 Independence La.', 'Waunakee', '6085555487');

INSERT INTO pet VALUES (1, 'Leo', '2000-09-07', 1, 1);
INSERT INTO pet VALUES (2, 'Basil', '2002-08-06', 6, 2);
INSERT INTO pet VALUES (3, 'Rosy', '2001-04-17', 2, 3);
INSERT INTO pet VALUES (4, 'Jewel', '2000-03-07', 2, 3);
INSERT INTO pet VALUES (5, 'Iggy', '2000-11-30', 3, 4);
INSERT INTO pet VALUES (6, 'George', '2000-01-20', 4, 5);
INSERT INTO pet VALUES (7, 'Samantha', '1995-09-04', 1, 6);
INSERT INTO pet VALUES (8, 'Max', '1995-09-04', 1, 6);
INSERT INTO pet VALUES (9, 'Lucky', '1999-08-06', 5, 7);
INSERT INTO pet VALUES (10, 'Mulligan', '1997-02-24', 2, 8);
INSERT INTO pet VALUES (11, 'Freddy', '2000-03-09', 5, 9);
INSERT INTO pet VALUES (12, 'Lucky', '2000-06-24', 2, 10);
INSERT INTO pet VALUES (13, 'Sly', '2002-06-08', 1, 10);

INSERT INTO visit VALUES (1, 7, '2010-03-04', 'rabies shot');
INSERT INTO visit VALUES (2, 8, '2011-03-04', 'rabies shot');
INSERT INTO visit VALUES (3, 8, '2009-06-04', 'neutered');
INSERT INTO visit VALUES (4, 7, '2008-09-04', 'spayed');

-- NOW FIX THE BROKEN SEQUENCES...

SELECT setval('owner_id_seq', (SELECT MAX(id) FROM owner));
SELECT setval('pet_id_seq', (SELECT MAX(id) FROM pet));
SELECT setval('specialty_id_seq', (SELECT MAX(id) FROM specialty));
SELECT setval('pet_type_id_seq', (SELECT MAX(id) FROM pet_type));
SELECT setval('vet_id_seq', (SELECT MAX(id) FROM vet));
SELECT setval('visit_id_seq', (SELECT MAX(id) FROM visit));
