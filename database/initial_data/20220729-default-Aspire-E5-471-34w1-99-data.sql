--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)

-- Started on 2022-07-29 15:15:13 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = on;

--
-- TOC entry 3372 (class 0 OID 24625)
-- Dependencies: 219
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: default
--



--
-- TOC entry 3374 (class 0 OID 24634)
-- Dependencies: 221
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: default
--



--
-- TOC entry 3375 (class 0 OID 24644)
-- Dependencies: 222
-- Data for Name: course_student; Type: TABLE DATA; Schema: public; Owner: default
--



--
-- TOC entry 3368 (class 0 OID 24601)
-- Dependencies: 215
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: default
--



--
-- TOC entry 3363 (class 0 OID 24577)
-- Dependencies: 210
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: default
--

INSERT INTO public.migrations (id, migration, batch) VALUES (1, '2014_10_12_000000_create_users_table', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (2, '2014_10_12_100000_create_password_resets_table', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 4) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (5, '2022_07_29_170917_create_courses_table', 5) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (6, '2022_07_29_170940_create_students_table', 6) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (7, '2022_07_29_173329_course_student', 7) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (8, '2022_07_29_174213_add_foreign_keys_to_course_student_table', 8) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (9, '2022_07_29_184733_create_users_table', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (10, '2022_07_29_184733_create_course_student_table', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (11, '2022_07_29_184733_create_password_resets_table', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (12, '2022_07_29_184733_create_students_table', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (13, '2022_07_29_184733_create_failed_jobs_table', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (14, '2022_07_29_184733_create_personal_access_tokens_table', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (15, '2022_07_29_184733_create_courses_table', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.migrations (id, migration, batch) VALUES (16, '2022_07_29_184734_add_foreign_keys_to_course_student_table', 0) ON CONFLICT DO NOTHING;


--
-- TOC entry 3366 (class 0 OID 24594)
-- Dependencies: 213
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: default
--



--
-- TOC entry 3370 (class 0 OID 24613)
-- Dependencies: 217
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: default
--



--
-- TOC entry 3365 (class 0 OID 24584)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: default
--

INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (1, 'Robson Alonso Queirós', 'heloisa.domingues@example.com', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LYziMK8Y0J', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (2, 'Dr. Emilly Marques Jr.', 'hdavila@example.org', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WAOsDwcNyZ', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (3, 'Dr. Constância Quintana Sobrinho', 'dfidalgo@example.com', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TS3zpLjqyM', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (4, 'Srta. Emília Kamila Rocha', 'reinaldo.souza@example.com', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sDlz2zRF1V', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (5, 'Sr. Sergio Aranda Verdara Sobrinho', 'xzaragoca@example.com', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iiVft78iIa', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (6, 'Sabrina de Souza Neto', 'cintia94@example.net', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jTCnKm2UPz', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (7, 'Maria Assunção Rios Neto', 'emanuel42@example.com', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FZjBg1g4kt', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (8, 'Dr. Nathalia Marta Faro Sobrinho', 'mascarenhas.denis@example.net', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Gl0SHOYcy1', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (9, 'Laura Salas Sobrinho', 'agostinho89@example.com', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ov9G5HmWV5', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (10, 'Sr. Flávio Rivera Filho', 'franciele86@example.net', '2022-07-29 18:35:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KhfAgD4U6D', '2022-07-29 18:35:12', '2022-07-29 18:35:12') ON CONFLICT DO NOTHING;


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 218
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, false);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 214
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.migrations_id_seq', 16, true);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 216
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 220
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.students_id_seq', 1, false);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


-- Completed on 2022-07-29 15:15:13 -04

--
-- PostgreSQL database dump complete
--

