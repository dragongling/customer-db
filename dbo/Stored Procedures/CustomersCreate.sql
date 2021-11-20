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