use diesel::{OptionalExtension, QueryDsl, QueryResult, RunQueryDsl, update};
use uuid::Uuid;
use crate::config::establish_connection_postgres;
use crate::diesel::ExpressionMethods;
use crate::models::address_model::AddressTable;
use crate::models::login_model::LoginResponse;
use crate::models::user_model::UserTable;

pub fn create_user(user: UserTable) -> QueryResult<Uuid>
{
    use crate::schema::users::dsl::*;

    let connection = &mut establish_connection_postgres();

    return  diesel::insert_into(users)
        .values(&user)
        .returning(id)
        .get_result::<Uuid>(connection);
}

pub fn update_verification_status(find_username: String)
{
    use crate::schema::users::dsl::*;

    let connection = &mut establish_connection_postgres();

    update(users.filter(username.eq(find_username)))
        .set(verified.eq(true))
        .execute(connection)
        .expect("Couldnt update user verification status");
}

pub fn create_address(address: AddressTable)
{
    use crate::schema::addresses::dsl::*;

    let connection = &mut establish_connection_postgres();

    diesel::insert_into(addresses)
        .values(address)
        .execute(connection)
        .expect("Something went wrong");
}

pub fn find_hashed_password(find_username: &String) -> Option<LoginResponse>
{
    use crate::schema::users::dsl::*;

    let connection = &mut establish_connection_postgres();

    let credentials: Option<LoginResponse> = users
    .filter(username.eq(find_username))
    .select((username, password, verified))
    .first::<(String, String, bool)>(connection)
    .optional()
    .map(|result| {
        match result {
            Some((query_username, query_password, query_verified)) => Some(LoginResponse { username:query_username, password:query_password, verified: query_verified }),
            None => None,
        }
    })
    .unwrap_or(None);

    credentials
}

