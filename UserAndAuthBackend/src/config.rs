use diesel::prelude::*;
use std::env;
use std::path::PathBuf;

//Database Connection Postgres

pub fn establish_connection_postgres() -> PgConnection {

    load_env();

    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set in .env");

    PgConnection::establish(&database_url).expect(&format!("Error connecting to {}", database_url))
}

//Redis Cache Connection

pub fn establish_connection_redis() -> redis::RedisResult<redis::Connection> {
    let client = redis::Client::open("redis://127.0.0.1/")?;
    let con = client.get_connection()?;

    Ok(con)
}

// Load .env files

pub fn load_env() {
    let mut path = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    path.push("../.env");

    dotenv::from_path(path.as_path()).expect("Failed to load .env file");
}

// pub fn store_email_token(token: &str, username: String, ttl_seconds: usize) -> redis::RedisResult<()> {
//     let mut con = establish_connection_redis()?;
//     let _: () = con.set_ex(token,  username, ttl_seconds)?;
//
//     Ok(())
// }
//
// pub fn validate_email_token(token: &str) -> redis::RedisResult<bool> {
//     let mut con = establish_connection_redis()?;
//     let key_exists: bool = con.exists(token)?;
//
//     Ok(key_exists)
// }
//
// pub fn get_username(token: &str) -> redis::RedisResult<Option<String>> {
//     let mut con = establish_connection_redis()?;
//     let username :Option<String> = con.get(token)?;
//
//     Ok(username)
// }

