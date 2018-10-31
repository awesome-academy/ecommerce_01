User.delete_all
User.create! name: "nosignup", email: "no@signup.com",
             password: "123456"

Category.create!(name: "Vehicles")
Category.create!(name: "Electronics")
Category.create!(name: "Fashions")
Category.create!(name: "Furnitures")
Category.create!(name: "Travels")
Category.create!(name: "Others")

Category.create!(name: "Cars", parent_id: 1)
Category.create!(name: "Motorbikes", parent_id: 1)
Category.create!(name: "Mobile Phone", parent_id: 2)
Category.create!(name: "Tablets", parent_id: 2)
Category.create!(name: "Laptops", parent_id: 2)
Category.create!(name: "Cameras", parent_id: 2)
Category.create!(name: "Clothes", parent_id: 3)
Category.create!(name: "Watches", parent_id: 3)
Category.create!(name: "Shoes", parent_id: 3)
Category.create!(name: "Wallets", parent_id: 3)
Category.create!(name: "Perfumes", parent_id: 3)
Category.create!(name: "Tables", parent_id: 4)
Category.create!(name: "Chairs", parent_id: 4)
Category.create!(name: "Refrigerators", parent_id: 4)
Category.create!(name: "Washing Machines", parent_id: 4)
Category.create!(name: "Front Door", parent_id: 21)
Category.create!(name: "Upper Door", parent_id: 21)

category_car = Category.find_by name: "Cars"
category_car.products.create!(name: "Nissan SUV Car",
                description: "Used. Imported from Japan",
                unit: "car", price: 389000000,
                color: "silver",
                unit_in_stock: 5, vendor: "Nissan")
category_car.products.create!(name: "Colorado Storm Trucks",
                description: "Brand new. Limited Edition",
                unit: "car", price: 809000000,
                color: "orange",
                unit_in_stock: 100, vendor: "Cherolet")
category_car.products.create!(name: "Toyota Vios 1.5E(MT)",
                description: "Brand new. Sedan. Assembled in Vietnam",
                unit: "car", price: 531000000,
                color: "red",
                unit_in_stock: 300, vendor: "Toyota Vietnam")
category_car.products.create!(name: "Toyota Wigo G 1.2AT",
                description: "Brand new. Hatchback. Assembled in Vietnam",
                unit: "car", price: 405000000,
                color: "red",
                unit_in_stock: 200, vendor: "Toyota Vietnam")
category_car.products.create!(name: "Toyota Wigo G 1.2AT",
                description: "Brand new. Hatchback. Assembled in Vietnam",
                unit: "car", price: 425000000,
                color: "orange",
                unit_in_stock: 200, vendor: "Toyota Vietnam")
category_car.products.create!(name: "Toyota Fortuner 2.4 4x2 AT",
                description: "Brand new. SUV. Assembled in Vietnam",
                unit: "car", price: 1094000000,
                color: "black",
                unit_in_stock: 500, vendor: "Toyota")
category_car.products.create!(name: "Toyota Fortuner 2.4 4x2 AT",
                description: "Brand new. SUV. Assembled in Vietnam",
                unit: "car", price: 1083000000,
                color: "white",
                unit_in_stock: 500, vendor: "Toyota")
category_car.products.create!(name: "Honda HRV 1.5G AT",
                description: "Brand new. Imported from Thailand",
                unit: "car", price: 786000000,
                color: "white",
                unit_in_stock: 100, vendor: "Honda Vietnam")
category_car.products.create!(name: "Honda HRV 1.5G AT",
                description: "Brand new. Imported from Thailand",
                unit: "car", price: 790000000,
                color: "red",
                unit_in_stock: 100, vendor: "Honda Vietnam")

category_motor = Category.find_by name: "Motorbikes"
category_motor.products.create! name: "Honda Vision 110cc",
                                description: "Special Edition",
                                unit: "Motorbike", price: 31990000,
                                color: "black",
                                unit_in_stock: 300, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda Vision 110cc",
                                description: "Special Edition",
                                unit: "Motorbike", price: 31990000,
                                color: "silver",
                                unit_in_stock: 300, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda Vision 110cc",
                                description: "Standard Edition",
                                unit: "Motorbike", price: 29990000,
                                color: "orange",
                                unit_in_stock: 300, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda Vision 110cc",
                                description: "Standard Edition",
                                unit: "Motorbike", price: 30990000,
                                color: "green",
                                unit_in_stock: 300, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda SH 300cc",
                                description: "Sport Edition",
                                unit: "Motorbike", price: 270000000,
                                color: "red",
                                unit_in_stock: 100, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda SH 300cc",
                                description: "Sport Edition",
                                unit: "Motorbike", price: 270000000,
                                color: "black",
                                unit_in_stock: 100, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda SH 300cc",
                                description: "Standard Edition",
                                unit: "Motorbike", price: 269000000,
                                color: "white",
                                unit_in_stock: 100, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda SH 300cc",
                                description: "Standard Edition",
                                unit: "Motorbike", price: 269000000,
                                color: "black",
                                unit_in_stock: 100, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda Airblade 125cc",
                                description: "Premium Edition",
                                unit: "Motorbike", price: 40590000,
                                color: "black",
                                unit_in_stock: 400, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda Airblade 125cc",
                                description: "Premium Edition",
                                unit: "Motorbike", price: 40590000,
                                color: "silver",
                                unit_in_stock: 400, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda Airblade 125cc",
                                description: "Premium Edition",
                                unit: "Motorbike", price: 40590000,
                                color: "red",
                                unit_in_stock: 400, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda Airblade 125cc",
                                description: "Standard Edition",
                                unit: "Motorbike", price: 37990000,
                                color: "black",
                                unit_in_stock: 400, vendor: "Honda Vietnam"
category_motor.products.create! name: "Honda Airblade 125cc",
                                description: "Standard Edition",
                                unit: "Motorbike", price: 37990000,
                                color: "white",
                                unit_in_stock: 400, vendor: "Honda Vietnam"

category_mobile = Category.find_by name: "Mobile Phone"
category_mobile.products.create! name: "Sony Xperia XZ Dual",
                                 description: "Display: 5.2 inch, Full HD, OS: Android 7.0",
                                 unit: "piece", price: 9990000,
                                 color: "white",
                                 unit_in_stock: 400, vendor: "Sony"
category_mobile.products.create! name: "Sony Xperia XZ Dual",
                                 description: "Display: 5.2 inch, Full HD, OS: Android 7.0",
                                 unit: "piece", price: 9990000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Sony"
category_mobile.products.create! name: "Sony Xperia XZ Dual",
                                 description: "Display: 5.2 inch, Full HD, OS: Android 7.0",
                                 unit: "piece", price: 9990000,
                                 color: "silver",
                                 unit_in_stock: 100, vendor: "Sony"
category_mobile.products.create! name: "Sony Xperia XA1 Plus",
                                 description: "Display: 5.5 inch, Full HD, OS: Android 7.0",
                                 unit: "piece", price: 3990000,
                                 color: "blue",
                                 unit_in_stock: 200, vendor: "Sony"
category_mobile.products.create! name: "Sony Xperia XA1 Plus",
                                 description: "Display: 5.5 inch, Full HD, OS: Android 7.0",
                                 unit: "piece", price: 3990000,
                                 color: "black",
                                 unit_in_stock: 100, vendor: "Sony"
category_mobile.products.create! name: "Sony Xperia XA1 Plus",
                                 description: "Display: 5.5 inch, Full HD, OS: Android 7.0",
                                 unit: "piece", price: 3990000,
                                 color: "black",
                                 unit_in_stock: 100, vendor: "Sony"
category_mobile.products.create! name: "Sony Xperia XA1 Plus",
                                 description: "Display: 5.5 inch, Full HD, OS: Android 7.0",
                                 unit: "piece", price: 3990000,
                                 color: "black",
                                 unit_in_stock: 100, vendor: "Sony"
category_mobile.products.create! name: "Samsung Galaxy Note 9 512GB",
                                 description: "Display: 6.4 inch, Quad HD +, OS: Android 8.1",
                                 unit: "piece", price: 28490000,
                                 color: "blue",
                                 unit_in_stock: 100, vendor: "Samsung"
category_mobile.products.create! name: "Samsung Galaxy S9+ 128GB",
                                 description: "Display: 6.2 inch, Quad HD +, OS: Android 8.0",
                                 unit: "piece", price: 24490000,
                                 color: "black",
                                 unit_in_stock: 100, vendor: "Samsung"
category_mobile.products.create! name: "Samsung Galaxy S9+ 64GB",
                                 description: "Display: 6.2 inch, Quad HD +, OS: Android 8.0",
                                 unit: "piece", price: 23490000,
                                 color: "blue",
                                 unit_in_stock: 100, vendor: "Samsung"
category_mobile.products.create! name: "Samsung Galaxy Note 8",
                                 description: "Display: 6.3 inch, Quad HD +, OS: Android 7.1",
                                 unit: "piece", price: 19990000,
                                 color: "black",
                                 unit_in_stock: 100, vendor: "Samsung"
category_mobile.products.create! name: "Samsung Galaxy Note 8",
                                 description: "Display: 6.3 inch, Quad HD +, OS: Android 7.1",
                                 unit: "piece", price: 19990000,
                                 color: "white",
                                 unit_in_stock: 100, vendor: "Samsung"
category_mobile.products.create! name: "Samsung Galaxy A8+",
                                 description: "Display: 6 inch, Full HD +, OS: Android 7.1",
                                 unit: "piece", price: 13490000,
                                 color: "black",
                                 unit_in_stock: 100, vendor: "Samsung"
category_mobile.products.create! name: "Samsung Galaxy A8+",
                                 description: "Display: 6 inch, Full HD +, OS: Android 7.1",
                                 unit: "piece", price: 13490000,
                                 color: "white",
                                 unit_in_stock: 100, vendor: "Samsung"
category_mobile.products.create! name: "Samsung Galaxy A8",
                                 description: "Display: 5.6 inch, Full HD +, OS: Android 7.1",
                                 unit: "piece", price: 10990000,
                                 color: "white",
                                 unit_in_stock: 100, vendor: "Samsung"
category_mobile.products.create! name: "Samsung Galaxy A8",
                                 description: "Display: 5.6 inch, Full HD +, OS: Android 7.1",
                                 unit: "piece", price: 10990000,
                                 color: "black",
                                 unit_in_stock: 100, vendor: "Samsung"
category_mobile.products.create! name: "Iphone Xs Max 512GB",
                                 description: "Display: 6.5 inch, Super Retina, OS: iOS 12",
                                 unit: "piece", price: 43990000,
                                 color: "white",
                                 unit_in_stock: 400, vendor: "Apple"
category_mobile.products.create! name: "Iphone Xs Max 512GB",
                                 description: "Display: 6.5 inch, Super Retina, OS: iOS 12",
                                 unit: "piece", price: 43990000,
                                 color: "red",
                                 unit_in_stock: 400, vendor: "Apple"
category_mobile.products.create! name: "Iphone Xs Max 256GB",
                                 description: "Display: 6.5 inch, Super Retina, OS: iOS 12",
                                 unit: "piece", price: 37990000,
                                 color: "silver",
                                 unit_in_stock: 400, vendor: "Apple"
category_mobile.products.create! name: "Iphone Xs Max 256GB",
                                 description: "Display: 6.5 inch, Super Retina, OS: iOS 12",
                                 unit: "piece", price: 37990000,
                                 color: "red",
                                 unit_in_stock: 400, vendor: "Apple"
category_mobile.products.create! name: "Iphone Xs 256GB",
                                 description: "Display: 5.8 inch, Super Retina, OS: iOS 12",
                                 unit: "piece", price: 34990000,
                                 color: "white",
                                 unit_in_stock: 300, vendor: "Apple"
category_mobile.products.create! name: "Iphone Xs 256GB",
                                 description: "Display: 5.8 inch, Super Retina, OS: iOS 12",
                                 unit: "piece", price: 34990000,
                                 color: "black",
                                 unit_in_stock: 300, vendor: "Apple"
category_mobile.products.create! name: "Nokia 7 plus",
                                 description: "Display: 6 inch, Full HD +, OS: Android 8.0",
                                 unit: "piece", price: 8290000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Microsoft"
category_mobile.products.create! name: "Nokia 7 plus",
                                 description: "Display: 6 inch, Full HD +, OS: Android 8.0",
                                 unit: "piece", price: 8290000,
                                 color: "white",
                                 unit_in_stock: 200, vendor: "Microsoft"
category_mobile.products.create! name: "Nokia 6.1 plus",
                                 description: "Display: 5.8 inch, Full HD +, OS: Android One",
                                 unit: "piece", price: 6590000,
                                 color: "black",
                                 unit_in_stock: 100, vendor: "Microsoft"
category_mobile.products.create! name: "Nokia 6.1 plus",
                                 description: "Display: 5.8 inch, Full HD +, OS: Android One",
                                 unit: "piece", price: 6590000,
                                 color: "white",
                                 unit_in_stock: 100, vendor: "Microsoft"
category_mobile.products.create! name: "Oppo Find X",
                                 description: "Display: 6.42 inch, Full HD +, OS: Android 8.1",
                                 unit: "piece", price: 20990000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Oppo"
category_mobile.products.create! name: "Oppo Find X",
                                 description: "Display: 6.42 inch, Full HD +, OS: Android 8.1",
                                 unit: "piece", price: 20990000,
                                 color: "red",
                                 unit_in_stock: 200, vendor: "Oppo"
category_mobile.products.create! name: "Oppo F9 6GB",
                                 description: "Display: 6.3 inch, Full HD +, OS: Android 8.1",
                                 unit: "piece", price: 8490000,
                                 color: "red",
                                 unit_in_stock: 200, vendor: "Oppo"
category_mobile.products.create! name: "Oppo F9 6GB",
                                 description: "Display: 6.3 inch, Full HD +, OS: Android 8.1",
                                 unit: "piece", price: 8490000,
                                 color: "white",
                                 unit_in_stock: 200, vendor: "Oppo"
category_mobile.products.create! name: "Huawei Mate 20 Pro",
                                 description: "Display: 6.39 inch, Quad HD +, OS: Android 9.0",
                                 unit: "piece", price: 21990000,
                                 color: "green",
                                 unit_in_stock: 200, vendor: "Huawei"
category_mobile.products.create! name: "Huawei Mate 20 Pro",
                                 description: "Display: 6.39 inch, Quad HD +, OS: Android 9.0",
                                 unit: "piece", price: 21990000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Huawei"
category_mobile.products.create! name: "Huawei P20 Pro",
                                 description: "Display: 6.1 inch, Full HD +, OS: Android 8.1",
                                 unit: "piece", price: 16990000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Huawei"
category_mobile.products.create! name: "Huawei P20 Pro",
                                 description: "Display: 6.1 inch, Full HD +, OS: Android 8.1",
                                 unit: "piece", price: 16990000,
                                 color: "white",
                                 unit_in_stock: 200, vendor: "Huawei"
category_mobile.products.create! name: "Huawei Nova 3",
                                 description: "Display: 6.3 inch, Full HD +, OS: Android 8.1",
                                 unit: "piece", price: 11990000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Huawei"
category_mobile.products.create! name: "Huawei Nova 3",
                                 description: "Display: 6.3 inch, Full HD +, OS: Android 8.1",
                                 unit: "piece", price: 11990000,
                                 color: "white",
                                 unit_in_stock: 200, vendor: "Huawei"

category_tablet = Category.find_by name: "Tablets"
category_tablet.products.create! name: "iPad Pro Wifi Cellular 64GB",
                                 description: "Display: 10.5 inch, Retina, OS: iOS 11",
                                 unit: "piece", price: 19990000,
                                 color: "silver",
                                 unit_in_stock: 200, vendor: "Apple"
category_tablet.products.create! name: "iPad Pro Wifi Cellular 64GB",
                                 description: "Display: 10.5 inch, Retina, OS: iOS 11",
                                 unit: "piece", price: 19990000,
                                 color: "white",
                                 unit_in_stock: 200, vendor: "Apple"
category_tablet.products.create! name: "iPad Pro Wifi 64GB",
                                 description: "Display: 10.5 inch, Retina, OS: iOS 11",
                                 unit: "piece", price: 16990000,
                                 color: "silver",
                                 unit_in_stock: 200, vendor: "Apple"
category_tablet.products.create! name: "iPad Pro Wifi 64GB",
                                 description: "Display: 10.5 inch, Retina, OS: iOS 11",
                                 unit: "piece", price: 16990000,
                                 color: "white",
                                 unit_in_stock: 200, vendor: "Apple"
category_tablet.products.create! name: "iPad Air 2 Cellular 128GB",
                                 description: "Display: 10.5 inch, Retina, OS: iOS 11",
                                 unit: "piece", price: 15490000,
                                 color: "silver",
                                 unit_in_stock: 200, vendor: "Apple"
category_tablet.products.create! name: "iPad Air 2 Cellular 128GB",
                                 description: "Display: 10.5 inch, Retina, OS: iOS 11",
                                 unit: "piece", price: 15490000,
                                 color: "white",
                                 unit_in_stock: 200, vendor: "Apple"
category_tablet.products.create! name: "Samsung Galaxy Tab S4 S-Pen",
                                 description: "Display: 10.5 inch, Super Amoled, OS: Android 8.0",
                                 unit: "piece", price: 17990000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Samsung"
category_tablet.products.create! name: "Samsung Galaxy Tab S4 S-Pen",
                                 description: "Display: 10.5 inch, Super Amoled, OS: Android 8.0",
                                 unit: "piece", price: 17990000,
                                 color: "blue",
                                 unit_in_stock: 200, vendor: "Samsung"
category_tablet.products.create! name: "Samsung Galaxy Tab A",
                                 description: "Display: 10.5 inch, IPS LCD, OS: Android 8.0",
                                 unit: "piece", price: 9490000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Samsung"
category_tablet.products.create! name: "Samsung Galaxy Tab A",
                                 description: "Display: 10.5 inch, IPS LCD, OS: Android 8.0",
                                 unit: "piece", price: 9490000,
                                 color: "blue",
                                 unit_in_stock: 200, vendor: "Samsung"
category_tablet.products.create! name: "Samsung Galaxy Tab A6 S-Pen",
                                 description: "Display: 10.1 inch, PLS, OS: Android 6.0",
                                 unit: "piece", price: 7490000,
                                 color: "blue",
                                 unit_in_stock: 200, vendor: "Samsung"
category_tablet.products.create! name: "Samsung Galaxy Tab A6 S-Pen",
                                 description: "Display: 10.1 inch, PLS, OS: Android 6.0",
                                 unit: "piece", price: 7490000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Samsung"
category_tablet.products.create! name: "Huawei MediaPad M3 8.0",
                                 description: "Display: 8.0 inch, IPS LCD, OS: Android 7.0",
                                 unit: "piece", price: 5990000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Huawei"
category_tablet.products.create! name: "Huawei MediaPad M3 8.0",
                                 description: "Display: 8.0 inch, IPS LCD, OS: Android 7.0",
                                 unit: "piece", price: 5990000,
                                 color: "silver",
                                 unit_in_stock: 200, vendor: "Huawei"
category_tablet.products.create! name: "Huawei MediaPad T3 10",
                                 description: "Display: 10 inch, IPS LCD, OS: Android 7.0",
                                 unit: "piece", price: 4490000,
                                 color: "black",
                                 unit_in_stock: 200, vendor: "Huawei"
category_tablet.products.create! name: "Huawei MediaPad T3 10",
                                 description: "Display: 10 inch, IPS LCD, OS: Android 7.0",
                                 unit: "piece", price: 4490000,
                                 color: "silver",
                                 unit_in_stock: 200, vendor: "Huawei"

category_laptop = Category.find_by name: "Laptops"
category_laptop.products.create! name: "Apple Macbook Pro Touch MR932SA/A i7",
                                 description: "Display: 15.4 inch, Retina, OS: MAC OS",
                                 unit: "piece", price: 57490000,
                                 color: "silver",
                                 unit_in_stock: 100, vendor: "Apple"
category_laptop.products.create! name: "Apple Macbook Pro Touch MR9Q2SA/A i5",
                                 description: "Display: 13.3 inch, Retina, OS: MAC OS",
                                 unit: "piece", price: 44490000,
                                 color: "silver",
                                 unit_in_stock: 100, vendor: "Apple"
category_laptop.products.create! name: "iMac MNDY2SA/A i5",
                                 description: "Display: 21.5 inch, 4k UHD, OS: MAC OS",
                                 unit: "piece", price: 33990000,
                                 color: "silver",
                                 unit_in_stock: 100, vendor: "Apple"
category_laptop.products.create! name: "Dell Inspiron 7570 8550U",
                                 description: "Display: 15.6 inch, FHD, OS: Wins 10",
                                 unit: "piece", price: 26990000,
                                 color: "silver",
                                 unit_in_stock: 100, vendor: "Dell"
category_laptop.products.create! name: "Dell Inspiron 7570 8550U",
                                 description: "Display: 15.6 inch, FHD, OS: Wins 10",
                                 unit: "piece", price: 26990000,
                                 color: "black",
                                 unit_in_stock: 100, vendor: "Dell"
category_laptop.products.create! name: "Dell Inspiron 7373 8250U",
                                 description: "Display: 13.3 inch, FHD Touch, OS: Wins 10",
                                 unit: "piece", price: 26990000,
                                 color: "silver",
                                 unit_in_stock: 100, vendor: "Dell"
category_laptop.products.create! name: "Dell Inspiron 5379 8550U",
                                 description: "Display: 13.3 inch, FHD Touch, OS: Wins 10",
                                 unit: "piece", price: 26990000,
                                 color: "silver",
                                 unit_in_stock: 100, vendor: "Dell"
