--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

-- Started on 2023-07-06 13:44:23 WIB

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "e-asset-training";
--
-- TOC entry 3414 (class 1262 OID 32835)
-- Name: e-asset-training; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "e-asset-training" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE "e-asset-training" OWNER TO postgres;

\connect -reuse-previous=on "dbname='e-asset-training'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 32837)
-- Name: asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset (
    kode_asset integer NOT NULL,
    nama_asset character varying(255) NOT NULL,
    kode_bidang character varying(3) NOT NULL,
    kode_kartu character varying(1) NOT NULL,
    ucr character varying(100),
    uch character varying(100),
    udcr date,
    udch date
);


ALTER TABLE public.asset OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 32836)
-- Name: asset_kode_asset_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.asset ALTER COLUMN kode_asset ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asset_kode_asset_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 32842)
-- Name: authorize; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorize (
    id_authorize integer NOT NULL,
    id_user integer NOT NULL,
    kode_group character varying(10),
    token character varying(255) NOT NULL,
    ucr character varying(100),
    uch character varying(100),
    udcr date,
    udch date
);


ALTER TABLE public.authorize OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 32840)
-- Name: authorize_id_authorize_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.authorize ALTER COLUMN id_authorize ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.authorize_id_authorize_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 32841)
-- Name: authorize_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.authorize ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.authorize_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 32846)
-- Name: ref_bentuk_pemanfaatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_bentuk_pemanfaatan (
    kode_bentuk_pemanfaatan integer NOT NULL,
    nama_bentuk_pemanfaatan character varying(255),
    ucr character varying(100),
    uch character varying(100),
    udcr date,
    udch date
);


ALTER TABLE public.ref_bentuk_pemanfaatan OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 32845)
-- Name: ref_bentuk_pemanfaatan_kode_bentuk_pemanfaatan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ref_bentuk_pemanfaatan ALTER COLUMN kode_bentuk_pemanfaatan ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ref_bentuk_pemanfaatan_kode_bentuk_pemanfaatan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 32850)
-- Name: ref_bidang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_bidang (
    kode_bidang integer NOT NULL,
    kode_golongan character varying(1) NOT NULL,
    jenis_bidang character varying(255),
    ucr character varying(100),
    uch character varying(100),
    udcr date,
    udch date
);


ALTER TABLE public.ref_bidang OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32849)
-- Name: ref_bidang_kode_bidang_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ref_bidang ALTER COLUMN kode_bidang ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ref_bidang_kode_bidang_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 32854)
-- Name: ref_daftar_barang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_daftar_barang (
    kode_barang integer NOT NULL,
    kode_pembukuan character varying(9),
    kode_asset character varying(10),
    kode_asset_nup integer,
    kode_ruang character varying(7),
    nup character varying(50),
    merk character varying(255),
    tanggal_perolehan date,
    nilai_item numeric(12,2),
    deskripsi character varying(255),
    kondisi character varying,
    qr_code character varying(255),
    optional_key character varying(255),
    alasan character varying(255),
    umur_ekonomis integer,
    ucr character varying(100),
    uch character varying(100),
    udcr date,
    udch date
);


ALTER TABLE public.ref_daftar_barang OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32853)
-- Name: ref_daftar_barang_kode_barang_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ref_daftar_barang ALTER COLUMN kode_barang ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ref_daftar_barang_kode_barang_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 32860)
-- Name: ref_dokumen_tanah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_dokumen_tanah (
    kode_dokumen integer NOT NULL,
    nama_dokumen character varying(3),
    ucr character varying(100),
    uch character varying(100),
    udcr date,
    udch date
);


ALTER TABLE public.ref_dokumen_tanah OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32859)
-- Name: ref_dokumen_tanah_kode_dokumen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ref_dokumen_tanah ALTER COLUMN kode_dokumen ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ref_dokumen_tanah_kode_dokumen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 32864)
-- Name: ref_golongan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_golongan (
    kode_golongan integer NOT NULL,
    nama_golongan character varying(255),
    ucr character varying(100),
    uch character varying(100),
    udcr date,
    udch date
);


ALTER TABLE public.ref_golongan OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32863)
-- Name: ref_golongan_kode_golongan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ref_golongan ALTER COLUMN kode_golongan ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ref_golongan_kode_golongan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 32868)
-- Name: ref_jenis_trn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_jenis_trn (
    no_sppa integer NOT NULL,
    kode_trn character varying(3),
    jenis_trn character varying(255),
    ucr character varying(100),
    uch character varying(100),
    udcr date,
    udch date
);


ALTER TABLE public.ref_jenis_trn OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 32867)
-- Name: ref_jenis_trn_no_sppa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ref_jenis_trn ALTER COLUMN no_sppa ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ref_jenis_trn_no_sppa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 32871)
-- Name: ref_kartu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_kartu (
    kode_kartu character varying(1),
    nama_kartu character varying(255),
    ucr character varying(100),
    uch character varying(100),
    udcr date,
    udch date
);


ALTER TABLE public.ref_kartu OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32874)
-- Name: ref_pembukuan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_pembukuan (
    kode_asset character varying(10) NOT NULL,
    no_sppa character varying(5) NOT NULL,
    kode_pembukuan character varying(9) NOT NULL,
    jumlah_barang integer NOT NULL,
    asal_perolehan character varying(255),
    no_bukti_perolehan character varying(255)
);


ALTER TABLE public.ref_pembukuan OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 32837)
-- Dependencies: 210
-- Data for Name: asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset (kode_asset, nama_asset, kode_bidang, kode_kartu, ucr, uch, udcr, udch) FROM stdin;
\.


--
-- TOC entry 3394 (class 0 OID 32842)
-- Dependencies: 213
-- Data for Name: authorize; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorize (id_authorize, id_user, kode_group, token, ucr, uch, udcr, udch) FROM stdin;
\.


--
-- TOC entry 3396 (class 0 OID 32846)
-- Dependencies: 215
-- Data for Name: ref_bentuk_pemanfaatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_bentuk_pemanfaatan (kode_bentuk_pemanfaatan, nama_bentuk_pemanfaatan, ucr, uch, udcr, udch) FROM stdin;
\.


--
-- TOC entry 3398 (class 0 OID 32850)
-- Dependencies: 217
-- Data for Name: ref_bidang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_bidang (kode_bidang, kode_golongan, jenis_bidang, ucr, uch, udcr, udch) FROM stdin;
\.


--
-- TOC entry 3400 (class 0 OID 32854)
-- Dependencies: 219
-- Data for Name: ref_daftar_barang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_daftar_barang (kode_barang, kode_pembukuan, kode_asset, kode_asset_nup, kode_ruang, nup, merk, tanggal_perolehan, nilai_item, deskripsi, kondisi, qr_code, optional_key, alasan, umur_ekonomis, ucr, uch, udcr, udch) FROM stdin;
\.


--
-- TOC entry 3402 (class 0 OID 32860)
-- Dependencies: 221
-- Data for Name: ref_dokumen_tanah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_dokumen_tanah (kode_dokumen, nama_dokumen, ucr, uch, udcr, udch) FROM stdin;
\.


--
-- TOC entry 3404 (class 0 OID 32864)
-- Dependencies: 223
-- Data for Name: ref_golongan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_golongan (kode_golongan, nama_golongan, ucr, uch, udcr, udch) FROM stdin;
\.


--
-- TOC entry 3406 (class 0 OID 32868)
-- Dependencies: 225
-- Data for Name: ref_jenis_trn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_jenis_trn (no_sppa, kode_trn, jenis_trn, ucr, uch, udcr, udch) FROM stdin;
\.


--
-- TOC entry 3407 (class 0 OID 32871)
-- Dependencies: 226
-- Data for Name: ref_kartu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_kartu (kode_kartu, nama_kartu, ucr, uch, udcr, udch) FROM stdin;
\.


--
-- TOC entry 3408 (class 0 OID 32874)
-- Dependencies: 227
-- Data for Name: ref_pembukuan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_pembukuan (kode_asset, no_sppa, kode_pembukuan, jumlah_barang, asal_perolehan, no_bukti_perolehan) FROM stdin;
\.


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 209
-- Name: asset_kode_asset_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_kode_asset_seq', 1, false);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 211
-- Name: authorize_id_authorize_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authorize_id_authorize_seq', 1, false);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 212
-- Name: authorize_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authorize_id_user_seq', 1, false);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 214
-- Name: ref_bentuk_pemanfaatan_kode_bentuk_pemanfaatan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_bentuk_pemanfaatan_kode_bentuk_pemanfaatan_seq', 1, false);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 216
-- Name: ref_bidang_kode_bidang_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_bidang_kode_bidang_seq', 1, false);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 218
-- Name: ref_daftar_barang_kode_barang_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_daftar_barang_kode_barang_seq', 1, false);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 220
-- Name: ref_dokumen_tanah_kode_dokumen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_dokumen_tanah_kode_dokumen_seq', 1, false);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 222
-- Name: ref_golongan_kode_golongan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_golongan_kode_golongan_seq', 1, false);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 224
-- Name: ref_jenis_trn_no_sppa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_jenis_trn_no_sppa_seq', 1, false);


-- Completed on 2023-07-06 13:44:23 WIB

--
-- PostgreSQL database dump complete
--

