/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     20.03.2011 17:07:48                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Авиарейс') and o.name = 'FK_АВИАРЕЙС_REFERENCE_ТИП САМО')
alter table Авиарейс
   drop constraint "FK_АВИАРЕЙС_REFERENCE_ТИП САМО"
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Авиарейс') and o.name = 'FK_АВИАРЕЙС_КАКОЙ АВИ_АВИАКОМП')
alter table Авиарейс
   drop constraint "FK_АВИАРЕЙС_КАКОЙ АВИ_АВИАКОМП"
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Авиарейс') and o.name = 'FK_АВИАРЕЙС_КУДА_ГОРОД')
alter table Авиарейс
   drop constraint FK_АВИАРЕЙС_КУДА_ГОРОД
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Авиарейс') and o.name = 'FK_АВИАРЕЙС_ОТКУДА_ГОРОД')
alter table Авиарейс
   drop constraint FK_АВИАРЕЙС_ОТКУДА_ГОРОД
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Авиакомпания')
            and   type = 'U')
   drop table Авиакомпания
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Авиарейс')
            and   type = 'U')
   drop table Авиарейс
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Город')
            and   type = 'U')
   drop table Город
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"Тип самолёта"')
            and   type = 'U')
   drop table "Тип самолёта"
go

/*==============================================================*/
/* Table: Авиакомпания                                          */
/*==============================================================*/
create table Авиакомпания (
   Название             varchar(200)         not null,
   constraint PK_АВИАКОМПАНИЯ primary key (Название)
)
go

/*==============================================================*/
/* Table: Авиарейс                                              */
/*==============================================================*/
create table Авиарейс (
   "Номер рейса"        int                  not null,
   Авиакомпания         varchar(200)         null,
   Откуда               varchar(200)         null,
   Куда                 varchar(200)         null,
   "Тип самолёта"       varchar(200)         null,
   Вылет                datetime             null,
   Прилёт               datetime             null,
   constraint PK_АВИАРЕЙС primary key ("Номер рейса")
)
go

/*==============================================================*/
/* Table: Город                                                 */
/*==============================================================*/
create table Город (
   Название             varchar(200)         not null,
   constraint PK_ГОРОД primary key (Название)
)
go

/*==============================================================*/
/* Table: "Тип самолёта"                                        */
/*==============================================================*/
create table "Тип самолёта" (
   "Тип самолёта"       varchar(200)         not null,
   "Количество пассажиров" int                  null
      constraint "CKC_КОЛИЧЕСТВО ПАССАЖ_ТИП САМО" check ("Количество пассажиров" is null or ("Количество пассажиров" between 10 and 9000)),
   constraint "PK_ТИП САМОЛЁТА" primary key ("Тип самолёта")
)
go

alter table Авиарейс
   add constraint "FK_АВИАРЕЙС_REFERENCE_ТИП САМО" foreign key ("Тип самолёта")
      references "Тип самолёта" ("Тип самолёта")
go

alter table Авиарейс
   add constraint "FK_АВИАРЕЙС_КАКОЙ АВИ_АВИАКОМП" foreign key (Авиакомпания)
      references Авиакомпания (Название)
         on update cascade
go

alter table Авиарейс
   add constraint FK_АВИАРЕЙС_КУДА_ГОРОД foreign key (Куда)
      references Город (Название)
go

alter table Авиарейс
   add constraint FK_АВИАРЕЙС_ОТКУДА_ГОРОД foreign key (Откуда)
      references Город (Название)
go

