
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