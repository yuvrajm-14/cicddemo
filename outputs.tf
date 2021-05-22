resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  awsinstance-ip = aws_instance.terraform-ansible.public_ip
 }
 )
 filename = "inventory"
}
