use Customers
go

create proc AdressesCreate
	@CustomerId int,
	@AddressLine nvarchar(100),
	@AddressLine2 nvarchar(100),
	@AddressType nvarchar(8),
	@City nvarchar(50),
	@PostalCode nvarchar(6),
	@State nvarchar(20)
as begin
	insert into [dbo].[Address]
           ([CustomerId]
           ,[AddressLine]
           ,[AddressLine2]
           ,[AddressType]
           ,[City]
           ,[PostalCode]
           ,[State])
     values
           (@CustomerId,
           @AddressLine,
           @AddressLine2,
           @AddressType,
           @City,
           @PostalCode,
           @State)
	return scope_identity()
end

go

create proc AddressesRead
	@Id int
as begin
	return select * from [Address] where AddressId = @Id
end

go

create proc AdressesUpdate
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

go

create proc AddressesDelete
	@Id int
as begin
	delete from [Address]
	where AddressId = @Id
end