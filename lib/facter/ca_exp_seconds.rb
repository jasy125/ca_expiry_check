require 'openssl'
require 'time'

Facter.add(:ca_exp_seconds) do
  ca_file = '/etc/puppetlabs/puppet/ssl/certs/ca.pem'
  confine do
    File.exist? ca_file
  end
  setcode do
    raw_ca_cert = File.read ca_file
    certificate = OpenSSL::X509::Certificate.new raw_ca_cert
    certificate.not_after - Time.now
  end
end
