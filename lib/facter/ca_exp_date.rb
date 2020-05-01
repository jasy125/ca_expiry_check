Facter.add(:ca_exp_date) do
  confine do
    File.exist? '/etc/puppetlabs/puppet/ssl/certs/ca.pem'
  end
  setcode do
    Facter::Core::Execution.execute('/opt/puppetlabs/puppet/bin/openssl x509 -enddate -noout -in /etc/puppetlabs/puppet/ssl/certs/ca.pem | sed -r \'s/.{9}//\'')
  end
end
