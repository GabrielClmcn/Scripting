function DNSResolver($IP)
{
 if($IP -match "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$")
  {
    [System.Net.Dns]::GetHostEntry($IP).HostName
  }
 elseif( $IP -match "^.*\.\.*")
   {
 $result = "IP is : " + [System.Net.Dns]::GetHostEntry($IP).AddressList[0].IPAddressToString
    write-host $result
   }
 else {
 $errorMsg = "Error : No DNS Found"
 write-host $errorMsg
}
}
// change this line
DNSResolver "google.com"