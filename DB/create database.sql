CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cognome VARCHAR(255),
    data_nascita DATE,
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE Punto_Vendita (
    id INT PRIMARY KEY AUTO_INCREMENT,
    indirizzo VARCHAR(255),
    citta varchar(255),
    partita_iva VARCHAR(255),
    src_img varchar(255)
);

CREATE TABLE Prodotto (
    codice INT PRIMARY KEY,
    produttore VARCHAR(255),
    prezzo_punti INT,
    prezzo FLOAT,
    tipo VARCHAR(255),
    nome VARCHAR(255),
    src VARCHAR(255)
);
    
CREATE TABLE Operatore (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cognome VARCHAR(255),
    imposte FLOAT,
    costo FLOAT,
    stipendio FLOAT,
    id_punto_vendita INT,
    data_Assunzione DATE,
    FOREIGN KEY (id_punto_vendita)
        REFERENCES Punto_Vendita (id),
    INDEX idx_id_punto_vendita (id_punto_vendita)
);

CREATE TABLE Transazione (
    id_cliente INT,
    id_operatore INT,
    codice_prodotto INT,
    data_ DATETIME,
    quantita_prodotto SMALLINT,
    PRIMARY KEY (id_cliente , id_operatore , data_),
    FOREIGN KEY (id_cliente)
        REFERENCES Cliente (id),
    FOREIGN KEY (id_operatore)
        REFERENCES Operatore (id),
    FOREIGN KEY (codice_prodotto)
        REFERENCES Prodotto (codice),
    INDEX idx_id_cliente (id_cliente),
    INDEX idx_id_operatore (id_operatore),
    INDEX idx_codice_prodotto (codice_prodotto)
);

CREATE TABLE assunzione_passata (
    id_operatore INT,
    id_punto_vendita INT,
    data_assunzione DATE,
    data_licenziamento DATE,
    PRIMARY KEY (id_operatore , id_punto_vendita , data_assunzione),
    FOREIGN KEY (id_operatore)
        REFERENCES Operatore (id),
    FOREIGN KEY (id_punto_vendita)
        REFERENCES Punto_Vendita (id),
    INDEX idx_id_operatore (id_operatore),
    INDEX idx_id_punto_vendita (id_punto_vendita)
);

CREATE TABLE scheda (
    Numero INT,
    id_punto_vendita INT,
    punteggio INT,
    id_cliente INT,
    PRIMARY KEY (Numero , id_punto_vendita),
    FOREIGN KEY (id_cliente)
        REFERENCES Cliente (id),
    INDEX idx_id_cliente (id_cliente)
);

CREATE TABLE ritiro (
    numero_scheda INT,
    id_punto_vendita INT,
    codice_prodotto INT,
    data_ritiro DATETIME,
    PRIMARY KEY (numero_scheda , id_punto_vendita , codice_prodotto , data_ritiro),
    FOREIGN KEY (numero_scheda)
        REFERENCES Scheda (Numero),
    INDEX idx_id_punto_vendita (id_punto_vendita)
);


create table registrazione(
	data_registrazione datetime,
    id_cliente int,
    id_punto_vendita int,
    primary key (data_registrazione, id_punto_vendita),
    FOREIGN KEY (id_cliente)
        REFERENCES cliente (id),
	FOREIGN KEY (id_punto_vendita)
        REFERENCES punto_vendita (id)
	
);

create table lista (
	id_cliente int,
    codice_prodotto int,
    quantita_prodotto int,
    primary key ( id_cliente, codice_prodotto),
    foreign key (codice_prodotto)references prodotto (codice),
    foreign key (id_cliente) references cliente (id)
    
);




insert into cliente values (null,'Luca','Chisari','1999-11-30',"ciao0@gmail.com","");
insert into cliente values (null,'Emanuele','Andaloro','1999-5-30',"ciao1@gmail.com","");
insert into cliente values (null,'Fabio','Castiglione','1999-7-10',"ciao2@gmail.com","");
insert into cliente values (null,'Giorgia','Arena','1999-12-24',"ciao3@gmail.com","");
insert into cliente values (null,'Sebastiano','Castiglione','1995-12-24',"ciao4@gmail.com","");
insert into cliente values (null,'Angelo', 'Sorbello', '1967-05-11',"ciao5@gmail.com","");
insert into cliente values (null,'Robert', 'Greco', '1980-01-23',"ciao6@gmail.com",""); 
insert into cliente values (null,'Marina', 'Terna', '1997-08-31',"ciao7@gmail.com","");
insert into cliente values (null,'Carmelo', 'Parisi', '2000-06-01',"ciao8@gmail.com","");
insert into cliente values (null,'Serena', 'Ventura', '1992-03-21',"ciao9@gmail.com","");
insert into cliente values (null,'Giacomo', 'Di Maria', '1999-11-10',"ciao10@gmail.com","");
insert into cliente values (null,'admin', '', '1999-14-05',"admin","$2y$10$lr7OSJ30ykBvO0csNkHb5OLQTVYfJdmmpWg4nAbriS5XNMd7d9Lya");

insert into punto_vendita values (null,'Via fantasia','Cesarò','IT000001','img/Località/1200px-Panorama_di_Cesarò_4.jpg');
insert into punto_vendita values (null,'Via Roma','Catania','IT000002','img/Località/cta-catania-port-1b.jpg.image.750.563.low.jpg');
insert into punto_vendita values (null,'Via Firenze','Taormina','IT000003','img/Località/isola-bella-taormina-panorama-scaled.jpg');
insert into punto_vendita values (null,'Via Regina Elena','Randazzo','IT000004','img/Località/Chiesa_di_San_Nicola,_Randazzo_Catania,_Sicily,_Italy_-_panoramio_(1).jpg');
insert into punto_vendita values (null,'Via della Vittoria','Giardini','IT000005','img/Località/Giardini.jpg');
insert into punto_vendita values (null,'Via Carlo Max','Adrano','IT000006','img/Località/Adrano-e1402324121948.jpg');

insert into prodotto values (0,'Barilla',null,1,'prodotto','farfalle','img/prodotti/farfalle_barilla.jpg');
insert into prodotto values (1,'Divella',null,1.5,'prodotto','orecchiette','img/prodotti/orecchiette_divella.jpg');
insert into prodotto values (2,'Sole',null,2,'prodotto','detersivo lavanda','img/prodotti/sole_detersivo_lavatrice_lavanda.jpg');
insert into prodotto values (3,'Mulino Bianco',null,3.7,'prodotto','tarallucci','img/prodotti/tarallucci_mulino_bianco.jpg');
insert into prodotto values (4,'Dash',null,2.8,'prodotto','pods','img/prodotti/pods_PeG_dash.jpg');
insert into prodotto values (5,'Gillette',null,7.8,'prodotto','rasoio','img/prodotti/rasoio_PeG_gillette.png');
insert into prodotto values (10,'Tupperware',100,15.7,'premio','bottiglie','img/prodotti/tupperware_bottiglie.jpg');
insert into prodotto values (11,'Tupperware',70,10.0,'premio','ciotole meraviglia','img/prodotti/tupperware_ciotole_meraviglia.jpg');
insert into prodotto values (12,'Tupperware',20,1,'premio','contenitori pinguino','img/prodotti/tupperware_contenitori_pinguino.jpg');
insert into prodotto values (13,'Tupperware',40,3,'premio','multichief','img/prodotti/tupperware_multichef.jpg');
insert into prodotto values (14,'Tupperware',2000,20,'premio','portavivande','img/prodotti/tupperware_portavivande.jpg');

insert into operatore values (null,'Mario','Rossi',500, 2000, 1500, 1, '2020-01-20');
insert into operatore values (null,'Luca','Chisari',500, 2000, 1500, 5, '2020-02-15');
insert into operatore values (null,'Nicola','Ferrari',1000, 2500, 2000, 3, '2020-07-08');
insert into operatore values (null,'Enzo','Ferrari',1000, 2500, 2000, 4, '2020-07-08');
insert into operatore values (null,'Ezio','Greggio',1000, 2500, 2000, 1, '2020-07-08');
insert into operatore values (null,'Gerry','Scotty',1000, 2500, 2000, 1, '2020-07-08');

insert into assunzione_passata values (1, 1, '2020-01-20', '2020-02-20');
insert into assunzione_passata values (1, 1, '2018-01-20', '2018-02-20');

insert into assunzione_passata values (3, 1, '2015-01-20', '2015-02-20');
insert into assunzione_passata values (3, 3, '2012-01-20', '2020-02-20');

insert into assunzione_passata values (2, 1, '2015-01-20', '2015-02-20');
insert into assunzione_passata values (2, 2, '2012-01-20', '2020-02-20');

insert into assunzione_passata values (2, 2, '2015-01-20', '2015-02-20');
insert into assunzione_passata values (2, 4, '2012-01-20', '2020-02-20');


insert into scheda values (1, 1, 0, 1);
-- insert into scheda values (1, 0, 0, 0);
insert into scheda values (2, 0, 0, null);
insert into scheda values (3, 0, 0, 5);
insert into scheda values (2, 1, 0, null);
insert into scheda values (3, 1, 0, 3);
insert into scheda values (1, 2, 0, null);
insert into scheda values (2, 2, 0, null);
insert into scheda values (3, 2, 0, null);
insert into scheda values (1, 4, 0, 2);
insert into scheda values (2, 4, 0, 10);
insert into scheda values (3, 4, 0, 8);
insert into scheda values (1, 5, 0, null);
insert into scheda values (2, 5, 0, null);
insert into scheda values (3, 5, 0, 4);

insert into ritiro values (1,1,11,'2020-12-23 18:00:00');
insert into ritiro values (2,1,11,'2020-09-27 13:00:00');
insert into ritiro values (3,4,11,'2020-12-23 17:00:00');
insert into ritiro values (1,2,11,'2020-01-23 12:00:00');


insert into transazione values (1, 1, 0000000, '2020-12-23 12:00:00',1);
insert into transazione values (1, 1, 0000001, '2020-12-23 12:00:01',2);
insert into transazione values (1, 1, 0000002, '2020-12-23 12:00:05',3);
insert into transazione values (1, 1, 0000005, '2020-12-23 12:00:07',1);

insert into transazione values (3, 1, 0000010, '2020-01-23 12:00:00',1);
insert into transazione values (3, 1, 0000001, '2020-03-23 12:00:01',1);
insert into transazione values (3, 1, 0000002, '2020-04-23 12:00:05',1);
insert into transazione values (3, 1, 0000014, '2020-04-23 12:00:07',1);

insert into transazione values (3, 4, 0000010, '2019-01-23 12:00:00',5);
insert into transazione values (3, 4, 0000001, '2019-03-23 12:00:01',5);
insert into transazione values (3, 4, 0000002, '2019-04-23 12:00:05',5);
insert into transazione values (3, 4, 0000014, '2019-04-23 12:00:07',10);

insert into transazione values (2, 1, 0000000, '2020-12-23 13:00:00',5);
insert into transazione values (2, 1, 0000001, '2020-12-23 13:00:01',15);
insert into transazione values (2, 1, 0000002, '2020-12-23 13:00:05',7);
insert into transazione values (2, 1, 0000005, '2020-12-23 13:00:07',8);

insert into transazione values (6, 3, 0000000, '2020-09-23 13:00:00',7);
insert into transazione values (6, 3, 0000001, '2020-09-23 13:00:01',7);
insert into transazione values (6, 3, 0000002, '2020-09-23 13:00:05',7);
insert into transazione values (6, 3, 0000005, '2020-09-23 13:00:07',7);


delimiter \\
create trigger premio_gratis
after update 
on scheda
for each row 
begin

	if new.punteggio >= 1000
		then
			insert into ritiro values (new.numero, new.id_punto_vendita,11,current_timestamp());
	end if;
            
	if new.punteggio >= 2000
		then
			insert into ritiro values (new.numero, new.id_punto_vendita,10,current_timestamp()+1);
	end if;
                    
	 if new.punteggio >= 5000
		then
			insert into ritiro values (new.numero, new.id_punto_vendita,14,current_timestamp()+2);
	end if;

end\\

delimiter \\
create procedure mostra_premi()
begin

	select *
    from prodotto
    where tipo = "premio";

end\\

delimiter \\
create procedure storico_impiegati_punto_vendita(in id_punto_vendita int)
begin

drop table if exists impiegati_correnti;
drop table if exists impiegati_precedenti;

create temporary table impiegati_correnti
	as 
	select id, nome, cognome, data_Assunzione 
	from operatore o
    where id_punto_vendita = o.id_punto_vendita;
    
create temporary table impiegati_precedenti
	as
	select a.id_operatore, a.data_assunzione, a.data_licenziamento, o.nome, o.cognome
    from assunzione_passata a join operatore o on a.id_operatore = o.id
    where id_punto_vendita = a.id_punto_vendita;
    
select * from impiegati_correnti;
select * from impiegati_precedenti;

end\\

delimiter \\
create procedure ritiro_premi(in codice_prodotto int, in numero_scheda int, in id_punto_vendita int)
begin 

	declare message varchar(255);
    
    case 
        when 
			(select punteggio - (select prezzo_punti from prodotto where codice = codice_prodotto)
            from scheda
            where numero = numero_scheda and scheda.id_punto_vendita = id_punto_vendita) 
            > 0
				then
					insert into ritiro values
					(
						numero_scheda,
						id_punto_vendita,
						codice_prodotto ,
						current_timestamp()
					);
					drop view if exists punti_clienti;

					update scheda s
					set punteggio = punteggio - (select prezzo_punti from prodotto where codice = codice_prodotto)
					where numero_scheda = numero and s.id_punto_vendita = id_punto_vendita;

					create view punti_clienti as (
						select id_cliente, round(sum( t.quantita_prodotto * prezzo )) as totale_punti
					from prodotto p join transazione t on p.codice = t.codice_prodotto
					group by t.id_cliente
					);
                    
		when
			(select punteggio - (select prezzo_punti from prodotto where codice = codice_prodotto)
			from scheda
			where numero = numero_scheda and scheda.id_punto_vendita = id_punto_vendita) 
			< 0
				then
					set message = "ERRORE PUNTI INSUFFICENTI PER IL RITIRO DEL PREMIO!";
					select message;
									
	end case;


end\\

delimiter \\ 
create procedure stampa_costi_operatori()
begin

select id_punto_vendita, sum(costo) as costo_sostenuto
from operatore
group by id_punto_vendita;
end\\


delimiter \\
create trigger calcolo_costo_operatore
before insert on operatore
for each row
begin

	set new.costo = new.imposte + new.stipendio; 
    
end\\



delimiter //
create trigger aggiornamento_punti_clienti
after insert on transazione 
for each row
begin

update scheda as s
set s.punteggio = (select totale_punti from punti_clienti where new.id_cliente = id_cliente)
where new.id_cliente = s.id_cliente
;

end//



-- QUESTO TRIGGER UTILIZZA LA VIEW DI SOLA LETTURA PER AGGIORNARE (SCRIVERE UN ATTRIBUTO DERIVATO)


CREATE VIEW punti_clienti AS
    (SELECT 
        id_cliente,
        ROUND(SUM(t.quantita_prodotto * prezzo)) AS totale_punti
    FROM
        prodotto p
            JOIN
        transazione t ON p.codice = t.codice_prodotto
    GROUP BY t.id_cliente)
