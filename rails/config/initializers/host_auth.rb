Rails.application.config.hosts = [
  IPAddr.new("0.0.0.0/0"),
  IPAddr.new("::/0"),
  "localhost",
  "subdir-testapp.herokuapp.com"
]
