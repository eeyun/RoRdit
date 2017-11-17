pkg_name=rordit
pkg_origin=eeyun
pkg_scaffolding="core/scaffolding-ruby"
pkg_version="0.1.0"

pkg_binds=(
  [database]="port superuser_name superuser_password",
  [search]="http-port transport-port"
)

declare -A scaffolding_env
scaffolding_env[SECRET_KEY_BASE]="{{cfg.secret_key_base}}"
scaffolding_env[SITE_TITLE]="{{cfg.site_title}}"
scaffolding_env[SITE_SLOGAN]="{{cfg.site_slogan}}"
scaffolding_env[ELASTICSEARCH_HOST]="{{bind.search.first.sys.ip}}"

#adding a comment to test builder behavior
