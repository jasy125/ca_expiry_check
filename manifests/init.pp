# Notify if CA will expire within a set window
#
# Notifys on each puppet run should the CA Cert get within a specific window
#
# @example
#   include ca_expiry_check
class ca_expiry_check (
  Integer $alertwindow,
)
  {


if $facts[ca_exp_seconds] < $ca_expiry_check::alertwindow {
  notify {"Puppet CA expiring on ${facts['ca_exp_date']} You should renew, Please take a look at the Puppet CA_Extend Module (https://forge.puppet.com/puppetlabs/ca_extend)":}
}


}
