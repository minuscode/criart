# Schema

# Table: Category
## Properties:
* Name
* Description
* Logo

# Table: Product
## Properties:
* Name
* Reference
* Description
* Price
* Sizes (array)
* Picture url
* Thumb url
* Visits
* FOREIGN KEY Category

# Table (DEVISE) : Customer
## Properties:
* Login_email (OAUTH Facebook/Gmail)
* Password


--- ## LATER ## --

# Table: Cart
## Properties:
* Cart stuff

# Table: Line Item
## Properties:
* Foreign Key: Product
	* Product
	* Price
* Quantity

# Table: Order
## Properties:
* Foreign Key (User) (Buyer Details)
* Payment Details
* Shipping statusgit@github.com:miguelm/criart.git