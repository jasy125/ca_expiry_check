Facter.add(:ca_exp_date) do
  confine do
    File.exist? '/etc/puppetlabs/puppet/ssl/ca/ca_crt.pem'
  end

  setcode do
    begin
      result = Facter::Core::Execution.execute('/opt/puppetlabs/puppet/bin/openssl x509 -enddate -noout -in /etc/puppetlabs/puppet/ssl/ca/ca_crt.pem')
      enddate = result.split('=')
      if enddate.empty?
         Facter.warn("No enddate found in #{result}")
      else
        enddate[1]
      end
    rescue Facter::Core::Execution::ExecutionFailure
      Facter.warn('Unable to execute the openssl command to check enddate')
    end
  end
end
