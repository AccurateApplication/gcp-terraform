data "google_client_openid_userinfo" "me" {
}

resource "google_os_login_ssh_public_key" "cache" {
  key  = file("~/.ssh/id_rsa.pub")
  user = data.google_client_openid_userinfo.me.email
}
