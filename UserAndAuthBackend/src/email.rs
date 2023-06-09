use std::env;
use lettre::{Message, SmtpTransport, Transport};
use lettre::message::header::ContentType;
use lettre::transport::smtp::authentication::Credentials;
use rocket::http::Status;
use rocket::tokio::task;
use serde_json::Value;
use crate::config::load_env;
use crate::handlebars_template_creator::{create_template};


pub fn send_verification_mail(data: Value) {

    load_env();

    let smtp_username = env::var("SMTP_USERNAME").expect("SMTP_USERNAME must be set");
    let smtp_password = env::var("SMTP_PASSWORD").expect("SMTP_PASSWORD must be set");
    let smtp_server = env::var("SMTP_SERVER").expect("SMTP_SERVER must be set");

    let html = create_template("email_verification", data);

    let email = Message::builder()
        .to("admin@homelabhost.de".parse().unwrap())
        .from(smtp_username.parse().unwrap())
        .subject("Wilkommen im Webshop")
        .header(ContentType::TEXT_HTML)
        .body(html.unwrap())
        .unwrap();

    let creds = Credentials::new(smtp_username, smtp_password.to_owned());
    task::spawn(async move {
        let mail_server = SmtpTransport::relay(&smtp_server)
            .map_err(|_| Status::InternalServerError)
            .unwrap()
            .credentials(creds)
            .build();

        match mail_server.send(&email) {
            Ok(_) => println!("Verification Email sent successfully!"),
            Err(e) => println!("Could not send email: {:?}", e),
        }
    });
}