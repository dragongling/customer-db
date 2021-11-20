CREATE TABLE [dbo].[Address] (
    [AddressId]    INT            IDENTITY (1, 1) NOT NULL,
    [CustomerId]   INT            NOT NULL,
    [AddressLine]  NVARCHAR (100) NOT NULL,
    [AddressLine2] NVARCHAR (100) NULL,
    [AddressType]  NVARCHAR (8)   NOT NULL,
    [City]         NVARCHAR (50)  NOT NULL,
    [PostalCode]   NVARCHAR (6)   NOT NULL,
    [State]        NVARCHAR (20)  NOT NULL,
    PRIMARY KEY CLUSTERED ([AddressId] ASC),
    CONSTRAINT [address_type_cc] CHECK ([AddressType]='Billing' OR [AddressType]='Shipping'),
    CONSTRAINT [country_name_cc] CHECK ([State]='Canada' OR [State]='United States'),
    CONSTRAINT [postal_code] CHECK ([PostalCode] like replicate('[0-9]',(6))),
    CONSTRAINT [FK_Address_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId])
);

