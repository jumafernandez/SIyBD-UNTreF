PGDMP     )    /                {            anuarios_spu    15.4    15.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16742    anuarios_spu    DATABASE     �   CREATE DATABASE anuarios_spu WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE anuarios_spu;
                postgres    false            �            1259    16776 	   egresados    TABLE     �   CREATE TABLE public.egresados (
    id_institucion integer NOT NULL,
    anio integer NOT NULL,
    cantidad_mujeres numeric,
    cantidad_hombres numeric
);
    DROP TABLE public.egresados;
       public         heap    postgres    false            �            1259    16744    instituciones    TABLE     �   CREATE TABLE public.instituciones (
    id integer NOT NULL,
    institucion text NOT NULL,
    tipo text NOT NULL,
    cpres text
);
 !   DROP TABLE public.instituciones;
       public         heap    postgres    false            �            1259    16743    instituciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.instituciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.instituciones_id_seq;
       public          postgres    false    215                       0    0    instituciones_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.instituciones_id_seq OWNED BY public.instituciones.id;
          public          postgres    false    214            �            1259    16752    nuevos_inscriptos    TABLE     �   CREATE TABLE public.nuevos_inscriptos (
    id_institucion integer NOT NULL,
    anio integer NOT NULL,
    cantidad_mujeres numeric,
    cantidad_hombres numeric
);
 %   DROP TABLE public.nuevos_inscriptos;
       public         heap    postgres    false            �            1259    16764    reinscriptos    TABLE     �   CREATE TABLE public.reinscriptos (
    id_institucion integer NOT NULL,
    anio integer NOT NULL,
    cantidad_mujeres numeric,
    cantidad_hombres numeric
);
     DROP TABLE public.reinscriptos;
       public         heap    postgres    false            q           2604    16747    instituciones id    DEFAULT     t   ALTER TABLE ONLY public.instituciones ALTER COLUMN id SET DEFAULT nextval('public.instituciones_id_seq'::regclass);
 ?   ALTER TABLE public.instituciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                      0    16776 	   egresados 
   TABLE DATA           ]   COPY public.egresados (id_institucion, anio, cantidad_mujeres, cantidad_hombres) FROM stdin;
    public          postgres    false    218   <                 0    16744    instituciones 
   TABLE DATA           E   COPY public.instituciones (id, institucion, tipo, cpres) FROM stdin;
    public          postgres    false    215   �                 0    16752    nuevos_inscriptos 
   TABLE DATA           e   COPY public.nuevos_inscriptos (id_institucion, anio, cantidad_mujeres, cantidad_hombres) FROM stdin;
    public          postgres    false    216   s                  0    16764    reinscriptos 
   TABLE DATA           `   COPY public.reinscriptos (id_institucion, anio, cantidad_mujeres, cantidad_hombres) FROM stdin;
    public          postgres    false    217   o"                  0    0    instituciones_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.instituciones_id_seq', 1, false);
          public          postgres    false    214            y           2606    16782    egresados egresados_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.egresados
    ADD CONSTRAINT egresados_pkey PRIMARY KEY (id_institucion, anio);
 B   ALTER TABLE ONLY public.egresados DROP CONSTRAINT egresados_pkey;
       public            postgres    false    218    218            s           2606    16751     instituciones instituciones_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.instituciones
    ADD CONSTRAINT instituciones_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.instituciones DROP CONSTRAINT instituciones_pkey;
       public            postgres    false    215            u           2606    16758 (   nuevos_inscriptos nuevos_inscriptos_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.nuevos_inscriptos
    ADD CONSTRAINT nuevos_inscriptos_pkey PRIMARY KEY (id_institucion, anio);
 R   ALTER TABLE ONLY public.nuevos_inscriptos DROP CONSTRAINT nuevos_inscriptos_pkey;
       public            postgres    false    216    216            w           2606    16770    reinscriptos reinscriptos_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.reinscriptos
    ADD CONSTRAINT reinscriptos_pkey PRIMARY KEY (id_institucion, anio);
 H   ALTER TABLE ONLY public.reinscriptos DROP CONSTRAINT reinscriptos_pkey;
       public            postgres    false    217    217            |           2606    16783 '   egresados egresados_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.egresados
    ADD CONSTRAINT egresados_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituciones(id);
 Q   ALTER TABLE ONLY public.egresados DROP CONSTRAINT egresados_id_institucion_fkey;
       public          postgres    false    3187    218    215            z           2606    16759 7   nuevos_inscriptos nuevos_inscriptos_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.nuevos_inscriptos
    ADD CONSTRAINT nuevos_inscriptos_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituciones(id);
 a   ALTER TABLE ONLY public.nuevos_inscriptos DROP CONSTRAINT nuevos_inscriptos_id_institucion_fkey;
       public          postgres    false    3187    215    216            {           2606    16771 -   reinscriptos reinscriptos_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reinscriptos
    ADD CONSTRAINT reinscriptos_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituciones(id);
 W   ALTER TABLE ONLY public.reinscriptos DROP CONSTRAINT reinscriptos_id_institucion_fkey;
       public          postgres    false    215    217    3187               �  x�U�ۑc1D��`��SR����-��.��ġ��b˖����
���W`K��Y�� �)���ZSQ3�w�G�B�+�p;�r���a�{���F�gg	=m(UK9+��eZ�YМL<�`��HV�F�ud3<_��_�k8K"L�7Cfm�`����<�h�BL���a9�+�tgK���)�;��N,)cy�%�d�7��T�ބ��9>�E���� �VOw����F)�Z��t=G|{Le�`~�7��\�8:)S⭛�UDC�#q������Ѩ2�����K{:����#���!��{#����yī�6v0����7����?���6�0ԑ��%�d�����U�梓��j�9��Rͮq�:��/���n�X�N�j�#�aa�����H�'��? ��         �  x��W�r�0]_�B?P?�%�WHhH��t��
(cKYJ���.��*�n�c�2y8$e�x�s��=�/Z�KeV���K�xNsrJ3.-�T*�*�:!��f�Ǩ9�J�ʂk*h'�P�$�R����̇��,�>�Ɔ	Y�W~~�0���Te�^��Ä	�������x�1a��L1Q�� &k�I22�V��u@c�`^��k�1ps����`"K�6�Fu��bX��b%�K��fC�ԏ*�W9ޢ#���^��p��Q�k8D2#������ac=�#�J��,qЇc��.YRUr4�p}˛^O c%	/�N�*P�5-}a�����I�,�%���1{�4�%s�sq�Y���ͮ0n@��[ab��\���U�"Z���
8��K�Y^�<	0â�l	��%��N������
3���*�^x�0�w�s�F!��Qx%lY^n�{��/I�%p涽�J
���۠M���B/�d�%cYe��� 8V�㊻:x��!|�R.�fC܃szMY�3i;q �O���ʫw��p�VjGlq����m���8�%-\��	�a����	�L��b.}[��iÛ�(������p��4��v�߄:�x�1M�J�/]2���`�т^����3��W�M{{�IB�`���&_1{�\p�mB92l�#!�.�p���+�z+�.LfJg{)��8��P��O�N���2�{�� ��䤋��O�`����+�'��Jsm��dN�2pF8�c&r�������|ΐ���[��
}����0a�ʨF�FG�K+��Hq�6�~8��$�Uh��ߪ�����2�����px���:�mE���7�ӇK�{�67�b�0�|73Z�v�OC ��Ӷ�}�G�%�Vt?��N�?�t��         �  x�M�Ǳ0D�D1�Є+p�ux�EȞ�E��b!9���,�x�~���5I�O�X��ː���9:��@�j�a�����v-�z�<��ԟ@f�A�h^ �B¯k��q��'��7>$T���D��<V��c2C�`s
�$��1�)�j�>hG�`M}�X�hE�N��,-�@�bR^ᐢ�P��~��c��q
���Pt�&}�҅�S�[��7+҅V�@`Dt)`���pB�V�Gz�ڍ�WTY!ǖ��:�G-�sa�G�6y�n˖Z��L��:`�3ٗ8�_c��<��������UKr�;}]���\�]�+k#__tl1ȱe�nl�&=\��э�Ǜ?+G���}���΄%�y�6+�1�dWo ��)��
#��!��)�X�NKS���u�0�<�Ɣ�"��lE����ƙ����-/X6�C����|�Rz7M�{�X)|i���h� N|�`����a��(�R�5`џ_D�؋�q         �  x�M�ˑ@D�C0.�I8��?��)��*$���i�(+u97H?��Y�x��MDo��0#�D2�N0+ŤDs�i��Mzu��jWOd�O�����Nn'�	/��\"$���_|H��ڪ�{2��*s'���.�AnG�06��b9��$C��
$��q0�o$�k����קLI�W�P�B+1�
�&��R�֍�A��W=�tu�S���%�2O�Hj5EG����\i�D����]���d�w?@O� V���*��1t1�z�@�Dl0��ht��F���Ed��=S%���ǯ#g5π�d�͍���y��1�A.<^ �%N8��b7i@`	J�.�;�J\��c��<���ú��H� M�ξ��/�u:��U��j}�b5fE�b�5I^Ƒ��M��L8�C��q�(Vc��V�lv���-YŽ@p�?�Z�gʅm���\d4.l)�W{Jk<ZO��9<Yy��]��/,\֐2����������!�_��     