PGDMP  3    +                |           learning_platform    16.3    16.3 -               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16564    learning_platform    DATABASE     �   CREATE DATABASE learning_platform WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Lithuanian_Lithuania.1257';
 !   DROP DATABASE learning_platform;
                postgres    false            �            1259    16601    review_schedules    TABLE     �   CREATE TABLE public.review_schedules (
    id integer NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone,
    mentor_id integer,
    student_id integer
);
 $   DROP TABLE public.review_schedules;
       public         heap    postgres    false            �            1259    16600    review_schedule_id_seq    SEQUENCE     �   ALTER TABLE public.review_schedules ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.review_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16576    review_statuses    TABLE     h   CREATE TABLE public.review_statuses (
    id integer NOT NULL,
    status character varying NOT NULL
);
 #   DROP TABLE public.review_statuses;
       public         heap    postgres    false            �            1259    16575    review_statuses_id_seq    SEQUENCE     �   ALTER TABLE public.review_statuses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.review_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    16617    reviews    TABLE     �   CREATE TABLE public.reviews (
    id integer NOT NULL,
    grade integer,
    comment character varying,
    review_status_id integer NOT NULL,
    schedule_id integer NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    16616    reviews_id_seq    SEQUENCE     �   ALTER TABLE public.reviews ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16932    user_credentials    TABLE     �   CREATE TABLE public.user_credentials (
    id integer NOT NULL,
    password character varying NOT NULL,
    user_id integer NOT NULL
);
 $   DROP TABLE public.user_credentials;
       public         heap    postgres    false            �            1259    16931    user_credentials_id_seq    SEQUENCE     �   ALTER TABLE public.user_credentials ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    16565 
   user_types    TABLE     a   CREATE TABLE public.user_types (
    id integer NOT NULL,
    type character varying NOT NULL
);
    DROP TABLE public.user_types;
       public         heap    postgres    false            �            1259    16574    user_types_id_seq    SEQUENCE     �   ALTER TABLE public.user_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16586    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    user_type_id integer NOT NULL,
    username character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16916    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    219                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    224            c           2604    16923    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    219                      0    16601    review_schedules 
   TABLE DATA           S   COPY public.review_schedules (id, start, "end", mentor_id, student_id) FROM stdin;
    public          postgres    false    221   !3                 0    16576    review_statuses 
   TABLE DATA           5   COPY public.review_statuses (id, status) FROM stdin;
    public          postgres    false    218   u3                 0    16617    reviews 
   TABLE DATA           T   COPY public.reviews (id, grade, comment, review_status_id, schedule_id) FROM stdin;
    public          postgres    false    223   �3                 0    16932    user_credentials 
   TABLE DATA           A   COPY public.user_credentials (id, password, user_id) FROM stdin;
    public          postgres    false    226   �3                 0    16565 
   user_types 
   TABLE DATA           .   COPY public.user_types (id, type) FROM stdin;
    public          postgres    false    215   �4                 0    16586    users 
   TABLE DATA           B   COPY public.users (id, email, user_type_id, username) FROM stdin;
    public          postgres    false    219   �4                  0    0    review_schedule_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.review_schedule_id_seq', 2, true);
          public          postgres    false    220                       0    0    review_statuses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.review_statuses_id_seq', 4, true);
          public          postgres    false    217                        0    0    reviews_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reviews_id_seq', 2, true);
          public          postgres    false    222            !           0    0    user_credentials_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.user_credentials_id_seq', 19, true);
          public          postgres    false    225            "           0    0    user_types_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_types_id_seq', 4, true);
          public          postgres    false    216            #           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 32, true);
          public          postgres    false    224            q           2606    16605 &   review_schedules review_schedules_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.review_schedules
    ADD CONSTRAINT review_schedules_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.review_schedules DROP CONSTRAINT review_schedules_pkey;
       public            postgres    false    221            i           2606    16582 $   review_statuses review_statuses_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.review_statuses
    ADD CONSTRAINT review_statuses_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.review_statuses DROP CONSTRAINT review_statuses_pkey;
       public            postgres    false    218            s           2606    16623    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    223            m           2606    16599    users unique_email 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT unique_email;
       public            postgres    false    219            k           2606    16584    review_statuses unique_status 
   CONSTRAINT     Z   ALTER TABLE ONLY public.review_statuses
    ADD CONSTRAINT unique_status UNIQUE (status);
 G   ALTER TABLE ONLY public.review_statuses DROP CONSTRAINT unique_status;
       public            postgres    false    218            e           2606    16573    user_types unique_type 
   CONSTRAINT     Q   ALTER TABLE ONLY public.user_types
    ADD CONSTRAINT unique_type UNIQUE (type);
 @   ALTER TABLE ONLY public.user_types DROP CONSTRAINT unique_type;
       public            postgres    false    215            u           2606    16938 &   user_credentials user_credentials_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_credentials
    ADD CONSTRAINT user_credentials_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_credentials DROP CONSTRAINT user_credentials_pkey;
       public            postgres    false    226            g           2606    16571    user_types user_types_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_types DROP CONSTRAINT user_types_pkey;
       public            postgres    false    215            o           2606    16592    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219            w           2606    16606    review_schedules fk_mentor_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.review_schedules
    ADD CONSTRAINT fk_mentor_user FOREIGN KEY (mentor_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.review_schedules DROP CONSTRAINT fk_mentor_user;
       public          postgres    false    4719    219    221            y           2606    16629    reviews fk_review_schedule    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_review_schedule FOREIGN KEY (schedule_id) REFERENCES public.review_schedules(id);
 D   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_review_schedule;
       public          postgres    false    221    4721    223            z           2606    16624    reviews fk_review_status    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_review_status FOREIGN KEY (review_status_id) REFERENCES public.review_statuses(id);
 B   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_review_status;
       public          postgres    false    218    223    4713            x           2606    16611     review_schedules fk_student_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.review_schedules
    ADD CONSTRAINT fk_student_user FOREIGN KEY (student_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.review_schedules DROP CONSTRAINT fk_student_user;
       public          postgres    false    221    4719    219            {           2606    16939    user_credentials fk_user    FK CONSTRAINT     w   ALTER TABLE ONLY public.user_credentials
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(id);
 B   ALTER TABLE ONLY public.user_credentials DROP CONSTRAINT fk_user;
       public          postgres    false    219    4719    226            v           2606    16593    users fk_user_type    FK CONSTRAINT     {   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_type FOREIGN KEY (user_type_id) REFERENCES public.user_types(id);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_user_type;
       public          postgres    false    215    219    4711               D   x�Uʱ�0��H�m`�L���H���Z]ua7�#d"+�V��&��e�]Vė6a�wv�         :   x�3�,H�K��K�2��̋/(�O/J-.�2�L��-�I-IM�2�LN�KN�2c���� �K;            x�3�45����4�4����� {z         �   x���A
�Pбw��ߧ��è�D$H(���fP���[���F��1]|۬�m3���U�t�󫛓�#�'���鿃ݗ����������ba`�4 C�9�x(4�D�*��H�H(~d�#���IzP\� �/Y��L��x�(�4� �N�m�         ,   x�3�,.)MI�+�2��R�E\&��)��y��%E� ~� ��         �  x�e�Mn�0���)x"���ٵu
�UM�n��J�6R�뜾�Az��|34��C�}�/����Xw����Y�E��)���NÇ���I ��m7;-���h��j����{�cs��.��D�$�kOi��ߪ��z՞o S�A�N�X7xQ�D�38zM�':��>���Lx[���E��T�eJQ���h�`�9ۮ>DO��7��ј�]�Y��\�V�E����Y���cL\�DT+�fIv��wWe.x����%���p9f+����\���Jo�u��"jǥ����I��.F�!�E�|*'&��8�M̫/[l�G��s��6������2;�K�mq�>�R1��i�����20ҫӝ�t����V _4"�Ε�     