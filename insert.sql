use Customers;

/** Customer **/

/* Valid: */
insert into Customer (FirstName, LastName, PhoneNumber, Email, Notes, TotalPurchasesAmount)
values ('Arthur', 'Pirozhkov', '88005553535', 'pirozhkov@mail.ru', N'не дарит цветов, не пишет стихов', 20000.43);

insert into Customer (FirstName, LastName, PhoneNumber, Email, Notes, TotalPurchasesAmount)
values ('Vasiliy', 'Pupkin', '79096485234', 'pupkin@gmail.com', N'василий', 12.00);

insert into Customer (LastName, Notes)
values ('Golovkin', N'боксер');

/* Invalid: */
insert into Customer (FirstName, LastName, PhoneNumber, Email, Notes, TotalPurchasesAmount)
values ('Arthur', 'Pirozhkov', 'notAPhone', 'pirozhkov@mail.ru', N'не дарит цветов, не пишет стихов', 20000.43);

insert into Customer (FirstName, LastName, PhoneNumber, Email, Notes, TotalPurchasesAmount)
values ('Vasiliy', 'Pupkin', '79096485234', 'notEmail', N'василий', 12.00);

/** Address **/

/* Valid: */
insert into [Address] (CustomerId, AddressLine, AddressType, City, PostalCode, [State])
values ((select CustomerId from Customer where Customer.LastName = 'Pirozhkov'), 'Some st.', 'Shipping', 'Los Angeles', '123456', 'United States')

insert into [Address] (CustomerId, AddressLine, AddressType, City, PostalCode, [State])
values ((select CustomerId from Customer where Customer.LastName = 'Pupkin'), 'Pupkin st.', 'Billing', 'Toronto', '086735', 'Canada')

insert into [Address] (CustomerId, AddressLine, AddressType, City, PostalCode, [State])
values ((select CustomerId from Customer where Customer.LastName = 'Golovkin'), 'Golovkin st.', 'Shipping', 'New York', '654321', 'United States')

/* Invalid: */
insert into [Address] (CustomerId, AddressLine, AddressType, City, PostalCode, [State])
values (0, 'Some st.', 'Shipping', 'Los Angeles', '123456', 'United States')

insert into [Address] (CustomerId, AddressLine, AddressType, City, PostalCode, [State])
values ((select CustomerId from Customer where Customer.LastName = 'Pirozhkov'), 'Some st.', 'Unknown', 'Los Angeles', '123456', 'United States')

insert into [Address] (CustomerId, AddressLine, AddressType, City, PostalCode, [State])
values ((select CustomerId from Customer where Customer.LastName = 'Pirozhkov'), 'Some st.', 'Shipping', 'Los Angeles', 'noCode', 'United States')

insert into [Address] (CustomerId, AddressLine, AddressType, City, PostalCode, [State])
values ((select CustomerId from Customer where Customer.LastName = 'Pirozhkov'), 'Some st.', 'Shipping', 'Los Angeles', '123456', 'Kazakhstan')