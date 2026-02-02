-- ======================
-- CUSTOMERS
-- ======================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(50),
    Address VARCHAR(250)
);

-- ======================
-- RESTAURANTS
-- ======================
CREATE TABLE Restaurants (
    RID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(250),
    Phone VARCHAR(50)
);

-- ======================
-- MENU ITEMS
-- ======================
CREATE TABLE MenuItems (
    MIID INT PRIMARY KEY AUTO_INCREMENT,
    RID INT NOT NULL,
    ItemName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    IsAvailable BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_menuitems_restaurants 
        FOREIGN KEY (RID) REFERENCES Restaurants(RID)
);

-- ======================
-- ORDERS
-- ======================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(25) NOT NULL,
    Amount DECIMAL(10,2),
    CONSTRAINT fk_orders_customers 
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ======================
-- ORDER ITEMS (Junction Table)
-- ======================
CREATE TABLE OrderItems (
    OIID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    MIID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orderitems_orders 
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_orderitems_menuitems 
        FOREIGN KEY (MIID) REFERENCES MenuItems(MIID)
);

-- ======================
-- DELIVERY DRIVERS
-- ======================
CREATE TABLE DeliveryDrivers (
    DDID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(50) NOT NULL,
    Address VARCHAR(250) NOT NULL
);

-- ======================
-- DELIVERIES
-- ======================
CREATE TABLE Deliveries (
    DID INT PRIMARY KEY AUTO_INCREMENT,
    OID INT NOT NULL,
    DDID INT NOT NULL,
    PickupTime TIMESTAMP NULL,
    DeliveryTime TIMESTAMP NULL,
    CONSTRAINT fk_deliveries_orders 
        FOREIGN KEY (OID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_deliveries_drivers 
        FOREIGN KEY (DDID) REFERENCES DeliveryDrivers(DDID)
);