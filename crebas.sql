/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     20.03.2011 17:07:48                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('��������') and o.name = 'FK_��������_REFERENCE_��� ����')
alter table ��������
   drop constraint "FK_��������_REFERENCE_��� ����"
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('��������') and o.name = 'FK_��������_����� ���_��������')
alter table ��������
   drop constraint "FK_��������_����� ���_��������"
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('��������') and o.name = 'FK_��������_����_�����')
alter table ��������
   drop constraint FK_��������_����_�����
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('��������') and o.name = 'FK_��������_������_�����')
alter table ��������
   drop constraint FK_��������_������_�����
go

if exists (select 1
            from  sysobjects
           where  id = object_id('������������')
            and   type = 'U')
   drop table ������������
go

if exists (select 1
            from  sysobjects
           where  id = object_id('��������')
            and   type = 'U')
   drop table ��������
go

if exists (select 1
            from  sysobjects
           where  id = object_id('�����')
            and   type = 'U')
   drop table �����
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"��� �������"')
            and   type = 'U')
   drop table "��� �������"
go

/*==============================================================*/
/* Table: ������������                                          */
/*==============================================================*/
create table ������������ (
   ��������             varchar(200)         not null,
   constraint PK_������������ primary key (��������)
)
go

/*==============================================================*/
/* Table: ��������                                              */
/*==============================================================*/
create table �������� (
   "����� �����"        int                  not null,
   ������������         varchar(200)         null,
   ������               varchar(200)         null,
   ����                 varchar(200)         null,
   "��� �������"       varchar(200)         null,
   �����                datetime             null,
   �����               datetime             null,
   constraint PK_�������� primary key ("����� �����")
)
go

/*==============================================================*/
/* Table: �����                                                 */
/*==============================================================*/
create table ����� (
   ��������             varchar(200)         not null,
   constraint PK_����� primary key (��������)
)
go

/*==============================================================*/
/* Table: "��� �������"                                        */
/*==============================================================*/
create table "��� �������" (
   "��� �������"       varchar(200)         not null,
   "���������� ����������" int                  null
      constraint "CKC_���������� ������_��� ����" check ("���������� ����������" is null or ("���������� ����������" between 10 and 9000)),
   constraint "PK_��� ����˨��" primary key ("��� �������")
)
go

alter table ��������
   add constraint "FK_��������_REFERENCE_��� ����" foreign key ("��� �������")
      references "��� �������" ("��� �������")
go

alter table ��������
   add constraint "FK_��������_����� ���_��������" foreign key (������������)
      references ������������ (��������)
         on update cascade
go

alter table ��������
   add constraint FK_��������_����_����� foreign key (����)
      references ����� (��������)
go

alter table ��������
   add constraint FK_��������_������_����� foreign key (������)
      references ����� (��������)
go

