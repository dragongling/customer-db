
create proc AddressesRead
	@Id int
as begin
	return select * from [Address] where AddressId = @Id
end