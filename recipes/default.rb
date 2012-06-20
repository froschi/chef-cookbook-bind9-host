packages = Array.new

case node[:lsb][:codename]
when "lucid"
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
