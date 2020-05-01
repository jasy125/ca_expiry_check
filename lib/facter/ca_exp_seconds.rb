Facter.add(:ca_exp_seconds) do
  confine do
    File.exist? '/etc/puppetlabs/puppet/ssl/certs/ca.pem'
  end
  setcode do
    Facter::Core::Execution.execute('/bin/expr $(/bin/date \'+%s\' -d "$(/opt/puppetlabs/puppet/bin/openssl x509 -enddate -noout -in /etc/puppetlabs/puppet/ssl/certs/ca.pem | /bin/sed -r \'s/.{9}//\')") - $(/bin/date \'+%s\') ').to_i
  end
end
