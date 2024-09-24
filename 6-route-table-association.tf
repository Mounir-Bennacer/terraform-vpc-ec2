resource "aws_route_table_association" "route_table_association_custom_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table_custom_internet.id
}
