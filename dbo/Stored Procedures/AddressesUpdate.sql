
create proc AddressesUpdate
	@Id int,
	@CustomerId int,
	@AddressLine nvarchar(100),
	@AddressLine2 nvarchar(100),
	@AddressType nvarchar(8),
	@City nvarchar(50),
	@PostalCode nvarchar(6),
	@State nvarchar(20)
as begin
	update [Address]
	set CustomerId = @CustomerId,
		AddressLine = @AddressLine,
		AddressLine2 = @AddressLine2,
		AddressType = @AddressType,
		City = @City,
		PostalCode = @PostalCode,
		[State] = @State
	where AddressId = @Id
end