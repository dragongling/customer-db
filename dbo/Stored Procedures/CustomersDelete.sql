
create proc CustomersDelete
	@Id int
as begin
	delete from Customer
	where CustomerId = @Id
end