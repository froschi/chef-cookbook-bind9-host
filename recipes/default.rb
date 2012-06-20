include_recipe "libbind9"
include_recipe "libdns"
include_recipe "libisc"
include_recipe "libisccfg"
include_recipe "liblwres"

packages = Array.new

case node[:lsb][:codename]
when "lucid"
  include_recipe "libcap"
  include_recipe "libgssapi-krb5"
  include_recipe "libssl"
  include_recipe "libxml2"

  packages |= %w/
    bind9-host
  /
when "precise"
  packages |= %w/
    bind9-host
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
