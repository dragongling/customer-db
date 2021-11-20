
create proc AddressesDelete
	@Id int
as begin
	delete from [Address]
	where AddressId = @Id
end