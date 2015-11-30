class base::role::switch {
  include stdlib

  include base::interfaces,
    base::motd,
    base::ntpclient,
    base::users
}
