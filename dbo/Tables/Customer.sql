CREATE TABLE [dbo].[Customer] (
    [CustomerId]           INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]            NVARCHAR (50)  NULL,
    [LastName]             NVARCHAR (50)  NOT NULL,
    [PhoneNumber]          NVARCHAR (15)  NULL,
    [Email]                NVARCHAR (50)  NULL,
    [Notes]                NVARCHAR (MAX) NOT NULL,
    [TotalPurchasesAmount] DECIMAL (18)   NULL,
    PRIMARY KEY CLUSTERED ([CustomerId] ASC),
    CONSTRAINT [email_address] CHECK ([Email] like '%@%'),
    CONSTRAINT [phone_num_e_164] CHECK ([PhoneNumber] like concat(replicate('[0-9]',(11)),'%'))
);

