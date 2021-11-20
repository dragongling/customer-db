
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