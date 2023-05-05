fx_version "cerulean"
game "gta5"

files {
  "web/*",
  "web/**/*",
  "web/**/**/*",
}

ui_page "web/index.html"


shared_scripts {
  "@vrp/lib/utils.lua"
}

client_scripts {
  "src/*.lua"
}