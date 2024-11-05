create table users (
	user_id bigserial constraint users_pk primary key,
	name varchar(100) not null,
	email varchar(50) not null constraint users_email_unique unique, 
	password_hash varchar(50) not null,
	pin varchar(50) not null, 
	is_event_organizer boolean default false not null,
	referral_code varchar(50) unique not null,
	profile_image_url varchar(100),
	is_onboarding_finished boolean default false not null, 
	created_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	updated_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	deleted_at timestamp with time zone
);


create table events (
	event_id bigserial constraint event_pk primary key,
	user_id bigint references users(user_id),
	is_active boolean not null default false,
	name varchar(100) not null,
	price numeric(10,5) not null default 0,
	date date not null, 
	time time not null,
	location varchar(100) not null,
	description text not null,
	available_seats int not null, 
	ticket_types int not null,
	is_paid_event boolean not null,
	created_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	updated_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	deleted_at timestamp with time zone
);


create table promotions (
	promo_id bigserial constraint promo_pk primary key,
	event_id bigint references events(event_id),
	referral_code varchar(50) not null,
	price_cut numeric(10,5) not null default 0,
	promo_started_date date not null, 
	promo_started_time time not null,
	promo_ended_date date not null, 
	promo_ended_time time not null,
	created_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	updated_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	deleted_at timestamp with time zone
);


create table trx (
	trx_id bigserial constraint trx_pk primary key, 
	event_id bigint references events(event_id),
	ticket_amount int not null,
	total_price numeric(10,5) not null default 0,
	promo_id bigint references promotions(promo_id),
	referral_code_used varchar(50),
	created_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	updated_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	deleted_at timestamp with time zone
);

create table reviews_ratings (
	review_rating_id bigserial constraint review_rating_px primary key, 
	trx_id bigint references trx (trx_id),
	review text not null,
	suggestion text not null,
	rating int not null,
	created_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	updated_at timestamp with time zone default CURRENT_TIMESTAMP not null,
	deleted_at timestamp with time zone
);

create unique index trx_id_uindex on trx (trx_id desc);
create unique index review_rating_id_uindex on reviews_ratings (review_rating_id desc);
create unique index promo_id_uindex on promotions (promo_id desc);
create unique index event_id_uindex on events (event_id desc);
create unique index user_id_uindex on users (user_id desc);