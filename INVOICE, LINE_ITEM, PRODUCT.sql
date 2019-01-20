USE C_DB10_2018

CREATE TABLE INVOICE(
	InvoiceNumber INT PRIMARY KEY, 
	InvoiceDate DATE, 
	SubTotal FLOAT, 
	TaxPct FLOAT, 
	Total FLOAT
)

CREATE TABLE PRODUCT(
	ProductNumber INT PRIMARY KEY, 
	ProductType TEXT, 
	ProductDescription VARCHAR(300), 
	UnitPrice FLOAT
)

CREATE TABLE LINE_ITEM(
	InvoiceNumber INT, 
	LineNumber INT PRIMARY KEY, 
	ProductNumber INT, 
	Quantity INT, 
	Unitprice FLOAT, 
	Total FLOAT
	CONSTRAINT Invoice_Number_PK FOREIGN KEY (InvoiceNumber) REFERENCES INVOICE(InvoiceNumber),
	CONSTRAINT Product_Number_PK FOREIGN KEY (ProductNumber) REFERENCES PRODUCT(ProductNumber)
)
