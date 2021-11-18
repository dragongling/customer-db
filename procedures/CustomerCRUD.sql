use Customers
go

create proc CustomersCreate
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@PhoneNumber nvarchar(15),
	@Email nvarchar(50),
	@Notes nvarchar(max),
	@TotalPurchasesAmount decimal
as begin
	insert into Customer
           ([FirstName]
           ,[LastName]
           ,[PhoneNumber]
           ,[Email]
           ,[Notes]
           ,[TotalPurchasesAmount])
    values
           (@FirstName,
           @LastName,
           @PhoneNumber,
           @Email,
           @Notes,
           @TotalPurchasesAmount)
	return scope_identity()
end

go

create proc CustomersRead
	@Id int
as begin
	return select [FirstName]
           ,[LastName]
           ,[PhoneNumber]
           ,[Email]
           ,[Notes]
           ,[TotalPurchasesAmount] 
		   from Customer
		   where Customer.CustomerId = @Id
end

go

create proc CustomersUpdate
	@Id int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@PhoneNumber nvarchar(15),
	@Email nvarchar(50),
	@Notes nvarchar(max),
	@TotalPurchasesAmount decimal
as begin
	update Customer
	set FirstName = @FirstName,
		LastName = @LastName,
		PhoneNumber = @PhoneNumber,
		Email = @Email,
		Notes = @Notes,
		TotalPurchasesAmount = @TotalPurchasesAmount
	where CustomerId = @Id
end

go

create proc CustomersDelete
	@Id int
as begin
	delete from Customer
	where CustomerId = @Id
end
