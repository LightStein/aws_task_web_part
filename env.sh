PublicIP=$(curl http://checkip.amazonaws.com)
PrivateIP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
public="  PublicIP: $PublicIP"
private=" PrivateIP: $PrivateIP"
echo "env = {"
echo $public
echo $private
echo "}"