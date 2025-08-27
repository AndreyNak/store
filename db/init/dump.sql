--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Ubuntu 14.18-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-1.pgdg22.04+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO andre;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO andre;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO andre;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO andre;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO andre;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO andre;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO andre;

--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.cart_items (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cart_items OWNER TO andre;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_items_id_seq OWNER TO andre;

--
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.carts OWNER TO andre;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO andre;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: chats; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.chats (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    status text,
    title text NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.chats OWNER TO andre;

--
-- Name: chats_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.chats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chats_id_seq OWNER TO andre;

--
-- Name: chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.chats_id_seq OWNED BY public.chats.id;


--
-- Name: comment_likes; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.comment_likes (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    comment_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.comment_likes OWNER TO andre;

--
-- Name: comment_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.comment_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_likes_id_seq OWNER TO andre;

--
-- Name: comment_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.comment_likes_id_seq OWNED BY public.comment_likes.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    text text NOT NULL,
    rating integer,
    parent_id integer,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO andre;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO andre;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: denied_permissions; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.denied_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.denied_permissions OWNER TO andre;

--
-- Name: denied_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.denied_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.denied_permissions_id_seq OWNER TO andre;

--
-- Name: denied_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.denied_permissions_id_seq OWNED BY public.denied_permissions.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.favorites OWNER TO andre;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorites_id_seq OWNER TO andre;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: jwt_denylist; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.jwt_denylist (
    id bigint NOT NULL,
    jti character varying NOT NULL,
    exp timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.jwt_denylist OWNER TO andre;

--
-- Name: jwt_denylist_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.jwt_denylist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jwt_denylist_id_seq OWNER TO andre;

--
-- Name: jwt_denylist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.jwt_denylist_id_seq OWNED BY public.jwt_denylist.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    chat_id bigint NOT NULL,
    user_id bigint NOT NULL,
    text text NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO andre;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO andre;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: mobility_string_translations; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.mobility_string_translations (
    id bigint NOT NULL,
    locale character varying NOT NULL,
    key character varying NOT NULL,
    value character varying,
    translatable_type character varying,
    translatable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.mobility_string_translations OWNER TO andre;

--
-- Name: mobility_string_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.mobility_string_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mobility_string_translations_id_seq OWNER TO andre;

--
-- Name: mobility_string_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.mobility_string_translations_id_seq OWNED BY public.mobility_string_translations.id;


--
-- Name: mobility_text_translations; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.mobility_text_translations (
    id bigint NOT NULL,
    locale character varying NOT NULL,
    key character varying NOT NULL,
    value text,
    translatable_type character varying,
    translatable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.mobility_text_translations OWNER TO andre;

--
-- Name: mobility_text_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.mobility_text_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mobility_text_translations_id_seq OWNER TO andre;

--
-- Name: mobility_text_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.mobility_text_translations_id_seq OWNED BY public.mobility_text_translations.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifiable_type character varying NOT NULL,
    notifiable_id bigint NOT NULL,
    message character varying NOT NULL,
    read boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO andre;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO andre;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    price numeric
);


ALTER TABLE public.order_items OWNER TO andre;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO andre;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    status character varying,
    received_at timestamp(6) without time zone,
    rating integer
);


ALTER TABLE public.orders OWNER TO andre;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO andre;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO andre;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO andre;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: permissions_roles; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.permissions_roles (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.permissions_roles OWNER TO andre;

--
-- Name: product_translations; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.product_translations (
    id bigint NOT NULL,
    tname character varying,
    locale character varying NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.product_translations OWNER TO andre;

--
-- Name: product_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.product_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_translations_id_seq OWNER TO andre;

--
-- Name: product_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.product_translations_id_seq OWNED BY public.product_translations.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    description text,
    price numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    type_product_id bigint,
    discount_price numeric,
    quantity integer DEFAULT 0 NOT NULL,
    discount_start_date timestamp(6) without time zone,
    discount_end_date timestamp(6) without time zone
);


ALTER TABLE public.products OWNER TO andre;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO andre;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_type_products; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.products_type_products (
    product_id bigint NOT NULL,
    type_product_id bigint NOT NULL
);


ALTER TABLE public.products_type_products OWNER TO andre;

--
-- Name: restrictions; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.restrictions (
    id bigint NOT NULL,
    offender_id bigint NOT NULL,
    officer_id bigint NOT NULL,
    canceller_id bigint,
    permission_id bigint NOT NULL,
    reason text,
    expired_at timestamp(6) without time zone NOT NULL,
    cancelled_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.restrictions OWNER TO andre;

--
-- Name: restrictions_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.restrictions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restrictions_id_seq OWNER TO andre;

--
-- Name: restrictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.restrictions_id_seq OWNED BY public.restrictions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO andre;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO andre;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO andre;

--
-- Name: type_product_translations; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.type_product_translations (
    id bigint NOT NULL,
    tname character varying,
    locale character varying NOT NULL,
    type_product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.type_product_translations OWNER TO andre;

--
-- Name: type_product_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.type_product_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_product_translations_id_seq OWNER TO andre;

--
-- Name: type_product_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.type_product_translations_id_seq OWNED BY public.type_product_translations.id;


--
-- Name: type_products; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.type_products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.type_products OWNER TO andre;

--
-- Name: type_products_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.type_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_products_id_seq OWNER TO andre;

--
-- Name: type_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.type_products_id_seq OWNED BY public.type_products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: andre
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    login character varying,
    name character varying,
    surname character varying,
    date_of_birth date,
    address character varying,
    role_id bigint,
    locale character varying
);


ALTER TABLE public.users OWNER TO andre;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: andre
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO andre;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andre
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: chats id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.chats ALTER COLUMN id SET DEFAULT nextval('public.chats_id_seq'::regclass);


--
-- Name: comment_likes id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.comment_likes ALTER COLUMN id SET DEFAULT nextval('public.comment_likes_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: denied_permissions id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.denied_permissions ALTER COLUMN id SET DEFAULT nextval('public.denied_permissions_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: jwt_denylist id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.jwt_denylist ALTER COLUMN id SET DEFAULT nextval('public.jwt_denylist_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: mobility_string_translations id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.mobility_string_translations ALTER COLUMN id SET DEFAULT nextval('public.mobility_string_translations_id_seq'::regclass);


--
-- Name: mobility_text_translations id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.mobility_text_translations ALTER COLUMN id SET DEFAULT nextval('public.mobility_text_translations_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: product_translations id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.product_translations ALTER COLUMN id SET DEFAULT nextval('public.product_translations_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: restrictions id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.restrictions ALTER COLUMN id SET DEFAULT nextval('public.restrictions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: type_product_translations id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.type_product_translations ALTER COLUMN id SET DEFAULT nextval('public.type_product_translations_id_seq'::regclass);


--
-- Name: type_products id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.type_products ALTER COLUMN id SET DEFAULT nextval('public.type_products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
6	image	Product	2	6	2024-04-19 13:08:01.304737
8	image	Product	3	8	2024-04-19 14:36:26.400729
9	image	Product	4	9	2024-04-20 18:48:13.612409
10	image	Product	5	10	2024-04-20 18:48:54.193389
11	image	Product	6	11	2024-04-20 18:49:11.912721
12	image	Product	7	12	2024-04-20 18:49:33.447186
13	image	Product	8	13	2024-04-20 18:51:17.083874
14	image	Product	9	14	2024-04-20 18:51:42.06182
15	image	Product	10	15	2024-04-20 18:51:53.148691
16	image	Product	11	16	2024-04-20 18:52:10.487643
17	image	Product	12	17	2024-04-20 18:52:31.87939
18	image	Product	13	18	2024-04-20 18:52:43.656308
19	image	Product	14	19	2024-04-20 18:53:06.623475
20	image	Product	15	20	2024-04-20 18:53:23.142071
21	image	Product	16	21	2024-04-20 18:53:46.025712
23	image	Product	18	23	2024-04-20 19:09:37.706849
24	image	Product	19	24	2024-04-20 19:51:32.982502
25	image	ActiveStorage::VariantRecord	3	25	2024-04-20 20:27:52.903064
26	image	ActiveStorage::VariantRecord	4	27	2024-04-20 20:27:52.912651
27	image	ActiveStorage::VariantRecord	5	26	2024-04-20 20:27:52.925959
28	image	ActiveStorage::VariantRecord	2	28	2024-04-20 20:27:52.928241
29	image	ActiveStorage::VariantRecord	1	29	2024-04-20 20:27:52.930403
30	image	ActiveStorage::VariantRecord	6	30	2024-04-20 20:27:53.161169
31	image	ActiveStorage::VariantRecord	7	31	2024-04-20 20:27:53.294067
32	image	ActiveStorage::VariantRecord	8	32	2024-04-20 20:27:53.385559
33	image	ActiveStorage::VariantRecord	9	33	2024-04-20 20:27:53.395665
34	image	ActiveStorage::VariantRecord	10	34	2024-04-20 20:27:53.398288
35	image	ActiveStorage::VariantRecord	11	35	2024-04-20 20:27:53.524921
36	image	ActiveStorage::VariantRecord	12	36	2024-04-20 20:27:53.53534
37	image	ActiveStorage::VariantRecord	13	37	2024-04-20 20:27:53.781738
38	image	ActiveStorage::VariantRecord	14	38	2024-04-20 20:27:53.832639
39	image	ActiveStorage::VariantRecord	15	39	2024-04-20 20:27:53.95416
40	image	ActiveStorage::VariantRecord	16	40	2024-04-20 20:27:54.102044
41	image	ActiveStorage::VariantRecord	17	41	2024-04-20 20:27:54.431581
42	image	ActiveStorage::VariantRecord	18	43	2024-04-20 20:29:07.944903
43	image	ActiveStorage::VariantRecord	20	44	2024-04-20 20:29:07.959614
44	image	ActiveStorage::VariantRecord	19	42	2024-04-20 20:29:07.956219
45	image	ActiveStorage::VariantRecord	21	46	2024-04-20 20:29:07.967977
46	image	ActiveStorage::VariantRecord	22	45	2024-04-20 20:29:07.983507
47	image	ActiveStorage::VariantRecord	23	47	2024-04-20 20:29:08.48153
48	image	ActiveStorage::VariantRecord	25	48	2024-04-20 20:29:08.755571
49	image	ActiveStorage::VariantRecord	24	49	2024-04-20 20:29:08.797228
50	image	ActiveStorage::VariantRecord	27	50	2024-04-20 20:29:08.899257
51	image	ActiveStorage::VariantRecord	26	51	2024-04-20 20:29:08.912438
52	image	ActiveStorage::VariantRecord	28	52	2024-04-20 20:29:09.108422
53	image	ActiveStorage::VariantRecord	29	53	2024-04-20 20:29:09.459868
54	image	ActiveStorage::VariantRecord	30	54	2024-04-20 20:29:09.58278
55	image	ActiveStorage::VariantRecord	31	55	2024-04-20 20:29:09.645331
56	image	ActiveStorage::VariantRecord	32	56	2024-04-20 20:29:09.71253
57	image	ActiveStorage::VariantRecord	33	57	2024-04-20 20:29:09.719725
58	image	ActiveStorage::VariantRecord	34	58	2024-04-20 20:29:10.008885
59	image	Product	20	59	2024-04-21 17:01:52.18724
60	image	Product	21	60	2024-04-21 17:08:06.226003
61	image	ActiveStorage::VariantRecord	35	61	2024-04-21 18:25:59.674405
62	image	ActiveStorage::VariantRecord	36	62	2024-04-21 18:26:01.627696
63	image	ActiveStorage::VariantRecord	38	63	2024-04-25 13:38:03.370419
64	image	ActiveStorage::VariantRecord	39	64	2024-04-25 13:38:03.375891
65	image	ActiveStorage::VariantRecord	40	65	2024-04-25 13:38:03.389536
66	image	ActiveStorage::VariantRecord	37	66	2024-04-25 13:38:03.399728
67	image	ActiveStorage::VariantRecord	41	67	2024-04-25 13:38:03.410827
68	image	ActiveStorage::VariantRecord	42	68	2024-04-25 13:38:03.861095
69	image	ActiveStorage::VariantRecord	43	69	2024-04-25 13:38:04.025302
70	image	ActiveStorage::VariantRecord	44	70	2024-04-25 13:38:04.037079
71	image	ActiveStorage::VariantRecord	45	71	2024-04-25 13:38:04.103692
72	image	ActiveStorage::VariantRecord	46	72	2024-04-25 13:38:04.17008
73	image	ActiveStorage::VariantRecord	47	73	2024-04-25 13:38:04.763063
74	image	ActiveStorage::VariantRecord	48	74	2024-04-25 13:38:04.818087
75	image	ActiveStorage::VariantRecord	49	76	2024-04-25 13:38:04.967097
76	image	ActiveStorage::VariantRecord	50	75	2024-04-25 13:38:04.97248
77	image	ActiveStorage::VariantRecord	51	77	2024-04-25 13:38:05.046121
78	image	ActiveStorage::VariantRecord	52	78	2024-04-25 13:38:05.377868
79	image	ActiveStorage::VariantRecord	53	79	2024-04-25 13:38:05.43266
80	image	ActiveStorage::VariantRecord	54	80	2024-04-25 13:38:05.54911
81	image	ActiveStorage::VariantRecord	55	81	2024-04-25 13:38:05.79879
82	image	ActiveStorage::VariantRecord	56	82	2024-04-25 13:40:24.302505
83	image	ActiveStorage::VariantRecord	58	83	2024-04-25 13:40:25.307784
84	image	ActiveStorage::VariantRecord	57	84	2024-04-25 13:40:25.344576
85	image	ActiveStorage::VariantRecord	59	85	2024-04-25 13:40:25.373021
86	image	ActiveStorage::VariantRecord	60	86	2024-04-25 13:40:25.407568
87	image	ActiveStorage::VariantRecord	61	87	2024-04-25 13:40:25.487955
88	image	ActiveStorage::VariantRecord	62	88	2024-04-25 13:40:25.83098
89	image	ActiveStorage::VariantRecord	63	89	2024-04-25 13:40:25.865232
90	image	ActiveStorage::VariantRecord	64	90	2024-04-25 13:40:25.923446
91	image	ActiveStorage::VariantRecord	65	91	2024-04-25 13:40:25.934463
92	image	ActiveStorage::VariantRecord	66	92	2024-04-25 13:40:25.953493
93	image	ActiveStorage::VariantRecord	67	93	2024-04-25 13:40:26.225937
99	image	ActiveStorage::VariantRecord	73	99	2024-04-25 13:40:26.697386
232	image	ActiveStorage::VariantRecord	151	232	2024-05-24 13:10:54.843569
243	image	ActiveStorage::VariantRecord	161	243	2024-05-24 13:10:56.049678
246	image	ActiveStorage::VariantRecord	164	246	2024-05-24 13:10:56.514279
251	image	ActiveStorage::VariantRecord	169	251	2024-05-27 13:46:46.75985
252	image	ActiveStorage::VariantRecord	170	252	2024-05-27 13:49:20.981925
258	image	ActiveStorage::VariantRecord	176	258	2024-05-27 13:53:02.184134
261	image	Product	51	261	2024-06-08 20:40:15.610801
262	image	ActiveStorage::VariantRecord	178	262	2024-06-08 20:40:15.89
94	image	ActiveStorage::VariantRecord	68	94	2024-04-25 13:40:26.299783
97	image	ActiveStorage::VariantRecord	71	97	2024-04-25 13:40:26.520845
233	image	ActiveStorage::VariantRecord	150	233	2024-05-24 13:10:54.846686
235	image	ActiveStorage::VariantRecord	153	235	2024-05-24 13:10:55.051438
241	image	ActiveStorage::VariantRecord	158	241	2024-05-24 13:10:55.794755
245	image	ActiveStorage::VariantRecord	163	245	2024-05-24 13:10:56.337419
248	image	ActiveStorage::VariantRecord	167	248	2024-05-24 13:10:56.73895
253	image	ActiveStorage::VariantRecord	171	253	2024-05-27 13:50:41.875014
254	image	ActiveStorage::VariantRecord	172	254	2024-05-27 13:52:39.399428
255	image	ActiveStorage::VariantRecord	173	255	2024-05-27 13:52:42.769904
256	image	ActiveStorage::VariantRecord	174	256	2024-05-27 13:52:47.310234
257	image	ActiveStorage::VariantRecord	175	257	2024-05-27 13:52:50.503882
263	image	ActiveStorage::VariantRecord	179	263	2024-06-08 20:50:39.806505
95	image	ActiveStorage::VariantRecord	69	95	2024-04-25 13:40:26.311319
234	image	ActiveStorage::VariantRecord	152	234	2024-05-24 13:10:55.048044
242	image	ActiveStorage::VariantRecord	160	242	2024-05-24 13:10:56.017392
249	image	ActiveStorage::VariantRecord	166	249	2024-05-24 13:10:56.769988
264	image	Product	52	264	2024-06-10 12:21:53.929583
265	image	ActiveStorage::VariantRecord	180	265	2024-06-10 12:21:54.202727
266	image	Product	53	266	2024-06-10 12:24:00.657043
267	image	ActiveStorage::VariantRecord	181	267	2024-06-10 12:24:01.006987
96	image	ActiveStorage::VariantRecord	70	96	2024-04-25 13:40:26.315714
236	image	ActiveStorage::VariantRecord	154	236	2024-05-24 13:10:55.066411
237	image	ActiveStorage::VariantRecord	155	237	2024-05-24 13:10:55.234863
238	image	ActiveStorage::VariantRecord	156	238	2024-05-24 13:10:55.347098
239	image	ActiveStorage::VariantRecord	157	239	2024-05-24 13:10:55.574218
240	image	ActiveStorage::VariantRecord	159	240	2024-05-24 13:10:55.78678
244	image	ActiveStorage::VariantRecord	162	244	2024-05-24 13:10:56.09819
247	image	ActiveStorage::VariantRecord	165	247	2024-05-24 13:10:56.624082
268	image	ActiveStorage::VariantRecord	182	268	2024-06-10 12:24:34.821796
269	image	ActiveStorage::VariantRecord	183	269	2024-06-10 12:24:35.995647
98	image	ActiveStorage::VariantRecord	72	98	2024-04-25 13:40:26.649864
100	image	ActiveStorage::VariantRecord	74	100	2024-04-25 13:40:27.045026
101	image	ActiveStorage::VariantRecord	76	101	2024-04-27 19:08:58.392696
102	image	ActiveStorage::VariantRecord	78	102	2024-04-27 19:08:58.414294
103	image	ActiveStorage::VariantRecord	75	103	2024-04-27 19:08:58.423493
104	image	ActiveStorage::VariantRecord	77	104	2024-04-27 19:08:58.427939
105	image	ActiveStorage::VariantRecord	79	105	2024-04-27 19:08:58.439687
106	image	ActiveStorage::VariantRecord	80	106	2024-04-27 19:08:58.783561
107	image	ActiveStorage::VariantRecord	81	107	2024-04-27 19:08:58.879645
108	image	ActiveStorage::VariantRecord	82	108	2024-04-27 19:08:58.910281
109	image	ActiveStorage::VariantRecord	83	109	2024-04-27 19:08:59.041907
110	image	ActiveStorage::VariantRecord	84	110	2024-04-27 19:08:59.08871
111	image	ActiveStorage::VariantRecord	85	111	2024-04-27 19:08:59.635747
112	image	ActiveStorage::VariantRecord	86	112	2024-04-27 19:08:59.924688
113	image	ActiveStorage::VariantRecord	88	113	2024-04-27 19:08:59.951493
114	image	ActiveStorage::VariantRecord	87	114	2024-04-27 19:08:59.992463
115	image	ActiveStorage::VariantRecord	89	115	2024-04-27 19:09:00.042599
116	image	ActiveStorage::VariantRecord	90	116	2024-04-27 19:09:00.258278
117	image	ActiveStorage::VariantRecord	91	117	2024-04-27 19:09:00.449018
118	image	ActiveStorage::VariantRecord	92	118	2024-04-27 19:09:00.619207
119	image	ActiveStorage::VariantRecord	93	119	2024-05-11 14:06:43.185978
250	image	ActiveStorage::VariantRecord	168	250	2024-05-24 13:10:57.018506
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
19	l9ndjxszwz0e7kh0wksrqxtivn19	ketchup.png	image/png	{"identified":true,"width":1280,"height":1280,"analyzed":true}	local	487516	WkZMIzs3wW1Hq0Zkra9iDg==	2024-04-20 18:53:06.620881
20	bxpt60bk5pxjwugmtapwx0a8xird	sprite.jpg	image/jpeg	{"identified":true,"width":1025,"height":1365,"analyzed":true}	local	42545	DC/IIJHKGqr3xJNN3P6MgQ==	2024-04-20 18:53:23.140086
21	xrc988pacwewyl27mvrwbf9ogx7g	bread.jpg	image/jpeg	{"identified":true,"width":478,"height":477,"analyzed":true}	local	56325	teRYMOqFyzxxWsSyV7ZZxQ==	2024-04-20 18:53:46.021368
6	2fq2kswjhcc0zbmxz02y15v5a6sl	dd874232e9ef11eca80654a05054786b_9cafb2b8cc2811ed8ce054a05054786b.jpg	image/jpeg	{"identified":true,"width":1500,"height":1500,"analyzed":true}	local	311265	3ONcA3+56VRIa7FBlcSzMQ==	2024-04-19 13:08:01.3029
8	l8xligp7ax6di0rq0glm2dixo5nz	1_krasnaya_ikra_gorbushi_500.jpg	image/jpeg	{"identified":true,"width":1200,"height":1200,"analyzed":true}	local	136451	FzHJwy2X1I/El99fPM9D+g==	2024-04-19 14:36:26.398299
9	tdbg2n6gp8mfqg0iyjc7m5bzwy2q	babana.jpg	image/jpeg	{"identified":true,"width":800,"height":600,"analyzed":true}	local	33382	X4IjEF6o+6jB27JnhwyaIw==	2024-04-20 18:48:13.608527
10	myycdpxi1brpa06emdewluvgudyd	tomat.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	92424	S83qwF0lyfWCgUd5/253/w==	2024-04-20 18:48:54.190852
11	5mkh1r8g0h729lm1vtyqmeh1hczh	meat.jpg	image/jpeg	{"identified":true,"width":1920,"height":1080,"analyzed":true}	local	290633	+CgjCZFjeMPtQct2Vwz7mQ==	2024-04-20 18:49:11.896337
12	rsiwayb4v38pyya3uf2bfkp1oyuo	sausage.jpg	image/jpeg	{"identified":true,"width":612,"height":469,"analyzed":true}	local	53864	aXfhMnXYzM43fUGmINnJFw==	2024-04-20 18:49:33.445131
13	y9h9v2zi7tylrc0tythcnkdu75wh	cucumber.jpeg	image/jpeg	{"identified":true,"width":272,"height":185,"analyzed":true}	local	4308	BlH5m07MaBrm9hgj7atS2g==	2024-04-20 18:51:17.081564
14	2t9p6t2tyc69rnr9n3ft88svyj1z	chips.jpg	image/jpeg	{"identified":true,"width":2560,"height":2560,"analyzed":true}	local	404339	Sg58J7sq5+KO2XeZZtdqfQ==	2024-04-20 18:51:42.059458
15	c87fws6xfiufavh1cnj7y4rto77k	eggs.jpeg	image/jpeg	{"identified":true,"width":1200,"height":798,"analyzed":true}	local	47157	Vx5wfCRA7jpmO0yGQwTzag==	2024-04-20 18:51:53.146549
16	9qwubknbs3tt58eyoypwqmoei97t	milk.jpeg	image/jpeg	{"identified":true,"width":488,"height":488,"analyzed":true}	local	17227	WIJtLDFAU6FvzqjLp56L5g==	2024-04-20 18:52:10.485647
17	dxum58ke00cc4gephdki9a5vpnry	orange.jpg	image/jpeg	{"identified":true,"width":612,"height":563,"analyzed":true}	local	41817	/XgVOF52DqTbKb8V/e/kPw==	2024-04-20 18:52:31.877477
18	2fxawecqchfr4hwq53vrn6jc8bnw	cheese.jpg	image/jpeg	{"identified":true,"width":735,"height":489,"analyzed":true}	local	22490	JxvfxUj2Gw2uqIO3SsjATw==	2024-04-20 18:52:43.654357
23	tytls3ba5mrclms2ldruwpa1sghh	cola.jpg	image/jpeg	{"identified":true,"width":1200,"height":1200,"analyzed":true}	local	51781	Q6uJ+WZbBsg8OjynGqjncA==	2024-04-20 19:09:37.703915
24	r8u8xla82mbl94fphxvrbm4t00an	apple.jpg	image/jpeg	{"identified":true,"width":580,"height":450,"analyzed":true}	local	30518	Hpp7C7g9i8mMm6VofyAo/w==	2024-04-20 19:51:32.980507
28	742z7ja24btw70ny51teuxcgjg6g	apple.jpg	image/jpeg	{"identified":true,"width":309,"height":240,"analyzed":true}	local	11229	tRnVR6Tv8ibbBIVo1BO6WA==	2024-04-20 20:27:52.915807
26	vp20cvv60eh1b5rkchbh2sfnmk2d	babana.jpg	image/jpeg	{"identified":true,"width":316,"height":237,"analyzed":true}	local	8184	p2NHXthz6BHgOP3ms3VckA==	2024-04-20 20:27:52.906229
27	izb5ova0dnwnhjlch8vedo1tit8u	cola.jpg	image/jpeg	{"identified":true,"width":240,"height":240,"analyzed":true}	local	5424	FQhiDtHBKWIGFZrqvBggMQ==	2024-04-20 20:27:52.908792
25	8sx2qd0va4o1og1ud1hzuaew1loq	dd874232e9ef11eca80654a05054786b_9cafb2b8cc2811ed8ce054a05054786b.jpg	image/jpeg	{"identified":true,"width":240,"height":240,"analyzed":true}	local	8659	4xGo+hpr0wrwDQf4y7c3YA==	2024-04-20 20:27:52.889333
29	9lh82vte0v76z2efrmid81d8jsw3	tomat.jpg	image/jpeg	{"identified":true,"width":316,"height":211,"analyzed":true}	local	7991	e0mK8vQLs3QlENj4kiyZxA==	2024-04-20 20:27:52.92126
30	70ajcpm4wh1o5edmb2yxf05zzhbu	eggs.jpeg	image/jpeg	{"identified":true,"width":316,"height":210,"analyzed":true}	local	5285	o+PuzQ9SKD+P7q2f4jAVEg==	2024-04-20 20:27:53.156072
31	tmavkqha1czpceympq2xtbm17ph8	sausage.jpg	image/jpeg	{"identified":true,"width":313,"height":240,"analyzed":true}	local	17948	cshr1eaC0+iKnVR+YRl+ig==	2024-04-20 20:27:53.259607
34	6b8i9haz15pe0a32ja9j6rbzrred	milk.jpeg	image/jpeg	{"identified":true,"width":240,"height":240,"analyzed":true}	local	4515	rDkAUJs9+zPgTUwslc0pGA==	2024-04-20 20:27:53.39016
32	jxqmdoz8ph8qyhpszcab3ygrtpgs	cucumber.jpeg	image/jpeg	{"identified":true,"width":272,"height":185,"analyzed":true}	local	5788	URP5GUni5cyQyfiDmmnz1Q==	2024-04-20 20:27:53.373884
33	ar0ifpr2mjg8706rhyneqbpzavzr	chips.jpg	image/jpeg	{"identified":true,"width":240,"height":240,"analyzed":true}	local	10620	ohWaJFoGLbuH6Idr0CI9IA==	2024-04-20 20:27:53.387879
36	0sd0cmy7nb7qnttqim5g8q11rq5u	cheese.jpg	image/jpeg	{"identified":true,"width":316,"height":210,"analyzed":true}	local	6925	iqXHuHy+aehd47XPXfR+gA==	2024-04-20 20:27:53.529252
35	6iosw9muadfntyarazy3vsofgy6k	meat.jpg	image/jpeg	{"identified":true,"width":316,"height":178,"analyzed":true}	local	10372	qrWnpJ8i1yCo1zLaLIptlw==	2024-04-20 20:27:53.515934
37	lacf4ro551s1kef6jemdo6tj948c	orange.jpg	image/jpeg	{"identified":true,"width":261,"height":240,"analyzed":true}	local	9603	dXW8PSJYQFjHy72PwyybHw==	2024-04-20 20:27:53.766741
38	3riuf2mjzlcqg8fboz63xj3rga0q	sprite.jpg	image/jpeg	{"identified":true,"width":180,"height":240,"analyzed":true}	local	4445	cT1cGazWym44WX4sUNRl8w==	2024-04-20 20:27:53.822155
39	p89uchg9q0rvedkvh8g3rpqnup2k	ketchup.png	image/png	{"identified":true,"width":240,"height":240,"analyzed":true}	local	32105	WiCfl2sBJZ6HmfQGAgICNA==	2024-04-20 20:27:53.926298
40	p1lvo8zl51jt1w7efxn3a8vf8sl8	bread.jpg	image/jpeg	{"identified":true,"width":241,"height":240,"analyzed":true}	local	7537	IeEhyKiWvTWk8BEu2a/51Q==	2024-04-20 20:27:54.09826
41	wmjkmywdyyqjvg3qsm74otva1xfn	1_krasnaya_ikra_gorbushi_500.jpg	image/jpeg	{"identified":true,"width":240,"height":240,"analyzed":true}	local	11650	e4PHrbl+xdyvyPKk7QF1/A==	2024-04-20 20:27:54.42894
42	3izeodllxyb57qkti0gbfk7mpbc7	apple.jpg	image/jpeg	{"identified":true,"width":580,"height":450,"analyzed":true}	local	30655	Y2opUqM+xs1At2BsLPRJ6A==	2024-04-20 20:29:07.919625
44	chox3qxdgpia6d8u815ptf39pq35	cola.jpg	image/jpeg	{"identified":true,"width":1000,"height":1000,"analyzed":true}	local	45474	rn3uHGyh+Wr+whRarUAeUA==	2024-04-20 20:29:07.939615
49	peivn589ih2tpsutkc43ovpkbqmq	meat.jpg	image/jpeg	{"identified":true,"width":1000,"height":563,"analyzed":true}	local	82322	qQkMp2jUhtjqTXyNQVN1sA==	2024-04-20 20:29:08.766254
46	3pxeid70pfp2q7jsj8bejagpvk50	dd874232e9ef11eca80654a05054786b_9cafb2b8cc2811ed8ce054a05054786b.jpg	image/jpeg	{"identified":true,"width":1000,"height":1000,"analyzed":true}	local	53893	1zIgfyGFxMzd0NysNWbMSg==	2024-04-20 20:29:07.952188
50	ijydyl7sdg7gdgrmlg6kkmensxa8	eggs.jpeg	image/jpeg	{"identified":true,"width":1000,"height":665,"analyzed":true}	local	34509	kR1JyzCK6cnECFYEhLhumw==	2024-04-20 20:29:08.885229
53	jznkj8185dolb3z0n5g2l72g044o	cheese.jpg	image/jpeg	{"identified":true,"width":735,"height":489,"analyzed":true}	local	22823	SYQPgPs4n8X7nOlbfPErZA==	2024-04-20 20:29:09.43862
263	hf53r13y0c073egixwlb590d4k6p	aaaa.jpg	image/jpeg	{"identified":true,"width":240,"height":240,"analyzed":true}	local	8677	qGxQhk254CCsvXKueH6ANw==	2024-06-08 20:50:39.801849
250	giqz2qltmk5ycmm638w4lb1nmtge	dd874232e9ef11eca80654a05054786b_9cafb2b8cc2811ed8ce054a05054786b.jpg	image/jpeg	{"identified":true,"width":120,"height":120,"analyzed":true}	local	5622	jjRbakngQtzZfQFdIMBmRg==	2024-05-24 13:10:57.011546
43	x9u477f9cvvlgd97n7dzkixa7wu1	babana.jpg	image/jpeg	{"identified":true,"width":800,"height":600,"analyzed":true}	local	31990	O8fdfw5kBMJ2NtuFzY6bXA==	2024-04-20 20:29:07.935299
48	1sla32zhqrwfbo351sdt1hqk2i5k	chips.jpg	image/jpeg	{"identified":true,"width":1000,"height":1000,"analyzed":true}	local	94564	f9zRbd2oSs9yjQgdxnlzhw==	2024-04-20 20:29:08.711086
56	7hzzqykza3f8ejepn5nub57ixd35	sprite.jpg	image/jpeg	{"identified":true,"width":751,"height":1000,"analyzed":true}	local	34949	UenfF6mu43DTvtr1PBuKmQ==	2024-04-20 20:29:09.673113
57	w4z00omd0lz03okv9i6gxiui3y2m	bread.jpg	image/jpeg	{"identified":true,"width":478,"height":477,"analyzed":true}	local	21521	2TiyMIvlkbBtuxXtoIltgg==	2024-04-20 20:29:09.700956
58	kb4nf9wr47me72r6e2q4aw6og3kv	tomat.jpg	image/jpeg	{"identified":true,"width":1000,"height":667,"analyzed":true}	local	50133	rUHtVKtYkoHcQFnSkfp43w==	2024-04-20 20:29:10.001419
265	n05ya4zfsg9nvephg4zgd2qzz5sz	strawberry.jpg	image/jpeg	{"identified":true,"width":120,"height":120,"analyzed":true}	local	3698	OtgFXzsUiF1LBXW+gQ2MPw==	2024-06-10 12:21:54.199405
266	t3a8t9o2sxbtzgeqrey9ses0bfq6	42221.png	image/png	{"identified":true,"width":740,"height":493,"analyzed":true}	local	228119	XvM3u0fzh+DLNooqCvR30w==	2024-06-10 12:24:00.652563
267	eu2aw8exgpoquhxbc34ovemmax4j	42221.png	image/png	{"identified":true,"width":160,"height":107,"analyzed":true}	local	15996	7unQElOKQaM+rcrBeLCZpQ==	2024-06-10 12:24:00.99636
264	r0nm856teyuin5ipkgmxoqeuuvr4	strawberry.jpg	image/jpeg	{"identified":true,"width":1200,"height":1200,"analyzed":true}	local	136389	023pkvY8zFCUaQJzdbsiTg==	2024-06-10 12:21:53.926092
45	z01b608xjv7f97oah07isbkvdieh	1_krasnaya_ikra_gorbushi_500.jpg	image/jpeg	{"identified":true,"width":1000,"height":1000,"analyzed":true}	local	111548	khg3alk3XD3w8BUDXyMTDA==	2024-04-20 20:29:07.949288
51	hvivifd94d7vkrkoinu0xmytrxvv	sausage.jpg	image/jpeg	{"identified":true,"width":612,"height":469,"analyzed":true}	local	46893	ElrCoZl/DYTez2eNiJx8Ww==	2024-04-20 20:29:08.895433
54	daie4b8twx2uq4cksud373e6m067	orange.jpg	image/jpeg	{"identified":true,"width":612,"height":563,"analyzed":true}	local	33308	KQjU5/jLsqo3P5d6NcjJMA==	2024-04-20 20:29:09.51007
268	mzwoumt3ucbv99z87pnaz2l8cxez	strawberry.jpg	image/jpeg	{"identified":true,"width":240,"height":240,"analyzed":true}	local	10666	ya3ZK2U167fWdaQCyQdJnQ==	2024-06-10 12:24:34.806633
269	y9wmc6bz4q9ndwdpg2pw3mo6mai0	42221.png	image/png	{"identified":true,"width":316,"height":211,"analyzed":true}	local	53648	bdiPgreY9sY760veNbrUVg==	2024-06-10 12:24:35.985539
251	e8gj5yqoc04sd93bun8kltwfso5j	sprite.jpg	image/jpeg	{"identified":true,"width":300,"height":400,"analyzed":true}	local	9236	fEKI+iaozWSvWk1feobbNw==	2024-05-27 13:46:46.753808
252	rlgk3fw22egf2v6oh1l8ig20m3qs	milk.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	9208	rEZ6iuNkY28MuGbMwt5ATw==	2024-05-27 13:49:20.943511
258	fw42008t2scslzb1sf8ne10ctffg	chicken.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	17548	XzscZxsKcQ7ytrCqQmsyTg==	2024-05-27 13:53:02.180923
47	zmoz54gp95as3q5vvybo9ogy30cn	cucumber.jpeg	image/jpeg	{"identified":true,"width":272,"height":185,"analyzed":true}	local	5788	URP5GUni5cyQyfiDmmnz1Q==	2024-04-20 20:29:08.470695
52	vx0pmisp0euhrqjt9hca2x9m9f57	milk.jpeg	image/jpeg	{"identified":true,"width":488,"height":488,"analyzed":true}	local	13711	HCE17ha2jT+Du6R+EpluXg==	2024-04-20 20:29:09.073478
55	xnbx0fswp6rh88qqejprfj2h19hh	ketchup.png	image/png	{"identified":true,"width":1000,"height":1000,"analyzed":true}	local	360593	O1d2R+hV6artdAdtd9yUNA==	2024-04-20 20:29:09.613618
59	eopymf83p7z3jv0ocwenhyl3afpq	chicken.jpg	image/jpeg	{"identified":true,"width":512,"height":512,"analyzed":true}	local	55196	dxIjwMBDCZyP/JTiVrUvyA==	2024-04-21 17:01:52.184275
60	f95d27ei5ftl7a2nvrx6jlla1s15	redis.jpeg	image/jpeg	{"identified":true,"width":249,"height":202,"analyzed":true}	local	6213	vfMzQW3lU7VpTVmQGSLVIw==	2024-04-21 17:08:06.221887
61	c2wytrs4uqnm8qwl1mkcdmti5xdi	chicken.jpg	image/jpeg	{"identified":true,"width":240,"height":240,"analyzed":true}	local	7389	98i41tnJuRpPvA2UqMEDHQ==	2024-04-21 18:25:59.669888
62	8zlkrziwlytjjezxvaefhpg9ydwv	redis.jpeg	image/jpeg	{"identified":true,"width":249,"height":202,"analyzed":true}	local	6125	5+sphaDzAU8jr18JGIFOBw==	2024-04-21 18:26:01.622431
63	qdmjnu28013ww9fxzbho4noupr3u	apple.jpg	image/jpeg	{"identified":true,"width":108,"height":84,"analyzed":true}	local	2738	QFBRcr3tHXEL7i1akuZHvA==	2024-04-25 13:38:03.355184
67	o0brnazasp1rs82hsxourfw9ezi2	cheese.jpg	image/jpeg	{"identified":true,"width":108,"height":72,"analyzed":true}	local	2203	2dPqe0QMQcqtxF0TMprA6w==	2024-04-25 13:38:03.394725
65	bszfhcfdut9ih4lnqnc8c7wmmyfp	orange.jpg	image/jpeg	{"identified":true,"width":108,"height":100,"analyzed":true}	local	3870	/Xbpd9lqKrLqgB0mRdr4/Q==	2024-04-25 13:38:03.363994
66	7x8oaiyb8hfbfrizygk0l4cacnmu	babana.jpg	image/jpeg	{"identified":true,"width":108,"height":81,"analyzed":true}	local	2495	/mtPwoqyDmfoqc77KxQMhA==	2024-04-25 13:38:03.381836
64	zjask8srbt8x1eofipqdinx36231	cucumber.jpeg	image/jpeg	{"identified":true,"width":108,"height":73,"analyzed":true}	local	2270	uziGPUv3sccmoKrRG8yuHA==	2024-04-25 13:38:03.360188
68	k79p16xbqbclntc5l8axv06asowe	sprite.jpg	image/jpeg	{"identified":true,"width":90,"height":120,"analyzed":true}	local	2076	vVxBEwV0tdgMgP11cMoIvw==	2024-04-25 13:38:03.84746
70	ovfy989384xp481lmpwtvqjt702f	cola.jpg	image/jpeg	{"identified":true,"width":108,"height":108,"analyzed":true}	local	2145	RlolDw/m/BbYr5SukOvtDg==	2024-04-25 13:38:04.016294
69	w87uqq9m0xlukhh37w03jwewl85j	dd874232e9ef11eca80654a05054786b_9cafb2b8cc2811ed8ce054a05054786b.jpg	image/jpeg	{"identified":true,"width":108,"height":108,"analyzed":true}	local	5332	MQjFmwa1l7oCe48u2cWGPQ==	2024-04-25 13:38:04.01164
71	gaatyr06l25rzd8dgvsmelh88z44	sausage.jpg	image/jpeg	{"identified":true,"width":108,"height":83,"analyzed":true}	local	5053	nx7Nw0oVSY31NMhC8JKTtg==	2024-04-25 13:38:04.091388
72	plbe7yo7wd6rgaqkbt2898h3ckxp	meat.jpg	image/jpeg	{"identified":true,"width":108,"height":61,"analyzed":true}	local	2391	mxumfXui9Lt7wrUgogWQaQ==	2024-04-25 13:38:04.163771
74	zf0fzgecaznr2mt6bptrf71z3cgx	1_krasnaya_ikra_gorbushi_500.jpg	image/jpeg	{"identified":true,"width":108,"height":108,"analyzed":true}	local	3411	IwjPy8B0/HkmsXRpBoZ4Lw==	2024-04-25 13:38:04.806986
73	skfteejb3d7h7a2jfhakmrifyio2	bread.jpg	image/jpeg	{"identified":true,"width":108,"height":108,"analyzed":true}	local	2692	ua01WfJGEFjR0Lp0Wh53/w==	2024-04-25 13:38:04.73801
76	2nvjpdnaai57q6iw2ztt4d3q90el	ketchup.png	image/png	{"identified":true,"width":108,"height":108,"analyzed":true}	local	8553	b/tC17S8zMu5DM/kxzJepw==	2024-04-25 13:38:04.952707
77	y2oc6rv3m7cwse6bnud1u629wj6u	chips.jpg	image/jpeg	{"identified":true,"width":108,"height":108,"analyzed":true}	local	3759	GB3oituRH6KbpEysA8A4qg==	2024-04-25 13:38:05.026346
75	lbcnydxmf1linykqlnr15bvjie5e	eggs.jpeg	image/jpeg	{"identified":true,"width":108,"height":72,"analyzed":true}	local	2208	F4wjM/k764l2GVfXGm0Dxg==	2024-04-25 13:38:04.936025
78	6u11nojfk70z7mnx9vgcqch1y1gv	redis.jpeg	image/jpeg	{"identified":true,"width":108,"height":88,"analyzed":true}	local	2449	XfGvP54/6NPT83XM4tlULw==	2024-04-25 13:38:05.349161
79	79xaq8eio4ytcmqly59ypuga5m4b	chicken.jpg	image/jpeg	{"identified":true,"width":108,"height":108,"analyzed":true}	local	2486	gNmz6P+apgki2Q6MsH1igA==	2024-04-25 13:38:05.404999
80	5zzz809n5s2byqlgv2396q2a3wd5	tomat.jpg	image/jpeg	{"identified":true,"width":108,"height":72,"analyzed":true}	local	2333	gC7izzhMHXwQIF1jRtJ0mg==	2024-04-25 13:38:05.506714
81	o638x9m8qbr96ii4zdsyxfln9sni	milk.jpeg	image/jpeg	{"identified":true,"width":108,"height":108,"analyzed":true}	local	1968	UIV6nrA/Bb5XFBhKCw7aWQ==	2024-04-25 13:38:05.794262
82	si086ace9nrle6h6n96dfqft1l1i	apple.jpg	image/jpeg	{"identified":true,"width":250,"height":194,"analyzed":true}	local	8242	4ui4XvLBpu1IN+uFT0dfWQ==	2024-04-25 13:40:24.299062
83	5fhg6je0gtzz6p4cegotj11b4lb3	babana.jpg	image/jpeg	{"identified":true,"width":250,"height":188,"analyzed":true}	local	6066	Sx7kSGPRStlU5UBmOA+UfQ==	2024-04-25 13:40:25.291395
84	97o96lk5wejxufjfmoez5v9fgc6k	cucumber.jpeg	image/jpeg	{"identified":true,"width":250,"height":170,"analyzed":true}	local	5743	FHmgb8rU/EEwzrh+Wo7UAw==	2024-04-25 13:40:25.312687
85	wa03ji0uxvtq7jco2z26d814z00a	chicken.jpg	image/jpeg	{"identified":true,"width":200,"height":200,"analyzed":true}	local	5602	4b0OMme8xXkqe3HgdiuICg==	2024-04-25 13:40:25.350298
87	dvltw3g2hymdeh05gqo20jf62i09	milk.jpeg	image/jpeg	{"identified":true,"width":200,"height":200,"analyzed":true}	local	3665	mXaS9XMn96Q/N980M6GbZA==	2024-04-25 13:40:25.477106
86	l48lv2jm3xj86s877uqouqlzfww4	cheese.jpg	image/jpeg	{"identified":true,"width":250,"height":166,"analyzed":true}	local	5219	bSno03msAJcmiqP6bKg6VA==	2024-04-25 13:40:25.387504
90	vwgz6fmiw1otn5wvlih67iz2p5s9	chips.jpg	image/jpeg	{"identified":true,"width":200,"height":200,"analyzed":true}	local	8313	MH+FBMdZACsFltB8g+u05Q==	2024-04-25 13:40:25.902791
88	83d69hfi2gmq5owvf2da1xjs4li2	cola.jpg	image/jpeg	{"identified":true,"width":200,"height":200,"analyzed":true}	local	4235	BaAI2MnVxddo9Zo4revm8w==	2024-04-25 13:40:25.806073
89	bl5p9t9jjdogcrp29aaoywag1yha	dd874232e9ef11eca80654a05054786b_9cafb2b8cc2811ed8ce054a05054786b.jpg	image/jpeg	{"identified":true,"width":200,"height":200,"analyzed":true}	local	7458	WA9nLQYvwqYMUveOwctKog==	2024-04-25 13:40:25.84883
93	pd06s7e1ayqcloglwbl0dy5hjpz3	sprite.jpg	image/jpeg	{"identified":true,"width":150,"height":200,"analyzed":true}	local	3613	BWmFNn0IAEIp0/XkRfUq4Q==	2024-04-25 13:40:26.207022
253	9dudcwxcoqoe6pe9fzfwqakn2a38	orange.jpg	image/jpeg	{"identified":true,"width":435,"height":400,"analyzed":true}	local	20693	hNevVECERxp+EVeMMioKhg==	2024-05-27 13:50:41.870511
94	vp5p7tycqbe0oy8h53hbdna74jpr	bread.jpg	image/jpeg	{"identified":true,"width":200,"height":200,"analyzed":true}	local	5795	wfKQrAb6aG2DGN9BIPDxWQ==	2024-04-25 13:40:26.288456
97	xn6hn8p746nimolfee7o9jotx0hd	tomat.jpg	image/jpeg	{"identified":true,"width":250,"height":167,"analyzed":true}	local	5838	e5gq7bZLtRxeoyywOs8mcw==	2024-04-25 13:40:26.512082
232	oyar6lquefsexiete68hbsjzuor7	redis.jpeg	image/jpeg	{"identified":true,"width":148,"height":120,"analyzed":true}	local	3433	nGMHW3rjb2nYpmo9IkW+Ug==	2024-05-24 13:10:54.834925
243	85g5s4m43gyq2xdebbmplfr5wnku	chips.jpg	image/jpeg	{"identified":true,"width":120,"height":120,"analyzed":true}	local	4195	pP7PTIPIySNNQEpD+ki2ng==	2024-05-24 13:10:56.037784
246	ujusnjnei7ehrmn0gzswq8b7vl66	meat.jpg	image/jpeg	{"identified":true,"width":160,"height":90,"analyzed":true}	local	3791	gT5CJtzlLGDJuetjmqezxQ==	2024-05-24 13:10:56.489869
254	fmp9ti445i75mj2tgwtlu3m0vv4j	babana.jpg	image/jpeg	{"identified":true,"width":533,"height":400,"analyzed":true}	local	16458	UqNW76irEsvzMaWssehggQ==	2024-05-27 13:52:39.394943
255	sp4nbpwbx7aitxitfsppcu38zfre	1_krasnaya_ikra_gorbushi_500.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	27245	2paSOPlS13E1/bkjqbEMfA==	2024-05-27 13:52:42.766188
256	8sj3jl90sfer5o4j3d4tz0llygvq	cucumber.jpeg	image/jpeg	{"identified":true,"width":272,"height":185,"analyzed":true}	local	5788	URP5GUni5cyQyfiDmmnz1Q==	2024-05-27 13:52:47.307038
257	kvj85tawukr5id4msxxqesppfsos	dd874232e9ef11eca80654a05054786b_9cafb2b8cc2811ed8ce054a05054786b.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	14876	GAWELdx4o1D+6GWcrq9bHw==	2024-05-27 13:52:50.499191
96	yzgq4q355o3qluow9nfi9dfpcjp0	eggs.jpeg	image/jpeg	{"identified":true,"width":250,"height":166,"analyzed":true}	local	4120	ko47Oo9T/ZQRn8ybm3F3wQ==	2024-04-25 13:40:26.305971
95	0fn5143hd2aofl3leqlplvy4rha8	1_krasnaya_ikra_gorbushi_500.jpg	image/jpeg	{"identified":true,"width":200,"height":200,"analyzed":true}	local	8658	GXMEEVn85Mzuy5o/PiKZ/g==	2024-04-25 13:40:26.291198
261	97wyvsdaitgq8uwczlx2v7paonbx	aaaa.jpg	image/jpeg	{"identified":true,"width":740,"height":740,"analyzed":true}	local	60830	AYMIQlqpaxIm//GEmi0Jig==	2024-06-08 20:40:15.606012
233	v9irlw6jgsprz2kqsv5kdlwb6psg	apple.jpg	image/jpeg	{"identified":true,"width":155,"height":120,"analyzed":true}	local	4272	IwGyMPBGrDZ8WlX572Dc2g==	2024-05-24 13:10:54.838442
235	ykyc2zm039f3umfnpc5x14osviaq	bread.jpg	image/jpeg	{"identified":true,"width":120,"height":120,"analyzed":true}	local	3059	ef2Gck4/EqH4zA+Q+xgYXw==	2024-05-24 13:10:55.043157
241	vrc8phvfn728bbsaw8kkmcam58k9	milk.jpeg	image/jpeg	{"identified":true,"width":120,"height":120,"analyzed":true}	local	2177	ewHsk3egIEMwjjmZel4Yug==	2024-05-24 13:10:55.78451
245	auvpfyhhpoqg7073sumjwfgfrwbn	sausage.jpg	image/jpeg	{"identified":true,"width":157,"height":120,"analyzed":true}	local	7188	BDjtbbRyvdNS2UcDf1Fzyg==	2024-05-24 13:10:56.332439
248	6xwqhwzxkg1foo9hp5lc4i7b8ajv	1_krasnaya_ikra_gorbushi_500.jpg	image/jpeg	{"identified":true,"width":120,"height":120,"analyzed":true}	local	3936	TtWdgGdLhkx59jYD7R+baw==	2024-05-24 13:10:56.7293
262	2u9vwbaufq0y413j147cgjf92a59	aaaa.jpg	image/jpeg	{"identified":true,"width":120,"height":120,"analyzed":true}	local	3647	KtJigccQd5I7fAveCmVWHA==	2024-06-08 20:40:15.886733
92	c65sibwi4kzkrjwowt6p33iysdrx	ketchup.png	image/png	{"identified":true,"width":200,"height":200,"analyzed":true}	local	23958	8Dn/o/hzUlJ9PL34RFZHIw==	2024-04-25 13:40:25.939289
99	7sv7ieav4rmoy6avm0nf2ve24j5e	sausage.jpg	image/jpeg	{"identified":true,"width":250,"height":192,"analyzed":true}	local	13013	BfBsHmh+tZv+IV2AvoFpqw==	2024-04-25 13:40:26.689483
234	otnnkpt4ajedgjuwy77405jnrv7f	chicken.jpg	image/jpeg	{"identified":true,"width":120,"height":120,"analyzed":true}	local	2832	3zdfEJniEIYOdEz6PR2VEA==	2024-05-24 13:10:55.037683
242	1osb4ez52114is7rs1icmxo14iyj	cucumber.jpeg	image/jpeg	{"identified":true,"width":160,"height":109,"analyzed":true}	local	3390	MsdDtMLP6vjwA7ICuYSgTQ==	2024-05-24 13:10:55.987648
249	y0tz97zl9wc7l1e5tfmtpmvcp281	babana.jpg	image/jpeg	{"identified":true,"width":160,"height":120,"analyzed":true}	local	3739	Lekx9EbSveWkmOyB960pfw==	2024-05-24 13:10:56.733238
91	f0ut2l0eu9cqvpo192tf9zal47bd	redis.jpeg	image/jpeg	{"identified":true,"width":247,"height":200,"analyzed":true}	local	6391	9LGjfXbnnkExga8Ta2yCnQ==	2024-04-25 13:40:25.913618
98	ukjl4kajsf8offq6ufyxamufv2fb	meat.jpg	image/jpeg	{"identified":true,"width":250,"height":141,"analyzed":true}	local	7168	SGlx6UJPGFp1Y88Ikc+ViA==	2024-04-25 13:40:26.644152
100	kl38zqtozkpzwg23ayfohs6v2ltr	orange.jpg	image/jpeg	{"identified":true,"width":217,"height":200,"analyzed":true}	local	7465	McI7Z+FGgWHTUY6vD6uXbw==	2024-04-25 13:40:27.041101
101	r384mk7r4y6cfgcy59mh68cbdoue	orange.jpg	image/jpeg	{"identified":true,"width":54,"height":50,"analyzed":true}	local	2931	JngJPLggIIVdiNXLbXs17w==	2024-04-27 19:08:58.376554
105	yo0s0g42oq3bhu1xcs4ret9mu0bj	cucumber.jpeg	image/jpeg	{"identified":true,"width":74,"height":50,"analyzed":true}	local	1621	0lHIkg0HqS7lsktpGsoFig==	2024-04-27 19:08:58.419551
103	g7cspqt96c3z9sf3ec1vz0uwqysl	babana.jpg	image/jpeg	{"identified":true,"width":67,"height":50,"analyzed":true}	local	1695	1RCt52dMxg01vXpVbcGxrg==	2024-04-27 19:08:58.395967
102	z1o5kyy7l265dk21m1kmirg65km2	apple.jpg	image/jpeg	{"identified":true,"width":64,"height":50,"analyzed":true}	local	1738	a4XdzPy5uy6C8qRjEbKLdg==	2024-04-27 19:08:58.390046
104	19hn52jpkppi0gs9obzm62cjlr2z	cheese.jpg	image/jpeg	{"identified":true,"width":75,"height":50,"analyzed":true}	local	1631	fgSKVoasO8nYTbkCTxsuaQ==	2024-04-27 19:08:58.401797
109	c9z8o07vimztptizo098jc4a01uq	cola.jpg	image/jpeg	{"identified":true,"width":50,"height":50,"analyzed":true}	local	1216	bt5POiM9ha8xgybsC+qTKA==	2024-04-27 19:08:59.03451
106	2g7wqzl4zb2zmy2or7r240vtgm5t	bread.jpg	image/jpeg	{"identified":true,"width":50,"height":50,"analyzed":true}	local	1410	dRFx5o26eQ65jFlaqCiEPw==	2024-04-27 19:08:58.77526
108	1l0l28qrez4f07s54g1jgb1biu5t	dd874232e9ef11eca80654a05054786b_9cafb2b8cc2811ed8ce054a05054786b.jpg	image/jpeg	{"identified":true,"width":50,"height":50,"analyzed":true}	local	4412	GPcjynsKCRzOPEiE9KlgrQ==	2024-04-27 19:08:58.902742
110	nmt8xki66jls50xfm9b4r81uywmv	meat.jpg	image/jpeg	{"identified":true,"width":89,"height":50,"analyzed":true}	local	1955	sLQXO7cpeXTWtKjtBS4yjg==	2024-04-27 19:08:59.075457
107	4g16tvfz0wte3fp08iu4sy05md4h	sausage.jpg	image/jpeg	{"identified":true,"width":65,"height":50,"analyzed":true}	local	3613	UzUKiu0dQR/AktI7MEFEhQ==	2024-04-27 19:08:58.862765
111	t6ekszdpev56fkb7a8wc1v1kmocj	sprite.jpg	image/jpeg	{"identified":true,"width":38,"height":50,"analyzed":true}	local	1161	Tg51l5LDB9ZcVa7q4ntEEg==	2024-04-27 19:08:59.626899
112	yn58vms4jvhj21rq6qwtpqo4jm75	ketchup.png	image/png	{"identified":true,"width":50,"height":50,"analyzed":true}	local	2395	LUtBcK0n6h3jCiXVEXkwBQ==	2024-04-27 19:08:59.897107
113	vfgos0sfduw73hpx1c2f6ige40ta	1_krasnaya_ikra_gorbushi_500.jpg	image/jpeg	{"identified":true,"width":50,"height":50,"analyzed":true}	local	1525	PGjJNqcB+Xp4V6QG2ryLng==	2024-04-27 19:08:59.936229
114	api63fgpsyqwo6ci80dqxtnxuluv	eggs.jpeg	image/jpeg	{"identified":true,"width":75,"height":50,"analyzed":true}	local	1900	9VdJqI09ilTnDkIi93M6ug==	2024-04-27 19:08:59.945673
116	19zbb2erk62gkdtfkjhxishnsdal	chicken.jpg	image/jpeg	{"identified":true,"width":50,"height":50,"analyzed":true}	local	1345	Rzl/xNtWRc9MoPsJiAs6vQ==	2024-04-27 19:09:00.249903
115	r0nbha3qiv493r2vfaqs9e4zujrg	chips.jpg	image/jpeg	{"identified":true,"width":50,"height":50,"analyzed":true}	local	1693	umeVD4b70S8rHKDqys1QSA==	2024-04-27 19:09:00.027608
117	7tuutjp9mpbv2gg4fmm76xmoh8yt	redis.jpeg	image/jpeg	{"identified":true,"width":62,"height":50,"analyzed":true}	local	1557	F4E2jK0pqybJGFoMtZkXqQ==	2024-04-27 19:09:00.443459
118	6956x0mbtw2wm7p50381dkb2lvme	milk.jpeg	image/jpeg	{"identified":true,"width":50,"height":50,"analyzed":true}	local	1227	6dG8uyYQwPobaOUShw/+9g==	2024-04-27 19:09:00.615161
119	hjfd8ke2j7c89w0nbn9wctubgk30	tomat.jpg	image/jpeg	{"identified":true,"width":75,"height":50,"analyzed":true}	local	1716	zxQc5UZ7l2GeHBzEi1EoeA==	2024-05-11 14:06:43.179048
247	rp8bb9yk0z2609vhzkuywdgeonj7	tomat.jpg	image/jpeg	{"identified":true,"width":160,"height":107,"analyzed":true}	local	3483	5D6IwANnYX5Xg1ZpvnwFJg==	2024-05-24 13:10:56.581533
236	3ni6i39te1sy92z8m6ykkjeartw8	cola.jpg	image/jpeg	{"identified":true,"width":120,"height":120,"analyzed":true}	local	2414	rGOYQzlHWdtGwjMLYbfZAQ==	2024-05-24 13:10:55.057117
237	nbfyep4fq18xzjygmqykwz2ika36	cheese.jpg	image/jpeg	{"identified":true,"width":160,"height":107,"analyzed":true}	local	3133	1Qzy3QU+mPFzuNKD1rgQ5Q==	2024-05-24 13:10:55.227289
238	49czdm5g3vbi2czcnmnupuyaan5d	orange.jpg	image/jpeg	{"identified":true,"width":130,"height":120,"analyzed":true}	local	4495	g090hg8y0guw+OBzeVzh9Q==	2024-05-24 13:10:55.340297
239	6wrosf5dx2frp7a3fgs3yz96c4sh	ketchup.png	image/png	{"identified":true,"width":120,"height":120,"analyzed":true}	local	10218	PWGR8wXzDz2uWSmJEgoHaw==	2024-05-24 13:10:55.566332
240	6e9ph0gczpjtx0vaqu4ijp7qpoa4	eggs.jpeg	image/jpeg	{"identified":true,"width":160,"height":106,"analyzed":true}	local	2805	qNEgva+DYt7klQ+GKbWMfQ==	2024-05-24 13:10:55.778595
244	b3nntfnmxo1onwwrw4vzk8xwv0b9	sprite.jpg	image/jpeg	{"identified":true,"width":90,"height":120,"analyzed":true}	local	2076	vVxBEwV0tdgMgP11cMoIvw==	2024-05-24 13:10:56.089655
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
1	10	TXtYcjoNdY7W59PiBycljnUUuFQ=
2	24	TXtYcjoNdY7W59PiBycljnUUuFQ=
3	6	TXtYcjoNdY7W59PiBycljnUUuFQ=
4	23	TXtYcjoNdY7W59PiBycljnUUuFQ=
5	9	TXtYcjoNdY7W59PiBycljnUUuFQ=
6	15	5nzBWeeY8TN2oo+xy6xiMz7c0gE=
7	12	TXtYcjoNdY7W59PiBycljnUUuFQ=
8	13	5nzBWeeY8TN2oo+xy6xiMz7c0gE=
9	14	TXtYcjoNdY7W59PiBycljnUUuFQ=
10	16	5nzBWeeY8TN2oo+xy6xiMz7c0gE=
11	11	TXtYcjoNdY7W59PiBycljnUUuFQ=
12	18	TXtYcjoNdY7W59PiBycljnUUuFQ=
13	17	TXtYcjoNdY7W59PiBycljnUUuFQ=
14	20	TXtYcjoNdY7W59PiBycljnUUuFQ=
15	19	+TebOLMWd6wv+d5/UMb+TeNfQG4=
16	21	TXtYcjoNdY7W59PiBycljnUUuFQ=
17	8	TXtYcjoNdY7W59PiBycljnUUuFQ=
18	9	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
19	24	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
20	23	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
21	6	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
22	8	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
23	13	WToKjde2tQDXSGPrK56JaJNZtcE=
24	11	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
25	14	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
26	12	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
27	15	WToKjde2tQDXSGPrK56JaJNZtcE=
28	16	WToKjde2tQDXSGPrK56JaJNZtcE=
29	18	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
30	17	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
31	19	KGwWOYTn5VOzNF6AoDB40O8f4d0=
32	20	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
33	21	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
34	10	5wJc3+k4fgcMAx1TWD3ptPrpBtE=
35	59	TXtYcjoNdY7W59PiBycljnUUuFQ=
36	60	5nzBWeeY8TN2oo+xy6xiMz7c0gE=
37	9	sYLD42ynjz3rhCfnKLsfooQyXms=
38	24	sYLD42ynjz3rhCfnKLsfooQyXms=
39	13	yFRiDiiiAg6lSc4mOCnpCrRzvLo=
40	17	sYLD42ynjz3rhCfnKLsfooQyXms=
41	18	sYLD42ynjz3rhCfnKLsfooQyXms=
42	20	sYLD42ynjz3rhCfnKLsfooQyXms=
43	6	sYLD42ynjz3rhCfnKLsfooQyXms=
44	23	sYLD42ynjz3rhCfnKLsfooQyXms=
45	12	sYLD42ynjz3rhCfnKLsfooQyXms=
46	11	sYLD42ynjz3rhCfnKLsfooQyXms=
47	21	sYLD42ynjz3rhCfnKLsfooQyXms=
48	8	sYLD42ynjz3rhCfnKLsfooQyXms=
49	19	z310azoDrjErxT6LIg1a8azhThI=
50	15	yFRiDiiiAg6lSc4mOCnpCrRzvLo=
51	14	sYLD42ynjz3rhCfnKLsfooQyXms=
52	60	yFRiDiiiAg6lSc4mOCnpCrRzvLo=
53	59	sYLD42ynjz3rhCfnKLsfooQyXms=
54	10	sYLD42ynjz3rhCfnKLsfooQyXms=
55	16	yFRiDiiiAg6lSc4mOCnpCrRzvLo=
56	24	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
57	13	BuzcMvwyZ1bA4bxDXGO3veqqDY4=
58	9	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
59	59	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
60	18	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
61	16	BuzcMvwyZ1bA4bxDXGO3veqqDY4=
62	23	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
63	6	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
64	14	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
65	60	BuzcMvwyZ1bA4bxDXGO3veqqDY4=
66	19	ihCDUTupYBcNfB2In6cT8wPYJNk=
67	20	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
68	21	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
69	8	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
70	15	BuzcMvwyZ1bA4bxDXGO3veqqDY4=
71	10	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
72	11	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
73	12	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
74	17	I3+sIUDyBAn/xZCL1tXxnRmJtvA=
75	9	KPt1zC0ri/OhdPrlLi34RmegQJM=
76	17	KPt1zC0ri/OhdPrlLi34RmegQJM=
77	18	KPt1zC0ri/OhdPrlLi34RmegQJM=
78	24	KPt1zC0ri/OhdPrlLi34RmegQJM=
79	13	0UbPKFokotWbskqaJbp2Tc+PCrg=
80	21	KPt1zC0ri/OhdPrlLi34RmegQJM=
81	12	KPt1zC0ri/OhdPrlLi34RmegQJM=
82	6	KPt1zC0ri/OhdPrlLi34RmegQJM=
83	23	KPt1zC0ri/OhdPrlLi34RmegQJM=
84	11	KPt1zC0ri/OhdPrlLi34RmegQJM=
85	20	KPt1zC0ri/OhdPrlLi34RmegQJM=
86	19	TcoWd1ylo/UeZ2emQH5OlhvWCx8=
87	15	0UbPKFokotWbskqaJbp2Tc+PCrg=
88	8	KPt1zC0ri/OhdPrlLi34RmegQJM=
89	14	KPt1zC0ri/OhdPrlLi34RmegQJM=
90	59	KPt1zC0ri/OhdPrlLi34RmegQJM=
91	60	0UbPKFokotWbskqaJbp2Tc+PCrg=
92	16	0UbPKFokotWbskqaJbp2Tc+PCrg=
93	10	KPt1zC0ri/OhdPrlLi34RmegQJM=
150	24	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
151	60	hxR3yzy9XhWy/E/UB0YFX2s0/mY=
152	59	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
153	21	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
154	23	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
155	18	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
156	17	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
157	19	tFaK6CnGRnrniX5Te5nZBdVAHwc=
158	16	hxR3yzy9XhWy/E/UB0YFX2s0/mY=
159	15	hxR3yzy9XhWy/E/UB0YFX2s0/mY=
160	13	hxR3yzy9XhWy/E/UB0YFX2s0/mY=
161	14	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
164	11	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
162	20	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
165	10	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
163	12	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
167	8	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
166	9	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
168	6	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
169	20	j4nisOaBIojMsR9rn63EMK4JY1E=
170	16	s2857eNcpWVWM9kguDfV3lsDBqQ=
171	17	j4nisOaBIojMsR9rn63EMK4JY1E=
172	9	j4nisOaBIojMsR9rn63EMK4JY1E=
173	8	j4nisOaBIojMsR9rn63EMK4JY1E=
174	13	s2857eNcpWVWM9kguDfV3lsDBqQ=
175	6	j4nisOaBIojMsR9rn63EMK4JY1E=
176	59	j4nisOaBIojMsR9rn63EMK4JY1E=
178	261	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
179	261	TXtYcjoNdY7W59PiBycljnUUuFQ=
180	264	2Gzf2VR6LhaZuWMBDKNrqRAaOFo=
181	266	tFaK6CnGRnrniX5Te5nZBdVAHwc=
182	264	TXtYcjoNdY7W59PiBycljnUUuFQ=
183	266	+TebOLMWd6wv+d5/UMb+TeNfQG4=
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-04-17 21:55:26.767732	2024-04-17 21:55:26.767736
\.


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.cart_items (id, cart_id, product_id, quantity, created_at, updated_at) FROM stdin;
302	77	4	2	2024-06-20 15:26:21.246915	2024-06-20 15:26:24.590512
304	77	16	1	2024-06-20 15:37:36.908142	2024-06-20 15:37:36.908142
172	47	2	3	2024-05-28 22:47:20.992766	2024-05-28 22:47:24.143639
274	63	4	1	2024-06-09 10:31:27.69237	2024-06-09 10:31:27.69237
275	63	16	1	2024-06-09 10:31:29.893781	2024-06-09 10:31:29.893781
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.carts (id, user_id, created_at, updated_at) FROM stdin;
63	5	2024-06-09 10:31:27.684023	2024-06-09 10:31:27.684023
77	4	2024-06-20 15:26:11.305295	2024-06-20 15:26:11.305295
47	2	2024-05-28 22:47:20.976006	2024-05-28 22:47:20.976006
\.


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.chats (id, user_id, status, title, created_at, updated_at) FROM stdin;
1	1	\N	text	2024-04-25 21:00:35.103976	2024-04-25 21:00:35.103976
2	1	\N	как какать?	2024-04-25 21:05:27.568239	2024-04-25 21:05:27.568239
4	5	\N	вопрос 	2024-04-26 11:14:44.855508	2024-04-26 11:14:44.855508
5	1	\N	qqq	2024-04-27 10:12:07.262263	2024-04-27 10:12:07.262263
6	1	\N	test	2024-06-05 13:40:26.119632	2024-06-05 13:40:26.119632
7	1	\N	test	2024-06-05 13:40:26.752443	2024-06-05 13:40:26.752443
8	1	\N	ttt	2024-06-05 13:42:11.146712	2024-06-05 13:42:11.146712
9	1	\N	123	2024-06-05 13:42:56.483286	2024-06-05 13:42:56.483286
10	1	\N	aa	2024-06-05 13:43:18.455806	2024-06-05 13:43:18.455806
11	1	\N	test1	2024-06-05 13:45:47.853729	2024-06-05 13:45:47.853729
12	1	\N	testt	2024-06-05 13:47:33.675633	2024-06-05 13:47:33.675633
13	1	\N	my super question	2024-06-05 13:48:04.74289	2024-06-05 13:48:04.74289
14	1	\N	My second question!	2024-06-05 13:53:26.004295	2024-06-05 13:53:26.004295
15	10	\N	My qst	2024-06-06 17:55:52.686235	2024-06-06 17:55:52.686235
16	7	\N	ttttt	2025-08-26 03:02:26.926102	2025-08-26 03:02:26.926102
\.


--
-- Data for Name: comment_likes; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.comment_likes (id, user_id, comment_id, created_at, updated_at, active) FROM stdin;
157	324	71	2024-06-27 02:14:31.960201	2024-06-27 02:14:31.960201	t
54	1	40	2024-06-10 15:44:09.441691	2024-06-12 18:01:13.023796	t
137	1	10	2024-06-12 18:01:52.166845	2024-06-12 18:01:52.166845	f
80	10	92	2024-06-11 17:44:44.320065	2024-06-11 17:44:44.320065	t
81	1	92	2024-06-11 21:09:41.619412	2024-06-11 21:09:41.619412	t
139	1	2	2024-06-12 18:09:18.621596	2024-06-12 18:09:51.265251	t
19	1	12	2024-05-28 20:17:47.714012	2024-05-28 20:17:47.714012	t
21	5	4	2024-05-28 20:18:13.725155	2024-05-28 20:18:13.725155	t
22	2	4	2024-05-28 20:18:53.085922	2024-05-28 20:18:53.085922	t
23	2	1	2024-05-28 20:53:55.466261	2024-05-28 20:53:55.466261	t
26	2	5	2024-05-28 22:33:59.837497	2024-05-28 22:33:59.837497	t
27	2	22	2024-05-28 22:34:01.35009	2024-05-28 22:34:01.35009	t
140	10	32	2024-06-12 18:13:43.928948	2024-06-12 18:17:36.451399	t
142	10	68	2024-06-12 18:18:19.445819	2024-06-12 18:18:31.459144	t
34	1	22	2024-05-30 23:34:25.65485	2024-05-30 23:34:25.65485	t
143	10	59	2024-06-12 18:19:00.849603	2024-06-12 18:19:00.849603	t
100	1	4	2024-06-12 17:02:45.279613	2024-06-12 17:02:45.279613	t
40	1	41	2024-05-31 01:19:24.686637	2024-05-31 01:19:24.686637	t
104	1	123	2024-06-12 17:19:20.202999	2024-06-12 17:19:20.202999	t
53	1	49	2024-05-31 16:05:55.542581	2024-05-31 16:05:55.542581	t
55	10	105	2024-06-10 15:47:35.69852	2024-06-10 15:47:35.69852	t
57	1	105	2024-06-11 14:08:31.780605	2024-06-11 14:08:31.780605	t
145	10	69	2024-06-12 18:22:04.363943	2024-06-12 18:23:54.072404	t
146	10	30	2024-06-12 18:23:55.098964	2024-06-12 18:23:55.098964	t
120	10	70	2024-06-12 17:29:05.763243	2024-06-12 17:29:05.763243	t
121	10	63	2024-06-12 17:29:07.454919	2024-06-12 17:29:07.454919	t
122	10	71	2024-06-12 17:29:08.378918	2024-06-12 17:29:08.378918	t
147	10	28	2024-06-12 18:42:46.980528	2024-06-12 18:42:51.772886	t
124	10	15	2024-06-12 17:29:11.486582	2024-06-12 17:29:11.486582	t
125	10	35	2024-06-12 17:29:12.483885	2024-06-12 17:29:12.483885	t
149	10	73	2024-06-12 18:53:38.410813	2024-06-12 18:53:38.410813	t
141	10	64	2024-06-12 18:17:40.132765	2024-06-12 18:56:31.654184	t
129	10	72	2024-06-12 17:29:19.353454	2024-06-12 17:29:19.353454	t
136	10	61	2024-06-12 17:29:31.252943	2024-06-12 17:29:31.252943	t
12	5	10	2024-05-28 19:17:23.231709	2024-06-12 17:52:23.715185	f
152	10	133	2024-06-12 19:05:13.438392	2024-06-12 19:07:05.224642	t
151	10	132	2024-06-12 19:01:25.534656	2024-06-12 19:01:28.631405	t
150	10	131	2024-06-12 18:57:56.670718	2024-06-12 19:04:56.722563	t
153	10	134	2024-06-12 19:07:16.809842	2024-06-12 19:07:18.685418	t
154	1	29	2024-06-20 22:14:12.22564	2024-06-20 22:14:12.22564	t
155	1	58	2024-06-20 22:15:15.033529	2024-06-20 22:15:15.033529	t
156	1	69	2024-06-22 01:18:52.391277	2024-06-22 01:19:19.874755	t
138	1	19	2024-06-12 18:03:59.985764	2024-06-22 01:19:39.918905	t
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.comments (id, text, rating, parent_id, user_id, product_id, created_at, updated_at) FROM stdin;
2	test	\N	\N	1	2	2024-05-28 14:40:12.848575	2024-05-28 14:40:12.848575
3	test comments 	\N	\N	1	2	2024-05-28 14:41:19.960837	2024-05-28 14:41:19.960837
7	subcomment	\N	1	1	2	2024-05-28 16:39:06.28354	2024-05-28 16:39:06.28354
8	hello!	\N	1	1	2	2024-05-28 17:05:47.651489	2024-05-28 17:05:47.651489
9	hi!	\N	1	1	2	2024-05-28 17:13:07.698118	2024-05-28 17:13:07.698118
10	norm	3	\N	1	2	2024-05-28 17:25:54.184006	2024-05-28 17:25:54.184006
12	agree!	\N	10	1	2	2024-05-28 20:03:19.050021	2024-05-28 20:03:19.050021
13	comment 1	\N	\N	2	2	2024-05-28 21:49:04.600432	2024-05-28 21:49:04.600432
14	comment 2	\N	\N	2	2	2024-05-28 21:49:07.751939	2024-05-28 21:49:07.751939
15	comment 3	\N	\N	2	2	2024-05-28 21:49:10.887042	2024-05-28 21:49:10.887042
16	comment 4	\N	\N	2	2	2024-05-28 21:49:17.392754	2024-05-28 21:49:17.392754
18	comment 6	\N	\N	2	2	2024-05-28 21:49:23.993201	2024-05-28 21:49:23.993201
19	comment 7	\N	\N	2	2	2024-05-28 21:49:26.412865	2024-05-28 21:49:26.412865
21	comment 9	\N	\N	2	2	2024-05-28 21:56:50.687498	2024-05-28 21:56:50.687498
22	comment 10	\N	\N	2	2	2024-05-28 21:56:55.733368	2024-05-28 21:56:55.733368
23	good!!!!!!	\N	\N	2	2	2024-05-28 22:32:25.248699	2024-05-28 22:32:25.248699
71	12346	3	\N	1	2	2024-05-31 11:58:25.549014	2024-06-29 17:03:46.359089
25	hello!	\N	4	2	2	2024-05-28 22:32:57.296396	2024-05-28 22:32:57.296396
27	ttee	5	\N	1	2	2024-05-30 22:13:58.184783	2024-05-30 22:13:58.184783
28	me comment	\N	\N	1	2	2024-05-30 22:28:06.491956	2024-05-30 22:28:06.491956
30	hi	\N	\N	1	2	2024-05-30 22:42:13.968731	2024-05-30 22:42:13.968731
31	qq	\N	4	1	2	2024-05-30 22:47:06.342649	2024-05-30 22:47:06.342649
32	hello	\N	\N	1	2	2024-05-30 23:30:58.955722	2024-05-30 23:30:58.955722
35	ddd	4	\N	1	2	2024-05-30 23:54:59.200854	2024-05-30 23:54:59.200854
39	1ds	\N	\N	1	15	2024-05-30 23:59:48.945787	2024-05-30 23:59:48.945787
40	ggg	1	\N	1	8	2024-05-31 00:21:06.576077	2024-05-31 00:21:14.429393
41	uu	\N	4	1	2	2024-05-31 00:30:31.17103	2024-05-31 00:30:31.17103
42	1	\N	4	1	2	2024-05-31 00:53:33.597078	2024-05-31 00:53:33.597078
43	6	\N	4	1	2	2024-05-31 00:53:42.031673	2024-05-31 00:53:42.031673
44	sfs	\N	4	1	2	2024-05-31 00:53:51.714668	2024-05-31 00:53:51.714668
45	ds	\N	4	1	2	2024-05-31 00:54:45.851048	2024-05-31 00:54:45.851048
46	1	\N	4	1	2	2024-05-31 01:27:05.099621	2024-05-31 01:27:05.099621
47	3	\N	4	1	2	2024-05-31 01:27:51.954727	2024-05-31 01:27:51.954727
48	test	\N	4	1	2	2024-05-31 10:51:46.42577	2024-05-31 10:51:46.42577
49	123	\N	1	1	2	2024-05-31 10:56:58.963028	2024-05-31 10:56:58.963028
50	ddd	\N	1	1	2	2024-05-31 11:00:08.668056	2024-05-31 11:00:08.668056
51	hhhh	\N	1	1	2	2024-05-31 11:03:11.630565	2024-05-31 11:03:11.630565
52	123	\N	22	1	2	2024-05-31 11:06:07.389308	2024-05-31 11:06:07.389308
53	d	\N	22	1	2	2024-05-31 11:11:19.27114	2024-05-31 11:11:19.27114
54	ttt	\N	22	1	2	2024-05-31 11:14:36.417602	2024-05-31 11:14:36.417602
55	dfd	\N	22	1	2	2024-05-31 11:15:07.767206	2024-05-31 11:15:07.767206
56	text	\N	22	1	2	2024-05-31 11:16:46.696672	2024-05-31 11:16:46.696672
4	hello!12	\N	\N	1	2	2024-05-28 14:45:56.333562	2024-05-31 11:17:01.175831
5	hello	\N	\N	1	2	2024-05-28 14:46:19.054499	2024-05-31 11:42:03.749776
58	fd	\N	\N	1	2	2024-05-31 11:45:47.465813	2024-05-31 11:45:47.465813
59	s	\N	\N	1	2	2024-05-31 11:46:52.443979	2024-05-31 11:46:52.443979
60	dsd	\N	\N	1	2	2024-05-31 11:47:06.996936	2024-05-31 11:47:06.996936
61	ds	\N	\N	1	2	2024-05-31 11:48:31.500742	2024-05-31 11:48:31.500742
62	ds	\N	\N	1	2	2024-05-31 11:50:41.726017	2024-05-31 11:50:41.726017
63	dsds	\N	\N	1	2	2024-05-31 11:50:51.689504	2024-05-31 11:50:51.689504
64	ds	\N	\N	1	2	2024-05-31 11:52:07.696848	2024-05-31 11:52:07.696848
65	sds	\N	\N	1	2	2024-05-31 11:53:12.265998	2024-05-31 11:53:12.265998
69	ddd	\N	\N	1	2	2024-05-31 11:55:52.966165	2024-05-31 11:55:52.966165
70	fds	\N	\N	1	2	2024-05-31 11:58:14.681446	2024-05-31 11:58:14.681446
72	123	\N	\N	1	2	2024-05-31 11:58:48.643227	2024-05-31 11:58:48.643227
73	123	\N	\N	1	2	2024-05-31 11:58:58.36507	2024-05-31 11:58:58.36507
74	123	\N	\N	1	2	2024-05-31 11:59:38.599819	2024-05-31 11:59:38.599819
75	DDS	\N	\N	1	2	2024-05-31 11:59:47.100864	2024-05-31 11:59:47.100864
1	some text	\N	\N	1	2	2024-05-28 13:49:23.960981	2024-05-31 16:06:06.204483
97	123	\N	15	1	2	2024-05-31 16:06:23.817703	2024-05-31 16:06:23.817703
92	cxds1232	\N	\N	1	4	2024-05-31 13:55:01.868102	2024-05-31 15:38:35.846861
95	123	\N	92	1	4	2024-05-31 15:41:04.560909	2024-05-31 15:41:04.560909
100	1233	\N	4	5	2	2024-06-03 13:52:17.581673	2024-06-03 13:52:17.581673
101	A	\N	\N	5	2	2024-06-03 13:53:14.057484	2024-06-03 13:53:14.057484
103	my comment	\N	\N	5	4	2024-06-04 15:52:00.565822	2024-06-04 15:52:00.565822
105	дыаа	2	\N	1	8	2024-06-10 15:47:19.969483	2024-06-10 15:47:19.969483
107	reply	\N	105	10	8	2024-06-11 21:10:52.062134	2024-06-11 21:10:52.062134
29	saq	2	\N	1	2	2024-05-30 22:28:10.228401	2024-06-20 22:12:21.015759
68	test144	\N	\N	1	2	2024-05-31 11:55:37.927875	2024-06-20 22:37:50.905227
123	v0ondaaaa!	4	\N	10	11	2024-06-12 16:21:58.124963	2024-06-12 16:21:58.124963
124	good!	\N	123	1	11	2024-06-12 16:22:50.294972	2024-06-12 16:22:50.294972
127	слово слово слово словослово  слово слово слово словослово слово	\N	123	1	11	2024-06-12 16:32:56.917291	2024-06-12 16:32:56.917291
125	goood!	\N	123	1	11	2024-06-12 16:26:04.641037	2024-06-12 16:26:04.641037
131	my comm	3	\N	1	11	2024-06-12 18:57:49.440072	2024-06-12 18:57:49.440072
132	sdss	\N	\N	1	11	2024-06-12 19:01:18.41689	2024-06-12 19:01:18.41689
133	12333	4	\N	1	11	2024-06-12 19:05:07.809904	2024-06-12 19:05:07.809904
134	12dddd	5	\N	1	11	2024-06-12 19:07:10.674347	2024-06-12 19:07:10.674347
\.


--
-- Data for Name: denied_permissions; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.denied_permissions (id, user_id, permission_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.favorites (id, user_id, product_id, created_at, updated_at) FROM stdin;
8	1	10	2024-04-22 11:41:56.156824	2024-04-22 11:41:56.156824
9	1	20	2024-04-22 12:15:15.562193	2024-04-22 12:15:15.562193
16	1	4	2024-05-14 18:43:38.413118	2024-05-14 18:43:38.413118
35	1	12	2024-06-08 18:17:47.133555	2024-06-08 18:17:47.133555
36	1	15	2024-06-08 19:04:19.082271	2024-06-08 19:04:19.082271
37	1	6	2024-06-09 09:59:51.484001	2024-06-09 09:59:51.484001
39	4	11	2024-06-20 15:30:58.811863	2024-06-20 15:30:58.811863
43	1	3	2024-06-21 23:25:24.556773	2024-06-21 23:25:24.556773
46	1	19	2024-06-30 13:54:11.285369	2024-06-30 13:54:11.285369
47	1	16	2025-08-26 02:59:12.884186	2025-08-26 02:59:12.884186
\.


--
-- Data for Name: jwt_denylist; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.jwt_denylist (id, jti, exp) FROM stdin;
1	02a40f95-74a6-4f83-910c-3e27f3e5e71b	2024-05-10 17:55:45
2	7ef30dbf-77d7-4802-98c6-3177289b9d41	2024-05-10 20:28:24
3	e95f3667-2598-4423-abf2-9f08974900a1	2024-05-10 20:29:02
4	deed052e-7861-4470-81bc-ae3e51902079	2024-05-10 20:31:25
5	a23660c8-8c0d-43fa-b042-c28e21625b6b	2024-05-10 22:43:43
6	79c6665b-6f18-41bf-9af8-f53af2980cff	2024-05-10 23:18:07
7	8f5da306-4fa1-4a78-b4f7-6b331c061e5c	2024-05-13 19:54:12
8	5a31c79f-1770-4bd3-a104-4035262282c2	2024-07-09 19:41:01
9	5e8dfcfd-291b-4c47-a6b0-4755bb7db65d	2024-07-16 20:14:33
10	90da674d-37ee-4aa2-8023-6089d12a8adc	2024-07-17 16:33:43
11	85b94ba5-36bf-46db-9afd-84922ae9956f	2024-07-17 17:22:05
12	f3decb5b-7def-4e9e-b814-2fea10a79f6e	2024-07-17 17:06:49
13	7a13252f-060a-49d1-b652-731e4e7cd41b	2024-07-19 19:46:45
14	9344bf37-3866-48e4-ab7d-3c364e072b93	2024-07-19 19:52:00
15	c380367c-5b0f-428f-bfcd-9ee222e3def4	2024-07-19 20:03:32
16	b8fa428e-bee8-4776-9c4b-19a4af345c48	2024-07-19 20:23:52
17	0cbbdc1f-17c4-4cfe-8fec-fb651ce8ff10	2024-07-19 20:27:00
18	7a583514-1dc0-46cf-b941-c42a319bd091	2024-07-19 20:27:34
19	2bbd241d-10df-405a-8e57-a87395288bc6	2024-07-19 20:31:51
20	96e20745-16fe-4225-8ab9-cfbfbdfdd703	2024-07-19 20:34:18
21	d3ec22c2-6bdd-4603-a05c-3fec0a0761cb	2024-07-19 20:34:34
22	358c4e36-b367-4e18-b6f8-7f7c8b3cc00a	2024-07-19 20:35:24
23	fc07ff8f-0b9f-4746-b8ac-51ae07ed4220	2024-07-19 21:18:35
24	7a14a103-c319-4f0a-94ae-c5d04673574e	2024-07-19 21:39:18
25	3d55cd1e-ffcc-4c4b-aab3-4d5352251fb8	2024-07-19 22:12:39
26	d37791ec-964b-4c4d-9b4f-0b749bfdd30f	2024-07-19 22:30:06
27	6a44e50f-4439-47c2-afbc-209e744dea1d	2024-07-21 11:33:57
28	262d1f3a-0da1-4459-97d8-c197bd826a95	2024-07-21 11:40:25
29	c7c8f448-e732-48bd-9b7f-0e345320b435	2024-07-21 11:40:42
30	d8617817-deb6-446d-8f1f-bf2472ef3d7a	2024-07-21 11:42:48
31	d1a0ed8b-6645-44f5-832d-a43b14959aac	2024-07-21 11:43:04
32	85bcc332-900f-4378-bac5-fd86f23120de	2024-07-21 11:43:25
33	69897530-9d14-4e6f-9aa1-bd219ba13650	2024-07-21 11:44:05
34	6203757e-fbc6-4202-9396-93cdf2bc1eb6	2024-07-21 11:44:17
35	37b610b3-bafd-4495-affb-22f0d8cbf982	2024-07-21 11:45:05
36	1b40d143-ca65-4d59-8e3f-e9f9f0889528	2024-07-21 11:45:18
37	fbf50603-8c96-49d7-876e-62546d66df70	2024-07-21 11:45:27
38	79b4cf4d-70fe-4844-a273-fbd4cba03a02	2024-07-21 11:45:51
39	59b8f6d2-798f-4cfe-a775-ee2998a9b232	2024-07-21 11:46:06
40	95c41995-867b-4bb4-a04c-e32f9c0b8f57	2024-07-23 20:18:41
41	e1e20403-a093-4bd3-9f28-6b03b5f7d5cd	2024-07-23 19:17:09
42	e5bc1db5-4f5f-4060-b17b-c5e44024bda0	2024-07-28 11:23:49
43	797d7e0f-d76d-4224-87d6-56f751c2e276	2024-07-24 11:18:31
44	62b71d4d-ce1f-49f2-8462-0173604c377e	2024-07-29 20:45:40
45	8859ae63-6ee1-4484-a07b-a6402839e192	2024-07-30 14:56:28
46	32c0fe91-265f-4272-a625-facd6e635338	2024-07-30 22:38:09
47	dea16139-442f-48b8-a46a-f4d0595d0941	2024-07-30 22:39:12
48	077905de-5504-46e7-bcb5-7810207bea40	2024-07-30 22:40:07
49	a7046c9f-d1cf-43c9-a07f-1cc187ed2dc6	2024-07-30 15:43:31
50	0d923d47-54fc-49f3-9c89-b1389b64dab8	2024-07-30 22:44:18
51	ce6294b9-7eb1-44ce-90cd-8ab88eaf8e32	2024-07-30 22:43:33
52	c17cafc5-30a4-443d-8a75-f702a232461e	2024-07-30 22:53:02
53	221f94c6-ba7a-4c16-83d9-21f4075ffbca	2024-07-30 22:55:15
54	833b0e0c-8ab2-49e6-a2ab-3ff19e9f23ce	2024-07-30 23:03:52
55	ebe71810-26af-47e0-a742-3f9a71aa106c	2024-07-30 23:07:35
56	abdd7807-7e1a-4fe5-9dbb-bb39c0cdf602	2024-07-30 23:10:55
57	2bbff31f-f0e4-4da8-8cf9-792076e27928	2024-07-30 23:16:26
58	fab2acac-722e-4430-95eb-cbd05ee72140	2024-07-30 23:19:19
59	a41b3d07-bc16-440a-ae2b-0e9f7c5facd8	2024-07-30 23:20:28
60	c9d07a35-2d7e-4fc0-b771-422f0df4dbaf	2024-07-30 23:23:52
61	570ac5b2-efaf-4da9-90bd-5a9d1f5afbda	2024-07-30 23:27:52
62	c1fd82f6-74dc-4f48-a6a5-ec83aaef82d1	2024-07-30 23:29:52
63	c7e227b8-68e7-4ad0-9579-9bca802ddf34	2024-07-30 23:31:01
64	844aab8c-07db-49c1-bb54-2c2cd0001289	2024-07-30 23:35:11
65	9e008613-332d-423d-b0f0-879be13827f1	2024-07-30 23:39:55
66	d84cba10-e3d2-45cf-a399-fdac1bd680a0	2024-07-30 23:44:59
67	1ff2e9b5-4ab0-406f-b3b3-71565d29b54d	2024-07-30 23:54:33
68	a4c10477-b197-40ef-b30e-6d19c1e452da	2024-07-30 23:58:45
69	29e91caa-ed76-457e-bb1c-a451dd2977da	2024-07-31 00:03:04
70	097c7747-d3a4-4d91-9882-696db5195797	2024-07-31 00:06:08
71	665e4d2a-9ab3-4588-a313-4bd679e2316e	2024-07-31 00:13:37
72	44d9ea4b-f059-4b6f-a646-bd7037bb2753	2024-07-31 11:42:31
73	c633d805-75d8-4ed0-8c41-10e31804ceda	2024-07-31 12:50:47
74	3a1d9df8-cf81-416f-a13c-6d4efc147450	2024-07-31 12:51:18
75	aaa34035-735e-4595-a7fc-983d79c8895f	2024-07-31 11:42:48
76	225e37c8-6386-4eba-be37-432200c7ee1f	2024-08-01 17:30:45
77	98ae63b8-b7da-4a66-b650-0b22c8b66147	2024-08-03 11:06:39
78	9bb64232-586c-403b-9e68-74985fbed5d6	2024-08-03 12:51:26
79	bc355051-2a7c-4106-8a2e-a21aaf267e41	2024-08-04 10:13:56
80	3aface93-af8d-4b00-865a-1d6b5346c505	2024-08-04 10:21:25
81	91883eee-5f72-40ed-a69f-1a4349859ca9	2024-08-04 10:21:51
82	ffd82b8e-9128-40c1-89de-06c5898a244e	2024-08-04 10:22:28
83	44e3440f-4571-4448-a945-84c04da406df	2024-08-04 10:22:42
84	e7b54e94-f1b9-4729-aca2-bb40cdfe58de	2024-08-04 10:23:43
85	491be2f5-98b3-4d11-bae8-038d7a61acd9	2024-08-04 10:29:08
86	80d6557a-ede3-41d1-b558-17e355115a86	2024-08-04 10:29:22
87	01bab8a5-f6a8-4a66-95db-5541c2187f1f	2024-08-04 10:29:38
88	a2ffa950-1162-41ce-9440-aeb1d00b18fa	2024-08-03 20:39:41
89	5753aa4a-7191-481f-9924-56b3c5149de0	2024-08-01 19:03:10
90	f563af31-6756-4aae-8932-e38e82e41765	2024-08-04 15:24:06
91	9bfe69db-3e73-4e15-9b22-d438480b630e	2024-08-15 15:11:06
92	9665e801-5fde-4cf6-a983-e93055f7b7b3	2024-08-15 15:58:33
93	93056efe-8482-40f3-a3aa-0eea250b89a0	2024-08-10 17:31:28
94	0ceec960-a497-4a6c-aa30-dd8fc97f1c15	2024-08-16 23:26:44
95	3c54632d-5b60-4aeb-8597-3dbee1ca9e6a	2024-08-18 13:32:17
96	e124e9a2-2cb7-479c-bcb1-dc9cb9e38ef0	2024-08-22 02:13:11
97	411fd7f6-167b-476f-8118-663a826c1dfe	2024-08-04 13:31:24
98	fd1bf6c8-ee86-4bca-81a6-70b51aaa5e2c	2024-08-15 18:07:55
99	aa40d26c-2a5a-483d-9cb6-251178ffeaf6	2024-08-24 15:48:21
100	1c117674-e927-4586-9da7-0c22e0e44c77	2024-08-24 15:49:22
101	93a6c564-2711-4709-b220-b0f33898115a	2024-08-24 15:49:55
102	3d230f78-6be2-4e92-9831-580c625e2bb9	2024-08-22 15:19:42
103	8b030b8d-d255-4f15-8af9-02474722f65c	2024-08-22 02:13:55
104	33737306-397c-470a-b02c-266bd4a42037	2025-10-21 03:01:00
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.messages (id, chat_id, user_id, text, created_at, updated_at) FROM stdin;
268	1	1	3	2024-05-23 13:09:21.29613	2024-05-23 13:09:21.29613
2	2	1	как какать?	2024-04-25 21:05:27.57302	2024-04-25 21:05:27.57302
3	2	1		2024-04-26 09:12:02.556239	2024-04-26 09:12:02.556239
4	2	1	test	2024-04-26 09:12:05.786681	2024-04-26 09:12:05.786681
5	2	1	fdfd	2024-04-26 09:12:09.219806	2024-04-26 09:12:09.219806
6	2	1	fdfd	2024-04-26 09:12:09.286074	2024-04-26 09:12:09.286074
7	2	1	fdfsfsd	2024-04-26 09:12:11.462201	2024-04-26 09:12:11.462201
8	2	1	fdfsfsd	2024-04-26 09:12:11.574132	2024-04-26 09:12:11.574132
9	2	1	fdsfsdfsd	2024-04-26 09:12:13.471581	2024-04-26 09:12:13.471581
269	1	1	sd	2024-05-23 13:10:44.654438	2024-05-23 13:10:44.654438
270	1	1	3	2024-05-23 13:10:58.377121	2024-05-23 13:10:58.377121
271	1	1	test	2024-05-23 13:11:44.911206	2024-05-23 13:11:44.911206
272	1	1	3	2024-05-23 13:12:56.947788	2024-05-23 13:12:56.947788
273	1	1	fdfsd	2024-05-23 13:12:58.827879	2024-05-23 13:12:58.827879
280	1	1	ds	2024-05-23 13:33:10.963682	2024-05-23 13:33:10.963682
281	1	1	2w	2024-05-23 13:37:09.273064	2024-05-23 13:37:09.273064
305	1	1	a	2024-05-23 14:34:00.328962	2024-05-23 14:34:00.328962
307	1	1	e	2024-05-23 14:38:55.706817	2024-05-23 14:38:55.706817
19	4	5	вопрос	2024-04-26 11:14:44.858871	2024-04-26 11:14:44.858871
20	4	1	ответ	2024-04-26 11:17:22.634839	2024-04-26 11:17:22.634839
21	4	5	хуй	2024-04-26 11:20:26.283944	2024-04-26 11:20:26.283944
22	4	5	f	2024-04-27 10:20:09.42801	2024-04-27 10:20:09.42801
23	4	5	sds	2024-04-27 10:21:05.431114	2024-04-27 10:21:05.431114
24	2	1	fd	2024-04-27 10:25:18.678595	2024-04-27 10:25:18.678595
25	2	1	fd	2024-04-27 10:26:07.840149	2024-04-27 10:26:07.840149
26	2	1	123	2024-04-27 10:26:26.466832	2024-04-27 10:26:26.466832
27	2	1	1	2024-04-27 10:26:42.868238	2024-04-27 10:26:42.868238
28	2	1	3	2024-04-27 10:27:34.797613	2024-04-27 10:27:34.797613
29	2	1	23	2024-04-27 10:28:01.144164	2024-04-27 10:28:01.144164
30	2	1	1	2024-04-27 10:28:29.492751	2024-04-27 10:28:29.492751
31	4	1	123	2024-04-27 10:29:16.069252	2024-04-27 10:29:16.069252
32	4	5	1	2024-04-27 10:29:19.646806	2024-04-27 10:29:19.646806
33	4	1	2	2024-04-27 10:29:52.154986	2024-04-27 10:29:52.154986
34	4	5	2	2024-04-27 10:29:57.241779	2024-04-27 10:29:57.241779
35	4	1	test	2024-04-27 10:33:12.627105	2024-04-27 10:33:12.627105
36	4	1	s	2024-04-27 10:44:47.356092	2024-04-27 10:44:47.356092
37	4	5	d	2024-04-27 10:46:37.584927	2024-04-27 10:46:37.584927
38	4	5	s	2024-04-27 10:48:45.75307	2024-04-27 10:48:45.75307
39	4	1	123	2024-04-27 10:48:51.062276	2024-04-27 10:48:51.062276
40	4	1	dsd	2024-04-27 10:57:41.371798	2024-04-27 10:57:41.371798
41	4	1	2	2024-04-27 10:58:40.143715	2024-04-27 10:58:40.143715
42	2	1	2	2024-04-27 11:04:56.583055	2024-04-27 11:04:56.583055
43	2	1	w	2024-04-27 11:19:07.817711	2024-04-27 11:19:07.817711
44	2	1	dsds	2024-04-27 11:19:35.521212	2024-04-27 11:19:35.521212
45	4	5	4	2024-04-27 11:20:45.076023	2024-04-27 11:20:45.076023
46	2	1	3	2024-04-27 11:20:52.802484	2024-04-27 11:20:52.802484
47	2	1	123	2024-04-27 11:21:13.335944	2024-04-27 11:21:13.335944
48	2	1	ds	2024-04-27 11:21:32.642454	2024-04-27 11:21:32.642454
49	2	1	a	2024-04-27 11:21:58.930728	2024-04-27 11:21:58.930728
50	2	1	123	2024-04-27 11:22:18.717831	2024-04-27 11:22:18.717831
51	2	5	sd	2024-04-27 11:25:01.225123	2024-04-27 11:25:01.225123
52	4	1	2	2024-04-27 11:27:59.983778	2024-04-27 11:27:59.983778
53	4	1	2332	2024-04-27 11:28:11.690617	2024-04-27 11:28:11.690617
54	4	1	123	2024-04-27 11:33:04.122063	2024-04-27 11:33:04.122063
55	4	1	d	2024-04-27 11:33:06.505663	2024-04-27 11:33:06.505663
56	4	1	d	2024-04-27 11:34:59.165349	2024-04-27 11:34:59.165349
57	4	5	s	2024-04-27 11:35:26.317062	2024-04-27 11:35:26.317062
58	4	1	123	2024-04-27 11:36:32.042617	2024-04-27 11:36:32.042617
59	4	1	123	2024-04-27 11:42:10.093665	2024-04-27 11:42:10.093665
60	4	1	test	2024-04-27 11:42:28.872645	2024-04-27 11:42:28.872645
61	4	1	Hello!	2024-04-27 11:47:16.921381	2024-04-27 11:47:16.921381
62	4	1	d	2024-04-27 11:47:44.954672	2024-04-27 11:47:44.954672
63	4	5	sds	2024-04-27 11:47:53.171315	2024-04-27 11:47:53.171315
64	4	1	asda	2024-04-27 11:48:50.526792	2024-04-27 11:48:50.526792
65	4	1	hello!	2024-04-27 11:49:44.616244	2024-04-27 11:49:44.616244
66	4	1	dsds	2024-04-27 11:50:08.989796	2024-04-27 11:50:08.989796
67	4	1	fsfs	2024-04-27 11:50:13.530813	2024-04-27 11:50:13.530813
68	4	1	123	2024-04-27 11:50:16.149029	2024-04-27 11:50:16.149029
69	4	1	dsd	2024-04-27 11:50:41.972083	2024-04-27 11:50:41.972083
70	4	1	sds	2024-04-27 11:50:45.187504	2024-04-27 11:50:45.187504
71	4	1	123	2024-04-27 11:50:53.516941	2024-04-27 11:50:53.516941
72	4	1	hello1	2024-04-27 11:53:02.02754	2024-04-27 11:53:02.02754
73	4	1	hello2	2024-04-27 11:53:05.436192	2024-04-27 11:53:05.436192
74	4	1	hello3	2024-04-27 11:53:10.565651	2024-04-27 11:53:10.565651
75	4	1	hhh	2024-04-27 11:53:24.88815	2024-04-27 11:53:24.88815
76	4	1	nn	2024-04-27 13:28:15.746642	2024-04-27 13:28:15.746642
77	4	5	fsdf	2024-04-27 13:29:21.912394	2024-04-27 13:29:21.912394
78	4	1	fdfs	2024-04-27 13:29:33.711951	2024-04-27 13:29:33.711951
79	4	1	hello	2024-04-27 13:31:44.298142	2024-04-27 13:31:44.298142
80	4	1	dsds	2024-04-27 13:47:01.808411	2024-04-27 13:47:01.808411
81	4	1	dsds	2024-04-27 14:16:22.998914	2024-04-27 14:16:22.998914
82	4	1	123	2024-04-27 14:16:25.298484	2024-04-27 14:16:25.298484
83	4	1	dsd	2024-04-27 14:16:51.146329	2024-04-27 14:16:51.146329
84	4	5	fdf	2024-04-27 14:17:27.8317	2024-04-27 14:17:27.8317
85	4	1	dsds	2024-04-27 14:18:50.544025	2024-04-27 14:18:50.544025
86	4	1	123	2024-04-27 14:19:14.085596	2024-04-27 14:19:14.085596
87	4	1	fds	2024-04-27 14:19:25.047384	2024-04-27 14:19:25.047384
88	4	5	123	2024-04-27 14:19:27.091359	2024-04-27 14:19:27.091359
89	4	1	asa	2024-04-27 14:19:37.843717	2024-04-27 14:19:37.843717
90	4	5	hello	2024-04-27 14:19:42.297538	2024-04-27 14:19:42.297538
91	4	1	Приве!	2024-04-27 14:20:05.00798	2024-04-27 14:20:05.00798
92	4	1	ПРивет!	2024-04-27 14:28:13.856849	2024-04-27 14:28:13.856849
93	4	1	Admin!	2024-04-27 14:28:49.930797	2024-04-27 14:28:49.930797
94	4	1	test!	2024-04-27 14:28:58.457003	2024-04-27 14:28:58.457003
95	4	1	hi!	2024-04-27 14:29:40.082907	2024-04-27 14:29:40.082907
96	4	1	123	2024-04-27 15:01:02.078816	2024-04-27 15:01:02.078816
97	4	1	123	2024-04-27 15:01:02.134564	2024-04-27 15:01:02.134564
98	4	1	helo!	2024-04-27 15:01:08.840189	2024-04-27 15:01:08.840189
99	4	1	test	2024-04-27 15:07:45.519472	2024-04-27 15:07:45.519472
100	4	1	helo	2024-04-27 15:10:16.86915	2024-04-27 15:10:16.86915
101	4	1	hi!	2024-04-27 15:12:10.628637	2024-04-27 15:12:10.628637
102	4	1	hi	2024-04-27 15:12:31.122088	2024-04-27 15:12:31.122088
103	4	1	fghf	2024-04-27 15:12:44.931138	2024-04-27 15:12:44.931138
104	4	5	ghg	2024-04-27 15:12:48.302199	2024-04-27 15:12:48.302199
105	4	1	hi	2024-04-27 15:21:20.987713	2024-04-27 15:21:20.987713
106	4	1	faf	2024-04-27 15:21:26.535501	2024-04-27 15:21:26.535501
107	4	1	а ты что  делаешь ?	2024-04-27 15:21:36.566693	2024-04-27 15:21:36.566693
108	4	1	dsds	2024-04-27 15:22:29.146568	2024-04-27 15:22:29.146568
109	4	1	dsds	2024-04-27 15:22:29.188526	2024-04-27 15:22:29.188526
110	4	1	hi	2024-04-27 15:23:19.464561	2024-04-27 15:23:19.464561
111	4	1	hi	2024-04-27 15:24:35.305701	2024-04-27 15:24:35.305701
112	4	1	hi	2024-04-27 15:24:35.390749	2024-04-27 15:24:35.390749
113	4	1	hi	2024-04-27 15:24:43.601779	2024-04-27 15:24:43.601779
114	4	1	123	2024-04-27 15:41:28.969597	2024-04-27 15:41:28.969597
115	4	1	123	2024-04-27 15:43:16.170388	2024-04-27 15:43:16.170388
116	4	1	1	2024-04-27 15:43:18.302967	2024-04-27 15:43:18.302967
117	4	1	dwerw	2024-04-27 15:43:38.030449	2024-04-27 15:43:38.030449
118	4	1	d	2024-04-27 15:47:57.991054	2024-04-27 15:47:57.991054
119	4	1	d	2024-04-27 15:47:58.044896	2024-04-27 15:47:58.044896
120	4	1	fdsfsd	2024-04-27 15:48:01.512424	2024-04-27 15:48:01.512424
121	4	1	fdsfsd	2024-04-27 15:48:01.698813	2024-04-27 15:48:01.698813
122	4	1	123	2024-04-27 15:48:05.865135	2024-04-27 15:48:05.865135
123	4	1	123	2024-04-27 15:48:06.189433	2024-04-27 15:48:06.189433
124	4	1	123	2024-04-27 15:48:06.212943	2024-04-27 15:48:06.212943
125	4	1	123	2024-04-27 15:48:43.505626	2024-04-27 15:48:43.505626
126	4	1	1	2024-04-27 15:48:44.865498	2024-04-27 15:48:44.865498
127	4	1	d	2024-04-27 15:51:01.258846	2024-04-27 15:51:01.258846
128	4	1	dsds	2024-04-27 15:51:05.267358	2024-04-27 15:51:05.267358
129	4	1	24	2024-04-27 15:51:08.695774	2024-04-27 15:51:08.695774
130	4	1	d	2024-04-27 15:51:22.553342	2024-04-27 15:51:22.553342
131	4	1	dsds	2024-04-27 15:51:24.619924	2024-04-27 15:51:24.619924
132	4	1	dsds	2024-04-27 15:51:24.828291	2024-04-27 15:51:24.828291
133	4	1	dsds	2024-04-27 15:51:24.856622	2024-04-27 15:51:24.856622
134	4	1	hi!	2024-04-27 15:52:09.148954	2024-04-27 15:52:09.148954
135	2	5	vxc	2024-04-27 17:53:20.508065	2024-04-27 17:53:20.508065
136	4	5	ds	2024-04-27 19:14:15.660928	2024-04-27 19:14:15.660928
137	4	1	cs	2024-04-27 19:15:30.447606	2024-04-27 19:15:30.447606
138	4	5	123	2024-04-27 19:17:09.817629	2024-04-27 19:17:09.817629
139	2	1	react test message	2024-05-22 13:23:14.569151	2024-05-22 13:23:14.569151
140	2	1	more test	2024-05-22 13:24:50.708395	2024-05-22 13:24:50.708395
141	2	1	123	2024-05-22 13:25:56.292129	2024-05-22 13:25:56.292129
142	2	1	123	2024-05-22 13:25:56.339168	2024-05-22 13:25:56.339168
143	2	1	aa	2024-05-22 13:33:19.685375	2024-05-22 13:33:19.685375
144	2	1	hhfhf	2024-05-22 13:33:31.704267	2024-05-22 13:33:31.704267
145	2	1	1	2024-05-22 13:34:06.105241	2024-05-22 13:34:06.105241
146	2	1	1	2024-05-22 13:34:06.152778	2024-05-22 13:34:06.152778
147	2	1	as	2024-05-22 13:34:10.916679	2024-05-22 13:34:10.916679
148	2	1	test	2024-05-22 13:36:04.936783	2024-05-22 13:36:04.936783
149	2	1	dsdadas	2024-05-22 13:36:10.049636	2024-05-22 13:36:10.049636
150	2	1	dasdasdas	2024-05-22 13:36:12.996834	2024-05-22 13:36:12.996834
151	2	1	123	2024-05-22 13:36:16.448192	2024-05-22 13:36:16.448192
274	1	1	d	2024-05-23 13:21:52.990328	2024-05-23 13:21:52.990328
275	1	1	d111	2024-05-23 13:22:18.669488	2024-05-23 13:22:18.669488
276	1	1	AAAAAAAA	2024-05-23 13:22:42.445149	2024-05-23 13:22:42.445149
277	1	1	end	2024-05-23 13:22:54.753947	2024-05-23 13:22:54.753947
278	1	1	ws	2024-05-23 13:24:26.904663	2024-05-23 13:24:26.904663
282	1	1	d	2024-05-23 13:46:25.733173	2024-05-23 13:46:25.733173
283	1	1	dsds	2024-05-23 13:46:28.29399	2024-05-23 13:46:28.29399
284	1	1	d	2024-05-23 13:48:36.231775	2024-05-23 13:48:36.231775
285	1	1	fdas	2024-05-23 13:48:41.140847	2024-05-23 13:48:41.140847
286	1	1	sda	2024-05-23 13:50:47.346864	2024-05-23 13:50:47.346864
290	1	1	d	2024-05-23 13:54:21.16471	2024-05-23 13:54:21.16471
291	1	1	s	2024-05-23 13:57:08.804418	2024-05-23 13:57:08.804418
299	1	1	sds	2024-05-23 14:00:25.601169	2024-05-23 14:00:25.601169
306	1	1	as	2024-05-23 14:37:43.975608	2024-05-23 14:37:43.975608
309	1	1	sd	2024-05-23 14:40:11.769832	2024-05-23 14:40:11.769832
310	1	1	123	2024-05-23 14:40:13.517956	2024-05-23 14:40:13.517956
311	1	1	sss	2024-05-23 14:40:45.692984	2024-05-23 14:40:45.692984
312	1	1	a	2024-05-23 14:41:44.05214	2024-05-23 14:41:44.05214
313	1	1	as	2024-05-23 14:46:32.410703	2024-05-23 14:46:32.410703
314	1	1	342	2024-05-23 14:46:36.139364	2024-05-23 14:46:36.139364
315	1	1	11	2024-05-23 14:47:49.097997	2024-05-23 14:47:49.097997
316	1	1	d	2024-05-23 14:49:31.997826	2024-05-23 14:49:31.997826
321	4	1	привет!	2024-05-24 13:42:31.240973	2024-05-24 13:42:31.240973
322	4	1	1	2024-05-24 13:44:52.418079	2024-05-24 13:44:52.418079
324	5	1	2	2024-05-24 16:39:54.616275	2024-05-24 16:39:54.616275
325	5	1	3	2024-05-24 16:39:55.081934	2024-05-24 16:39:55.081934
326	5	1	4	2024-05-24 16:39:55.629748	2024-05-24 16:39:55.629748
327	5	1	5	2024-05-24 16:39:56.097436	2024-05-24 16:39:56.097436
328	5	1	6	2024-05-24 16:39:56.532374	2024-05-24 16:39:56.532374
329	5	1	7	2024-05-24 16:39:57.029623	2024-05-24 16:39:57.029623
330	5	1	8	2024-05-24 16:39:57.516328	2024-05-24 16:39:57.516328
331	5	1	9	2024-05-24 16:39:57.95828	2024-05-24 16:39:57.95828
332	5	1	10	2024-05-24 16:40:00.347283	2024-05-24 16:40:00.347283
333	5	1	11	2024-05-24 16:40:01.422535	2024-05-24 16:40:01.422535
334	5	1	12	2024-05-24 16:40:02.240976	2024-05-24 16:40:02.240976
335	5	1	13	2024-05-24 16:40:03.386589	2024-05-24 16:40:03.386589
336	5	1	14	2024-05-24 16:40:04.123994	2024-05-24 16:40:04.123994
337	5	1	15	2024-05-24 16:40:05.2443	2024-05-24 16:40:05.2443
338	5	1	16	2024-05-24 16:40:06.378902	2024-05-24 16:40:06.378902
339	5	1	17	2024-05-24 16:40:07.76815	2024-05-24 16:40:07.76815
340	5	1	18	2024-05-24 16:40:08.816318	2024-05-24 16:40:08.816318
341	5	1	19	2024-05-24 16:40:09.999074	2024-05-24 16:40:09.999074
343	5	1	20	2024-05-24 17:26:43.839577	2024-05-24 17:26:43.839577
344	5	1	21	2024-05-24 17:26:45.975761	2024-05-24 17:26:45.975761
345	5	1	22	2024-05-24 17:27:48.623406	2024-05-24 17:27:48.623406
346	5	1	23	2024-05-24 17:27:49.578001	2024-05-24 17:27:49.578001
347	5	1	24	2024-05-24 17:27:50.654727	2024-05-24 17:27:50.654727
348	5	1	25	2024-05-24 17:27:52.673695	2024-05-24 17:27:52.673695
349	5	1	26	2024-05-24 17:27:53.619149	2024-05-24 17:27:53.619149
350	5	1	27	2024-05-24 17:27:54.627326	2024-05-24 17:27:54.627326
351	5	1	28	2024-05-24 17:27:55.782961	2024-05-24 17:27:55.782961
352	5	1	29	2024-05-24 17:27:56.983171	2024-05-24 17:27:56.983171
353	5	1	30	2024-05-24 17:27:57.701907	2024-05-24 17:27:57.701907
354	5	1	31	2024-05-24 17:27:59.350346	2024-05-24 17:27:59.350346
355	5	1	32	2024-05-24 17:28:00.662783	2024-05-24 17:28:00.662783
356	5	1	33	2024-05-24 17:28:01.325836	2024-05-24 17:28:01.325836
357	5	1	34	2024-05-24 17:28:02.70269	2024-05-24 17:28:02.70269
358	5	1	35	2024-05-24 17:28:06.031588	2024-05-24 17:28:06.031588
359	4	1	хелоо	2024-05-24 17:28:50.622345	2024-05-24 17:28:50.622345
360	4	5	hi	2024-05-24 17:29:08.046467	2024-05-24 17:29:08.046467
362	4	5	test	2024-05-24 17:44:37.681974	2024-05-24 17:44:37.681974
279	1	1	wsdds	2024-05-23 13:32:07.906697	2024-05-23 13:32:07.906697
287	1	1	fd	2024-05-23 13:51:32.356628	2024-05-23 13:51:32.356628
288	1	1	f	2024-05-23 13:54:11.021118	2024-05-23 13:54:11.021118
289	1	1	sds	2024-05-23 13:54:13.098477	2024-05-23 13:54:13.098477
292	1	1	a	2024-05-23 13:57:40.501478	2024-05-23 13:57:40.501478
293	1	1	ds	2024-05-23 13:57:47.13917	2024-05-23 13:57:47.13917
294	1	1	f	2024-05-23 13:58:28.524817	2024-05-23 13:58:28.524817
295	1	1	s	2024-05-23 13:58:51.539546	2024-05-23 13:58:51.539546
296	1	1	asd	2024-05-23 13:58:54.398975	2024-05-23 13:58:54.398975
297	1	1	s	2024-05-23 13:59:07.989161	2024-05-23 13:59:07.989161
298	1	1	ds	2024-05-23 13:59:29.673567	2024-05-23 13:59:29.673567
300	1	1	s	2024-05-23 14:00:51.654648	2024-05-23 14:00:51.654648
301	1	1	s	2024-05-23 14:04:17.080537	2024-05-23 14:04:17.080537
302	1	1	a	2024-05-23 14:05:52.733626	2024-05-23 14:05:52.733626
303	1	1	c	2024-05-23 14:06:22.293938	2024-05-23 14:06:22.293938
304	1	1	sds	2024-05-23 14:09:40.312882	2024-05-23 14:09:40.312882
308	1	1	sd	2024-05-23 14:39:00.543584	2024-05-23 14:39:00.543584
317	4	1	d	2024-05-23 23:35:21.908093	2024-05-23 23:35:21.908093
318	4	1	as	2024-05-23 23:39:32.585092	2024-05-23 23:39:32.585092
319	4	1	sss	2024-05-23 23:39:57.366222	2024-05-23 23:39:57.366222
320	4	5	123	2024-05-23 23:40:03.810967	2024-05-23 23:40:03.810967
323	5	1	1	2024-05-24 16:31:11.406861	2024-05-24 16:31:11.406861
342	4	5	zx	2024-05-24 17:13:11.408254	2024-05-24 17:13:11.408254
361	4	1	Для того чтобы сообщения текущего пользователя отображались справа, а сообщения собеседника - слева, можно использовать CSS стили. Вот пример, как это можно реализовать:	2024-05-24 17:33:33.672384	2024-05-24 17:33:33.672384
363	4	5	dds	2024-05-25 22:41:00.730328	2024-05-25 22:41:00.730328
364	4	5	Вопрос	2024-05-28 22:43:07.704868	2024-05-28 22:43:07.704868
365	2	2	ее	2024-05-28 22:48:02.287153	2024-05-28 22:48:02.287153
366	6	1	test	2024-06-05 13:40:26.12658	2024-06-05 13:40:26.12658
367	7	1	test	2024-06-05 13:40:26.762095	2024-06-05 13:40:26.762095
368	8	1	ttt	2024-06-05 13:42:11.155047	2024-06-05 13:42:11.155047
369	9	1	123	2024-06-05 13:42:56.488489	2024-06-05 13:42:56.488489
370	10	1	aa	2024-06-05 13:43:18.460554	2024-06-05 13:43:18.460554
371	11	1	test1	2024-06-05 13:45:47.861817	2024-06-05 13:45:47.861817
372	12	1	testt	2024-06-05 13:47:33.680533	2024-06-05 13:47:33.680533
373	13	1	my super question	2024-06-05 13:48:04.752226	2024-06-05 13:48:04.752226
374	14	1	My second question!	2024-06-05 13:53:26.008339	2024-06-05 13:53:26.008339
375	15	10	My qst	2024-06-06 17:55:52.691072	2024-06-06 17:55:52.691072
376	15	1	Hello Vonda! What you want?	2024-06-06 17:56:59.695913	2024-06-06 17:56:59.695913
377	15	1	d	2024-06-06 18:02:56.92906	2024-06-06 18:02:56.92906
378	15	1	c	2024-06-06 18:03:55.389032	2024-06-06 18:03:55.389032
265	1	1	df	2024-05-23 13:04:41.626738	2024-05-23 13:04:41.626738
266	1	1	d	2024-05-23 13:05:17.299474	2024-05-23 13:05:17.299474
267	1	1	d	2024-05-23 13:05:57.261213	2024-05-23 13:05:57.261213
379	15	1	hello!	2024-06-06 18:04:33.429065	2024-06-06 18:04:33.429065
380	15	1	ff	2024-06-06 18:04:40.642343	2024-06-06 18:04:40.642343
381	15	1	dsds	2024-06-06 18:04:48.392096	2024-06-06 18:04:48.392096
382	15	1	123	2024-06-06 18:05:02.957141	2024-06-06 18:05:02.957141
383	15	10	aa	2024-06-06 18:05:06.549281	2024-06-06 18:05:06.549281
384	15	10	hello!	2024-06-06 18:07:10.231335	2024-06-06 18:07:10.231335
385	15	10	123	2024-06-06 18:07:19.792523	2024-06-06 18:07:19.792523
386	15	10	aa	2024-06-06 18:11:12.604596	2024-06-06 18:11:12.604596
387	15	1	as	2024-06-06 18:11:59.102691	2024-06-06 18:11:59.102691
388	15	1	tesr	2024-06-06 22:09:29.33288	2024-06-06 22:09:29.33288
389	15	1	123	2024-06-06 22:09:41.439765	2024-06-06 22:09:41.439765
390	15	1	tt	2024-06-06 22:09:55.849941	2024-06-06 22:09:55.849941
391	16	7	ttttt	2025-08-26 03:02:26.931594	2025-08-26 03:02:26.931594
392	16	7	123	2025-08-26 03:02:51.984967	2025-08-26 03:02:51.984967
393	16	1	fsdfsd	2025-08-26 03:02:54.942026	2025-08-26 03:02:54.942026
\.


--
-- Data for Name: mobility_string_translations; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.mobility_string_translations (id, locale, key, value, translatable_type, translatable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mobility_text_translations; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.mobility_text_translations (id, locale, key, value, translatable_type, translatable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.notifications (id, user_id, notifiable_type, notifiable_id, message, read, created_at, updated_at) FROM stdin;
8	1	Comment	104	Your comment was liked.	t	2024-06-11 16:30:42.183765	2024-06-11 16:42:47.638682
7	1	Comment	104	Your comment was liked.	t	2024-06-11 16:30:41.501518	2024-06-11 16:45:06.293473
6	1	Comment	104	Your comment was liked.	t	2024-06-11 16:30:41.024054	2024-06-11 16:45:18.275351
5	1	Comment	104	Your comment was liked.	t	2024-06-11 16:30:40.619021	2024-06-11 16:45:18.647325
4	1	Comment	104	Your comment was liked.	t	2024-06-11 16:30:40.206428	2024-06-11 16:45:18.891928
3	1	Comment	104	Your comment was liked.	t	2024-06-11 16:30:25.411627	2024-06-11 16:45:19.192346
2	1	Comment	104	Your comment was liked.	t	2024-06-11 16:29:55.562488	2024-06-11 16:45:19.545307
1	1	Comment	106	Your comment was liked.	t	2024-06-11 16:20:14.914554	2024-06-11 19:30:07.122949
42	10	Comment	110	admin replied to your comment: gssa with text: HI!	t	2024-06-12 15:53:55.250102	2024-06-12 16:42:27.830866
43	10	Comment	110	admin replied to your comment: gssa with text: GA!	t	2024-06-12 15:54:21.346193	2024-06-12 16:42:28.362299
44	10	Comment	110	vonda liked your comment: gssa	t	2024-06-12 15:55:37.276899	2024-06-12 16:42:28.71391
45	10	Comment	110	admin replied to your comment: gssa with text: dss	t	2024-06-12 16:17:34.350701	2024-06-12 16:42:28.936934
46	10	Comment	123	admin liked your comment: v0ondaaaa!	t	2024-06-12 16:22:45.167114	2024-06-12 16:42:29.138075
50	10	Comment	123	admin replied to your comment: v0ondaaaa! with text: слово слово слово словослово  слово слово слово словослово слово on product Milk	t	2024-06-12 16:32:56.931696	2024-06-12 16:42:31.532117
51	10	Comment	128	admin replied to your comment: test! with text: hhh on product Apple	t	2024-06-12 16:41:57.370822	2024-06-12 16:42:32.097295
49	10	Comment	110	admin replied to your comment: gssa with text: слово слово слово словослово  слово слово слово словослово слово on product Apple	t	2024-06-12 16:32:11.914676	2024-06-12 16:42:32.313856
48	10	Comment	123	admin replied to your comment: v0ondaaaa! with text: goood! on product Milk	t	2024-06-12 16:26:04.832711	2024-06-12 16:42:32.533002
47	10	Comment	123	admin replied to your comment: v0ondaaaa! with text: good!	t	2024-06-12 16:22:50.305951	2024-06-12 16:42:32.760028
41	10	Comment	110	admin replied to your comment: gssa with text: 2qqq	t	2024-06-11 22:42:32.301863	2024-06-12 16:42:33.310529
39	10	Comment	110	admin replied to your comment: gssa with text: gain!!!	t	2024-06-11 22:40:46.362217	2024-06-12 16:42:33.503934
38	10	Comment	110	admin ответил наш комментарий: gssa с текстом: again!	t	2024-06-11 22:37:53.652173	2024-06-12 16:42:33.971949
31	10	Comment	110	Translation missing: ru.like_comment	t	2024-06-11 21:56:19.107371	2024-06-12 16:42:34.148774
29	10	Comment	110	admin replied to your comment: gssa	t	2024-06-11 21:22:35.446904	2024-06-12 16:42:34.316327
37	1	Comment	104	vonda понравился ваш коммент: text!	t	2024-06-11 22:26:16.578293	2024-06-12 21:29:58.817975
36	1	Comment	104	vonda liked your comment: text!	t	2024-06-11 22:17:58.025604	2024-06-12 21:29:58.988052
35	1	Comment	104	vonda liked your comment: text!	t	2024-06-11 22:14:25.494151	2024-06-12 21:29:59.163183
34	1	Comment	104	Translation missing: en.like_comment	t	2024-06-11 22:11:50.972179	2024-06-12 21:29:59.357575
33	1	Comment	104	Translation missing: en.like_comment	t	2024-06-11 22:11:26.870585	2024-06-12 21:29:59.504597
32	1	Comment	106	Translation missing: en.like_comment	t	2024-06-11 21:57:53.183101	2024-06-12 21:29:59.680275
30	1	Comment	104	vonda replied to your comment: text!	t	2024-06-11 21:23:16.533248	2024-06-12 21:29:59.840685
28	1	Comment	104	vonda replied to your comment: text!	t	2024-06-11 21:21:27.957516	2024-06-12 21:30:00.003477
27	1	Comment	106	vonda replied to your comment: 123	t	2024-06-11 21:20:44.596854	2024-06-12 21:30:00.182963
26	1	Comment	106	admin liked your comment: 123	t	2024-06-11 21:19:07.736202	2024-06-12 21:30:00.345047
25	1	Comment	106	admin liked your comment: 123	t	2024-06-11 21:19:04.918698	2024-06-12 21:30:00.5342
24	1	Comment	106	vonda liked your comment: 123	t	2024-06-11 21:18:53.564068	2024-06-12 21:30:00.731128
23	1	Comment	92	admin liked your comment: cxds1232	t	2024-06-11 21:09:41.650258	2024-06-12 21:30:00.901273
22	1	Comment	92	vonda liked your comment: cxds1232	t	2024-06-11 17:44:44.328751	2024-06-12 21:30:01.095399
21	1	Comment	92	vonda liked your comment: cxds1232	t	2024-06-11 17:44:38.956042	2024-06-12 21:30:01.277535
20	1	Comment	92	vonda liked your comment: cxds1232	t	2024-06-11 17:43:15.206016	2024-06-12 21:30:01.447303
19	1	Comment	92	vonda liked your comment: cxds1232	t	2024-06-11 17:43:13.334602	2024-06-12 21:30:01.612719
18	1	Comment	92	vonda liked your comment: cxds1232	t	2024-06-11 17:42:58.933242	2024-06-12 21:30:01.810275
17	1	Comment	92	vonda liked your comment: cxds1232	t	2024-06-11 17:42:57.200419	2024-06-12 21:30:01.983196
16	1	Comment	92	vonda liked your comment: cxds1232	t	2024-06-11 17:42:52.623999	2024-06-12 21:30:02.173
15	1	Comment	92	vonda liked your comment: cxds1232	t	2024-06-11 17:42:48.196155	2024-06-12 21:30:02.362201
14	1	Comment	92	vonda liked your comment: cxds1232	t	2024-06-11 17:42:24.786462	2024-06-12 21:30:02.561002
13	1	Comment	106	vonda liked your comment: 123	t	2024-06-11 17:41:25.804323	2024-06-12 21:30:02.758626
12	1	Comment	106	vonda liked your comment: 123	t	2024-06-11 17:41:21.367837	2024-06-12 21:30:02.954109
11	1	Comment	106	vonda liked your comment: 123	t	2024-06-11 17:40:08.42871	2024-06-12 21:30:03.129436
10	1	Comment	106	vonda liked your comment: 123	t	2024-06-11 17:38:09.980244	2024-06-12 21:30:03.310722
9	1	Comment	106	vonda liked your comment: 123	t	2024-06-11 17:36:55.748265	2024-06-12 21:30:03.484373
65	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:23:48.707915	2024-06-12 21:30:10.849553
64	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:23:42.473733	2024-06-12 21:30:10.981137
63	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:23:25.876764	2024-06-12 21:30:11.133324
62	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:23:24.681437	2024-06-12 21:30:11.301254
61	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:23:21.88013	2024-06-12 21:30:11.46551
60	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:23:21.219644	2024-06-12 21:30:11.633917
59	10	Comment	130	admin liked your comment: ffds	t	2024-06-12 17:20:52.971442	2024-06-12 21:30:11.795969
58	10	Comment	130	admin liked your comment: ffds	t	2024-06-12 17:19:59.568802	2024-06-12 21:30:11.972891
57	10	Comment	130	admin liked your comment: ffds	t	2024-06-12 17:19:48.837871	2024-06-12 21:30:12.14127
55	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:18:57.674939	2024-06-12 21:30:12.476125
54	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:18:50.408759	2024-06-12 21:30:12.634269
53	10	Comment	128	admin liked your comment: test!	t	2024-06-12 16:59:56.682606	2024-06-12 21:30:12.838299
52	10	Comment	128	admin liked your comment: test!	t	2024-06-12 16:57:46.599036	2024-06-12 21:30:13.231975
67	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:24:02.290069	2024-06-12 21:30:10.520946
66	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:23:49.813622	2024-06-12 21:30:10.689275
75	2	Comment	15	vonda liked your comment: comment 3	f	2024-06-12 17:29:10.148313	2024-06-12 17:29:10.148313
76	2	Comment	15	vonda liked your comment: comment 3	f	2024-06-12 17:29:11.49376	2024-06-12 17:29:11.49376
89	2	Comment	19	admin liked your comment: comment 7	f	2024-06-12 18:04:00.444759	2024-06-12 18:04:00.444759
107	1	Comment	134	vonda понравился ваш коммент: 12dddd	t	2024-06-12 19:07:16.83102	2024-06-12 21:29:52.392747
106	1	Comment	132	vonda понравился ваш коммент: sdss	t	2024-06-12 19:01:25.554351	2024-06-12 21:29:52.590798
105	1	Comment	131	vonda понравился ваш коммент: my comm	t	2024-06-12 19:00:53.87451	2024-06-12 21:29:52.811778
104	1	Comment	131	vonda понравился ваш коммент: my comm	t	2024-06-12 18:58:00.4366	2024-06-12 21:29:52.97495
103	1	Comment	131	vonda понравился ваш коммент: my comm	t	2024-06-12 18:57:58.944494	2024-06-12 21:29:53.133028
102	1	Comment	131	vonda понравился ваш коммент: my comm	t	2024-06-12 18:57:56.67943	2024-06-12 21:29:53.285085
101	1	Comment	64	vonda понравился ваш коммент: ds	t	2024-06-12 18:57:22.278284	2024-06-12 21:29:53.564859
100	1	Comment	73	vonda понравился ваш коммент: 123	t	2024-06-12 18:56:00.140954	2024-06-12 21:29:53.721144
99	1	Comment	33	vonda понравился ваш коммент: new Comment!	t	2024-06-12 18:52:56.157278	2024-06-12 21:29:53.879525
98	1	Comment	28	vonda понравился ваш коммент: me comment	t	2024-06-12 18:42:51.783264	2024-06-12 21:29:54.190487
97	1	Comment	28	vonda понравился ваш коммент: me comment	t	2024-06-12 18:42:46.996194	2024-06-12 21:29:54.3351
96	1	Comment	69	vonda понравился ваш коммент: ddd	t	2024-06-12 18:22:26.538577	2024-06-12 21:29:54.487259
95	1	Comment	69	vonda понравился ваш коммент: ddd	t	2024-06-12 18:22:22.701311	2024-06-12 21:29:54.637655
94	1	Comment	69	vonda понравился ваш коммент: ddd	t	2024-06-12 18:22:04.376596	2024-06-12 21:29:54.797304
93	1	Comment	36	vonda понравился ваш коммент: ttt	t	2024-06-12 18:21:53.955761	2024-06-12 21:29:54.973407
92	1	Comment	32	vonda понравился ваш коммент: hello	t	2024-06-12 18:17:17.236551	2024-06-12 21:29:55.147501
91	1	Comment	32	vonda понравился ваш коммент: hello	t	2024-06-12 18:13:45.90843	2024-06-12 21:29:55.330954
90	1	Comment	32	vonda понравился ваш коммент: hello	t	2024-06-12 18:13:43.947559	2024-06-12 21:29:55.658917
88	1	Comment	61	vonda понравился ваш коммент: ds	t	2024-06-12 17:29:31.26387	2024-06-12 21:29:55.815144
87	1	Comment	61	vonda понравился ваш коммент: ds	t	2024-06-12 17:29:30.83727	2024-06-12 21:29:55.985271
86	1	Comment	61	vonda понравился ваш коммент: ds	t	2024-06-12 17:29:30.42858	2024-06-12 21:29:56.14234
85	1	Comment	61	vonda понравился ваш коммент: ds	t	2024-06-12 17:29:30.014505	2024-06-12 21:29:56.300742
84	1	Comment	61	vonda понравился ваш коммент: ds	t	2024-06-12 17:29:28.39245	2024-06-12 21:29:56.471411
83	1	Comment	61	vonda понравился ваш коммент: ds	t	2024-06-12 17:29:27.581984	2024-06-12 21:29:56.654326
82	1	Comment	61	vonda понравился ваш коммент: ds	t	2024-06-12 17:29:25.144832	2024-06-12 21:29:56.819733
81	1	Comment	72	vonda понравился ваш коммент: 123	t	2024-06-12 17:29:19.360581	2024-06-12 21:29:57.001335
80	1	Comment	72	vonda понравился ваш коммент: 123	t	2024-06-12 17:29:17.707919	2024-06-12 21:29:57.176034
79	1	Comment	72	vonda понравился ваш коммент: 123	t	2024-06-12 17:29:16.161812	2024-06-12 21:29:57.349292
78	1	Comment	72	vonda понравился ваш коммент: 123	t	2024-06-12 17:29:14.377907	2024-06-12 21:29:57.537825
77	1	Comment	35	vonda понравился ваш коммент: ddd	t	2024-06-12 17:29:12.491509	2024-06-12 21:29:57.733908
74	1	Comment	71	vonda понравился ваш коммент: 123	t	2024-06-12 17:29:08.386295	2024-06-12 21:29:57.899363
73	1	Comment	63	vonda понравился ваш коммент: dsds	t	2024-06-12 17:29:07.463341	2024-06-12 21:29:58.082505
72	1	Comment	70	vonda понравился ваш коммент: fds	t	2024-06-12 17:29:05.773033	2024-06-12 21:29:58.260505
71	1	Comment	67	vonda понравился ваш коммент: sds	t	2024-06-12 17:29:04.827434	2024-06-12 21:29:58.440997
40	1	Comment	106	vonda ответил наш комментарий: 123 с текстом: qq!	t	2024-06-11 22:42:11.026987	2024-06-12 21:29:58.628275
70	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:26:59.752475	2024-06-12 21:30:09.965588
69	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:26:58.881806	2024-06-12 21:30:10.15829
68	10	Comment	128	admin liked your comment: test!	t	2024-06-12 17:26:57.370763	2024-06-12 21:30:10.354604
56	10	Comment	123	admin liked your comment: v0ondaaaa!	t	2024-06-12 17:19:20.210783	2024-06-12 21:30:12.31968
108	1	Comment	29	admin понравился ваш коммент: saq	t	2024-06-20 22:14:12.264718	2024-06-20 22:14:23.215539
109	1	Comment	71	sasasasasa понравился ваш коммент: 123	t	2024-06-27 02:14:32.002099	2024-06-27 02:15:08.220753
110	32	Comment	157	You have been restricted from commenting. Comment:spam spam spam spam	t	2024-06-29 17:21:41.303846	2024-06-29 17:22:24.756595
111	32	Comment	159	Вам запретили оставлять комментарии. Комментарий: spapapapapapapa	t	2024-06-29 17:33:23.148968	2024-06-29 17:33:45.268417
112	32	Comment	160	Вам запретили оставлять комментарии. Комментарий: спамчик	t	2024-06-29 17:37:05.682872	2024-06-29 17:38:06.753585
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.order_items (id, order_id, product_id, quantity, created_at, updated_at, price) FROM stdin;
83	50	5	1	2024-05-26 14:26:49.440676	2024-05-26 14:26:49.440676	90.0
84	51	19	1	2024-05-27 19:22:32.992289	2024-05-27 19:22:32.992289	1.0
85	51	15	2	2024-05-27 19:22:32.998554	2024-05-27 19:22:32.998554	60.0
87	53	20	1	2024-05-27 20:26:11.070211	2024-05-27 20:26:11.070211	500.0
89	55	2	3	2024-05-28 22:34:27.713724	2024-05-28 22:34:27.713724	80.0
107	58	18	1	2024-05-29 12:27:59.916134	2024-05-29 12:27:59.916134	150.0
108	58	15	1	2024-05-29 12:27:59.921522	2024-05-29 12:27:59.921522	60.0
109	58	12	1	2024-05-29 12:27:59.926203	2024-05-29 12:27:59.926203	90.0
110	58	4	1	2024-05-29 12:27:59.930096	2024-05-29 12:27:59.930096	100.0
111	58	3	1	2024-05-29 12:27:59.9408	2024-05-29 12:27:59.9408	300.0
112	58	14	1	2024-05-29 12:27:59.944498	2024-05-29 12:27:59.944498	220.0
113	58	5	1	2024-05-29 12:27:59.948624	2024-05-29 12:27:59.948624	90.0
114	58	2	1	2024-05-29 12:27:59.952766	2024-05-29 12:27:59.952766	80.0
115	58	8	1	2024-05-29 12:27:59.956427	2024-05-29 12:27:59.956427	65.0
116	58	6	1	2024-05-29 12:27:59.960386	2024-05-29 12:27:59.960386	500.0
117	58	11	1	2024-05-29 12:27:59.964371	2024-05-29 12:27:59.964371	150.0
128	61	15	1	2024-05-29 12:46:28.664682	2024-05-29 12:46:28.664682	60.0
129	61	18	1	2024-05-29 12:46:28.670234	2024-05-29 12:46:28.670234	150.0
130	61	12	1	2024-05-29 12:46:28.674758	2024-05-29 12:46:28.674758	90.0
131	61	4	1	2024-05-29 12:46:28.678851	2024-05-29 12:46:28.678851	100.0
132	61	3	1	2024-05-29 12:46:28.683072	2024-05-29 12:46:28.683072	300.0
133	61	14	1	2024-05-29 12:46:28.686973	2024-05-29 12:46:28.686973	220.0
134	61	11	1	2024-05-29 12:46:28.690377	2024-05-29 12:46:28.690377	150.0
135	61	6	1	2024-05-29 12:46:28.694403	2024-05-29 12:46:28.694403	500.0
136	61	8	1	2024-05-29 12:46:28.698194	2024-05-29 12:46:28.698194	65.0
137	62	11	1	2024-05-29 12:49:05.423918	2024-05-29 12:49:05.423918	150.0
138	62	6	1	2024-05-29 12:49:05.427524	2024-05-29 12:49:05.427524	500.0
139	62	8	1	2024-05-29 12:49:05.430299	2024-05-29 12:49:05.430299	65.0
140	62	16	1	2024-05-29 12:49:05.433121	2024-05-29 12:49:05.433121	30.0
141	62	7	1	2024-05-29 12:49:05.436837	2024-05-29 12:49:05.436837	300.0
142	62	13	1	2024-05-29 12:49:05.440826	2024-05-29 12:49:05.440826	120.0
143	62	18	1	2024-05-29 12:49:05.443754	2024-05-29 12:49:05.443754	150.0
144	62	15	1	2024-05-29 12:49:05.446724	2024-05-29 12:49:05.446724	60.0
145	62	12	1	2024-05-29 12:49:05.450155	2024-05-29 12:49:05.450155	90.0
146	62	4	1	2024-05-29 12:49:05.453873	2024-05-29 12:49:05.453873	100.0
147	62	3	1	2024-05-29 12:49:05.457732	2024-05-29 12:49:05.457732	300.0
148	62	14	1	2024-05-29 12:49:05.461079	2024-05-29 12:49:05.461079	220.0
149	62	21	1	2024-05-29 12:49:05.464734	2024-05-29 12:49:05.464734	40.0
150	62	5	1	2024-05-29 12:49:05.468461	2024-05-29 12:49:05.468461	90.0
151	62	2	1	2024-05-29 12:49:05.471432	2024-05-29 12:49:05.471432	80.0
152	62	19	1	2024-05-29 12:49:05.475046	2024-05-29 12:49:05.475046	1.0
153	62	10	1	2024-05-29 12:49:05.478779	2024-05-29 12:49:05.478779	130.0
165	63	11	1	2024-05-29 12:49:53.755355	2024-05-29 12:49:53.755355	150.0
166	63	7	1	2024-05-29 12:49:53.759619	2024-05-29 12:49:53.759619	300.0
167	63	13	1	2024-05-29 12:49:53.764057	2024-05-29 12:49:53.764057	120.0
168	63	16	1	2024-05-29 12:49:53.767963	2024-05-29 12:49:53.767963	30.0
169	63	19	1	2024-05-29 12:49:53.77189	2024-05-29 12:49:53.77189	1.0
170	63	10	1	2024-05-29 12:49:53.77537	2024-05-29 12:49:53.77537	130.0
171	64	18	1	2024-05-31 16:37:11.332452	2024-05-31 16:37:11.332452	150.0
176	69	19	2	2024-06-01 23:02:23.410574	2024-06-01 23:02:23.410574	2.0
177	70	19	2	2024-06-01 23:05:32.067164	2024-06-01 23:05:32.067164	50.0
178	71	9	1	2024-06-02 14:01:32.053252	2024-06-02 14:01:32.053252	110.0
179	72	9	1	2024-06-02 14:09:31.565028	2024-06-02 14:09:31.565028	110.0
80	49	19	1	2024-05-26 13:54:54.098563	2024-05-26 13:54:54.098563	20.0
81	49	8	5	2024-05-26 13:54:54.102641	2024-05-26 13:54:54.102641	65.0
82	49	5	3	2024-05-26 13:54:54.105211	2024-05-26 13:54:54.105211	90.0
1	1	2	1	2024-04-18 12:14:54.850375	2024-04-18 12:14:54.850375	80.0
2	2	2	3	2024-04-18 13:27:32.957425	2024-04-18 13:27:32.957425	80.0
3	2	3	2	2024-04-18 13:27:32.960217	2024-04-18 13:27:32.960217	300.0
4	3	2	1	2024-04-18 16:30:22.825885	2024-04-18 16:30:22.825885	80.0
5	4	3	3	2024-04-18 17:33:38.639292	2024-04-18 17:33:38.639292	300.0
6	5	2	1	2024-04-18 18:45:17.556427	2024-04-18 18:45:17.556427	80.0
7	6	2	2	2024-04-18 18:49:14.790427	2024-04-18 18:49:14.790427	80.0
8	7	2	3	2024-04-20 16:31:51.939556	2024-04-20 16:31:51.939556	80.0
9	7	3	1	2024-04-20 16:31:51.941653	2024-04-20 16:31:51.941653	300.0
10	8	3	1	2024-04-20 16:41:39.225608	2024-04-20 16:41:39.225608	300.0
11	9	3	1	2024-04-20 16:48:50.700342	2024-04-20 16:48:50.700342	300.0
12	10	3	1	2024-04-20 16:49:05.63345	2024-04-20 16:49:05.63345	300.0
13	11	3	1	2024-04-20 16:52:39.078029	2024-04-20 16:52:39.078029	300.0
14	12	19	1	2024-04-21 12:49:52.315556	2024-04-21 12:49:52.315556	20.0
15	13	10	3	2024-04-22 14:35:27.526243	2024-04-22 14:35:27.526243	130.0
16	13	19	21	2024-04-22 14:35:27.531025	2024-04-22 14:35:27.531025	20.0
17	13	5	26	2024-04-22 14:35:27.533914	2024-04-22 14:35:27.533914	90.0
18	13	21	4	2024-04-22 14:35:27.536683	2024-04-22 14:35:27.536683	40.0
19	14	19	1	2024-04-22 14:39:57.256303	2024-04-22 14:39:57.256303	20.0
20	14	5	1	2024-04-22 14:39:57.260256	2024-04-22 14:39:57.260256	90.0
21	14	4	1	2024-04-22 14:39:57.264414	2024-04-22 14:39:57.264414	100.0
22	14	8	1	2024-04-22 14:39:57.269369	2024-04-22 14:39:57.269369	65.0
180	73	9	1	2024-06-06 15:02:29.881227	2024-06-06 15:02:29.881227	110.0
181	73	15	1	2024-06-06 15:02:29.887304	2024-06-06 15:02:29.887304	60.0
182	74	9	1	2024-06-06 15:12:37.689508	2024-06-06 15:12:37.689508	110.0
183	74	15	1	2024-06-06 15:12:37.694246	2024-06-06 15:12:37.694246	60.0
184	75	18	1	2024-06-09 10:02:41.790625	2024-06-09 10:02:41.790625	150.0
185	75	9	1	2024-06-09 10:02:41.795007	2024-06-09 10:02:41.795007	110.0
186	75	7	1	2024-06-09 10:02:41.79793	2024-06-09 10:02:41.79793	300.0
187	75	8	1	2024-06-09 10:02:41.800134	2024-06-09 10:02:41.800134	65.0
188	75	16	1	2024-06-09 10:02:41.802407	2024-06-09 10:02:41.802407	30.0
189	75	51	3	2024-06-09 10:02:41.805062	2024-06-09 10:02:41.805062	350.0
190	76	4	1	2024-06-13 20:57:12.290065	2024-06-13 20:57:12.290065	100.0
191	76	16	1	2024-06-13 20:57:12.296263	2024-06-13 20:57:12.296263	30.0
192	77	3	1	2024-06-13 21:01:45.494593	2024-06-13 21:01:45.494593	300.0
193	77	8	1	2024-06-13 21:01:45.497657	2024-06-13 21:01:45.497657	65.0
23	14	12	1	2024-04-22 14:39:57.273022	2024-04-22 14:39:57.273022	90.0
24	14	13	1	2024-04-22 14:39:57.277117	2024-04-22 14:39:57.277117	120.0
25	14	15	1	2024-04-22 14:39:57.280735	2024-04-22 14:39:57.280735	60.0
26	14	2	1	2024-04-22 14:39:57.284457	2024-04-22 14:39:57.284457	80.0
27	14	18	1	2024-04-22 14:39:57.288374	2024-04-22 14:39:57.288374	150.0
28	14	6	1	2024-04-22 14:39:57.2918	2024-04-22 14:39:57.2918	500.0
29	14	7	1	2024-04-22 14:39:57.297853	2024-04-22 14:39:57.297853	300.0
30	14	11	1	2024-04-22 14:39:57.301544	2024-04-22 14:39:57.301544	150.0
31	14	16	1	2024-04-22 14:39:57.305637	2024-04-22 14:39:57.305637	30.0
32	14	14	1	2024-04-22 14:39:57.311008	2024-04-22 14:39:57.311008	220.0
33	14	3	1	2024-04-22 14:39:57.314764	2024-04-22 14:39:57.314764	300.0
34	14	10	1	2024-04-22 14:39:57.318152	2024-04-22 14:39:57.318152	130.0
35	14	9	1	2024-04-22 14:39:57.321322	2024-04-22 14:39:57.321322	110.0
36	14	20	1	2024-04-22 14:39:57.325589	2024-04-22 14:39:57.325589	500.0
37	14	21	1	2024-04-22 14:39:57.329386	2024-04-22 14:39:57.329386	40.0
38	15	5	1	2024-04-22 17:53:39.22369	2024-04-22 17:53:39.22369	90.0
39	15	19	14	2024-04-22 17:53:39.227091	2024-04-22 17:53:39.227091	20.0
40	15	12	3	2024-04-22 17:53:39.231532	2024-04-22 17:53:39.231532	90.0
41	15	4	29	2024-04-22 17:53:39.234204	2024-04-22 17:53:39.234204	100.0
42	16	19	1	2024-04-25 15:06:08.411935	2024-04-25 15:06:08.411935	20.0
43	16	4	1	2024-04-25 15:06:08.415714	2024-04-25 15:06:08.415714	100.0
44	17	19	4	2024-04-29 14:17:04.41541	2024-04-29 14:17:04.41541	20.0
45	18	19	1	2024-05-14 14:53:06.150447	2024-05-14 14:53:06.150447	20.0
46	18	4	1	2024-05-14 14:53:06.157977	2024-05-14 14:53:06.157977	100.0
47	19	19	1	2024-05-14 19:48:52.705612	2024-05-14 19:48:52.705612	20.0
48	19	6	1	2024-05-14 19:48:52.711908	2024-05-14 19:48:52.711908	500.0
49	20	8	1	2024-05-14 19:50:15.852553	2024-05-14 19:50:15.852553	65.0
50	21	8	1	2024-05-14 19:50:41.205136	2024-05-14 19:50:41.205136	65.0
51	22	8	1	2024-05-14 19:55:44.920654	2024-05-14 19:55:44.920654	65.0
52	23	8	1	2024-05-14 19:56:14.78043	2024-05-14 19:56:14.78043	65.0
53	24	8	1	2024-05-14 19:58:20.848106	2024-05-14 19:58:20.848106	65.0
54	25	8	1	2024-05-14 19:59:18.317003	2024-05-14 19:59:18.317003	65.0
55	26	8	1	2024-05-14 20:11:27.012025	2024-05-14 20:11:27.012025	65.0
56	27	8	1	2024-05-14 20:13:40.782444	2024-05-14 20:13:40.782444	65.0
57	28	8	1	2024-05-14 20:16:17.017159	2024-05-14 20:16:17.017159	65.0
58	29	8	1	2024-05-14 20:16:52.608033	2024-05-14 20:16:52.608033	65.0
59	30	8	1	2024-05-14 20:17:38.758455	2024-05-14 20:17:38.758455	65.0
60	32	8	1	2024-05-15 12:43:45.907326	2024-05-15 12:43:45.907326	65.0
61	32	5	1	2024-05-15 12:43:45.911855	2024-05-15 12:43:45.911855	90.0
62	32	21	1	2024-05-15 12:43:45.914498	2024-05-15 12:43:45.914498	40.0
63	33	11	1	2024-05-15 12:46:02.026903	2024-05-15 12:46:02.026903	150.0
64	34	8	1	2024-05-15 12:50:54.399707	2024-05-15 12:50:54.399707	65.0
65	35	8	1	2024-05-15 12:51:20.541908	2024-05-15 12:51:20.541908	65.0
66	36	8	1	2024-05-15 12:55:11.576983	2024-05-15 12:55:11.576983	65.0
67	37	8	1	2024-05-15 12:57:01.81935	2024-05-15 12:57:01.81935	65.0
68	38	8	1	2024-05-15 12:59:29.461599	2024-05-15 12:59:29.461599	65.0
69	40	8	1	2024-05-15 13:01:39.422221	2024-05-15 13:01:39.422221	65.0
70	41	8	1	2024-05-15 13:03:12.979176	2024-05-15 13:03:12.979176	65.0
71	42	8	1	2024-05-15 13:12:46.150608	2024-05-15 13:12:46.150608	65.0
72	43	8	1	2024-05-16 20:28:08.813445	2024-05-16 20:28:08.813445	65.0
73	44	8	1	2024-05-16 20:46:35.546866	2024-05-16 20:46:35.546866	65.0
74	45	8	1	2024-05-16 20:51:30.532742	2024-05-16 20:51:30.532742	65.0
75	46	8	1	2024-05-16 20:52:35.963773	2024-05-16 20:52:35.963773	65.0
76	47	8	1	2024-05-16 21:00:46.898937	2024-05-16 21:00:46.898937	65.0
77	48	5	1	2024-05-26 11:10:28.743599	2024-05-26 11:10:28.743599	90.0
78	48	21	1	2024-05-26 11:10:28.746734	2024-05-26 11:10:28.746734	40.0
79	48	12	1	2024-05-26 11:10:28.749759	2024-05-26 11:10:28.749759	90.0
86	52	20	1	2024-05-27 19:25:34.933455	2024-05-27 19:25:34.933455	500.0
88	54	12	1	2024-05-27 20:58:24.277537	2024-05-27 20:58:24.277537	90.0
90	56	15	1	2024-05-29 12:10:13.201281	2024-05-29 12:10:13.201281	60.0
91	56	2	1	2024-05-29 12:10:13.205217	2024-05-29 12:10:13.205217	80.0
92	56	18	1	2024-05-29 12:10:13.208713	2024-05-29 12:10:13.208713	150.0
93	56	12	1	2024-05-29 12:10:13.211927	2024-05-29 12:10:13.211927	90.0
94	56	4	1	2024-05-29 12:10:13.217227	2024-05-29 12:10:13.217227	100.0
95	56	3	1	2024-05-29 12:10:13.222181	2024-05-29 12:10:13.222181	300.0
96	56	14	1	2024-05-29 12:10:13.225698	2024-05-29 12:10:13.225698	220.0
97	57	15	1	2024-05-29 12:15:06.567873	2024-05-29 12:15:06.567873	60.0
98	57	18	1	2024-05-29 12:15:06.572008	2024-05-29 12:15:06.572008	150.0
99	57	12	1	2024-05-29 12:15:06.57604	2024-05-29 12:15:06.57604	90.0
100	57	4	1	2024-05-29 12:15:06.579531	2024-05-29 12:15:06.579531	100.0
101	57	3	1	2024-05-29 12:15:06.582725	2024-05-29 12:15:06.582725	300.0
102	57	14	1	2024-05-29 12:15:06.58666	2024-05-29 12:15:06.58666	220.0
103	57	11	1	2024-05-29 12:15:06.59018	2024-05-29 12:15:06.59018	150.0
104	57	6	1	2024-05-29 12:15:06.595446	2024-05-29 12:15:06.595446	500.0
105	57	8	1	2024-05-29 12:15:06.599398	2024-05-29 12:15:06.599398	65.0
106	57	2	1	2024-05-29 12:15:06.602544	2024-05-29 12:15:06.602544	80.0
118	59	15	1	2024-05-29 12:42:20.606002	2024-05-29 12:42:20.606002	60.0
119	59	18	1	2024-05-29 12:42:20.610509	2024-05-29 12:42:20.610509	150.0
120	59	12	1	2024-05-29 12:42:20.614252	2024-05-29 12:42:20.614252	90.0
121	59	4	1	2024-05-29 12:42:20.618375	2024-05-29 12:42:20.618375	100.0
122	59	3	1	2024-05-29 12:42:20.622187	2024-05-29 12:42:20.622187	300.0
123	59	14	1	2024-05-29 12:42:20.625485	2024-05-29 12:42:20.625485	220.0
124	59	8	1	2024-05-29 12:42:20.630025	2024-05-29 12:42:20.630025	65.0
125	59	6	1	2024-05-29 12:42:20.63405	2024-05-29 12:42:20.63405	500.0
126	59	11	1	2024-05-29 12:42:20.638144	2024-05-29 12:42:20.638144	150.0
127	59	2	1	2024-05-29 12:42:20.642564	2024-05-29 12:42:20.642564	80.0
154	63	18	1	2024-05-29 12:49:53.716843	2024-05-29 12:49:53.716843	150.0
155	63	15	1	2024-05-29 12:49:53.71994	2024-05-29 12:49:53.71994	60.0
156	63	12	1	2024-05-29 12:49:53.723594	2024-05-29 12:49:53.723594	90.0
157	63	4	1	2024-05-29 12:49:53.728096	2024-05-29 12:49:53.728096	100.0
158	63	3	1	2024-05-29 12:49:53.731617	2024-05-29 12:49:53.731617	300.0
159	63	14	1	2024-05-29 12:49:53.735791	2024-05-29 12:49:53.735791	220.0
160	63	5	1	2024-05-29 12:49:53.738853	2024-05-29 12:49:53.738853	90.0
161	63	2	1	2024-05-29 12:49:53.742238	2024-05-29 12:49:53.742238	80.0
162	63	21	1	2024-05-29 12:49:53.745386	2024-05-29 12:49:53.745386	40.0
163	63	8	1	2024-05-29 12:49:53.747918	2024-05-29 12:49:53.747918	65.0
164	63	6	1	2024-05-29 12:49:53.751487	2024-05-29 12:49:53.751487	500.0
194	78	6	1	2024-06-14 00:12:58.288171	2024-06-14 00:12:58.288171	500.0
195	78	11	1	2024-06-14 00:12:58.291674	2024-06-14 00:12:58.291674	150.0
196	79	19	1	2024-06-14 01:04:01.501664	2024-06-14 01:04:01.501664	50.0
197	79	4	1	2024-06-14 01:04:01.50531	2024-06-14 01:04:01.50531	100.0
198	80	8	1	2024-06-14 01:04:36.273633	2024-06-14 01:04:36.273633	65.0
199	80	10	1	2024-06-14 01:04:36.276001	2024-06-14 01:04:36.276001	130.0
200	81	52	1	2024-06-14 01:09:31.716907	2024-06-14 01:09:31.716907	400.0
201	82	3	1	2024-06-14 01:12:48.118219	2024-06-14 01:12:48.118219	300.0
202	83	4	1	2024-06-14 14:28:21.946494	2024-06-14 14:28:21.946494	100.0
203	83	16	1	2024-06-14 14:28:21.950298	2024-06-14 14:28:21.950298	30.0
204	84	16	1	2024-06-14 15:22:50.806552	2024-06-14 15:22:50.806552	30.0
205	84	4	1	2024-06-14 15:22:50.81097	2024-06-14 15:22:50.81097	100.0
206	85	4	1	2024-06-14 15:41:51.696269	2024-06-14 15:41:51.696269	100.0
207	85	16	1	2024-06-14 15:41:51.699951	2024-06-14 15:41:51.699951	30.0
208	85	3	1	2024-06-14 15:41:51.703123	2024-06-14 15:41:51.703123	300.0
209	86	4	1	2024-06-14 15:45:32.678447	2024-06-14 15:45:32.678447	100.0
210	86	16	1	2024-06-14 15:45:32.682229	2024-06-14 15:45:32.682229	30.0
225	94	4	1	2024-06-18 17:53:24.713125	2024-06-18 17:53:24.713125	100.0
226	94	16	1	2024-06-18 17:53:24.716641	2024-06-18 17:53:24.716641	30.0
227	95	6	1	2024-06-18 17:55:20.555488	2024-06-18 17:55:20.555488	500.0
228	95	11	1	2024-06-18 17:55:20.558033	2024-06-18 17:55:20.558033	150.0
229	96	8	1	2024-06-18 17:56:59.554366	2024-06-18 17:56:59.554366	65.0
236	99	16	1	2024-06-27 17:52:38.200142	2024-06-27 17:52:38.200142	30.0
237	99	8	1	2024-06-27 17:52:38.203777	2024-06-27 17:52:38.203777	65.0
238	99	3	4	2024-06-27 17:52:38.206231	2024-06-27 17:52:38.206231	300.0
239	100	4	1	2024-06-27 17:58:32.339077	2024-06-27 17:58:32.339077	100.0
240	101	4	3	2024-06-30 13:28:48.700276	2024-06-30 13:28:48.700276	100.0
241	102	19	1	2024-06-30 13:59:27.733307	2024-06-30 13:59:27.733307	50.0
242	103	4	1	2024-06-30 14:05:11.050519	2024-06-30 14:05:11.050519	100.0
243	103	16	1	2024-06-30 14:05:11.05387	2024-06-30 14:05:11.05387	30.0
244	104	4	1	2024-07-08 14:47:24.486214	2024-07-08 14:47:24.486214	100.0
245	104	16	1	2024-07-08 14:47:24.490163	2024-07-08 14:47:24.490163	30.0
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.orders (id, user_id, created_at, updated_at, status, received_at, rating) FROM stdin;
17	1	2024-04-29 14:17:04.40413	2024-04-29 14:29:40.975002	received	2024-04-29 14:24:14.69254	5
57	1	2024-05-29 12:15:06.563078	2024-05-29 12:22:11.204273	received	2024-05-29 12:22:11.203902	\N
18	1	2024-05-14 14:53:06.141786	2024-05-14 19:09:34.19378	received	2024-05-14 19:09:34.193098	\N
73	1	2024-06-06 15:02:29.876859	2024-06-06 15:09:36.543147	received	2024-06-06 15:09:36.542715	\N
58	1	2024-05-29 12:27:59.91115	2024-05-29 12:35:07.085769	received	2024-05-29 12:35:07.085393	\N
19	1	2024-05-14 19:48:52.698551	2024-05-14 19:55:54.205046	received	2024-05-14 19:55:54.204688	\N
20	1	2024-05-14 19:50:15.847928	2024-05-14 19:57:22.576708	received	2024-05-14 19:57:22.575886	\N
21	1	2024-05-14 19:50:41.200666	2024-05-14 19:57:42.570843	received	2024-05-14 19:57:42.570576	\N
43	1	2024-05-16 20:28:08.803633	2024-05-16 20:28:24.449083	cancelled	\N	\N
22	1	2024-05-14 19:55:44.915677	2024-05-14 20:02:49.77676	received	2024-05-14 20:02:49.77653	\N
5	1	2024-04-18 18:45:17.553563	2024-04-18 18:47:35.091934	cancelled	2024-04-18 19:06:43.838199	\N
23	1	2024-05-14 19:56:14.775403	2024-05-14 20:03:21.29652	received	2024-05-14 20:03:21.296259	\N
24	1	2024-05-14 19:58:20.843769	2024-05-14 20:05:25.566717	received	2024-05-14 20:05:25.566274	\N
25	1	2024-05-14 19:59:18.299418	2024-05-14 20:06:24.824875	received	2024-05-14 20:06:24.824132	\N
6	1	2024-04-18 18:49:14.787299	2024-04-18 19:18:05.688751	cancelled	\N	\N
4	1	2024-04-18 17:33:38.636192	2024-04-18 19:19:56.195877	rejected	2024-04-18 19:06:43.838199	\N
1	1	2024-04-18 12:14:54.846354	2024-04-19 10:12:58.185133	received	2024-04-17 00:00:00	4
26	1	2024-05-14 20:11:27.006234	2024-05-14 20:12:00.964036	cancelled	\N	\N
2	1	2024-04-18 13:27:32.954287	2024-04-19 11:23:33.445181	received	2024-04-18 19:06:43.838199	2
27	1	2024-05-14 20:13:40.777654	2024-05-14 20:13:41.743028	cancelled	\N	\N
3	1	2024-04-18 16:30:22.820365	2024-04-20 15:30:26.352651	received	2024-04-18 19:06:43.838199	4
7	1	2024-04-20 16:31:51.936013	2024-04-20 16:47:43.863987	received	2024-04-20 16:47:43.8637	\N
8	1	2024-04-20 16:41:39.222557	2024-04-20 16:52:01.999306	cancelled	\N	\N
10	1	2024-04-20 16:49:05.630398	2024-04-20 16:52:21.852995	cancelled	\N	\N
9	1	2024-04-20 16:48:50.69538	2024-04-20 16:52:25.096528	cancelled	\N	\N
28	1	2024-05-14 20:16:17.011941	2024-05-14 20:16:18.254446	cancelled	\N	\N
11	1	2024-04-20 16:52:39.075232	2024-04-20 16:59:45.625962	received	2024-04-20 16:59:45.625681	\N
12	1	2024-04-21 12:49:52.310422	2024-04-21 12:56:57.760232	received	2024-04-21 12:56:57.75996	\N
29	1	2024-05-14 20:16:52.586133	2024-05-14 20:16:53.541431	cancelled	\N	\N
13	1	2024-04-22 14:35:27.518764	2024-04-22 14:42:30.421055	received	2024-04-22 14:42:30.420838	\N
14	1	2024-04-22 14:39:57.250329	2024-04-22 14:47:01.336949	received	2024-04-22 14:47:01.3367	\N
15	1	2024-04-22 17:53:39.218458	2024-04-22 18:00:47.96739	received	2024-04-22 18:00:47.96704	\N
30	1	2024-05-14 20:17:38.753648	2024-05-14 20:24:41.956453	received	2024-05-14 20:24:41.956201	\N
16	3	2024-04-25 15:06:08.406268	2024-04-25 15:13:09.773591	received	2024-04-25 15:13:09.773318	\N
44	1	2024-05-16 20:46:35.538328	2024-05-16 20:46:43.863969	cancelled	\N	\N
31	1	2024-05-15 12:29:06.874084	2024-05-15 12:36:10.678407	received	2024-05-15 12:36:10.678162	\N
45	1	2024-05-16 20:51:30.528274	2024-05-16 20:51:45.374085	cancelled	\N	\N
32	1	2024-05-15 12:43:45.902148	2024-05-15 12:50:56.615698	received	2024-05-15 12:50:56.615494	\N
46	1	2024-05-16 20:52:35.958895	2024-05-16 20:52:41.961286	cancelled	\N	\N
33	1	2024-05-15 12:46:02.022348	2024-05-15 12:53:06.559289	received	2024-05-15 12:53:06.558926	\N
47	1	2024-05-16 21:00:46.89408	2024-05-16 21:07:51.728238	received	2024-05-16 21:07:51.727822	\N
35	1	2024-05-15 12:51:20.537013	2024-05-15 12:58:31.227315	received	2024-05-15 12:58:31.227062	\N
42	1	2024-05-15 13:12:46.145976	2024-05-24 19:05:42.833223	received	2024-05-15 13:19:54.098364	4
38	1	2024-05-15 12:59:29.457191	2024-05-15 13:03:27.509858	cancelled	\N	\N
40	1	2024-05-15 13:01:39.415816	2024-05-15 13:03:28.197929	cancelled	\N	\N
39	1	2024-05-15 12:59:48.076731	2024-05-15 13:03:28.742245	cancelled	\N	\N
37	1	2024-05-15 12:57:01.813905	2024-05-15 13:03:29.420537	cancelled	\N	\N
41	1	2024-05-15 13:03:12.972621	2024-05-15 13:03:30.579355	cancelled	\N	\N
74	1	2024-06-06 15:12:37.685241	2024-06-06 15:14:19.424193	cancelled	\N	\N
48	5	2024-05-26 11:10:28.736534	2024-05-26 11:17:30.556941	received	2024-05-26 11:17:30.556578	\N
34	1	2024-05-15 12:50:54.394507	2024-05-15 21:08:35.720461	received	2024-05-15 12:57:58.97738	5
61	1	2024-05-29 12:46:28.660878	2024-05-29 12:48:52.140626	cancelled	\N	\N
49	1	2024-05-26 13:54:54.0939	2024-05-26 14:01:58.182573	received	2024-05-26 14:01:58.182209	\N
36	1	2024-05-15 12:55:11.540584	2024-05-15 21:09:58.741386	received	2024-05-15 13:02:18.407012	5
59	1	2024-05-29 12:42:20.601521	2024-05-29 12:48:53.890251	cancelled	\N	\N
50	1	2024-05-26 14:26:49.436194	2024-05-26 14:33:54.533739	received	2024-05-26 14:33:54.533437	\N
62	1	2024-05-29 12:49:05.419946	2024-05-29 12:49:34.396931	cancelled	\N	\N
51	1	2024-05-27 19:22:32.985623	2024-05-27 19:29:39.490338	received	2024-05-27 19:29:39.490094	\N
52	1	2024-05-27 19:25:34.928821	2024-05-27 19:32:43.167425	received	2024-05-27 19:32:43.166772	\N
53	1	2024-05-27 20:26:11.065394	2024-05-27 20:33:18.274662	received	2024-05-27 20:33:18.274308	\N
63	1	2024-05-29 12:49:53.713318	2024-05-29 12:56:59.590024	received	2024-05-29 12:56:59.589798	\N
54	1	2024-05-27 20:58:24.273719	2024-05-27 21:05:26.709181	received	2024-05-27 21:05:26.708843	\N
55	2	2024-05-28 22:34:27.707205	2024-05-28 22:41:39.693357	received	2024-05-28 22:41:39.692402	\N
64	1	2024-05-31 16:37:11.321617	2024-05-31 16:38:04.174193	cancelled	\N	\N
81	10	2024-06-14 01:09:31.714368	2024-06-14 01:09:34.047553	cancelled	\N	\N
56	1	2024-05-29 12:10:13.196593	2024-05-29 12:17:16.843823	received	2024-05-29 12:17:16.843554	\N
75	1	2024-06-09 10:02:41.785066	2024-06-09 10:06:50.587491	cancelled	\N	\N
70	1	2024-06-01 23:05:32.064056	2024-06-01 23:06:27.376581	cancelled	\N	\N
69	1	2024-06-01 23:02:23.400357	2024-06-01 23:06:29.014141	cancelled	\N	\N
71	1	2024-06-02 14:01:32.049753	2024-06-02 14:08:41.664433	received	2024-06-02 14:08:41.664207	\N
72	1	2024-06-02 14:09:31.56219	2024-06-02 14:09:42.049604	cancelled	\N	\N
84	10	2024-06-14 15:22:50.802669	2024-06-14 15:47:54.262633	rejected	2024-06-14 15:24:58.057349	\N
80	10	2024-06-14 01:04:36.270738	2024-06-14 01:14:41.014366	rejected	2024-06-13 22:13:44.557418	\N
76	10	2024-06-13 20:57:12.285602	2024-06-13 21:04:19.551378	received	2024-06-13 21:04:19.551105	\N
77	10	2024-06-13 21:01:45.491735	2024-06-13 21:08:56.345306	received	2024-06-13 21:08:56.345026	\N
79	10	2024-06-14 01:04:01.498133	2024-06-13 22:16:05.253057	received	2024-06-13 22:16:05.252805	\N
78	10	2024-06-14 00:12:58.283763	2024-06-13 21:20:00.677776	received	2024-06-13 21:20:00.677356	\N
82	10	2024-06-14 01:12:48.115516	2024-06-13 22:30:52.722245	received	2024-06-13 22:30:52.721797	\N
83	10	2024-06-14 14:28:21.942617	2024-06-14 14:48:33.408973	received	\N	\N
86	10	2024-06-14 15:45:32.674777	2024-06-14 15:45:34.037312	cancelled	\N	\N
85	10	2024-06-14 15:41:51.691637	2024-06-14 15:46:08.292576	rejected	2024-06-14 15:44:01.742691	\N
95	1	2024-06-18 17:55:20.553256	2024-06-18 17:57:23.70926	received	2024-06-18 17:57:23.708927	\N
96	1	2024-06-18 17:56:59.551346	2024-06-18 17:59:10.769409	received	2024-06-18 17:59:10.768887	\N
94	1	2024-06-17 00:00:00	2024-06-18 18:00:47.154304	received	2024-06-18 17:55:31.309923	\N
99	1	2024-06-27 17:52:38.195807	2024-06-27 17:54:43.951893	received	2024-06-27 17:54:43.95163	\N
100	324	2024-06-27 17:58:32.332038	2024-06-27 18:00:38.878505	received	2024-06-27 18:00:38.878023	\N
101	1	2024-06-30 13:28:48.694856	2024-06-30 13:38:50.04891	received	2024-06-30 13:38:50.048534	\N
102	1	2024-06-30 13:59:27.72938	2024-06-30 14:10:34.998727	received	2024-06-30 14:10:34.998434	\N
103	1	2024-06-30 14:05:11.047206	2024-06-30 14:19:16.136014	received	2024-06-30 14:19:16.135559	\N
104	1	2024-07-08 14:47:24.479793	2024-07-08 14:51:28.043366	received	2024-07-08 14:51:28.043125	\N
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.permissions (id, name, created_at, updated_at) FROM stdin;
14	can_view_admin	2024-06-03 15:31:56.601385	2024-06-03 15:31:56.601385
15	can_view_admin_settings	2024-06-03 15:32:10.211769	2024-06-03 15:32:10.211769
21	can_view_admin_users	2024-06-03 15:33:59.853548	2024-06-03 15:33:59.853548
22	can_view_admin_user	2024-06-03 15:34:05.925025	2024-06-03 15:34:05.925025
23	can_edit_admin_user	2024-06-03 15:34:27.705809	2024-06-03 15:34:27.705809
24	can_delete_admin_user	2024-06-03 15:34:44.691234	2024-06-03 15:34:44.691234
29	can_view_test	2024-06-03 23:28:34.307147	2024-06-03 23:28:34.307147
31	can_edit_comment_stranger	2024-06-04 13:36:06.762808	2024-06-04 13:36:06.762808
32	can_delete_comment_stranger	2024-06-04 13:36:50.366291	2024-06-04 13:36:50.366291
2	can_edit_comment_expired	2024-06-03 15:24:00.270578	2024-06-04 14:56:59.952923
20	can_view_admin_chats	2024-06-03 15:33:16.605057	2024-06-04 19:53:01.584165
33	can_view_admin_roles	2024-06-04 16:38:16.549491	2024-06-04 19:58:25.69161
34	can_view_admin_permissions	2024-06-04 16:38:34.920735	2024-06-04 19:59:52.587391
35	can_view_admin_products	2024-06-04 17:20:57.576322	2024-06-04 20:39:47.474892
36	can_view_admin_type_products	2024-06-04 17:24:45.77662	2024-06-04 20:39:51.577723
37	can_view_support_chats_stranger	2024-06-05 11:50:44.536661	2024-06-05 11:50:44.536661
38	can_edit_support_chat_stranger	2024-06-05 12:49:50.525128	2024-06-05 12:49:50.525128
39	can_create_admin_product	2024-06-06 16:22:41.55278	2024-06-06 16:22:41.55278
40	can_edit_admin_product	2024-06-06 16:22:53.781892	2024-06-06 16:22:53.781892
41	can_delete_admin_product	2024-06-06 16:32:52.767256	2024-06-06 16:32:52.767256
42	can_edit_admin_product_make_discount	2024-06-06 16:48:05.385104	2024-06-06 16:48:05.385104
43	can_view_admin_chat	2024-06-06 18:35:03.693538	2024-06-06 18:35:03.693538
44	can_edit_admin_chat	2024-06-06 18:55:59.304802	2024-06-06 18:55:59.304802
45	can_edit_admin_role	2024-06-06 18:59:29.673778	2024-06-06 18:59:29.673778
46	can_create_admin_role	2024-06-06 18:59:44.130007	2024-06-06 18:59:44.130007
47	can_edit_admin_type_product	2024-06-06 19:04:47.996964	2024-06-06 19:04:47.996964
48	can_create_admin_type_product	2024-06-06 19:05:08.178232	2024-06-06 19:05:08.178232
49	can_delete_admin_type_product	2024-06-06 19:05:32.346437	2024-06-06 19:05:32.346437
50	can_create_admin_permission	2024-06-06 19:23:01.484614	2024-06-06 19:23:01.484614
51	can_edit_admin_permission	2024-06-06 19:23:16.323625	2024-06-06 19:23:16.323625
52	can_delete_admin_permission	2024-06-06 19:24:05.316156	2024-06-06 19:24:05.316156
53	can_view_admin_orders	2024-06-13 20:20:57.847822	2024-06-13 20:20:57.847822
54	can_view_admin_orders_live	2024-06-14 15:57:56.294426	2024-06-14 15:57:56.294426
55	can_view_admin_orders_statistics	2024-06-18 15:22:13.731375	2024-06-18 15:22:13.731375
56	can_view_products_comment_moderate	2024-06-20 20:02:21.011003	2024-06-20 20:02:21.011003
57	can_edit_comment_user_disable_commiserate	2024-06-21 00:36:44.065568	2024-06-21 00:45:27.091062
58	test	2024-06-22 01:24:55.893333	2024-06-22 01:24:55.893333
60	can_create_comment	2024-06-26 00:47:09.38003	2024-06-26 00:47:09.38003
61	can_edit_admin_user_cancel_restriction	2024-06-26 22:16:41.938471	2024-06-26 22:16:41.938471
62	can_edit_admin_user_cancel_restriction_stranger	2024-06-27 23:37:44.959416	2024-06-27 23:37:44.959416
63	can_view_app	2024-07-08 14:04:34.211958	2024-07-08 14:04:34.211958
\.


--
-- Data for Name: permissions_roles; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.permissions_roles (permission_id, role_id) FROM stdin;
2	1
20	1
14	1
15	1
24	1
23	1
22	1
20	4
14	4
2	4
20	3
14	3
2	3
21	3
21	1
31	1
31	3
32	1
32	3
33	1
34	1
35	1
35	3
36	1
37	1
38	1
22	3
39	1
40	1
41	1
42	1
40	3
41	3
36	3
42	3
39	3
43	1
43	4
43	3
44	1
44	3
44	4
45	1
46	1
47	1
47	3
48	1
48	3
49	1
49	3
50	1
51	1
52	1
53	1
53	3
54	1
54	3
53	4
55	1
55	3
56	1
56	3
56	4
57	1
57	3
57	4
60	1
60	2
60	3
60	4
61	1
62	1
62	3
61	3
63	1
63	2
63	3
63	4
\.


--
-- Data for Name: product_translations; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.product_translations (id, tname, locale, product_id, created_at, updated_at) FROM stdin;
1	Beer	en	2	2024-06-08 19:54:19.984816	2024-06-08 19:54:19.984816
2	Пиво	ru	2	2024-06-08 19:54:43.030365	2024-06-08 19:54:43.030365
3	Арбуз	ru	51	2024-06-08 20:40:15.594064	2024-06-08 20:40:15.594064
4	Watermelon	en	51	2024-06-08 20:40:15.597657	2024-06-08 20:40:15.597657
5	Редис	ru	21	2024-06-08 20:41:33.844193	2024-06-08 20:41:33.844193
6	Redis	en	21	2024-06-08 20:41:33.84938	2024-06-08 20:41:33.84938
7	Курица	ru	20	2024-06-08 20:42:00.653495	2024-06-08 20:42:00.653495
8	Chicken	en	20	2024-06-08 20:42:00.657291	2024-06-08 20:42:00.657291
9	Яблоко	ru	19	2024-06-08 20:42:21.495154	2024-06-08 20:42:21.495154
10	Apple	en	19	2024-06-08 20:42:21.497565	2024-06-08 20:42:21.497565
11	Кола	ru	18	2024-06-08 20:42:35.705507	2024-06-08 20:42:35.705507
12	Сola	en	18	2024-06-08 20:42:35.709601	2024-06-08 20:42:35.709601
13	Хлеб	ru	16	2024-06-08 20:43:20.500221	2024-06-08 20:43:20.500221
14	Bread	en	16	2024-06-08 20:43:20.504555	2024-06-08 20:43:20.504555
15	Спрайт	ru	15	2024-06-08 20:43:29.138513	2024-06-08 20:43:29.138513
16	Sprite	en	15	2024-06-08 20:43:29.141418	2024-06-08 20:43:29.141418
17	Кетчуп	ru	14	2024-06-08 20:43:46.700633	2024-06-08 20:43:46.700633
18	Ketchup	en	14	2024-06-08 20:43:46.704725	2024-06-08 20:43:46.704725
19	Сыр	ru	13	2024-06-08 20:44:18.90888	2024-06-08 20:44:18.90888
20	Сheese	en	13	2024-06-08 20:44:18.912302	2024-06-08 20:44:18.912302
21	Молоко	ru	11	2024-06-08 20:44:32.339611	2024-06-08 20:44:32.339611
22	Milk	en	11	2024-06-08 20:44:32.343128	2024-06-08 20:44:32.343128
23	Яйца	ru	10	2024-06-08 20:44:47.967662	2024-06-08 20:44:47.967662
24	Eggs	en	10	2024-06-08 20:44:47.971803	2024-06-08 20:44:47.971803
25	Лейс	ru	9	2024-06-08 20:45:35.040302	2024-06-08 20:45:35.040302
26	Lays	en	9	2024-06-08 20:45:35.04401	2024-06-08 20:45:35.04401
27	Огурец	ru	8	2024-06-08 20:45:52.994619	2024-06-08 20:45:52.994619
28	Cucumber	en	8	2024-06-08 20:45:52.998018	2024-06-08 20:45:52.998018
29	Сосиски	ru	7	2024-06-08 20:46:09.614692	2024-06-08 20:46:09.614692
30	Sausages	en	7	2024-06-08 20:46:09.617709	2024-06-08 20:46:09.617709
31	Мясо	ru	6	2024-06-08 20:46:24.933537	2024-06-08 20:46:24.933537
32	Meat	en	6	2024-06-08 20:46:24.93699	2024-06-08 20:46:24.93699
33	Помидоры	ru	5	2024-06-08 20:46:50.460329	2024-06-08 20:46:50.460329
34	Tomatoes	en	5	2024-06-08 20:46:50.463064	2024-06-08 20:46:50.463064
35	Бананы	ru	4	2024-06-08 20:47:23.082171	2024-06-08 20:47:23.082171
36	Banana	en	4	2024-06-08 20:47:23.086182	2024-06-08 20:47:23.086182
37	Икра	ru	3	2024-06-08 20:47:36.458329	2024-06-08 20:47:36.458329
38	Caviar	en	3	2024-06-08 20:47:36.462592	2024-06-08 20:47:36.462592
39	Апельсин	ru	12	2024-06-08 20:48:30.025509	2024-06-08 20:48:30.025509
40	Orange	en	12	2024-06-08 20:48:30.030044	2024-06-08 20:48:30.030044
41	Клубника	ru	52	2024-06-10 12:21:53.897461	2024-06-10 12:21:53.897461
42	Strawberry	en	52	2024-06-10 12:21:53.902959	2024-06-10 12:21:53.902959
43	Творог	ru	53	2024-06-10 12:24:00.639012	2024-06-10 12:24:00.639012
44	Сottage cheese	en	53	2024-06-10 12:24:00.641688	2024-06-10 12:24:00.641688
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.products (id, name, description, price, created_at, updated_at, type_product_id, discount_price, quantity, discount_start_date, discount_end_date) FROM stdin;
2	Пиво	Пиво вкуное оно	80.0	2024-04-17 22:21:45.068862	2024-06-08 19:54:43.033757	5	\N	91	\N	\N
4	Banana		100.0	2024-04-20 18:48:13.600311	2024-07-08 14:47:24.45642	2	\N	80	\N	\N
6	Meat		500.0	2024-04-20 18:49:11.861366	2024-06-18 17:55:20.54252	4	\N	92	\N	\N
11	Milk	Молоко — биологическая жидкость, продукт нормальной физиологической секреции молочных желёз самок млекопитающих, вырабатываемый в период лактации. Предназначено для грудного вскармливания и питания.\r\n\r\nВ молоке содержатся около 250 полезных элементов: полноценные белки, жиры, углеводы, витамины, минеральные вещества. 5 Один литр молока даёт организму около 600 ккал, что составляет около 20 % суточной нормы для взрослого человека. 3\r\n\r\nВажно помнить, что употребление молока и молочных продуктов ненадлежащего качества может стать причиной возникновения целого ряда заболеваний. 15\r\n	150.0	2024-04-20 18:52:10.480496	2024-06-18 17:55:20.54909	3	\N	92	\N	\N
20	Chicken	самый многочисленный и распространенный вид домашней птицы. Она является универсальным продуктом, ведь такая птичка нужна для салатов, закусок, супов, горячих блюд и выпечки. Курица любима диетологами и любителями ЗОЖ, а еще это настоящий народный продукт!	500.0	2024-04-21 17:01:52.175099	2024-06-08 20:42:00.661399	\N	\N	0	\N	\N
14	Ketchup		220.0	2024-04-20 18:53:06.614868	2024-06-08 20:43:46.707611	7	\N	93	\N	\N
13	Сheese		120.0	2024-04-20 18:52:43.65002	2024-06-08 20:44:18.915511	3	\N	98	\N	\N
5	Tomatoes	Что может быть лучше ? 	90.0	2024-04-20 18:48:54.185562	2024-06-08 20:46:50.465533	1	\N	97	\N	\N
12	Orange		90.0	2024-04-20 18:52:31.871782	2024-06-08 20:48:30.033582	2	\N	92	\N	\N
9	Lays		110.0	2024-04-20 18:51:42.053985	2024-06-09 10:02:41.737998	9	\N	35	\N	\N
7	Sausages		300.0	2024-04-20 18:49:33.43988	2024-06-09 10:02:41.745975	4	\N	97	\N	\N
8	Cucumber		65.0	2024-04-20 18:51:17.075429	2024-06-27 17:52:38.177421	1	\N	89	\N	\N
3	Caviar	Икруша	300.0	2024-04-17 22:22:17.833879	2024-06-27 17:52:38.183245	8	\N	86	\N	\N
51	Watermelon		350.0	2024-06-08 20:40:15.585617	2024-06-10 20:10:22.48636	\N	\N	27	\N	\N
10	Eggs		130.0	2024-04-20 18:51:53.142085	2024-06-14 01:04:36.267372	4	\N	97	\N	\N
19	Apple	Яблоко — сочный плод яблони, который употребляется в пищу в свежем и запечённом виде, служит сырьём в кулинарии и для приготовления напитков. 	50.0	2024-04-20 19:51:32.973371	2024-06-30 13:59:27.720925	2	\N	91	\N	\N
21	Redis	Неприхотливый и бодрящий овощ, редис является членом семейства капустных. Его сочный, хрустящий корень с пикантным вкусом добавляет в салаты, бутерброды и закуски яркую остроту. Богат витаминами, минералами и антиоксидантами, редис не только придает блюдам вкус, но и приносит пользу для здоровья. Идеальный выбор для весны, он привносит в сезонные блюда свежие и бодрящие ноты.	40.0	2024-04-21 17:08:06.213694	2024-06-08 20:41:33.853838	\N	\N	98	\N	\N
18	Сola	Coca-Cola (Кока-Кола) — газированный безалкогольный напиток, производимый компанией Coca-Cola Company	150.0	2024-04-20 19:09:37.697517	2024-06-12 21:37:52.19361	5	\N	91	\N	\N
53	Сottage cheese		150.0	2024-06-10 12:24:00.634833	2024-06-13 20:03:31.562077	\N	\N	80	\N	\N
16	Bread	Хлеб — это пищевой продукт, получаемый выпечкой разрыхлённого посредством дрожжей или закваски теста, приготовленного из муки, воды и соли с добавлением (или без добавления) сахара, жира, молока 	30.0	2024-04-20 18:53:46.010963	2024-07-08 14:47:24.462624	6	\N	88	\N	\N
52	Strawberry		400.0	2024-06-10 12:21:53.890151	2024-06-14 01:09:31.710114	\N	\N	79	\N	\N
15	Sprite	Sprite — газированный безалкогольный напиток, производимый компанией Coca-Cola Company.	60.0	2024-04-20 18:53:23.135296	2024-06-08 20:43:29.145306	5	\N	89	\N	\N
\.


--
-- Data for Name: products_type_products; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.products_type_products (product_id, type_product_id) FROM stdin;
11	3
11	5
3	8
19	2
4	2
8	1
12	2
13	3
7	4
6	4
18	5
2	5
15	5
16	6
14	7
10	4
9	9
20	4
5	1
21	1
51	2
52	2
53	3
\.


--
-- Data for Name: restrictions; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.restrictions (id, offender_id, officer_id, canceller_id, permission_id, reason, expired_at, cancelled_at, created_at, updated_at) FROM stdin;
1	324	1	1	60	\N	2024-06-28 12:48:14.898062	2024-06-27 12:58:40.291754	2024-06-27 12:48:14.937511	2024-06-27 12:58:40.292454
2	324	1	1	60	\N	2024-06-28 13:37:58.066633	2024-06-27 13:38:12.905313	2024-06-27 13:37:58.102447	2024-06-27 13:38:12.905925
3	324	1	1	60	\N	2024-06-28 13:47:44.803583	2024-06-27 13:47:56.575483	2024-06-27 13:47:44.824022	2024-06-27 13:47:56.576096
4	324	1	1	60	\N	2024-06-28 13:49:45.620332	2024-06-27 13:49:51.87048	2024-06-27 13:49:45.651923	2024-06-27 13:49:51.870957
5	324	1	1	60	\N	2024-06-28 13:52:04.617728	2024-06-27 13:53:57.864088	2024-06-27 13:52:04.667742	2024-06-27 13:53:57.864701
6	324	1	1	60	\N	2024-06-28 13:56:56.342435	2024-06-27 13:57:44.669839	2024-06-27 13:56:56.405276	2024-06-27 13:57:44.670212
7	324	1	1	60	Spam	2024-06-28 16:32:32.766509	2024-06-28 01:11:12.146394	2024-06-27 16:32:32.793479	2024-06-28 01:11:12.14715
8	324	1	1	60	Spam	2024-06-29 02:18:30.68009	2024-06-28 02:18:53.781775	2024-06-28 02:18:30.704876	2024-06-28 02:18:53.782265
9	324	1	10	60	Spam	2024-06-30 15:49:45.821339	2024-06-29 15:50:16.682352	2024-06-29 15:49:45.856178	2024-06-29 15:50:16.683114
10	324	1	\N	60	Spam	2024-06-30 16:02:25.59115	\N	2024-06-29 16:02:25.627096	2024-06-29 16:02:25.627096
11	32	1	1	60	\N	2024-06-30 17:17:53.192324	2024-06-29 17:21:04.412935	2024-06-29 17:17:53.247261	2024-06-29 17:21:04.41353
12	32	1	1	60	Spam	2024-06-30 17:21:41.22106	2024-06-29 17:28:07.7347	2024-06-29 17:21:41.242505	2024-06-29 17:28:07.735562
13	32	1	1	60	Spam	2024-06-30 17:29:12.15652	2024-06-29 17:30:25.925591	2024-06-29 17:29:12.208192	2024-06-29 17:30:25.926278
14	32	1	1	60	Spam	2024-06-30 17:31:01.030872	2024-06-29 17:36:17.031605	2024-06-29 17:31:01.069817	2024-06-29 17:36:17.032371
15	32	1	\N	60	Spam	2024-06-30 17:37:05.597151	\N	2024-06-29 17:37:05.645573	2024-06-29 17:37:05.645573
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.roles (id, name, created_at, updated_at) FROM stdin;
1	admin	2024-04-17 22:04:07.168894	2024-04-17 22:04:07.168894
2	user	2024-04-17 22:04:17.741087	2024-04-17 22:04:17.741087
3	manager	2024-06-03 15:47:38.66104	2024-06-03 15:47:38.66104
4	support	2024-06-03 15:47:46.058519	2024-06-03 15:47:46.058519
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.schema_migrations (version) FROM stdin;
20240415130504
20240415134024
20240415144516
20240415145812
20240415145848
20240417170809
20240417171013
20240417212939
20240417224731
20240418121002
20240418121236
20240418160442
20240418190125
20240419095317
20240420232507
20240420232701
20240421144053
20240421144415
20240421152407
20240425174800
20240425175159
20240427160628
20240427160836
20240510171610
20240526121220
20240526134854
20240527184147
20240528133727
20240528174300
20240601210052
20240603131825
20240603132329
20240607230422
20240608193248
20240608193249
20240608195239
20240608222923
20240611150030
20240612173636
20240621121257
20240623110222
20240625224603
\.


--
-- Data for Name: type_product_translations; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.type_product_translations (id, tname, locale, type_product_id, created_at, updated_at) FROM stdin;
1	Соусы	ru	7	2024-06-08 22:40:46.280925	2024-06-08 22:40:46.280925
2	Sauces	en	7	2024-06-08 22:40:46.284586	2024-06-08 22:40:46.284586
3	Морепродукты	ru	8	2024-06-08 22:42:08.562416	2024-06-08 22:42:08.562416
4	Seafood	en	8	2024-06-08 22:42:08.567368	2024-06-08 22:42:08.567368
5	Снеки	ru	9	2024-06-08 22:42:20.960575	2024-06-08 22:42:20.960575
6	Snacks	en	9	2024-06-08 22:42:20.963763	2024-06-08 22:42:20.963763
7	Пекарня	ru	6	2024-06-08 22:42:34.065622	2024-06-08 22:42:34.065622
8	Bakery	en	6	2024-06-08 22:42:34.068033	2024-06-08 22:42:34.068033
9	Напитки	ru	5	2024-06-08 22:42:59.637636	2024-06-08 22:42:59.637636
10	Drinks	en	5	2024-06-08 22:42:59.641398	2024-06-08 22:42:59.641398
11	Мясное	ru	4	2024-06-08 22:43:20.378159	2024-06-08 22:43:20.378159
12	Meat	en	4	2024-06-08 22:43:20.381703	2024-06-08 22:43:20.381703
13	Молочное	ru	3	2024-06-08 22:43:30.817555	2024-06-08 22:43:30.817555
14	Dairy	en	3	2024-06-08 22:43:30.823506	2024-06-08 22:43:30.823506
15	Фрукты	ru	2	2024-06-08 22:43:42.690707	2024-06-08 22:43:42.690707
16	Fruit	en	2	2024-06-08 22:43:42.694833	2024-06-08 22:43:42.694833
17	Овощи	ru	1	2024-06-08 22:43:54.614898	2024-06-08 22:43:54.614898
18	Vegetables	en	1	2024-06-08 22:43:54.618357	2024-06-08 22:43:54.618357
\.


--
-- Data for Name: type_products; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.type_products (id, name, description, created_at, updated_at) FROM stdin;
7	Sauces		2024-04-21 15:19:41.685603	2024-06-08 22:40:46.287251
8	Seafood		2024-04-21 15:20:20.389249	2024-06-08 22:42:08.570121
9	Snacks		2024-04-21 15:22:01.814342	2024-06-08 22:42:20.967377
6	Bakery		2024-04-21 15:19:14.882323	2024-06-08 22:42:34.070516
5	Drinks		2024-04-21 15:17:35.585175	2024-06-08 22:42:59.643852
4	Meat		2024-04-21 15:16:41.681959	2024-06-08 22:43:20.385072
3	Dairy		2024-04-21 15:15:38.198447	2024-06-08 22:43:30.828123
2	Fruit		2024-04-21 15:08:37.261693	2024-06-08 22:43:42.699085
1	Vegetables		2024-04-21 15:03:23.906002	2024-06-08 22:43:54.621767
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: andre
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, login, name, surname, date_of_birth, address, role_id, locale) FROM stdin;
1	nakaryakov.andreyka@mail.ru	$2a$12$vtF5cPDM41cq/qogGRMFNO4jjANhkbcwexFyNWmovxlHflTNvm25e	\N	\N	\N	2024-04-17 22:06:29.836049	2025-08-26 03:27:23.67726	admin	Andrey	Nak	\N	Moscow	1	ru
4	dsds@mail.com	$2a$12$3p/YYZxiD4nCdE5f9UUH0ud0LRgfoez19gLCd3vIcA5K.4hKvit/6	\N	\N	\N	2024-04-17 22:06:30.434117	2024-06-20 15:37:18.180355	dsds	\N	\N	\N	\N	2	ru
3	nak.and@mail.com	$2a$12$8qH0tCCfmkU/HNsfp.N4A.IGBdXjCOMPPYmbjJmZAVUBOYD1pUTb2	\N	\N	\N	2024-04-17 22:06:30.231475	2024-05-17 20:06:49.759226	nak.and	\N	\N	\N	\N	1	\N
7	jeanetta_schmidt@carter.name	$2a$12$8iKDxmmO4vd7YLNAUpUEje/HX3QAmGYFbcmDP3ee.p1QYdMwav2O2	\N	\N	\N	2024-04-25 14:03:39.797176	2024-04-25 14:03:39.797176	jeanetta_schmidt	\N	\N	\N	\N	2	\N
8	walton_kessler@cronin.name	$2a$12$.pBg2mzVrM5nnn1gxYI1H.HxFUbu65oEf0Yi7.vSU/U4rKukJD/aC	\N	\N	\N	2024-04-25 14:03:40.047273	2024-06-03 20:46:38.753532	walton_kessler	\N	\N	\N	\N	1	\N
6	test123@mail.com	$2a$12$YpN/CHDViiLZbB9I0eZqMeY/WdPiKifSLgjRHSuVGbqX9zReB4kqK	\N	\N	\N	2024-04-25 13:51:29.91825	2024-06-04 22:37:28.174668	test13@mail.com			\N		3	\N
11	amos@farrell.io	$2a$12$Yf0okIqZcvI7ps/8Px4nNejUJEZmXhFc5o8as.YN/jfkQecCETCuS	\N	\N	\N	2024-04-25 14:03:40.688647	2024-06-04 22:52:50.950574	amos	\N	\N	\N	\N	4	\N
323	ggggg@mail.com	$2a$12$vXB9OrrmsL2ZIriIJHELze6KDe.i9ii5cpCyLVj9ODDk2wd1/h2.G	\N	\N	\N	2024-06-05 00:04:46.676856	2024-06-05 00:04:46.676856	ggggg	\N	\N	\N	\N	2	\N
324	fdfdfdf@mail.com	$2a$12$2QVsH7Jkqo1Bb.k0YHXnouW5NcU68Jur4uuaCbqT3JzZFxNqUZ05q	\N	\N	\N	2024-06-05 00:08:40.970358	2024-06-05 00:08:40.970358	sasasasasa	\N	\N	\N	\N	2	\N
15	cecil.beatty@kutch.org	$2a$12$dV.V3/NsT4mlEY8SM86gIefFN7Z.JK1K421FA6P4ChAdDhs4zTcfi	\N	\N	\N	2024-04-25 14:03:41.497664	2024-06-06 16:02:20.743354	cecil.beatty	\N	\N	\N	\N	3	\N
13	jason@gleichner.org	$2a$12$7TRu1fjRSaD3G6JehzhTduIzMt6mT0edrQV8R1hQdRh5wmQqNUKXe	\N	\N	\N	2024-04-25 14:03:41.09464	2024-06-06 16:03:25.110888	jason	\N	\N	\N	\N	3	\N
321	afsd@mail.com	$2a$12$7o8UEEagM5RfJMy.3x4chOF..8THsDzDKzVDRuYe5sJIr0fNA93Lu	\N	\N	\N	2024-05-24 22:05:27.84977	2024-06-23 12:19:05.88456	asasa	\N	\N	\N	\N	1	\N
10	vonda@haley.org	$2a$12$dRuLgT.KrvGWIaDRr3gf6udPOIDczmrGWBgCvB4ia.kme30p8sCnm	\N	\N	\N	2024-04-25 14:03:40.482767	2024-06-29 15:48:16.752489	vonda	\N	\N	\N	\N	3	\N
32	cody@mills-ratke.org	$2a$12$YbEp9Oz8hjWiP1Mq49KQN.5BwfB8gN5Fsfq7ubp5stt3ejXz..VAy	\N	\N	\N	2024-04-25 14:03:44.935431	2024-06-29 17:28:53.228865	cody	\N	\N	\N	\N	2	ru
5	test@mail.com	$2a$12$LSufXLxykGB5HP7hy2IF5eNgxYFXhQ5xZhdMH2KnETiObJTG2FPqS	\N	\N	\N	2024-04-17 22:06:30.6317	2024-06-09 10:29:25.648536	test	Andrety		\N		2	ru
2	nakaryakov.1andreyka@gmail.com	$2a$12$eLesQur8XLLJBkjeHR1W1ut7SRit1HdROZHFMm4zNMpdW400RqnPC	\N	\N	\N	2024-04-17 22:06:30.033281	2025-08-26 03:00:47.959687	nakaryakov.1andreyka	\N	\N	\N	\N	1	\N
9	harrison_ziemann@konopelski.biz	$2a$12$Dg9d1nC8Z2Npwr9Z6oIV0OaDM861c6RnPjqaGu5L7ew/3.X4aFcHu	\N	\N	\N	2024-04-25 14:03:40.264152	2024-04-25 14:03:40.264152	harrison_ziemann	\N	\N	\N	\N	2	\N
12	alica@lindgren-kerluke.co	$2a$12$9rTXSFUiKP9zXhY5IHVmb.G.9GOSVkgZUu2phrLjnGmq/v4gC9QWm	\N	\N	\N	2024-04-25 14:03:40.892362	2024-04-25 14:03:40.892362	alica	\N	\N	\N	\N	2	\N
14	junie_rowe@mann.net	$2a$12$/dD5OJX/PqkOBIbRt1xZiepxGSbwhJIyTN/0IQ32XO0k/uTstCuWm	\N	\N	\N	2024-04-25 14:03:41.297012	2024-04-25 14:03:41.297012	junie_rowe	\N	\N	\N	\N	2	\N
322	asdasdas@mail.com	$2a$12$pmxm87zWnd6.34.2xws.DOTbEKgGD5Nzy1i8uFCvZysPMltdIaj4a	\N	\N	\N	2024-05-24 22:12:56.822812	2024-05-24 22:12:56.822812	asdasdas	\N	\N	\N	\N	2	\N
325	testt@mail.com	$2a$12$b13Oa9OzalVoIA28FR69q.sbn/akTvcn7LSYC/s.pVn6j9OFi/10K	\N	\N	\N	2024-06-05 00:12:59.121726	2024-06-05 00:12:59.121726	testT	\N	\N	\N	\N	2	\N
16	johnie.kuphal@keeling.biz	$2a$12$w.uKQLcUb40Q2RUvsTSmDeLG/l63Y3DPKo8fWUxEDXSTcksBQaxFC	\N	\N	\N	2024-04-25 14:03:41.700521	2024-04-25 14:03:41.700521	johnie.kuphal	\N	\N	\N	\N	2	\N
17	jerrod_hudson@towne.io	$2a$12$x2ZdqyQGZvDtVG5sybBToeS2HSGqKkLwxUmIAEb15Knq4ebp2LMOS	\N	\N	\N	2024-04-25 14:03:41.901322	2024-04-25 14:03:41.901322	jerrod_hudson	\N	\N	\N	\N	2	\N
18	trey@leffler.name	$2a$12$vNHrAhpufegQScDs0IOCV.pztpA1kJ.dtEDgQRFWM7RQIc2D93ZYS	\N	\N	\N	2024-04-25 14:03:42.100684	2024-04-25 14:03:42.100684	trey	\N	\N	\N	\N	2	\N
19	keiko@hagenes.org	$2a$12$lb2vHgwKQXWAWWfl4F6qJOn2SmO./PGAtf0Ef6s3gg4y4DD/GzzvS	\N	\N	\N	2024-04-25 14:03:42.302323	2024-04-25 14:03:42.302323	keiko	\N	\N	\N	\N	2	\N
20	raymon@lebsack.io	$2a$12$lrlsW9szjCtGqLUvSP3Sc.2VKj/L9QH3xNA3plDAhkAR.Epkd3tFi	\N	\N	\N	2024-04-25 14:03:42.502755	2024-04-25 14:03:42.502755	raymon	\N	\N	\N	\N	2	\N
21	justine.paucek@dooley.io	$2a$12$iY7ZuOoPsK7a/rCqEKHQX.e/O./ac5ZAqtU0SCds3qlaZ9A1b/hJG	\N	\N	\N	2024-04-25 14:03:42.702731	2024-04-25 14:03:42.702731	justine.paucek	\N	\N	\N	\N	2	\N
22	dee.jacobs@trantow-goodwin.co	$2a$12$3k6IfJyReZF67CadQtqeNu3jpXPK1MFCpuzkPhPaNO/M1ESnvX7VO	\N	\N	\N	2024-04-25 14:03:42.902582	2024-04-25 14:03:42.902582	dee.jacobs	\N	\N	\N	\N	2	\N
23	pauline.rolfson@durgan-lubowitz.io	$2a$12$HXp1PKPgaeFbOS/vWHjlXusI1YbTaGp0rGotyTC7KYy7XSMOMlttu	\N	\N	\N	2024-04-25 14:03:43.10368	2024-04-25 14:03:43.10368	pauline.rolfson	\N	\N	\N	\N	2	\N
24	carolynn@ziemann.net	$2a$12$Ta549riAStqWTU6OYxsJROtw2toVmWhnqonwQ1jkQ2Jdip6cjg4Va	\N	\N	\N	2024-04-25 14:03:43.314916	2024-04-25 14:03:43.314916	carolynn	\N	\N	\N	\N	2	\N
25	buster_bogisich@bins.org	$2a$12$x2xrA3S920CjF57gjiWnzuvJiLth4mztbY9NfPgGh5MHVRLGp6A8u	\N	\N	\N	2024-04-25 14:03:43.516182	2024-04-25 14:03:43.516182	buster_bogisich	\N	\N	\N	\N	2	\N
26	elisha_russel@powlowski.io	$2a$12$LGOecEOUg6KOerX3fW.Tmu9J0oPch6OV1/iC5wmbXX2twk1iADu5O	\N	\N	\N	2024-04-25 14:03:43.719919	2024-04-25 14:03:43.719919	elisha_russel	\N	\N	\N	\N	2	\N
27	elvira.altenwerth@thiel.net	$2a$12$U9pKWxI2VIpaWsx/K6pktOvsbdUPSzNBnGr/zM1xEic4kptdekUsC	\N	\N	\N	2024-04-25 14:03:43.925946	2024-04-25 14:03:43.925946	elvira.altenwerth	\N	\N	\N	\N	2	\N
28	alfonso.schinner@koelpin-bosco.com	$2a$12$mznjuWLDe8kruB.Q1bProOfvwR3KJRL46ySlxxvMv3QlGaeTIk99a	\N	\N	\N	2024-04-25 14:03:44.12688	2024-04-25 14:03:44.12688	alfonso.schinner	\N	\N	\N	\N	2	\N
29	emanuel@torp.net	$2a$12$tOQ0bY38AWfIsyEnEfb0k.K3a6QgNaBnnjvpFVcPftLIvRwa1irAK	\N	\N	\N	2024-04-25 14:03:44.329392	2024-04-25 14:03:44.329392	emanuel	\N	\N	\N	\N	2	\N
30	danille@tillman.name	$2a$12$X9m0MRAaQ7cjoZy4riwX7e1UbSd0iaicrvhYNGAb/N.UQOODCormS	\N	\N	\N	2024-04-25 14:03:44.529611	2024-04-25 14:03:44.529611	danille	\N	\N	\N	\N	2	\N
31	margherita@kuphal.com	$2a$12$uKDnsAy/skw74Qj8y4SvVO9z2l.fOgrxulOqb7GpzTLf4iZqEQ346	\N	\N	\N	2024-04-25 14:03:44.730826	2024-04-25 14:03:44.730826	margherita	\N	\N	\N	\N	2	\N
33	daryl_wintheiser@swaniawski-feeney.info	$2a$12$pv3g50RNkhNUUr5CXr2EKO2K228YQfJTBAOPLvr3XIFChvz0z6/Tq	\N	\N	\N	2024-04-25 14:03:45.137499	2024-04-25 14:03:45.137499	daryl_wintheiser	\N	\N	\N	\N	2	\N
34	zack@gerlach.net	$2a$12$U2hEP4JCSUW05ntTuZL8LuXSoL0mg298hf6SD6ratMrNyI38DgAyK	\N	\N	\N	2024-04-25 14:03:45.338868	2024-04-25 14:03:45.338868	zack	\N	\N	\N	\N	2	\N
35	katia@pagac.com	$2a$12$sRhYtBu0b8bnoyRUU2Cww.QK7pGoGdkHdEM2iq4z5v.obbjx7k7YS	\N	\N	\N	2024-04-25 14:03:45.539443	2024-04-25 14:03:45.539443	katia	\N	\N	\N	\N	2	\N
36	gaylene@ryan-casper.net	$2a$12$pcRLg8aX5OZD7lHmQ7lE1uetCUyrS/9RNZO1w5Enu11FBFH/AsD/a	\N	\N	\N	2024-04-25 14:03:45.746476	2024-04-25 14:03:45.746476	gaylene	\N	\N	\N	\N	2	\N
37	alexander_keeling@orn.co	$2a$12$rZb75m8Z5zH2KuOUp.i2C.wFaO8UfSECdrgL8q/B2CnWJI6KHFnW.	\N	\N	\N	2024-04-25 14:03:45.954964	2024-04-25 14:03:45.954964	alexander_keeling	\N	\N	\N	\N	2	\N
38	ramon@kuphal.biz	$2a$12$.vZnx4Djeun10BD2AloNo.XHZooJHOYuZTZ83zu43teUk3kuw3t96	\N	\N	\N	2024-04-25 14:03:46.163693	2024-04-25 14:03:46.163693	ramon	\N	\N	\N	\N	2	\N
39	angeles@johnson-deckow.net	$2a$12$iVsEgUrS7jl8CnLz55RNquO1e/tLMEYWRAEYRTo1YJZSdSbAVYC7G	\N	\N	\N	2024-04-25 14:03:46.371655	2024-04-25 14:03:46.371655	angeles	\N	\N	\N	\N	2	\N
40	cathryn@yost.io	$2a$12$k/LLe9ZqaNr0SF8w/ROs1u.aLLdyVwByjlhRLS9R3oQH7MQEFSmzO	\N	\N	\N	2024-04-25 14:03:46.578719	2024-04-25 14:03:46.578719	cathryn	\N	\N	\N	\N	2	\N
41	hilario@upton.com	$2a$12$bW4xkskXyanSYB4GXVUVruJdT1CdeBsdSG34EHlKzbt8EEqk8YAaG	\N	\N	\N	2024-04-25 14:03:46.784274	2024-04-25 14:03:46.784274	hilario	\N	\N	\N	\N	2	\N
42	hans@leffler.net	$2a$12$14cR4durK5wcumRdEvwlqunTY1dgY87QmV/KJz83E6Zxb9bjuSkQS	\N	\N	\N	2024-04-25 14:03:46.992385	2024-04-25 14:03:46.992385	hans	\N	\N	\N	\N	2	\N
43	carmelo@hahn.info	$2a$12$ZVBzDJMiKTTpPXxW3GfOs.UvN1rzGZ4RHjCPTaRVJKlTqVF9DR0aK	\N	\N	\N	2024-04-25 14:03:47.213027	2024-04-25 14:03:47.213027	carmelo	\N	\N	\N	\N	2	\N
44	darell@kertzmann-robel.info	$2a$12$iXStS./Qsd4FuaVGBu4NcOGz4xuRspR6eC2mKw786iGs753R2xiza	\N	\N	\N	2024-04-25 14:03:47.433344	2024-04-25 14:03:47.433344	darell	\N	\N	\N	\N	2	\N
45	ella@mayert.net	$2a$12$DcE0wLcjoq4lUE3tq9YouuePgDsMpU0FSS3ZDjPQeXQcRt3h2WFha	\N	\N	\N	2024-04-25 14:03:47.641533	2024-04-25 14:03:47.641533	ella	\N	\N	\N	\N	2	\N
46	lenny.mcdermott@bode.info	$2a$12$KjHxzmh.UP9KHQA0CAzINer9VddrmNlaCW8UEgZbnhi9y49MdblTy	\N	\N	\N	2024-04-25 14:03:47.854404	2024-04-25 14:03:47.854404	lenny.mcdermott	\N	\N	\N	\N	2	\N
47	damien.ruecker@pacocha.io	$2a$12$ZsLNA1JMq8CLAP8i5RdWne7xVhaflFekMJIlVv1uquLhs6btragka	\N	\N	\N	2024-04-25 14:03:48.05915	2024-04-25 14:03:48.05915	damien.ruecker	\N	\N	\N	\N	2	\N
48	yasmine.rowe@kilback.net	$2a$12$pAy/zkhUXDucSoY1aeNeyuwMs5uRwvlmGkYNKaf.DlsHCS0ykLp9.	\N	\N	\N	2024-04-25 14:03:48.266302	2024-04-25 14:03:48.266302	yasmine.rowe	\N	\N	\N	\N	2	\N
49	samuel@kiehn-harvey.io	$2a$12$esYWOFGFIxOWDmr6AQ7XVuDmS3lEcWlaagWWh0X2aHyF7OFaYwfQu	\N	\N	\N	2024-04-25 14:03:48.473643	2024-04-25 14:03:48.473643	samuel	\N	\N	\N	\N	2	\N
50	sena@champlin.org	$2a$12$ZDtGTGn20VebOtpX0dnK8efGZzm3EX2Jkq3J1G8uLrAx3ej8v5zw6	\N	\N	\N	2024-04-25 14:03:48.674417	2024-04-25 14:03:48.674417	sena	\N	\N	\N	\N	2	\N
51	nicholas@barrows-welch.biz	$2a$12$xxsoUWbXlhl9TshWiD9SL.MC69HTWc2Dqx3BPlLZRkV42D0qD38yq	\N	\N	\N	2024-04-25 14:03:48.875851	2024-04-25 14:03:48.875851	nicholas	\N	\N	\N	\N	2	\N
52	tia@kuhn.net	$2a$12$5JHiXKLn0USGXS2Yw4ejZedduCvupvpNf6I.UGFOWb.mAWOs2iVXW	\N	\N	\N	2024-04-25 14:03:49.078112	2024-04-25 14:03:49.078112	tia	\N	\N	\N	\N	2	\N
53	marvin.lynch@emmerich-goyette.info	$2a$12$7Q8u9ATUL1nIRfkuE6FOOekywUotqXJm5vRDkKG6MMNv1O5.hgBq6	\N	\N	\N	2024-04-25 14:03:49.278326	2024-04-25 14:03:49.278326	marvin.lynch	\N	\N	\N	\N	2	\N
54	marybeth@damore-klocko.io	$2a$12$m5Ghy9qnRa3JbjdyTWV9F.SB84k7aMipCrmahHpZGsdwSJg7V3cXK	\N	\N	\N	2024-04-25 14:03:49.480712	2024-04-25 14:03:49.480712	marybeth	\N	\N	\N	\N	2	\N
55	tod.tillman@mclaughlin-mertz.name	$2a$12$Du5QrvemAM3sSZgit9wXXuQwZIRAqa6KGrLhT0SAxCcnN7fDwwReC	\N	\N	\N	2024-04-25 14:03:49.683098	2024-04-25 14:03:49.683098	tod.tillman	\N	\N	\N	\N	2	\N
56	hortensia_bosco@keeling-huel.co	$2a$12$5PJlLCv1mJKZ6Gj1i2lN1.YZYRrDQFjV7h5Twphnh2.GAlvvGLJLe	\N	\N	\N	2024-04-25 14:03:49.887818	2024-04-25 14:03:49.887818	hortensia_bosco	\N	\N	\N	\N	2	\N
57	jamila@hettinger.co	$2a$12$S3QSo1svlTwZVwkuI7DiPOZbetcNNUQJDQ34oL1dn8ypAwTPbKkrq	\N	\N	\N	2024-04-25 14:03:50.086522	2024-04-25 14:03:50.086522	jamila	\N	\N	\N	\N	2	\N
58	ilda@gutkowski.net	$2a$12$KJDlcdPSXolO/H7hMWub6OuM5jVIRyvv0P68V2Bzo4hllkwycRll6	\N	\N	\N	2024-04-25 14:03:50.28707	2024-04-25 14:03:50.28707	ilda	\N	\N	\N	\N	2	\N
59	carol@witting.name	$2a$12$ht.6OBkL9IqeFDMjV0y/XuuijMgIuDvyp2mWBu6uCjyuq315SxuNm	\N	\N	\N	2024-04-25 14:03:50.490293	2024-04-25 14:03:50.490293	carol	\N	\N	\N	\N	2	\N
60	david.mcdermott@murphy.name	$2a$12$aG9iuzERXVP02sjWa/f/pOCFuDKhbm8bp.XjvJXZoJfl9QLAau/ci	\N	\N	\N	2024-04-25 14:03:50.690967	2024-04-25 14:03:50.690967	david.mcdermott	\N	\N	\N	\N	2	\N
61	asha@erdman.net	$2a$12$T7pMU3pMVNKGFAmWMjCDPewuywFQ1GxJ/E/fH.ZWNehPNXibkYseS	\N	\N	\N	2024-04-25 14:03:50.890328	2024-04-25 14:03:50.890328	asha	\N	\N	\N	\N	2	\N
62	george_blanda@little.com	$2a$12$I5rGxNy2n3IdZGZwjMLRGeIssgaRy/4m44I3Ux42UoNTvs6Gy4jYS	\N	\N	\N	2024-04-25 14:03:51.090559	2024-04-25 14:03:51.090559	george_blanda	\N	\N	\N	\N	2	\N
63	jamaal@christiansen.info	$2a$12$fo9V9GQ9PPcxzTyLZC4LfuDZSUoAqoMyrxBcoV/TcOGns4SsopNje	\N	\N	\N	2024-04-25 14:03:51.290401	2024-04-25 14:03:51.290401	jamaal	\N	\N	\N	\N	2	\N
64	malvina@macgyver.info	$2a$12$EtyZLJRVpQQyft820F3fRe8nkqWflwnlPmeF2zx0aCI51LkF1F.4e	\N	\N	\N	2024-04-25 14:03:51.489942	2024-04-25 14:03:51.489942	malvina	\N	\N	\N	\N	2	\N
65	hien.moore@gutmann.io	$2a$12$X4tvKowYHIOUAgV1TK3YduhMNVaYurhPcgBTI260FlTdUBH0NzyDS	\N	\N	\N	2024-04-25 14:03:51.688529	2024-04-25 14:03:51.688529	hien.moore	\N	\N	\N	\N	2	\N
66	leland@breitenberg.info	$2a$12$ZUSWIAKBStegHI8OLNpBuO4JLvU4YRzFRmltuEf9rb3IVqHWvKZTK	\N	\N	\N	2024-04-25 14:03:51.887098	2024-04-25 14:03:51.887098	leland	\N	\N	\N	\N	2	\N
67	daryl_pfannerstill@quitzon.name	$2a$12$e3isNarpwqp8YNwik5Kn1OldEbZA//ljPnptxgCYheRVv5nL8.bde	\N	\N	\N	2024-04-25 14:03:52.092727	2024-04-25 14:03:52.092727	daryl_pfannerstill	\N	\N	\N	\N	2	\N
68	arron@okeefe-durgan.org	$2a$12$FX6QcEOh1PZ.APdOUD9Pc.mTth.dvNUpxD.VV/8ZmJIBrIlbVuFrq	\N	\N	\N	2024-04-25 14:03:52.305278	2024-04-25 14:03:52.305278	arron	\N	\N	\N	\N	2	\N
69	napoleon@johnson-spinka.co	$2a$12$sVeO64O3zpTIZ1PTN1LEQuKbZSwZZ4xGfsE6zZzolCV/1XPDabA9O	\N	\N	\N	2024-04-25 14:03:52.514924	2024-04-25 14:03:52.514924	napoleon	\N	\N	\N	\N	2	\N
70	dusty.aufderhar@klein-lueilwitz.net	$2a$12$QHX6lRozR.SXL4PNjLYTS.xSPgD/fl.9Pn/8l6a6VCju5oXpHe25G	\N	\N	\N	2024-04-25 14:03:52.722751	2024-04-25 14:03:52.722751	dusty.aufderhar	\N	\N	\N	\N	2	\N
71	monty.mante@collins.net	$2a$12$K.Hylm3gKUTBYZnyd./RpOJar4k8q4vLwyuLZgtK5IzcG1IMA1zxS	\N	\N	\N	2024-04-25 14:03:52.939457	2024-04-25 14:03:52.939457	monty.mante	\N	\N	\N	\N	2	\N
72	rosalie@padberg-brakus.biz	$2a$12$Fy6KUwkONxSM.IHHbirWv.BG2bCEJq2edo6/ggooj3TKBCoyLeoQS	\N	\N	\N	2024-04-25 14:03:53.149791	2024-04-25 14:03:53.149791	rosalie	\N	\N	\N	\N	2	\N
73	kera.green@monahan-mraz.name	$2a$12$/c4iqeMvTh4U1FLt2KQrlOfVoA8C/3yK8iU8vGwATHM8pqSPQCzAy	\N	\N	\N	2024-04-25 14:03:53.35305	2024-04-25 14:03:53.35305	kera.green	\N	\N	\N	\N	2	\N
74	dwain@reichel.biz	$2a$12$9xrD8OeihrAxQHJ2Zatu7uJ4.kC28LeAgUq2Iw2Lx6lzZFJ1AeAz6	\N	\N	\N	2024-04-25 14:03:53.567614	2024-04-25 14:03:53.567614	dwain	\N	\N	\N	\N	2	\N
75	brittni_larson@wyman.biz	$2a$12$2pQVGuY4HBUKWm8liXdRsehZ2M1EBMz31rdqQQ8O7l35sLiSmNaQS	\N	\N	\N	2024-04-25 14:03:53.791298	2024-04-25 14:03:53.791298	brittni_larson	\N	\N	\N	\N	2	\N
76	johnette.rice@sauer.co	$2a$12$g.cWXZJAjKZ7AiQ8ls6za.OqfO59ot3vlpjYLuVIN7mCrQaFIqvfC	\N	\N	\N	2024-04-25 14:03:54.002069	2024-04-25 14:03:54.002069	johnette.rice	\N	\N	\N	\N	2	\N
77	waldo.oconnell@glover.name	$2a$12$4TqUViQuVFYs4YDNJpti3.cbG9ScXJJEKAoaBsFHG9RmJorkjIeSC	\N	\N	\N	2024-04-25 14:03:54.205637	2024-04-25 14:03:54.205637	waldo.oconnell	\N	\N	\N	\N	2	\N
78	elwanda_zboncak@klocko.org	$2a$12$PbC435uWZ4XLNu86aEE6/.zE4.pEqwZVpQYTwAnYTGlOL0FrbTKcy	\N	\N	\N	2024-04-25 14:03:54.409301	2024-04-25 14:03:54.409301	elwanda_zboncak	\N	\N	\N	\N	2	\N
79	danika_hodkiewicz@funk.name	$2a$12$Y22gmEuOL5.awPcYOutr0uDbwzagm6E6c1x4WREiB/A8wRScxhqSq	\N	\N	\N	2024-04-25 14:03:54.614065	2024-04-25 14:03:54.614065	danika_hodkiewicz	\N	\N	\N	\N	2	\N
80	keenan@hintz.name	$2a$12$47q9GVLH7D4R6FfQHFT4FOK/lkU9mUzsIcSrB9PYPpYQW5lD.ktPy	\N	\N	\N	2024-04-25 14:03:54.816881	2024-04-25 14:03:54.816881	keenan	\N	\N	\N	\N	2	\N
81	danika_grant@koch-king.co	$2a$12$/4Hp.87BBc9HbU594L7MxOUDeVWygrvfcEuTQp5gSY/.sp2cyaPwm	\N	\N	\N	2024-04-25 14:03:55.055309	2024-04-25 14:03:55.055309	danika_grant	\N	\N	\N	\N	2	\N
82	joeann@langosh.net	$2a$12$gvltzRWC0LjtttwfX1x5v.f0387SmYgoXajfR4i.a9t5ssS8QmMw6	\N	\N	\N	2024-04-25 14:03:55.28792	2024-04-25 14:03:55.28792	joeann	\N	\N	\N	\N	2	\N
83	ava.rippin@rice.com	$2a$12$1QpcO.Lvef651ATgQrx1M.SCFKma0ZPU3K5X2X2ZXqPV8vSv6jLGy	\N	\N	\N	2024-04-25 14:03:55.4973	2024-04-25 14:03:55.4973	ava.rippin	\N	\N	\N	\N	2	\N
84	moira_gleichner@schiller-ebert.com	$2a$12$qXPjGw2.g5AAjKIENcWYHuuCPMH7JpSTTnQf/tqrT6e2Kv68n6hv2	\N	\N	\N	2024-04-25 14:03:55.70459	2024-04-25 14:03:55.70459	moira_gleichner	\N	\N	\N	\N	2	\N
85	bradley@rogahn-collier.info	$2a$12$I2gpZGsx75OhnmqyI34VSe5uIjaY/M23iYhcgNa9hWnVvSEC1DpXO	\N	\N	\N	2024-04-25 14:03:55.910256	2024-04-25 14:03:55.910256	bradley	\N	\N	\N	\N	2	\N
86	lou@mcglynn.name	$2a$12$2KjdBezYNaewMLc2RteniODkQyXldp/LuZdbBVy.xcDYnMJsPrfIW	\N	\N	\N	2024-04-25 14:03:56.128198	2024-04-25 14:03:56.128198	lou	\N	\N	\N	\N	2	\N
87	jefferey@nikolaus.info	$2a$12$JFGlDQ3ZXz4WItDCuMIXJejGdmr/rS9X3EbbLN7k0/tg4qq.bdNaS	\N	\N	\N	2024-04-25 14:03:56.3461	2024-04-25 14:03:56.3461	jefferey	\N	\N	\N	\N	2	\N
88	juan@crona-treutel.co	$2a$12$tVLVGnRSp9L7iTJDKuPlkeLFvL7tBglVcQdjujCNhdVJ.u8mJZv5m	\N	\N	\N	2024-04-25 14:03:56.553638	2024-04-25 14:03:56.553638	juan	\N	\N	\N	\N	2	\N
89	marty@oconner.name	$2a$12$O.HjyU0uPSvwxCkcH6BRYuM7XyfqkBkzRgPSkO2jy.A/0ZlUx6hCK	\N	\N	\N	2024-04-25 14:03:56.758914	2024-04-25 14:03:56.758914	marty	\N	\N	\N	\N	2	\N
90	marcos@jacobi.org	$2a$12$j5UWu9jHmioBErk5bMvMH.uOWAcVoumNz6qqrzQpCoLJ/gqsQOmCi	\N	\N	\N	2024-04-25 14:03:56.968676	2024-04-25 14:03:56.968676	marcos	\N	\N	\N	\N	2	\N
91	demetrice@lockman.com	$2a$12$BcBbfg3Tkzmqm1CUq5Nm1uulVjYvlxCile0rOZpEPVNZ5n/SP.b8q	\N	\N	\N	2024-04-25 14:03:57.168873	2024-04-25 14:03:57.168873	demetrice	\N	\N	\N	\N	2	\N
92	harold@goyette-ondricka.name	$2a$12$3uBIgAYhou7YRcdpVjN2d.e0Jx4bdU0PeDc0A2Ffp3lZRC.UIb7DO	\N	\N	\N	2024-04-25 14:03:57.369716	2024-04-25 14:03:57.369716	harold	\N	\N	\N	\N	2	\N
93	hal_powlowski@hansen.co	$2a$12$h7Brz3FOzPJIbdU8zBR96OjtqHWIg4bNZccD2Lu.1g0m9eDcUGdWy	\N	\N	\N	2024-04-25 14:03:57.571818	2024-04-25 14:03:57.571818	hal_powlowski	\N	\N	\N	\N	2	\N
94	ben_reilly@zboncak.io	$2a$12$ks9d6JnI.XjGvw0YzAEYI.jiezMORoPklL8iyebDpW3pxR1HOX6fm	\N	\N	\N	2024-04-25 14:03:57.772749	2024-04-25 14:03:57.772749	ben_reilly	\N	\N	\N	\N	2	\N
95	noe_kreiger@cummerata-murphy.org	$2a$12$NHrHaICcnfFlgTPIr00m7uPd4KyRy2tBC0FCANPFSAxqrBe0.Ypnm	\N	\N	\N	2024-04-25 14:03:57.977115	2024-04-25 14:03:57.977115	noe_kreiger	\N	\N	\N	\N	2	\N
96	cammie_roob@huels-lemke.io	$2a$12$e5QMnJ2FglKpxst76KqpxeQPidgQ/5IfmhHl0L4ruXizPH9BGdKtW	\N	\N	\N	2024-04-25 14:03:58.176885	2024-04-25 14:03:58.176885	cammie_roob	\N	\N	\N	\N	2	\N
97	bobbie@beer.io	$2a$12$ltrNHyHb1l88SGAvK27NIOWABQ1eS1uuSxSm3k4jtL0V73Zh252xi	\N	\N	\N	2024-04-25 14:03:58.375361	2024-04-25 14:03:58.375361	bobbie	\N	\N	\N	\N	2	\N
98	johna.dicki@corkery.com	$2a$12$B01vWet0QN6MoLIJoo.GyOJzCda/qnf.zYU.TvTgrOU3tBfAFXgoO	\N	\N	\N	2024-04-25 14:03:58.574212	2024-04-25 14:03:58.574212	johna.dicki	\N	\N	\N	\N	2	\N
99	eartha_gibson@schumm.co	$2a$12$C8gMw.g5xqU1n7n77KQaI.AHkOY76gEaJAWRlMPzPDjmjDE/a/UIe	\N	\N	\N	2024-04-25 14:03:58.785607	2024-04-25 14:03:58.785607	eartha_gibson	\N	\N	\N	\N	2	\N
100	salvatore@labadie-wehner.info	$2a$12$mmaUyDOt/GA67xY.nHc3Y.FrQUi531/vo2vyLl7vQ3dReUBW7jeSu	\N	\N	\N	2024-04-25 14:03:59.060672	2024-04-25 14:03:59.060672	salvatore	\N	\N	\N	\N	2	\N
101	lewis@rice.org	$2a$12$NTdEY6him0XusujNxKgdQOPAnZq5w0B4aaWZdGjj1yiN.BfDFtJyS	\N	\N	\N	2024-04-25 14:03:59.267437	2024-04-25 14:03:59.267437	lewis	\N	\N	\N	\N	2	\N
102	lenny.bernhard@rempel-robel.org	$2a$12$LNHw2Eaeza1/QsTH4DW4seVDliz7omOvelTLC2OdhnoSCG8LS3iNi	\N	\N	\N	2024-04-25 14:03:59.4744	2024-04-25 14:03:59.4744	lenny.bernhard	\N	\N	\N	\N	2	\N
103	malcom@mann.com	$2a$12$6NB2WmuyCZjG3/uuzpPNIe69.0Swj4YTz0eeTMP9e3KoDm.LUrrDO	\N	\N	\N	2024-04-25 14:03:59.682685	2024-04-25 14:03:59.682685	malcom	\N	\N	\N	\N	2	\N
104	eulalia_weber@bergnaum.biz	$2a$12$U5TZEBD36IB9yM/a.U6OK.8xxm2fjzmy6ko8i0E.bhDRayr7ekR5i	\N	\N	\N	2024-04-25 14:03:59.885871	2024-04-25 14:03:59.885871	eulalia_weber	\N	\N	\N	\N	2	\N
105	almeda_predovic@bogisich.name	$2a$12$c38RAZrtUSo9MIxJW0b4yeNB5evBNDXMQRDRi4eNBTEms/aB8ebme	\N	\N	\N	2024-04-25 14:04:00.090526	2024-04-25 14:04:00.090526	almeda_predovic	\N	\N	\N	\N	2	\N
106	priscila.schneider@reinger-reichert.org	$2a$12$PszP6ED3.wT7K5STyp/1XuaeBsBGg1IITQxyfqc94VYmeLl3Y8P7y	\N	\N	\N	2024-04-25 14:04:00.306556	2024-04-25 14:04:00.306556	priscila.schneider	\N	\N	\N	\N	2	\N
107	christoper.hammes@runte.io	$2a$12$MZXyMmLaGhNtXfhiQfcXN.UVjz7vStoSMT8wICl1eT4heJ09rbfwa	\N	\N	\N	2024-04-25 14:04:00.525772	2024-04-25 14:04:00.525772	christoper.hammes	\N	\N	\N	\N	2	\N
108	wilson@braun-marvin.net	$2a$12$qucaloFKWcFlNa91erkrLOVpxwCQ3so0/BHf5nitZDAMn6E..RZmG	\N	\N	\N	2024-04-25 14:04:00.732136	2024-04-25 14:04:00.732136	wilson	\N	\N	\N	\N	2	\N
109	rosaria@rutherford-hane.net	$2a$12$PChRfk/NBEwL.KTRCkgPDOxGCs5SKghFjsN2nBI7V3YxiiclUksnm	\N	\N	\N	2024-04-25 14:04:00.939259	2024-04-25 14:04:00.939259	rosaria	\N	\N	\N	\N	2	\N
110	sammie@kuhlman.name	$2a$12$hf9iEJXhucyN.D/vfaoln.CYklIjwQX8W/6A4qfRWcSIyonCLITNG	\N	\N	\N	2024-04-25 14:04:01.147788	2024-04-25 14:04:01.147788	sammie	\N	\N	\N	\N	2	\N
111	maryalice.donnelly@king.name	$2a$12$hw/rU39423v6CMQcWSlmo.dSo5uMqKAOEy/F5rcoA/0A5HEgOOC9a	\N	\N	\N	2024-04-25 14:04:01.350645	2024-04-25 14:04:01.350645	maryalice.donnelly	\N	\N	\N	\N	2	\N
112	marcus@kautzer.info	$2a$12$A164oyUD/ypt.KzlYsLYxe./UsyvxS2/VbV/PPDlEGzuXiLFrwhzq	\N	\N	\N	2024-04-25 14:04:01.554099	2024-04-25 14:04:01.554099	marcus	\N	\N	\N	\N	2	\N
113	ali.will@roberts-schmeler.com	$2a$12$19OHfFq/7FQle3xBor2lG.igHdJD5PrXaZ7.MK33ZTqPMQ0bvtirG	\N	\N	\N	2024-04-25 14:04:01.765877	2024-04-25 14:04:01.765877	ali.will	\N	\N	\N	\N	2	\N
114	mauricio@bernier.biz	$2a$12$Vhm/RBjXVJL2ONumHYipNuz2wn2MM7N4kazYL3vjtyYXOU2MxfUHC	\N	\N	\N	2024-04-25 14:04:01.96792	2024-04-25 14:04:01.96792	mauricio	\N	\N	\N	\N	2	\N
115	elmer@cormier.biz	$2a$12$WS7bhO2VwPdKHzCwkcMZGeOQyOPJmSKfS2rcUgddYRjJCxrfJuCUa	\N	\N	\N	2024-04-25 14:04:02.168968	2024-04-25 14:04:02.168968	elmer	\N	\N	\N	\N	2	\N
116	elfreda@koepp.net	$2a$12$nrPwECa65dkm89IGpMOfVuQFXZ9aUOiR316iz78aVOyu/V6rSabS2	\N	\N	\N	2024-04-25 14:04:02.377955	2024-04-25 14:04:02.377955	elfreda	\N	\N	\N	\N	2	\N
117	ta.oberbrunner@kohler-pagac.info	$2a$12$Q47vf5gneTEFxiHb9w6KdeZ22F5Ns2TQip4O3auNNzaD7xcWAeiFO	\N	\N	\N	2024-04-25 14:04:02.579071	2024-04-25 14:04:02.579071	ta.oberbrunner	\N	\N	\N	\N	2	\N
118	skye@rowe-blick.name	$2a$12$Qyxjut469HCHwqAahFx5C.7o6l6FUHycvNq.DTVbc2cA4YD8rJzK.	\N	\N	\N	2024-04-25 14:04:02.780611	2024-04-25 14:04:02.780611	skye	\N	\N	\N	\N	2	\N
119	christena@purdy.name	$2a$12$5zZSLx1u24BS1SSzCAUct.xZsyvdpJgJDIKIKXOlOhOi0vbtlgFMm	\N	\N	\N	2024-04-25 14:04:02.981693	2024-04-25 14:04:02.981693	christena	\N	\N	\N	\N	2	\N
120	gavin.mayer@dooley.name	$2a$12$NDIDZ.DIHHH5zGowseZA5.tShXppG1DBY9GxWel4KPwScbd/WiAYC	\N	\N	\N	2024-04-25 14:04:03.187703	2024-04-25 14:04:03.187703	gavin.mayer	\N	\N	\N	\N	2	\N
121	shannon@murray.com	$2a$12$cAQ8aMjMmiDZPIemKPnGXOpesPVQC0lO1n.S/EZI5CJQn.ePHZC/e	\N	\N	\N	2024-04-25 14:04:03.387079	2024-04-25 14:04:03.387079	shannon	\N	\N	\N	\N	2	\N
122	daniella.krajcik@steuber-johnson.co	$2a$12$GmeweoEK9XQSgMUzH4IotO3x4i4vG2FGu5v2WOCASGiFm95Xafbei	\N	\N	\N	2024-04-25 14:04:03.590513	2024-04-25 14:04:03.590513	daniella.krajcik	\N	\N	\N	\N	2	\N
123	darnell.walter@sawayn-funk.co	$2a$12$TElLGEt9daVGVEEZoSKnT.ye712aXe/GdEvfnq2jo4NHT8AhhYXIS	\N	\N	\N	2024-04-25 14:04:03.790848	2024-04-25 14:04:03.790848	darnell.walter	\N	\N	\N	\N	2	\N
124	dionne@torphy.org	$2a$12$c38NaCEz11JtBLivUtDsheIhgyMWQUTmHsquqtK.dr24vXlCEl5Vm	\N	\N	\N	2024-04-25 14:04:03.991623	2024-04-25 14:04:03.991623	dionne	\N	\N	\N	\N	2	\N
125	twana_white@ratke.io	$2a$12$qVeyqkNtyByVQ.Nt3DUXGOAwd/CWG9/Y54O.mHZXLDtuTA0d.q08u	\N	\N	\N	2024-04-25 14:04:04.190905	2024-04-25 14:04:04.190905	twana_white	\N	\N	\N	\N	2	\N
126	douglass@grant-ullrich.name	$2a$12$Em5urZ6JcUFpsU7Yunzj4edmRHCZoponen7AuxzuUgYYjLsxSiwQ2	\N	\N	\N	2024-04-25 14:04:04.391021	2024-04-25 14:04:04.391021	douglass	\N	\N	\N	\N	2	\N
127	everette_carroll@wyman-emard.co	$2a$12$rqTiHetJu.NqYrGZVVFOkOQWr5.F9ke8utyM5HNckf47FMuWjr3pe	\N	\N	\N	2024-04-25 14:04:04.593986	2024-04-25 14:04:04.593986	everette_carroll	\N	\N	\N	\N	2	\N
128	rosario@schroeder.info	$2a$12$VkcGbzPChLzK/n3H91TWEOyanVIBDYC.Ki66dZGRwU.M/voZjxGci	\N	\N	\N	2024-04-25 14:04:04.795594	2024-04-25 14:04:04.795594	rosario	\N	\N	\N	\N	2	\N
129	blanche@reinger-langosh.co	$2a$12$wUOPktznU//mAagWJZ9emOrj8XKyLv82yY1jUQtEjTDYDH33tsUCy	\N	\N	\N	2024-04-25 14:04:04.995076	2024-04-25 14:04:04.995076	blanche	\N	\N	\N	\N	2	\N
130	phillip.hyatt@heidenreich-schaefer.name	$2a$12$C0Wz8YXjvfh7vbhiHCS1JO23rUI9OBgwVyK9kfiP0HD4vUI2UQFVK	\N	\N	\N	2024-04-25 14:04:05.195515	2024-04-25 14:04:05.195515	phillip.hyatt	\N	\N	\N	\N	2	\N
131	jenny.hane@brekke.com	$2a$12$.7ou7v/iHPfXKUpGmVEv3OVbzPKEAQtXw2wzpUIRIihB4iePR2.yW	\N	\N	\N	2024-04-25 14:04:05.396254	2024-04-25 14:04:05.396254	jenny.hane	\N	\N	\N	\N	2	\N
132	arlene_metz@thompson.info	$2a$12$XQ2LuOSaaQ97XVKiTPWWjO/KmLAcM0gme0pisO7wVjeuz6tQXIbTy	\N	\N	\N	2024-04-25 14:04:05.597175	2024-04-25 14:04:05.597175	arlene_metz	\N	\N	\N	\N	2	\N
133	erasmo@johnson.net	$2a$12$82NpBoNg9rJeJeKeaY.9N.UMLZEdrXQkmumlus/HXI0HT9VhdRHWW	\N	\N	\N	2024-04-25 14:04:05.809058	2024-04-25 14:04:05.809058	erasmo	\N	\N	\N	\N	2	\N
134	loria.fritsch@keeling-bauch.com	$2a$12$ILh0Gf4XGSsqk4Wv7vlds.1UbCl1bno5.SfBGsZ7blFx9TkxcdpxS	\N	\N	\N	2024-04-25 14:04:06.019547	2024-04-25 14:04:06.019547	loria.fritsch	\N	\N	\N	\N	2	\N
135	leslee.cassin@harber.biz	$2a$12$GsRr3E.4X8Q9r2x6yIC4MuRiXUNqidyqhcp0YKQqKXM3a2gfnoV12	\N	\N	\N	2024-04-25 14:04:06.230604	2024-04-25 14:04:06.230604	leslee.cassin	\N	\N	\N	\N	2	\N
136	king.flatley@treutel.com	$2a$12$8wR.MHkoozP/St6Q0ox4X.uQA7V58tOezyJ431RKYPpMxRuhFZPIm	\N	\N	\N	2024-04-25 14:04:06.435692	2024-04-25 14:04:06.435692	king.flatley	\N	\N	\N	\N	2	\N
137	sigrid@feest.name	$2a$12$anzCccS5/ewvU82FY1NxwOCJkbluEe3MFbNzHKNPhE/VQzbZ5YVgK	\N	\N	\N	2024-04-25 14:04:06.642779	2024-04-25 14:04:06.642779	sigrid	\N	\N	\N	\N	2	\N
138	colton@zieme.io	$2a$12$XONNooRA0LPZbZ4neucOx.CKpsCH7ksdoKQK0D6SV9MmF0nmpAp3C	\N	\N	\N	2024-04-25 14:04:06.847593	2024-04-25 14:04:06.847593	colton	\N	\N	\N	\N	2	\N
139	verline@huels.com	$2a$12$bNWXJuYZneFtDrQ3F71kFexc0opSbQ5Y..1ocFwVJbJ4dj5VqNQoS	\N	\N	\N	2024-04-25 14:04:07.053132	2024-04-25 14:04:07.053132	verline	\N	\N	\N	\N	2	\N
140	ginny.wintheiser@cole-moore.org	$2a$12$wjn/7sXyUaNyD3OnZzve7exMF0Dms7ute8UC7tK4NqhudOh//IBJa	\N	\N	\N	2024-04-25 14:04:07.270902	2024-04-25 14:04:07.270902	ginny.wintheiser	\N	\N	\N	\N	2	\N
141	wyatt@frami.info	$2a$12$GDkcsFHWa.yh.BTLCYpPouyHlW4fLnL9CIV/tprqPlBoGRbercp66	\N	\N	\N	2024-04-25 14:04:07.482474	2024-04-25 14:04:07.482474	wyatt	\N	\N	\N	\N	2	\N
142	bok_feest@west.name	$2a$12$RI2B1dfimgx9CNs.StcSge38cF783JNOQcfi4LGDmDPGHvN56C7Uu	\N	\N	\N	2024-04-25 14:04:07.687384	2024-04-25 14:04:07.687384	bok_feest	\N	\N	\N	\N	2	\N
143	sanda@jerde-turner.info	$2a$12$XN/ddXDArNNS3k0lEz.Ho.x635.OcvHP/qxV1efnRPBiKJhJs2k4e	\N	\N	\N	2024-04-25 14:04:07.889704	2024-04-25 14:04:07.889704	sanda	\N	\N	\N	\N	2	\N
144	ruth_gutmann@armstrong.info	$2a$12$ZTqpLJnPmRd9sTagoS9YzetgfJ19VRxvpRu8WweolCi.wcuzQStwS	\N	\N	\N	2024-04-25 14:04:08.095248	2024-04-25 14:04:08.095248	ruth_gutmann	\N	\N	\N	\N	2	\N
145	billie.rosenbaum@bednar-armstrong.info	$2a$12$YqyuvyQyaLBd4AqaIRoJpeG/./.WRyAIv1/esDO6Z7aO1t4SP9vHC	\N	\N	\N	2024-04-25 14:04:08.299051	2024-04-25 14:04:08.299051	billie.rosenbaum	\N	\N	\N	\N	2	\N
146	valarie_yundt@cruickshank.io	$2a$12$if36oI739KgQVDfxARhylO3lrSwA/hl0E/q9HXDG01.q9HH4miJVy	\N	\N	\N	2024-04-25 14:04:08.5094	2024-04-25 14:04:08.5094	valarie_yundt	\N	\N	\N	\N	2	\N
147	monte@lindgren.info	$2a$12$8LZQ2892PWIFyvb44XfUgeDwNmKEBDMYzFZXvhq4w/heUhqsmhMAW	\N	\N	\N	2024-04-25 14:04:08.710194	2024-04-25 14:04:08.710194	monte	\N	\N	\N	\N	2	\N
148	willene.moore@daniel.info	$2a$12$i1252VaD/72C2N4WM3/CI.ojfP/EhoRPhUULsUH3iNNBsFx.I/CBm	\N	\N	\N	2024-04-25 14:04:08.9105	2024-04-25 14:04:08.9105	willene.moore	\N	\N	\N	\N	2	\N
149	hailey@heller.info	$2a$12$lKQBJ/TH5m0ESHHDApFbQOO6HuUIMwHMwi0oTp98dUE8nIdM25uLy	\N	\N	\N	2024-04-25 14:04:09.111215	2024-04-25 14:04:09.111215	hailey	\N	\N	\N	\N	2	\N
150	milagros.bradtke@batz.io	$2a$12$nBTjJ1sT5GBHxEl4OqDfJ.jSEVMTFyhU69t0fbPlrr105Fbb6.S8y	\N	\N	\N	2024-04-25 14:04:09.310482	2024-04-25 14:04:09.310482	milagros.bradtke	\N	\N	\N	\N	2	\N
151	leon@hudson.net	$2a$12$fs1Q5MpoqSNXKcK1/yPdguZo2PUe.l57efRDkAo17zmSewnI/uvga	\N	\N	\N	2024-04-25 14:04:09.511534	2024-04-25 14:04:09.511534	leon	\N	\N	\N	\N	2	\N
152	bridgett_lebsack@bins.co	$2a$12$nx1q7.It0kiLd1AbYQFsnucDuZPl3fsz59v9S0hCOCBr4AwQqM5TK	\N	\N	\N	2024-04-25 14:04:09.710234	2024-04-25 14:04:09.710234	bridgett_lebsack	\N	\N	\N	\N	2	\N
153	nell.wisozk@harris.name	$2a$12$HA6aLM6WINsMUBOUIGSGuetdB1q5eVj7/OKl1orEsH4ins4eDT74i	\N	\N	\N	2024-04-25 14:04:09.920311	2024-04-25 14:04:09.920311	nell.wisozk	\N	\N	\N	\N	2	\N
154	ira.hickle@parker.io	$2a$12$pwy/Lsa3DMucBPeOkyaYmeFUIAMXbaBAC7RlxOd5Q8exo7jU9U10G	\N	\N	\N	2024-04-25 14:04:10.122992	2024-04-25 14:04:10.122992	ira.hickle	\N	\N	\N	\N	2	\N
155	ami@franecki-kozey.net	$2a$12$qHghnKi36fi/33aDhcjDm.GYtiCSonanZmtkfqoCxz6XQpnLJOCgC	\N	\N	\N	2024-04-25 14:04:10.32664	2024-04-25 14:04:10.32664	ami	\N	\N	\N	\N	2	\N
156	lina@walter-sipes.org	$2a$12$/iftje2thSDavnuxZA6aR.9EjnhtaLX8nhAC8cTlBEMVUdvWb.lpu	\N	\N	\N	2024-04-25 14:04:10.530015	2024-04-25 14:04:10.530015	lina	\N	\N	\N	\N	2	\N
157	shelly_fadel@larson.info	$2a$12$XHd/UHsOYY/g.Fg.Vt0nsO.BbNaT6P44XRikj5R5Pc9SkpLRSKoSO	\N	\N	\N	2024-04-25 14:04:10.732066	2024-04-25 14:04:10.732066	shelly_fadel	\N	\N	\N	\N	2	\N
158	quincy_sauer@ernser.name	$2a$12$yvpLQvo9deke4jxrzv/XPOBGhYvdJTfUq6ZqJTB.XDhN9oZKhj4ZG	\N	\N	\N	2024-04-25 14:04:10.932558	2024-04-25 14:04:10.932558	quincy_sauer	\N	\N	\N	\N	2	\N
159	chante.deckow@mayer.info	$2a$12$9ZvaYFxbyuM2B3jzvoKDk.3/dZuoO1O5NXCmYw0hygI/c043ERjvG	\N	\N	\N	2024-04-25 14:04:11.131778	2024-04-25 14:04:11.131778	chante.deckow	\N	\N	\N	\N	2	\N
160	virginia.glover@block-lindgren.io	$2a$12$38feJszzqplo8z267C2g1O3uFbf.jROg93As.0u1yoYSskQYCaZhW	\N	\N	\N	2024-04-25 14:04:11.331088	2024-04-25 14:04:11.331088	virginia.glover	\N	\N	\N	\N	2	\N
161	debora@ledner-fritsch.biz	$2a$12$yVM9GPCVivYmD9VFdHpBx.gOYyY626s7JRXqrQdMPX4Fhk/Su5fIa	\N	\N	\N	2024-04-25 14:04:11.531253	2024-04-25 14:04:11.531253	debora	\N	\N	\N	\N	2	\N
162	joanne@ledner.net	$2a$12$mLPPH/3Lb/en1qdBS.ByB./RsTVD7lBr/.98TBqoQ4QHq1R98uhg6	\N	\N	\N	2024-04-25 14:04:11.731313	2024-04-25 14:04:11.731313	joanne	\N	\N	\N	\N	2	\N
163	isaias_murphy@ryan.io	$2a$12$isj08z4XMv0pxzSyCAoxou/0mNhGRB4StSI8ZUJXtep6zrW3KjQNS	\N	\N	\N	2024-04-25 14:04:11.932405	2024-04-25 14:04:11.932405	isaias_murphy	\N	\N	\N	\N	2	\N
164	dorethea_dibbert@bashirian-christiansen.name	$2a$12$ZbJAJbEPSSdv0bfX1iN6COKwHIMdTyfv42wuKUKZg0Xqr1itjMuvi	\N	\N	\N	2024-04-25 14:04:12.132711	2024-04-25 14:04:12.132711	dorethea_dibbert	\N	\N	\N	\N	2	\N
165	hue@howe.io	$2a$12$EywagBor85rNRzG7mw/9/OTeCz2bFqegC7Oh1TgSw.n0rS45dQzju	\N	\N	\N	2024-04-25 14:04:12.334722	2024-04-25 14:04:12.334722	hue	\N	\N	\N	\N	2	\N
166	antonio_balistreri@weber.org	$2a$12$FJn2UA4cK0/vaIH27LrvJu4nEJBBiBvAzKV5MdUCqBv/pscwyQiQa	\N	\N	\N	2024-04-25 14:04:12.545116	2024-04-25 14:04:12.545116	antonio_balistreri	\N	\N	\N	\N	2	\N
167	aubrey.olson@zboncak.com	$2a$12$WPwooGsHCOUqmgXkk9asaejkLP9POuCMq6y6HrbOM1mVEDTfyoTh2	\N	\N	\N	2024-04-25 14:04:12.75189	2024-04-25 14:04:12.75189	aubrey.olson	\N	\N	\N	\N	2	\N
168	lindsey@casper.biz	$2a$12$XruzFtJ90HJxVkNuYK/WS.y2BCvfpFpihaUx7K0h4T7rqGzQ3nS4K	\N	\N	\N	2024-04-25 14:04:12.957766	2024-04-25 14:04:12.957766	lindsey	\N	\N	\N	\N	2	\N
169	taylor_hoppe@franecki.com	$2a$12$u/qVIMkySG1ir6LMbLcmKeUe3Eg08uVaIFsXZiawDDbH6pn91Efpy	\N	\N	\N	2024-04-25 14:04:13.161181	2024-04-25 14:04:13.161181	taylor_hoppe	\N	\N	\N	\N	2	\N
170	chuck_kovacek@mosciski-herzog.co	$2a$12$qIn4EHDUuQOuxKS31MsFPOVYCzM4MWWYcctAr4r72CEnJV8428BIS	\N	\N	\N	2024-04-25 14:04:13.365446	2024-04-25 14:04:13.365446	chuck_kovacek	\N	\N	\N	\N	2	\N
171	kina@kertzmann.io	$2a$12$fS6TArJzTz/.fKEutEu.MeAFgTJoRZT6i.HcgTrOMJlUjn/n95lGe	\N	\N	\N	2024-04-25 14:04:13.567131	2024-04-25 14:04:13.567131	kina	\N	\N	\N	\N	2	\N
172	rodrick_lueilwitz@legros.net	$2a$12$JCyNPS/ns1d0OYpka40.Mu0ZWBMF8j9KluS5WZ0sCpnM3LvF9Oetu	\N	\N	\N	2024-04-25 14:04:13.767694	2024-04-25 14:04:13.767694	rodrick_lueilwitz	\N	\N	\N	\N	2	\N
173	terresa.ohara@stamm.net	$2a$12$GdSN7v5xgOSNWK489zr4ReOjkQne75Z56FkB9pAEXgTQx9eVVBP..	\N	\N	\N	2024-04-25 14:04:13.987964	2024-04-25 14:04:13.987964	terresa.ohara	\N	\N	\N	\N	2	\N
174	janine@reynolds-altenwerth.biz	$2a$12$UrHpc1LJnHHJ0nunzaM4AeFWCC3Uub3DdUj6uEWC5IM3ZiORFYje.	\N	\N	\N	2024-04-25 14:04:14.191087	2024-04-25 14:04:14.191087	janine	\N	\N	\N	\N	2	\N
175	yasmine.hoeger@flatley.org	$2a$12$nW9GYNXbEPD5BhCvBD6IHuQ3CNWYcSGhQjUa3rL7PWGzwwvK565qW	\N	\N	\N	2024-04-25 14:04:14.394856	2024-04-25 14:04:14.394856	yasmine.hoeger	\N	\N	\N	\N	2	\N
176	stacey_homenick@metz.io	$2a$12$nubtnWGFo8X06SpDFxX2MOXA04dzDyKbKAQy45qELmFVNHj5aoY7m	\N	\N	\N	2024-04-25 14:04:14.597611	2024-04-25 14:04:14.597611	stacey_homenick	\N	\N	\N	\N	2	\N
177	cole.waters@schumm.org	$2a$12$pDIbzt7zCnHdO3E0Bw3JeeICJkSsm6Kj9EquNZoYzSwy0il3yHAAe	\N	\N	\N	2024-04-25 14:04:14.801399	2024-04-25 14:04:14.801399	cole.waters	\N	\N	\N	\N	2	\N
178	angla@schowalter-bernhard.info	$2a$12$iov586mQ5rVcMzHyTIRdseii694tckiX1n9YO..N6hRkqLSRGyf7K	\N	\N	\N	2024-04-25 14:04:15.005177	2024-04-25 14:04:15.005177	angla	\N	\N	\N	\N	2	\N
179	despina@gulgowski.org	$2a$12$hFszRTbSrSl/LEiIU9mveuuhp9ud9Fi16UVNgyGGdOu3sqDgoL0IO	\N	\N	\N	2024-04-25 14:04:15.21564	2024-04-25 14:04:15.21564	despina	\N	\N	\N	\N	2	\N
180	rosalba@lockman-hickle.io	$2a$12$kzU9HiGUQT76HN/8UaZVMuTr7.QhveYgpDt.OnNvakpMZOupIR4g2	\N	\N	\N	2024-04-25 14:04:15.418303	2024-04-25 14:04:15.418303	rosalba	\N	\N	\N	\N	2	\N
181	gayle@morar.com	$2a$12$Rm3.xCskXx7jvdMjKSYAJeU6R.Sde2.yN2cg48RhlyKFST9/h0zQ6	\N	\N	\N	2024-04-25 14:04:15.617226	2024-04-25 14:04:15.617226	gayle	\N	\N	\N	\N	2	\N
182	modesto@bernier.name	$2a$12$p2qpQ1MIoh6ZgBmjdY2ufOzFdNEO8dtuJh69HygecuMIaW.Mn3UWu	\N	\N	\N	2024-04-25 14:04:15.817125	2024-04-25 14:04:15.817125	modesto	\N	\N	\N	\N	2	\N
183	stephine_bauch@jaskolski-jast.net	$2a$12$G7TxGg4df2ZahI3MbH8FMeXxxkbVAH/vG.1oYceb5tcUoNxrDOHcq	\N	\N	\N	2024-04-25 14:04:16.019353	2024-04-25 14:04:16.019353	stephine_bauch	\N	\N	\N	\N	2	\N
184	graham@muller.org	$2a$12$D341vQizc5lUs9iArC9hGevzFrmLOjPQznb43Bo5vhdD6ss/4MRBq	\N	\N	\N	2024-04-25 14:04:16.226543	2024-04-25 14:04:16.226543	graham	\N	\N	\N	\N	2	\N
185	harry@goyette.org	$2a$12$d3o8Ns6jcKANPxqYr1uZFuhZfQ4SLXeVELyDrDhup31BCzvj0x2Wy	\N	\N	\N	2024-04-25 14:04:16.426041	2024-04-25 14:04:16.426041	harry	\N	\N	\N	\N	2	\N
186	russel@douglas.org	$2a$12$MX2oGOXJIOk1UKe4YsXMxeQKq7cOaRnu79WxCWSt7AraexnVMmTQS	\N	\N	\N	2024-04-25 14:04:16.626023	2024-04-25 14:04:16.626023	russel	\N	\N	\N	\N	2	\N
187	brendan_luettgen@christiansen.org	$2a$12$dfJy06JyNflb2AgtdrLvDeRs3gh3VXN1sONP04TMiBCjVBQ1CQx7i	\N	\N	\N	2024-04-25 14:04:16.825713	2024-04-25 14:04:16.825713	brendan_luettgen	\N	\N	\N	\N	2	\N
188	gilbert@marvin.name	$2a$12$Cux6xAqYfSjTdkA9jnAtSe5kyomkx3BdhuSlIOliXqC3we1Q3FVMu	\N	\N	\N	2024-04-25 14:04:17.026361	2024-04-25 14:04:17.026361	gilbert	\N	\N	\N	\N	2	\N
189	bryce@zieme.io	$2a$12$Svcb1ECvtkmYYkik49dXeekwDJD3FYxrRPoMlNlPWCKvhCX/y9gAm	\N	\N	\N	2024-04-25 14:04:17.233973	2024-04-25 14:04:17.233973	bryce	\N	\N	\N	\N	2	\N
190	billie@tillman-hand.io	$2a$12$eOmyB.mEpTvuF9kW0Jr9leJj4Wq17jz4IDzRC9NmZAHSaVitCEi4a	\N	\N	\N	2024-04-25 14:04:17.433981	2024-04-25 14:04:17.433981	billie	\N	\N	\N	\N	2	\N
191	george@kirlin.co	$2a$12$V3XQVv011FIg1IkWsMoLSOT9ea6Rfo/jGgkyUHqvoQs1hHuCYmxaa	\N	\N	\N	2024-04-25 14:04:17.6347	2024-04-25 14:04:17.6347	george	\N	\N	\N	\N	2	\N
192	lee.lowe@johnson.net	$2a$12$9k4.h0osJJtv0urRvi1CIeVR.yMuENRiWuF2snu72XEb8SrIG1Aii	\N	\N	\N	2024-04-25 14:04:17.835146	2024-04-25 14:04:17.835146	lee.lowe	\N	\N	\N	\N	2	\N
193	ressie.halvorson@friesen-erdman.org	$2a$12$JPcCxx3hOjOQWJ7n3gNyW.jZKvtksUK84h7M2G43fS0.SFlNfJCZu	\N	\N	\N	2024-04-25 14:04:18.036005	2024-04-25 14:04:18.036005	ressie.halvorson	\N	\N	\N	\N	2	\N
194	edgardo_howell@mosciski.biz	$2a$12$DI6DLca5KwKQlF7Kl5OFIOdooonCBxBbtEuh7rh3lgAiBamwYxKhK	\N	\N	\N	2024-04-25 14:04:18.23682	2024-04-25 14:04:18.23682	edgardo_howell	\N	\N	\N	\N	2	\N
195	marcelene@wintheiser-jerde.info	$2a$12$dHOFMVQ/igFVuHW9KeisFe3PgLSiXc2j0aSnX.Q3FR95wf7BYhx5e	\N	\N	\N	2024-04-25 14:04:18.441032	2024-04-25 14:04:18.441032	marcelene	\N	\N	\N	\N	2	\N
196	jared@tremblay-mcclure.info	$2a$12$M18NrUC/NgbPqvPF7ZH0YOE119dsiSF9Cx0/6Jjsw21pjRBXn5e7G	\N	\N	\N	2024-04-25 14:04:18.642852	2024-04-25 14:04:18.642852	jared	\N	\N	\N	\N	2	\N
197	hassan@robel-toy.com	$2a$12$/x7zF0oS7avJNzsFpD3EVOTjbSrhzAoaPbp2r.ALBQ4m.PkOsB32q	\N	\N	\N	2024-04-25 14:04:18.84945	2024-04-25 14:04:18.84945	hassan	\N	\N	\N	\N	2	\N
198	ehtel.osinski@beahan-stiedemann.io	$2a$12$5md5QiQq34NqcQAgM9z/5OcR7iloXzABgw4oOv891KtsnsqvBTrWW	\N	\N	\N	2024-04-25 14:04:19.060816	2024-04-25 14:04:19.060816	ehtel.osinski	\N	\N	\N	\N	2	\N
199	ned.lockman@dach.io	$2a$12$2A6xZXEgPM30083Jr3/VMuyEtR4TJZSjXwt94OYomm.ZBu6EFj8W6	\N	\N	\N	2024-04-25 14:04:19.30062	2024-04-25 14:04:19.30062	ned.lockman	\N	\N	\N	\N	2	\N
200	reita@dietrich-huel.com	$2a$12$XUis2X66Aud579gldsLkFeQXBCIVL9hkoiL7jor8S2yELMTZFVjjS	\N	\N	\N	2024-04-25 14:04:19.517988	2024-04-25 14:04:19.517988	reita	\N	\N	\N	\N	2	\N
201	terence_corkery@larkin-mayert.info	$2a$12$guf3XcK0NQp9RYs/7/4DkORycf6ZSAVS/qcNFIepXovuwh5lpR.Ne	\N	\N	\N	2024-04-25 14:04:19.721314	2024-04-25 14:04:19.721314	terence_corkery	\N	\N	\N	\N	2	\N
202	jerald@wyman.biz	$2a$12$oTl0ecW7GPC7DAPpa0n.COd42cF8akWRIVNka7on7nsblpXlZscHC	\N	\N	\N	2024-04-25 14:04:19.923244	2024-04-25 14:04:19.923244	jerald	\N	\N	\N	\N	2	\N
203	lecia@murray.biz	$2a$12$f83lPVeyA5MSjRiU6eDU7umQwqPb0OxmFjcEwY/6xKS11q9kXv77a	\N	\N	\N	2024-04-25 14:04:20.125478	2024-04-25 14:04:20.125478	lecia	\N	\N	\N	\N	2	\N
204	fernando.buckridge@mclaughlin.biz	$2a$12$4b6Cxg7pxYe//3fNoPn9g.B6m9ARRB7DVcLoZmE5TTIWDO/9Bz9Rq	\N	\N	\N	2024-04-25 14:04:20.326866	2024-04-25 14:04:20.326866	fernando.buckridge	\N	\N	\N	\N	2	\N
205	carter.swaniawski@wisozk-hauck.com	$2a$12$4iyEL5u1y2hv6e9rJyzIKOi.y4eI5/yqEP1XDkfszecsUbVu3in4K	\N	\N	\N	2024-04-25 14:04:20.541909	2024-04-25 14:04:20.541909	carter.swaniawski	\N	\N	\N	\N	2	\N
206	tristan_goodwin@kris.name	$2a$12$J5/IyQ3D0iO4.vfamzL1DudbOavfj12i314UqZq1snsfNO83XFF9u	\N	\N	\N	2024-04-25 14:04:20.750539	2024-04-25 14:04:20.750539	tristan_goodwin	\N	\N	\N	\N	2	\N
207	jesusa.ullrich@vonrueden.io	$2a$12$4myUsWVpvp2zEDuB6FPVP.l2quvu3NvWjvwQQ5/kGPQPTZQ1u7LMm	\N	\N	\N	2024-04-25 14:04:20.956461	2024-04-25 14:04:20.956461	jesusa.ullrich	\N	\N	\N	\N	2	\N
208	noah@brakus.info	$2a$12$cTV7CPLDbHzxZTSat/R1fOjKwff7we2nRPWIkcYe6l27tcYsLx43G	\N	\N	\N	2024-04-25 14:04:21.170208	2024-04-25 14:04:21.170208	noah	\N	\N	\N	\N	2	\N
209	fredrick@medhurst.io	$2a$12$7qzfTyfcTuY6pNV8LiN2V.1D6ETJyXVGajJOQecUhz1HNYDrKj5iK	\N	\N	\N	2024-04-25 14:04:21.377626	2024-04-25 14:04:21.377626	fredrick	\N	\N	\N	\N	2	\N
210	sabine.jaskolski@daugherty.io	$2a$12$lOHuTSWYLTWZxdT/fhwSbe4XfNt1mfelnvNtOK5kZG7dv2rN5/69a	\N	\N	\N	2024-04-25 14:04:21.584393	2024-04-25 14:04:21.584393	sabine.jaskolski	\N	\N	\N	\N	2	\N
211	lila.kassulke@marvin.net	$2a$12$vLdbrlWJyPW8XTmoKZN9QOx.D0FR0P7pJTUWhVGmIcEFmMFIXharS	\N	\N	\N	2024-04-25 14:04:21.788782	2024-04-25 14:04:21.788782	lila.kassulke	\N	\N	\N	\N	2	\N
212	donald.connelly@dickinson.org	$2a$12$lYzKxeszhTvqZIEEg6e8LOnGABgUMMkqYXJeh5Cgm0YBYIeaK2TDK	\N	\N	\N	2024-04-25 14:04:21.996407	2024-04-25 14:04:21.996407	donald.connelly	\N	\N	\N	\N	2	\N
213	mario@schuster.com	$2a$12$NJGFcMKnb49ZDXRq3kUL7O8XUA.KTtAWnfIKM/QUXOBNU7CEPm2ri	\N	\N	\N	2024-04-25 14:04:22.201043	2024-04-25 14:04:22.201043	mario	\N	\N	\N	\N	2	\N
214	alec.pacocha@larson-kovacek.net	$2a$12$9Ks/A.Lm9h2J8ug2sSc.1.6MQPO/s3pt4JIOV28qmjYirTUxe8962	\N	\N	\N	2024-04-25 14:04:22.408574	2024-04-25 14:04:22.408574	alec.pacocha	\N	\N	\N	\N	2	\N
215	raymonde@thompson.net	$2a$12$gwK/ca/68SKV8wcYmFdhDOhizsS5pL2.uZ2HGcBP66JDcaNNcq72G	\N	\N	\N	2024-04-25 14:04:22.611904	2024-04-25 14:04:22.611904	raymonde	\N	\N	\N	\N	2	\N
216	val@berge-kreiger.io	$2a$12$O7TlEqqKVzNMoE2DzzMJUOgo3aFQDcwK1D7MYuZKXNlL.39QQpTGG	\N	\N	\N	2024-04-25 14:04:22.820002	2024-04-25 14:04:22.820002	val	\N	\N	\N	\N	2	\N
217	gale_wolff@stroman.com	$2a$12$C82mJqb6GDara2/qOppZkOUFL2w7WR3FIBtE7aBDUSBc01dvxW5Ka	\N	\N	\N	2024-04-25 14:04:23.021002	2024-04-25 14:04:23.021002	gale_wolff	\N	\N	\N	\N	2	\N
218	hank@barton.org	$2a$12$uiyxc8eu6CHbg0ix4dWWUOsEFxBYB5PyIAY2aFdMbsXG3JxTnb41W	\N	\N	\N	2024-04-25 14:04:23.225145	2024-04-25 14:04:23.225145	hank	\N	\N	\N	\N	2	\N
220	stephen@friesen-hettinger.org	$2a$12$A05fJBAn3JX8/5CTxRFKC.Uj4SXDqMzAzS/NUOBY/xQR0HF4Zziza	\N	\N	\N	2024-04-25 14:04:59.884271	2024-04-25 14:04:59.884271	stephen	\N	\N	\N	\N	2	\N
221	stewart@haley-kozey.org	$2a$12$tTY9opWwghKyIomw71EwE.7Epi993WKw.YTn94y2GvPtsIRI9jdKO	\N	\N	\N	2024-04-25 14:05:00.103151	2024-04-25 14:05:00.103151	stewart	\N	\N	\N	\N	2	\N
222	vance.breitenberg@waters.info	$2a$12$pN4.RIVwKn7YI1q7YeccnOld5/WCQQJ.wlSECC4s2dvxsJL7Z4/lG	\N	\N	\N	2024-04-25 14:05:00.315356	2024-04-25 14:05:00.315356	vance.breitenberg	\N	\N	\N	\N	2	\N
223	rueben@smitham-quitzon.org	$2a$12$NTGNHyCfc5Ab3Zc.VyXHGuzaO3sZ9W7fyOKV.kx/8hfxDs16IXwUe	\N	\N	\N	2024-04-25 14:05:00.521244	2024-04-25 14:05:00.521244	rueben	\N	\N	\N	\N	2	\N
224	racheal_goodwin@weimann.com	$2a$12$C7yBr09hODWGFjU85OJ.6u6g2SQA9K7zPIznXO/rjUx/I4ZiIxbRG	\N	\N	\N	2024-04-25 14:05:00.72607	2024-04-25 14:05:00.72607	racheal_goodwin	\N	\N	\N	\N	2	\N
225	carolin_metz@ernser.name	$2a$12$SdMczkmgN/AkDDPARc/nU.2Cvhmqjo0WXfHxRqJKOGx6pxugK4sY.	\N	\N	\N	2024-04-25 14:05:00.930324	2024-04-25 14:05:00.930324	carolin_metz	\N	\N	\N	\N	2	\N
226	dean@bosco.io	$2a$12$5GtJD6hB.q8ctj4ntQUU7Oge8bzEWC4bfizhlAxuxl2FshZaM6jg.	\N	\N	\N	2024-04-25 14:05:01.136445	2024-04-25 14:05:01.136445	dean	\N	\N	\N	\N	2	\N
227	millicent_lindgren@veum.com	$2a$12$.8cn4kR8Tk8FCD2LX0fckObh06IAqzEixcYwseVSwFDHElQNqAYtG	\N	\N	\N	2024-04-25 14:05:01.343026	2024-04-25 14:05:01.343026	millicent_lindgren	\N	\N	\N	\N	2	\N
228	gail@emard.com	$2a$12$TKOmP7wIcBSKsesS1NyVVeyrblr1v00IuN1UOD5o7Uv8QDEPWghcC	\N	\N	\N	2024-04-25 14:05:01.546922	2024-04-25 14:05:01.546922	gail	\N	\N	\N	\N	2	\N
229	misty.paucek@hirthe.info	$2a$12$/MvCV9un6dpB6s4rZUkxgOnmIdkQ23fNYu4AZ0LIJDQNWkctqdIqG	\N	\N	\N	2024-04-25 14:05:01.748497	2024-04-25 14:05:01.748497	misty.paucek	\N	\N	\N	\N	2	\N
230	bernie@bruen.co	$2a$12$r8DlbuWTLx.5jJnhPc8ohu/gHcFlZQxUzlMYTVkz97mKMYbVysr.y	\N	\N	\N	2024-04-25 14:05:01.949962	2024-04-25 14:05:01.949962	bernie	\N	\N	\N	\N	2	\N
231	elidia@renner.org	$2a$12$J4LRTgimF7q4kjjVsezYm.RARGIdBVVT/xQwNU02rS7xzwwUzt0Xu	\N	\N	\N	2024-04-25 14:05:02.151022	2024-04-25 14:05:02.151022	elidia	\N	\N	\N	\N	2	\N
232	huey.hoeger@breitenberg-treutel.com	$2a$12$SyibFrOLQ.smpSNCrrjDu..ZKjMs.p8Imrw9NdnAb1KB4H90Vzk8G	\N	\N	\N	2024-04-25 14:05:02.356428	2024-04-25 14:05:02.356428	huey.hoeger	\N	\N	\N	\N	2	\N
233	ike_zboncak@dubuque.io	$2a$12$NceqDjxg4qDrYDEfXbuQbefQ.7lGwmlPXlOaOWaMxMfnbG9qFaHou	\N	\N	\N	2024-04-25 14:05:02.569701	2024-04-25 14:05:02.569701	ike_zboncak	\N	\N	\N	\N	2	\N
234	micheal@kulas.com	$2a$12$Z//2kvje9cExyUgCaWHPS.j1fA93sGOJu/TKYsiIcjZ9Jj.BaAhCm	\N	\N	\N	2024-04-25 14:05:02.771623	2024-04-25 14:05:02.771623	micheal	\N	\N	\N	\N	2	\N
235	tommye.pollich@kulas-mcclure.info	$2a$12$MY.GuqRbMujs7Iga8/6BDuNy4iGKRPspbiQ6RXY/qdjsbBmI6eIC2	\N	\N	\N	2024-04-25 14:05:02.972374	2024-04-25 14:05:02.972374	tommye.pollich	\N	\N	\N	\N	2	\N
236	lorean@pacocha.io	$2a$12$08Yr.vSxbhY96tVx4BXtPuY5mBUT0kesj0VljGYYerjN4YBmcT4Iy	\N	\N	\N	2024-04-25 14:05:03.17584	2024-04-25 14:05:03.17584	lorean	\N	\N	\N	\N	2	\N
237	lenny@ohara.biz	$2a$12$MH8BxidF5Crx3SkpDD1aU.xENoKQHkkyErp87AoithKqCHgr1gNH2	\N	\N	\N	2024-04-25 14:05:03.37848	2024-04-25 14:05:03.37848	lenny	\N	\N	\N	\N	2	\N
238	stephanie@bergstrom.info	$2a$12$MUOFlUmTopd0B46pXiELPe/1jsDpcx/Rqi1G39arlv7WBUwYZXTIi	\N	\N	\N	2024-04-25 14:05:03.579015	2024-04-25 14:05:03.579015	stephanie	\N	\N	\N	\N	2	\N
239	nakita_lemke@hessel.name	$2a$12$K6xf6yUC4xa9a2IMYtVzKeDq33LbXlOrwCw13sEerFaEpP5GTlfRy	\N	\N	\N	2024-04-25 14:05:03.780883	2024-04-25 14:05:03.780883	nakita_lemke	\N	\N	\N	\N	2	\N
240	marjorie_maggio@gislason.io	$2a$12$JmKkQTm69D.VMOv41u5fgO4qEk4dD9T0WmOMynXHyj05pFNQpxaIW	\N	\N	\N	2024-04-25 14:05:03.981769	2024-04-25 14:05:03.981769	marjorie_maggio	\N	\N	\N	\N	2	\N
241	kathey@hoeger.info	$2a$12$TqX9II384yq.XYnWO1uBHusRSptZpeTwPN122o8qYpM7/DwUGYZV2	\N	\N	\N	2024-04-25 14:05:04.18327	2024-04-25 14:05:04.18327	kathey	\N	\N	\N	\N	2	\N
242	richie@stoltenberg.net	$2a$12$f30FbDVAh58zGakmWPWAjOxONeJfPat0eGz4AqMs8FXYCd3CtnwjS	\N	\N	\N	2024-04-25 14:05:04.385249	2024-04-25 14:05:04.385249	richie	\N	\N	\N	\N	2	\N
243	cameron@gusikowski-keebler.info	$2a$12$93HC4iabdkIC/3VDDhyFo.9riUmG.Z9/XK6E0UicrUAhevVNrh7P2	\N	\N	\N	2024-04-25 14:05:04.585577	2024-04-25 14:05:04.585577	cameron	\N	\N	\N	\N	2	\N
244	jean@kulas.biz	$2a$12$4dUqRDsT1tMAzJneJR8z1.qkHgBURrbsb/F/3Nk7kUUbTPm84WjoG	\N	\N	\N	2024-04-25 14:05:04.786346	2024-04-25 14:05:04.786346	jean	\N	\N	\N	\N	2	\N
245	wm_beier@nolan-hickle.name	$2a$12$FtYeBrJd1z7qDTFhrGrtRuTs1oRIL09dmR0ToIv5sArtexsyJKLHa	\N	\N	\N	2024-04-25 14:05:04.994145	2024-04-25 14:05:04.994145	wm_beier	\N	\N	\N	\N	2	\N
246	vivien_kiehn@runte.co	$2a$12$B/QjwCp6AWBlkczgGTBn1.3Eub65ObDhdPkgAbLUE7bTNJ0dqCNBC	\N	\N	\N	2024-04-25 14:05:05.199345	2024-04-25 14:05:05.199345	vivien_kiehn	\N	\N	\N	\N	2	\N
247	joshua.monahan@mohr.co	$2a$12$y0pa2Lck8eMkWlCdJnpC0.Tr8RTuEcomWhNrF25s4i5xgnpDpu77y	\N	\N	\N	2024-04-25 14:05:05.40693	2024-04-25 14:05:05.40693	joshua.monahan	\N	\N	\N	\N	2	\N
248	mckenzie_morissette@feil-auer.org	$2a$12$aByWUnWO8ySld4NV024UneEeNPfJgusq7/M7R.SIaIXIinAVogGR6	\N	\N	\N	2024-04-25 14:05:05.668333	2024-04-25 14:05:05.668333	mckenzie_morissette	\N	\N	\N	\N	2	\N
249	toney_bosco@ledner-larkin.biz	$2a$12$KtwBn9e.qyVw70GPDyvAbeOKDjH.PWqVVaAN8vpDiPCKaEXDCbjau	\N	\N	\N	2024-04-25 14:05:05.899627	2024-04-25 14:05:05.899627	toney_bosco	\N	\N	\N	\N	2	\N
250	ronny@walsh.com	$2a$12$evRsmORaodLieIwBLkDW9.5YYikiGb3gCtNy0PgLb5NaAbwMKkM6O	\N	\N	\N	2024-04-25 14:05:06.102324	2024-04-25 14:05:06.102324	ronny	\N	\N	\N	\N	2	\N
251	karisa@harber.io	$2a$12$X26D4h/0NBsBHrk1Y4Ijrutg59dxo1k/AdDK2r2X.rgHyiHJbss1K	\N	\N	\N	2024-04-25 14:05:06.306451	2024-04-25 14:05:06.306451	karisa	\N	\N	\N	\N	2	\N
252	shon_reynolds@daniel.name	$2a$12$9Q89jc3ZSKHXd5qCqU0z7OvJuxpI2WKwiOiVliRaI8Ssyr5jsABE.	\N	\N	\N	2024-04-25 14:05:06.521467	2024-04-25 14:05:06.521467	shon_reynolds	\N	\N	\N	\N	2	\N
253	armida_stehr@littel-kuhic.biz	$2a$12$6CADUy2svQEXsRgK46hOxeqWuU/0jaBgT4NGWSmMHg0CNZNzymD2S	\N	\N	\N	2024-04-25 14:05:06.73387	2024-04-25 14:05:06.73387	armida_stehr	\N	\N	\N	\N	2	\N
254	cecil_runolfsdottir@leuschke.co	$2a$12$vStgyrRf2e1VNXGY3d2Yduh3wFt705KaWnERZkOBOxiFWk5mdOTlu	\N	\N	\N	2024-04-25 14:05:06.938855	2024-04-25 14:05:06.938855	cecil_runolfsdottir	\N	\N	\N	\N	2	\N
255	elene@konopelski-kohler.net	$2a$12$qIj5lTBc8D7YlgBcuWxrbessQA8.Tf6LPeXD8cEJ3/ddUEzF1YFWi	\N	\N	\N	2024-04-25 14:05:07.143425	2024-04-25 14:05:07.143425	elene	\N	\N	\N	\N	2	\N
256	socorro@considine-rodriguez.biz	$2a$12$HU8iNn8tS6rarq53VazEa.PoA8NYxkSfPFSLS2reLt081Wyn3x0qm	\N	\N	\N	2024-04-25 14:05:07.3471	2024-04-25 14:05:07.3471	socorro	\N	\N	\N	\N	2	\N
257	francina_barrows@sanford-mcdermott.info	$2a$12$ABSjH3Xxf.oYXPpLe5h2xu2O8Z2xeSmKp2Ssv6hEspk7cfj5oyu7O	\N	\N	\N	2024-04-25 14:05:07.551451	2024-04-25 14:05:07.551451	francina_barrows	\N	\N	\N	\N	2	\N
258	dexter_koepp@boyle.info	$2a$12$SrMNP9jKFRSj8MKkjX/Wn.mM7PBXAlOSN/LAUZqHO5nQo3l2OvFxy	\N	\N	\N	2024-04-25 14:05:07.755271	2024-04-25 14:05:07.755271	dexter_koepp	\N	\N	\N	\N	2	\N
259	benton_metz@dooley-bayer.name	$2a$12$ZBUPi7VpuPqDazvYaM34SOqtO4bRqboBBluLXzoWPJ2Z.m8rteu4m	\N	\N	\N	2024-04-25 14:05:07.958125	2024-04-25 14:05:07.958125	benton_metz	\N	\N	\N	\N	2	\N
260	duane@waters-ebert.name	$2a$12$TeEGRQL4gnanu5GCNojpveRXQDaR.3HINAyX8uaM893hBKLKCNk/q	\N	\N	\N	2024-04-25 14:05:08.159173	2024-04-25 14:05:08.159173	duane	\N	\N	\N	\N	2	\N
261	clifford@cronin-ankunding.com	$2a$12$oAjR88meNPM4kVVD9BWOSOHqu3wpT2u5AuttiRsUtPhslAse6uvDK	\N	\N	\N	2024-04-25 14:05:08.361017	2024-04-25 14:05:08.361017	clifford	\N	\N	\N	\N	2	\N
262	casey@walsh.net	$2a$12$gTR/l5dcWjwr5s/NsGjvBuRx.cRFzjL5HEVme/QcExw4cdTglN692	\N	\N	\N	2024-04-25 14:05:08.56901	2024-04-25 14:05:08.56901	casey	\N	\N	\N	\N	2	\N
263	alysa.ullrich@reynolds-schoen.io	$2a$12$vVq9s7hjMFWlRf82wvAB0.qe06ERnf3juJjYEZfoiSK/YJD2ydzD6	\N	\N	\N	2024-04-25 14:05:08.770426	2024-04-25 14:05:08.770426	alysa.ullrich	\N	\N	\N	\N	2	\N
264	madeleine@schultz.co	$2a$12$17kkuoi5l15v1IcRfl1OQ.hAT0BGHZ65Spnr5CnUtN9/kXKJ7ZalS	\N	\N	\N	2024-04-25 14:05:08.97575	2024-04-25 14:05:08.97575	madeleine	\N	\N	\N	\N	2	\N
265	kris@gulgowski.com	$2a$12$nNrTemX.5VddWDIUyROedO4ngTPi070WYjXgIuWBY2G/LPXkc5IG2	\N	\N	\N	2024-04-25 14:05:09.183917	2024-04-25 14:05:09.183917	kris	\N	\N	\N	\N	2	\N
266	thelma@batz-greenholt.org	$2a$12$rHvD55cRYC77g8WhXG5DTOmy/5np1vasqmGxLLBzaO69ILNTColHS	\N	\N	\N	2024-04-25 14:05:09.383571	2024-04-25 14:05:09.383571	thelma	\N	\N	\N	\N	2	\N
267	pennie.bradtke@toy.org	$2a$12$68Zbx5b3YEKZXvdLW8JmTOYbGoTyp18Se.YKeNsK9tHQajrbADsdS	\N	\N	\N	2024-04-25 14:05:09.58321	2024-04-25 14:05:09.58321	pennie.bradtke	\N	\N	\N	\N	2	\N
268	ellis_schinner@wolf.io	$2a$12$efjnEQibs3JWj7OVEYRXn.eQHAexEJys31SIMaddj7fJ7gVeUgvHS	\N	\N	\N	2024-04-25 14:05:09.793227	2024-04-25 14:05:09.793227	ellis_schinner	\N	\N	\N	\N	2	\N
269	bettye.barrows@cartwright-hilll.name	$2a$12$AmiNuLc5B5PXdV7fnTa.lOMpp7wOKB3T2YMYpiuz3NjON3PLnmLCq	\N	\N	\N	2024-04-25 14:05:09.994416	2024-04-25 14:05:09.994416	bettye.barrows	\N	\N	\N	\N	2	\N
270	paz@bergstrom.org	$2a$12$bbSqOnAZBPT67f6nBaRviO61s2S7p1h/502wjUR70ojTl2bvmkOpy	\N	\N	\N	2024-04-25 14:05:10.195619	2024-04-25 14:05:10.195619	paz	\N	\N	\N	\N	2	\N
271	steve.jacobs@heller-macgyver.biz	$2a$12$/jGHidVegb0pzcjsf.5QS.ZLta6Ond/fMrpYZL8aRl6udjHL1RHC2	\N	\N	\N	2024-04-25 14:05:10.397815	2024-04-25 14:05:10.397815	steve.jacobs	\N	\N	\N	\N	2	\N
272	carey@grady.info	$2a$12$pnppBhuL9/dEKeBKHfPcJuBWTHZNf2CUJkHAUcn8VqIOdOe6eXElS	\N	\N	\N	2024-04-25 14:05:10.599515	2024-04-25 14:05:10.599515	carey	\N	\N	\N	\N	2	\N
273	susana@nitzsche.info	$2a$12$qEp2eWnXgt2ltx2xQALrAu2.JPRXogolJh8eIySgp9EOQwKubIMPa	\N	\N	\N	2024-04-25 14:05:10.80095	2024-04-25 14:05:10.80095	susana	\N	\N	\N	\N	2	\N
274	jewell@lemke.org	$2a$12$TkWKWH2fhY56zk6MZKDlouISWidIAhfs/F7FO5XB3/e1U4xPKBJQq	\N	\N	\N	2024-04-25 14:05:11.001005	2024-04-25 14:05:11.001005	jewell	\N	\N	\N	\N	2	\N
275	cierra@blick.info	$2a$12$crEW71MBRYJyHRy45pkPL.OfwTztIE23SD7BG1GE99CzLb/awBx6m	\N	\N	\N	2024-04-25 14:05:11.202653	2024-04-25 14:05:11.202653	cierra	\N	\N	\N	\N	2	\N
276	clair@hirthe-kreiger.name	$2a$12$JvuiMAEJZdfPmBydV4shy.wX6UL.QEXDjC86H7JY98yFopWVLJIOe	\N	\N	\N	2024-04-25 14:05:11.404601	2024-04-25 14:05:11.404601	clair	\N	\N	\N	\N	2	\N
277	shirley@reynolds.io	$2a$12$9tNa11cFQ6TXHF1RDFRWH.epgVMI8VWPvoeQ1sxNXtHXvJJXLUcVu	\N	\N	\N	2024-04-25 14:05:11.604676	2024-04-25 14:05:11.604676	shirley	\N	\N	\N	\N	2	\N
278	hosea@jacobson.org	$2a$12$dMCxF9h3D5ewW//Lx7jr2.GZPEwztSQlsF2rIqjakzUogSaF/pQGK	\N	\N	\N	2024-04-25 14:05:11.809266	2024-04-25 14:05:11.809266	hosea	\N	\N	\N	\N	2	\N
279	brent@schneider-spinka.biz	$2a$12$lyjWyhazS38ukIoC7SBVseq6o4JxWP8pcwXZp02LbGUbcPVB9FGyO	\N	\N	\N	2024-04-25 14:05:12.01039	2024-04-25 14:05:12.01039	brent	\N	\N	\N	\N	2	\N
280	rod_connelly@hand-dare.org	$2a$12$JznX5HlJ8K3rOvQJbbBO4OjCG6rNII98KAzA/1ph3qpbtk.La9sN2	\N	\N	\N	2024-04-25 14:05:12.215908	2024-04-25 14:05:12.215908	rod_connelly	\N	\N	\N	\N	2	\N
281	christiana@kerluke.com	$2a$12$N9ZwsPyiGXR0hiPVz8Zswubp4XU7JVtqwU.8zXmsPdrO8ibyRAV8S	\N	\N	\N	2024-04-25 14:05:12.426923	2024-04-25 14:05:12.426923	christiana	\N	\N	\N	\N	2	\N
282	lashunda_bartell@sauer.co	$2a$12$q5gLwKaf7pNUNPFIyeyMxe0KsQFC72W75BssL1F1sY1SNQSivUO3G	\N	\N	\N	2024-04-25 14:05:12.629823	2024-04-25 14:05:12.629823	lashunda_bartell	\N	\N	\N	\N	2	\N
283	efren@schmitt.name	$2a$12$Egv2K6JGPZl4WilRFlcgUOamk5BvgYYuJK8MItTyi87Hy4A6JXrfG	\N	\N	\N	2024-04-25 14:05:12.836678	2024-04-25 14:05:12.836678	efren	\N	\N	\N	\N	2	\N
284	lamont@lynch-kutch.net	$2a$12$ux0E7LYq/P3VY9X3RnSnQeztWa7xd45cI0VXzET0Xz3bI57LE.Qzu	\N	\N	\N	2024-04-25 14:05:13.045041	2024-04-25 14:05:13.045041	lamont	\N	\N	\N	\N	2	\N
285	al@rippin.info	$2a$12$GGK3.w2O/Jr5Rue2MSWG2.AgOwgiNnvIEdCqvDrvBi1RjQhLAlNcC	\N	\N	\N	2024-04-25 14:05:13.257631	2024-04-25 14:05:13.257631	al	\N	\N	\N	\N	2	\N
286	cedric@torphy.com	$2a$12$Xa8M3ACJEo9Am0I8lwJfHud7m5N1dFUxBFx7Cbk2mJUwWZyARbZBa	\N	\N	\N	2024-04-25 14:05:13.468814	2024-04-25 14:05:13.468814	cedric	\N	\N	\N	\N	2	\N
287	cayla.hyatt@bashirian.com	$2a$12$x/ejRmI7f.uVlZv8G.m/U.q/TeW4c.v7XZiKAPaSkE.6EjU7TL4US	\N	\N	\N	2024-04-25 14:05:13.675089	2024-04-25 14:05:13.675089	cayla.hyatt	\N	\N	\N	\N	2	\N
288	eva.wolff@wiegand.name	$2a$12$2n7e3BRRKH5RTgScuCBXceESGRFstGgO0EioVdYSIn6JA/PwhbaKi	\N	\N	\N	2024-04-25 14:05:13.878458	2024-04-25 14:05:13.878458	eva.wolff	\N	\N	\N	\N	2	\N
289	shirley_wisoky@denesik.biz	$2a$12$XlZaaJ3z2H5Q4isxaLhx0eT2KFEJVa0imR5.6Jg9Cmywkm.qEVegi	\N	\N	\N	2024-04-25 14:05:14.085529	2024-04-25 14:05:14.085529	shirley_wisoky	\N	\N	\N	\N	2	\N
290	gregory@connelly.name	$2a$12$.pyaP0vfnDiYgcxacnTfUuqKNSupAJnh7O6zupfUACUjTIGzt0TuW	\N	\N	\N	2024-04-25 14:05:14.291362	2024-04-25 14:05:14.291362	gregory	\N	\N	\N	\N	2	\N
291	tyrell.wilkinson@bayer.biz	$2a$12$Gl3dtBbUPbJ8TcNhG63Fz.DoHMUi8YclXZLOAPLRiiKJK1TsZgzZ2	\N	\N	\N	2024-04-25 14:05:14.496314	2024-04-25 14:05:14.496314	tyrell.wilkinson	\N	\N	\N	\N	2	\N
292	gene@oconnell-okon.biz	$2a$12$J7L1u5wMv4GxUsVIEgGnv.O0866U.fs2gZSJiUasp7JabZZ2Immz2	\N	\N	\N	2024-04-25 14:05:14.697188	2024-04-25 14:05:14.697188	gene	\N	\N	\N	\N	2	\N
293	shay.hagenes@adams.net	$2a$12$ow4P71nq5GYnGaLM66Pibe8pyTBXLmtvLFnrEButhMOuY0qRAiXc6	\N	\N	\N	2024-04-25 14:05:14.897816	2024-04-25 14:05:14.897816	shay.hagenes	\N	\N	\N	\N	2	\N
294	kirk@brakus-hodkiewicz.co	$2a$12$1dBoVDyppd3TU5/yxgIETOQytZKEaCyv9Sje6T5yqrkVcPqkLScUa	\N	\N	\N	2024-04-25 14:05:15.103862	2024-04-25 14:05:15.103862	kirk	\N	\N	\N	\N	2	\N
295	robt@kozey.com	$2a$12$y6PyEPrCgb/Vzd7LuknygOHwOzgILODjeHyko.p0IF0L7NtcBKKRy	\N	\N	\N	2024-04-25 14:05:15.303306	2024-04-25 14:05:15.303306	robt	\N	\N	\N	\N	2	\N
296	theron@kuhic-balistreri.name	$2a$12$d7JY6/f1Ii1pObqKckBrMezzWmFvMncZqZLAVHsfkPJVbyCpGexYq	\N	\N	\N	2024-04-25 14:05:15.503817	2024-04-25 14:05:15.503817	theron	\N	\N	\N	\N	2	\N
297	young@balistreri.io	$2a$12$yiQItE/LFpOg.WA0lhkmGOJDl8mDlbgfQVnYTEp5Y4TSKgcZrDDiy	\N	\N	\N	2024-04-25 14:05:15.703045	2024-04-25 14:05:15.703045	young	\N	\N	\N	\N	2	\N
298	euna_leuschke@daugherty-schaden.org	$2a$12$KBxksePeVIFZCLQBOyZ7aO5Ln/DQgK/eRej/A4T4qh50xyCyFsvyO	\N	\N	\N	2024-04-25 14:05:15.908448	2024-04-25 14:05:15.908448	euna_leuschke	\N	\N	\N	\N	2	\N
299	valene_kirlin@olson.info	$2a$12$WReBhQIAgbPLcGmTzXTZLuSGe8WwyJLYz.bweZOOIfuL6bWerlzce	\N	\N	\N	2024-04-25 14:05:16.109966	2024-04-25 14:05:16.109966	valene_kirlin	\N	\N	\N	\N	2	\N
300	isaias.turcotte@moen.org	$2a$12$5cZH6A02EToUd/6xPKGZy.dREUuu0kk8LcgRz7qyyXIl4Q43SBT86	\N	\N	\N	2024-04-25 14:05:16.313372	2024-04-25 14:05:16.313372	isaias.turcotte	\N	\N	\N	\N	2	\N
301	iluminada.kulas@davis-cormier.biz	$2a$12$adOC4BLHKaqRBHhGhZQ3Ceo0xbVhD/C/Us1FJsBN2kCDTb32OzBLu	\N	\N	\N	2024-04-25 14:05:16.515093	2024-04-25 14:05:16.515093	iluminada.kulas	\N	\N	\N	\N	2	\N
302	hye@collins-renner.com	$2a$12$PrVjGNqofK.94RP1TsmxWO1zpa0yX82pU8B7JzvLGTaZKQ7yx9/wW	\N	\N	\N	2024-04-25 14:05:16.715399	2024-04-25 14:05:16.715399	hye	\N	\N	\N	\N	2	\N
303	darci@carter.co	$2a$12$z/o.iUdfgB.9pTdIuuUMF.LBADspfhuGFc6QUBu0zdpebcxZQlEku	\N	\N	\N	2024-04-25 14:05:16.914729	2024-04-25 14:05:16.914729	darci	\N	\N	\N	\N	2	\N
304	garth_bradtke@bartell.name	$2a$12$Gs4CzAskZvwmhMe7RvrE4e029mr5pVcGY67qW8BdO4dqxkkUrCmW.	\N	\N	\N	2024-04-25 14:05:17.115144	2024-04-25 14:05:17.115144	garth_bradtke	\N	\N	\N	\N	2	\N
305	hana_johnston@murazik.name	$2a$12$RiVqzrjCdWHK5p3AeUj2YOteHSDhU7M3sy7vLzg67jsrznNoGr8Lq	\N	\N	\N	2024-04-25 14:05:17.319749	2024-04-25 14:05:17.319749	hana_johnston	\N	\N	\N	\N	2	\N
306	elwood_hills@hamill-morissette.co	$2a$12$LdvxZLq5UV115uWCGryvwOjKvLUXyNzqm8OwtrOnRSmhcYyA04Lny	\N	\N	\N	2024-04-25 14:05:17.522679	2024-04-25 14:05:17.522679	elwood_hills	\N	\N	\N	\N	2	\N
307	reginald.kulas@pagac.io	$2a$12$jtAdrhKhAWMvwAxfPsTzyu9B7p15o.Gi9zCpjLoX9uT3FK.kXYdaK	\N	\N	\N	2024-04-25 14:05:17.723371	2024-04-25 14:05:17.723371	reginald.kulas	\N	\N	\N	\N	2	\N
308	leon.bernier@reynolds.name	$2a$12$xSPWaRxZvfYmQ5CPlGdey.yhA6H.Ge6bH11XanM0liACXjqXwwXJ.	\N	\N	\N	2024-04-25 14:05:17.923779	2024-04-25 14:05:17.923779	leon.bernier	\N	\N	\N	\N	2	\N
309	jon.wilderman@lesch.info	$2a$12$FUNT.NhofC/Z2/CNIPNrTO93/0/mKYsfJXfm0Xxfwji866LeSe676	\N	\N	\N	2024-04-25 14:05:18.124185	2024-04-25 14:05:18.124185	jon.wilderman	\N	\N	\N	\N	2	\N
310	christa@heathcote-stanton.info	$2a$12$pRs1IWkKa9WiT8zstF/dMOGy/Gh5NeP7/R4JoAInXtLc6eHVcp6ta	\N	\N	\N	2024-04-25 14:05:18.323606	2024-04-25 14:05:18.323606	christa	\N	\N	\N	\N	2	\N
311	faustino@weissnat.name	$2a$12$0vfUrODyovHWtnzELCQr.eN2mRN.XqXXLwsSE4qHQRpj1iZh9xbKK	\N	\N	\N	2024-04-25 14:05:18.531832	2024-04-25 14:05:18.531832	faustino	\N	\N	\N	\N	2	\N
312	jody@auer.name	$2a$12$J4NhiAkMv6ieSQMEJWNpB.uWMJW16xya2CwOOUd4aCZ6hRWXKufFG	\N	\N	\N	2024-04-25 14:05:18.739419	2024-04-25 14:05:18.739419	jody	\N	\N	\N	\N	2	\N
313	carroll.schinner@kreiger.name	$2a$12$Q2Z37ZEhR5M7zncr5JS5KeBwdGpM.RS95GUHpTVtqsbkDW6K8VnIi	\N	\N	\N	2024-04-25 14:05:18.948038	2024-04-25 14:05:18.948038	carroll.schinner	\N	\N	\N	\N	2	\N
314	lonna@rempel.com	$2a$12$6VT.1htY0SWY4TuZ/B5H6.Y4TC33UvYuW3OYg3NWyxS366976iogC	\N	\N	\N	2024-04-25 14:05:19.165091	2024-04-25 14:05:19.165091	lonna	\N	\N	\N	\N	2	\N
315	denisse_hudson@gerlach.info	$2a$12$PjKz69bfogoMsmdmcZGxGessa/81.W3yB2B6lqK0WAQ8Moc4sue1m	\N	\N	\N	2024-04-25 14:05:19.372165	2024-04-25 14:05:19.372165	denisse_hudson	\N	\N	\N	\N	2	\N
316	charise@thiel.io	$2a$12$MnXY0k7lqVCM9lE2i4vPUOfwirBajg4uaXiIiTpHP7iRjnImpigNC	\N	\N	\N	2024-04-25 14:05:19.575907	2024-04-25 14:05:19.575907	charise	\N	\N	\N	\N	2	\N
317	brendan@nader.co	$2a$12$n4Xn8HrZS0smcnVX0tD5G.lbjahkGqPJfGvk2tPkivP9mtBf4tvPe	\N	\N	\N	2024-04-25 14:05:19.793044	2024-04-25 14:05:19.793044	brendan	\N	\N	\N	\N	2	\N
318	delmar@runolfsson.name	$2a$12$Dfe/t3wRQnnz5yO5rN380e5xIIrc5ZhR8dsNsZacjOMi4pMexTPrW	\N	\N	\N	2024-04-25 14:05:20.019721	2024-04-25 14:05:20.019721	delmar	\N	\N	\N	\N	2	\N
319	burton.prohaska@halvorson.org	$2a$12$lq5lEMbRMDu06BlB5o1cz.iMhxgi3EEpsvIjKEQLTPPHNonKuj8Vi	\N	\N	\N	2024-04-25 14:05:20.224152	2024-04-25 14:05:20.224152	burton.prohaska	\N	\N	\N	\N	2	\N
320	ttt1@mail.com	$2a$12$REUVCKpT33mr1CEIKI2q8.Ya1Efi4qXX4Agpi/qh1cOQhjjmn0nYq	\N	\N	\N	2024-04-25 14:17:02.367895	2024-04-25 14:17:02.367895	ttt1	\N	\N	\N	\N	2	\N
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 281, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 281, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 189, true);


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 382, true);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.carts_id_seq', 83, true);


--
-- Name: chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.chats_id_seq', 16, true);


--
-- Name: comment_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.comment_likes_id_seq', 157, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.comments_id_seq', 160, true);


--
-- Name: denied_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.denied_permissions_id_seq', 26, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.favorites_id_seq', 47, true);


--
-- Name: jwt_denylist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.jwt_denylist_id_seq', 104, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.messages_id_seq', 393, true);


--
-- Name: mobility_string_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.mobility_string_translations_id_seq', 1, false);


--
-- Name: mobility_text_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.mobility_text_translations_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.notifications_id_seq', 112, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.order_items_id_seq', 245, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.orders_id_seq', 104, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.permissions_id_seq', 63, true);


--
-- Name: product_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.product_translations_id_seq', 56, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.products_id_seq', 59, true);


--
-- Name: restrictions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.restrictions_id_seq', 15, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: type_product_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.type_product_translations_id_seq', 18, true);


--
-- Name: type_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.type_products_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andre
--

SELECT pg_catalog.setval('public.users_id_seq', 325, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: comment_likes comment_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: denied_permissions denied_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.denied_permissions
    ADD CONSTRAINT denied_permissions_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: jwt_denylist jwt_denylist_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.jwt_denylist
    ADD CONSTRAINT jwt_denylist_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: mobility_string_translations mobility_string_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.mobility_string_translations
    ADD CONSTRAINT mobility_string_translations_pkey PRIMARY KEY (id);


--
-- Name: mobility_text_translations mobility_text_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.mobility_text_translations
    ADD CONSTRAINT mobility_text_translations_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: product_translations product_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.product_translations
    ADD CONSTRAINT product_translations_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: restrictions restrictions_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.restrictions
    ADD CONSTRAINT restrictions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: type_product_translations type_product_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.type_product_translations
    ADD CONSTRAINT type_product_translations_pkey PRIMARY KEY (id);


--
-- Name: type_products type_products_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.type_products
    ADD CONSTRAINT type_products_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_cart_items_on_cart_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_cart_items_on_cart_id ON public.cart_items USING btree (cart_id);


--
-- Name: index_cart_items_on_product_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_cart_items_on_product_id ON public.cart_items USING btree (product_id);


--
-- Name: index_carts_on_user_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_carts_on_user_id ON public.carts USING btree (user_id);


--
-- Name: index_chats_on_user_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_chats_on_user_id ON public.chats USING btree (user_id);


--
-- Name: index_comment_likes_on_active; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_comment_likes_on_active ON public.comment_likes USING btree (active);


--
-- Name: index_comment_likes_on_comment_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_comment_likes_on_comment_id ON public.comment_likes USING btree (comment_id);


--
-- Name: index_comment_likes_on_user_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_comment_likes_on_user_id ON public.comment_likes USING btree (user_id);


--
-- Name: index_comments_on_parent_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_comments_on_parent_id ON public.comments USING btree (parent_id);


--
-- Name: index_comments_on_product_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_comments_on_product_id ON public.comments USING btree (product_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_denied_permissions_on_user_id_and_permission_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_denied_permissions_on_user_id_and_permission_id ON public.denied_permissions USING btree (user_id, permission_id);


--
-- Name: index_favorites_on_product_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_favorites_on_product_id ON public.favorites USING btree (product_id);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_favorites_on_user_id ON public.favorites USING btree (user_id);


--
-- Name: index_favorites_on_user_id_and_product_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_favorites_on_user_id_and_product_id ON public.favorites USING btree (user_id, product_id);


--
-- Name: index_jwt_denylist_on_jti; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_jwt_denylist_on_jti ON public.jwt_denylist USING btree (jti);


--
-- Name: index_messages_on_chat_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_messages_on_chat_id ON public.messages USING btree (chat_id);


--
-- Name: index_messages_on_user_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_messages_on_user_id ON public.messages USING btree (user_id);


--
-- Name: index_mobility_string_translations_on_keys; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_mobility_string_translations_on_keys ON public.mobility_string_translations USING btree (translatable_id, translatable_type, locale, key);


--
-- Name: index_mobility_string_translations_on_query_keys; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_mobility_string_translations_on_query_keys ON public.mobility_string_translations USING btree (translatable_type, key, value, locale);


--
-- Name: index_mobility_string_translations_on_translatable_attribute; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_mobility_string_translations_on_translatable_attribute ON public.mobility_string_translations USING btree (translatable_id, translatable_type, key);


--
-- Name: index_mobility_text_translations_on_keys; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_mobility_text_translations_on_keys ON public.mobility_text_translations USING btree (translatable_id, translatable_type, locale, key);


--
-- Name: index_mobility_text_translations_on_translatable_attribute; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_mobility_text_translations_on_translatable_attribute ON public.mobility_text_translations USING btree (translatable_id, translatable_type, key);


--
-- Name: index_notifications_on_notifiable; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_notifications_on_notifiable ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: index_notifications_on_user_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_notifications_on_user_id ON public.notifications USING btree (user_id);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_order_items_on_order_id ON public.order_items USING btree (order_id);


--
-- Name: index_order_items_on_product_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_order_items_on_product_id ON public.order_items USING btree (product_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_permissions_roles_on_role_id_and_permission_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_permissions_roles_on_role_id_and_permission_id ON public.permissions_roles USING btree (role_id, permission_id);


--
-- Name: index_product_translations_on_locale; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_product_translations_on_locale ON public.product_translations USING btree (locale);


--
-- Name: index_product_translations_on_product_id_and_locale; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_product_translations_on_product_id_and_locale ON public.product_translations USING btree (product_id, locale);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_products_on_name ON public.products USING btree (name);


--
-- Name: index_products_on_type_product_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_products_on_type_product_id ON public.products USING btree (type_product_id);


--
-- Name: index_products_type_products_on_type_product_id_and_product_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_products_type_products_on_type_product_id_and_product_id ON public.products_type_products USING btree (type_product_id, product_id);


--
-- Name: index_restrictions_on_canceller_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_restrictions_on_canceller_id ON public.restrictions USING btree (canceller_id);


--
-- Name: index_restrictions_on_offender_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_restrictions_on_offender_id ON public.restrictions USING btree (offender_id);


--
-- Name: index_restrictions_on_officer_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_restrictions_on_officer_id ON public.restrictions USING btree (officer_id);


--
-- Name: index_restrictions_on_permission_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_restrictions_on_permission_id ON public.restrictions USING btree (permission_id);


--
-- Name: index_type_product_translations_on_locale; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_type_product_translations_on_locale ON public.type_product_translations USING btree (locale);


--
-- Name: index_type_product_translations_on_type_product_id_and_locale; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_type_product_translations_on_type_product_id_and_locale ON public.type_product_translations USING btree (type_product_id, locale);


--
-- Name: index_type_products_on_name; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_type_products_on_name ON public.type_products USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_login; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_users_on_login ON public.users USING btree (login);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: andre
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_role_id; Type: INDEX; Schema: public; Owner: andre
--

CREATE INDEX index_users_on_role_id ON public.users USING btree (role_id);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: messages fk_rails_0f670de7ba; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_rails_0f670de7ba FOREIGN KEY (chat_id) REFERENCES public.chats(id);


--
-- Name: restrictions fk_rails_13a3122caf; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.restrictions
    ADD CONSTRAINT fk_rails_13a3122caf FOREIGN KEY (canceller_id) REFERENCES public.users(id);


--
-- Name: messages fk_rails_273a25a7a6; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_rails_273a25a7a6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: denied_permissions fk_rails_291fb24375; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.denied_permissions
    ADD CONSTRAINT fk_rails_291fb24375 FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- Name: products fk_rails_40de6f5bc7; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_40de6f5bc7 FOREIGN KEY (type_product_id) REFERENCES public.type_products(id);


--
-- Name: favorites fk_rails_54567c0f67; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_54567c0f67 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: users fk_rails_642f17018b; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_642f17018b FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: cart_items fk_rails_681a180e84; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_rails_681a180e84 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: cart_items fk_rails_6cdb1f0139; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_rails_6cdb1f0139 FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: restrictions fk_rails_925d82ff80; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.restrictions
    ADD CONSTRAINT fk_rails_925d82ff80 FOREIGN KEY (officer_id) REFERENCES public.users(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: comments fk_rails_a0d280f6e4; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_a0d280f6e4 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: notifications fk_rails_b080fb4855; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_rails_b080fb4855 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comment_likes fk_rails_c28a479c60; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT fk_rails_c28a479c60 FOREIGN KEY (comment_id) REFERENCES public.comments(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: favorites fk_rails_d15744e438; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d15744e438 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: restrictions fk_rails_dbab9c8536; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.restrictions
    ADD CONSTRAINT fk_rails_dbab9c8536 FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- Name: type_product_translations fk_rails_dd6b6957bd; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.type_product_translations
    ADD CONSTRAINT fk_rails_dd6b6957bd FOREIGN KEY (type_product_id) REFERENCES public.type_products(id);


--
-- Name: order_items fk_rails_e3cb28f071; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_e3cb28f071 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: chats fk_rails_e555f43151; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT fk_rails_e555f43151 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: carts fk_rails_ea59a35211; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_rails_ea59a35211 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comment_likes fk_rails_efcc5b56dc; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT fk_rails_efcc5b56dc FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: order_items fk_rails_f1a29ddd47; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_f1a29ddd47 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: denied_permissions fk_rails_f4c16b01d0; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.denied_permissions
    ADD CONSTRAINT fk_rails_f4c16b01d0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: product_translations fk_rails_f53f501ab3; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.product_translations
    ADD CONSTRAINT fk_rails_f53f501ab3 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: restrictions fk_rails_f811ff5217; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.restrictions
    ADD CONSTRAINT fk_rails_f811ff5217 FOREIGN KEY (offender_id) REFERENCES public.users(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: andre
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

