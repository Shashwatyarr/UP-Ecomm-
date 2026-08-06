
import 'package:ecomm/routes/routes.dart';
import 'package:ecomm/utils/constants/images.dart';

import 'features/shop/models/banner_model.dart';
import 'features/shop/models/brand_category_model.dart';
import 'features/shop/models/brand_model.dart';
import 'features/shop/models/category_model.dart';
import 'features/shop/models/product_attribute_model.dart';
import 'features/shop/models/product_category_model.dart';
import 'features/shop/models/product_model.dart';
import 'features/shop/models/product_variation_model.dart';

class UDummyData {
  /// List of all Banners

  static final List<BannerModel> banner = [
    BannerModel(imageUrl: UImages.homeBanner1, targetScreen: URoutes.order, active: true),
    BannerModel(imageUrl: UImages.homeBanner2, targetScreen: URoutes.cart, active: true),
    BannerModel(imageUrl: UImages.homeBanner3, targetScreen: URoutes.wishlist, active: true),
    BannerModel(imageUrl: UImages.homeBanner4, targetScreen: URoutes.productDetail, active: true),
    BannerModel(imageUrl: UImages.homeBanner5, targetScreen: URoutes.profile, active: true),
  ];

  /// List of all Categories
  static final List<CategoryModel> categories = [
    /// Parent Categories
    CategoryModel(id: '1', name: 'Clothes', image: UImages.clothesIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Shoes', image: UImages.shoesIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Cosmetics', image: UImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Electronics', image: UImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: UImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Sports', image: UImages.sportsIcon, isFeatured: true),

    /// Clothes
    CategoryModel(id: '7', name: 'Shirts', image: UImages.shirtIcon, parentId: '1'),
    CategoryModel(id: '8', name: 'Jackets', image: UImages.jacketsIcon, parentId: '1'),
    CategoryModel(id: '9', name: 'Shorts', image: UImages.shortsIcon, parentId: '1'),

    /// Shoes
    CategoryModel(id: '10', name: 'Formal Shoes', image: UImages.formalShoesIcon, parentId: '2'),
    CategoryModel(id: '11', name: 'Sports Shoes', image: UImages.sportsShoesIcon, parentId: '2'),

    /// Cosmetics
    CategoryModel(id: '12', name: 'Face', image: UImages.faceIcon, parentId: '3'),
    CategoryModel(id: '13', name: 'Hair Oils', image: UImages.hairOilIcon, parentId: '3'),
    CategoryModel(id: '14', name: 'Bags', image: UImages.bagsIcon, parentId: '3'),
    CategoryModel(id: '15', name: 'Perfumes', image: UImages.perfumeIcon, parentId: '3'),
    CategoryModel(id: '16', name: 'Watches', image: UImages.watchIcon, parentId: '3'),

    /// Electronics
    CategoryModel(id: '17', name: 'Gadgets', image: UImages.gadgetsIcon, parentId: '4', isFeatured: false),
    CategoryModel(id: '18', name: 'Laptops', image: UImages.laptopsIcon, parentId: '4', isFeatured: false),
    CategoryModel(id: '19', name: 'Mobiles', image: UImages.mobileIcon, parentId: '4', isFeatured: false),

    /// Furniture
    CategoryModel(id: '20', name: 'Bed', image: UImages.bedIcon, parentId: '5', isFeatured: false),
    CategoryModel(id: '21', name: 'Lamps', image: UImages.lampIcon, parentId: '5', isFeatured: false),

    /// Sports
    CategoryModel(id: '22', name: 'Cricket', image: UImages.cricketIcon, parentId: '6', isFeatured: false),
    CategoryModel(id: '23', name: 'Soccer', image: UImages.soccerIcon, parentId: '6', isFeatured: false),
  ];

   //List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712693/Brands%20Images/tl9wjbj77zeo9qul3eq2.png',
        name: 'Nike',
        productsCount: 2,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712696/Brands%20Images/fdxer5l7qrisfyff2c9x.jpg',
        name: 'Adidas',
        productsCount: 2,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712697/Brands%20Images/rgoe3o3qptrjun5fmoqe.jpg',
        name: 'Apple',
        productsCount: 8,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712698/Brands%20Images/mcwd8faen7iogfrpt0ts.png',
        name: 'Bata',
        productsCount: 4,
        isFeatured: true),
    BrandModel(
        id: '5',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712699/Brands%20Images/peojxxvbvsv4grldfliu.png',
        name: 'Bloody',
        productsCount: 9,
        isFeatured: false),
    BrandModel(
        id: '6',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712701/Brands%20Images/cc0yugmbnl6l3r9fxzej.jpg',
        name: 'Breakout',
        productsCount: 7,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712702/Brands%20Images/uija31c12nklaouz40rg.png',
        name: 'Dari Mooch',
        productsCount: 4,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712703/Brands%20Images/e1ymwagv5db0cvsrdqfo.jpg',
        name: 'Interwood',
        productsCount: 9,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712705/Brands%20Images/hih7hp1324alvlptfsi5.jpg',
        name: 'HP',
        productsCount: 4,
        isFeatured: false),
    BrandModel(
        id: '10',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712706/Brands%20Images/hzi6y2n8km7hsqfl0m4k.png',
        name: 'J.',
        productsCount: 8,
        isFeatured: true),
    BrandModel(
        id: '11',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712707/Brands%20Images/ehasbyoowj8srvurhqvq.png',
        name: 'NDURE',
        productsCount: 4,
        isFeatured: true),
    BrandModel(
        id: '12',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712709/Brands%20Images/ox9ir27nmkpj7fniwshs.jpg',
        name: 'NorthStar',
        productsCount: 2,
        isFeatured: true),
    BrandModel(
        id: '13',
        image: 'https://res.cloudinary.com/dx4o5amce/image/upload/v1746712710/Brands%20Images/xd3q9uwpkp9tlkc8u7ga.png',
        name: 'Polo',
        productsCount: 2,
        isFeatured: true),
  ];
  //
  // /// List of all products - 68 Products
  static final List<ProductModel> products = [
    // 001
    ProductModel(
        id: '1',
        title: 'Casual Denim & Tee Set With Glossy Slip-On Shoes',
        stock: 15,
        price: 115,
        thumbnail: UImages.productImage1,
        description:
            "Stay stylish and comfortable with this casual outfit combo featuring a soft olive-green T-shirt, classic denim shorts, and sleek black slip-on shoes. Perfect for laid-back days or casual outings. Easy to wear, easy to love — all-in-one style made simple.",
        brand: brands[1],
        salePrice: 100,
        sku: 'ABR4568',
        categoryId: '7',
        productType: 'ProductType.single'),

    // 002
    ProductModel(
        id: '2',
        title: 'ProGrip Indoor/Outdoor Basketball',
        stock: 15,
        price: 30,
        isFeatured: true,
        thumbnail: UImages.productImage2,
        description:
            'Elevate your game with the ProGrip™ Basketball — designed for both indoor courts and outdoor play. Its textured grip ensures maximum control, while the durable rubber build offers long-lasting performance. Perfect for casual shoots or intense matches!',
        brand: brands[0],
        salePrice: 24,
        sku: 'ABR4568',
        categoryId: '23',
        productType: 'ProductType.single'),

    // 003
    ProductModel(
        id: '3',
        title: 'Apple iPhone 14 (Blue) – Super Retina Display, A15 Bionic',
        stock: 15,
        price: 700,
        isFeatured: false,
        thumbnail: UImages.productImage3,
        description:
            'Experience the power of the A15 Bionic chip, advanced dual-camera system, and stunning Super Retina XDR display. The iPhone 14 in elegant blue delivers lightning-fast performance, all-day battery life, and next-level photography — all in a sleek, durable design.',
        brand: brands[2],
        salePrice: 679,
        sku: 'ABR4568',
        categoryId: '19',
        productAttributes: [
          ProductAttributeModel(name: 'Storage', values: ['128GB', '256GB', '512GB']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributeValues: {'Storage': '128GB'},
              price: 600,
              description: 'This is description of 128GB Storage',
              sku: 'iPhoneSKU',
              stock: 10),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Storage': '256GB'},
              price: 650,
              description: 'This is description of 256GB Storage',
              sku: 'iPhoneSKU',
              stock: 20),
          ProductVariationModel(
              id: '3',
              attributeValues: {'Storage': '512GB'},
              price: 700,
              description: 'This is description of 512GB Storage',
              sku: 'iPhoneSKU',
              stock: 10)
        ],
        productType: 'ProductType.variable'),

    // 004
    ProductModel(
        id: '4',
        title: 'Apple iPhone X (64GB/256GB) – Space Gray & Silver Variants',
        stock: 15,
        price: 350,
        isFeatured: true,
        thumbnail: UImages.productImage4a,
        description:
            'The Apple iPhone X redefined smartphones with its edge-to-edge 5.8” Super Retina display, powerful A11 Bionic chip, and Face ID facial recognition technology. Its sleek glass body, dual 12MP cameras, and wireless charging make it a top choice for premium performance and timeless style.',
        brand: brands[2],
        images: [UImages.productImage4b, UImages.productImage4c, UImages.productImage4d, UImages.productImage4e],
        sku: 'ABR4568',
        categoryId: '19',
        productAttributes: [
          ProductAttributeModel(name: 'Storage', values: ['64GB', '128GB', '256GB']),
          ProductAttributeModel(name: 'Color', values: ['Black', 'Silver'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 5,
              price: 250,
              image: UImages.productImage4b,
              description: 'This is product description for 64GB Black',
              attributeValues: {'Storage': '64GB', 'Color': 'Black'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 290,
              image: UImages.productImage4c,
              attributeValues: {'Color': 'Black', 'Storage': '128GB'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 350,
              image: UImages.productImage4a,
              attributeValues: {'Color': 'Black', 'Storage': '256GB'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 250,
              image: UImages.productImage4d,
              attributeValues: {'Color': 'Silver', 'Storage': '64GB'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 290,
              image: UImages.productImage4e,
              attributeValues: {'Color': 'Silver', 'Storage': '128GB'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 350,
              image: UImages.productImage4e,
              attributeValues: {'Color': 'Silver', 'Storage': '256GB'}),
        ],
        productType: 'ProductType.variable'),

    // 005
    ProductModel(
        id: '5',
        title: 'Floral Affair Perfume – 100ml Romantic, Elegant & Timeless',
        stock: 15,
        price: 60,
        isFeatured: false,
        thumbnail: UImages.productImage5,
        description:
            'Floral Affair captures the essence of blooming cherry blossoms with a soft, feminine fragrance that lingers beautifully. Ideal for daily wear or special evenings, it’s a delicate blend of floral notes that leaves a lasting impression.',
        brand: brands[9],
        salePrice: 58.99,
        sku: 'ABR4568',
        categoryId: '15',
        productType: 'ProductType.single'),

    // 006
    ProductModel(
        id: '6',
        title: 'J. Pour Femme Long Lasting Perfume 100ml',
        stock: 0,
        price: 50,
        thumbnail: UImages.productImage6,
        description:
            'J. Pour Femme is a sophisticated fragrance designed for the modern woman. With a graceful blend of floral and musky notes, it delivers a soft yet long-lasting scent perfect for everyday elegance or special occasions.',
        brand: brands[9],
        salePrice: 48.99,
        sku: 'ABR4568',
        categoryId: '15',
        productType: 'ProductType.single'),

    // 007
    ProductModel(
      id: '7',
      title: 'Smoky Vanillin – Romantic Perfume 150ml',
      stock: 10,
      price: 70,
      isFeatured: true,
      thumbnail: UImages.productImage7,
      //16/512
      description:
          "Smoky Vanillin is an intense and captivating fragrance that blends rich vanilla with deep smoky undertones. Designed for those who love bold and lasting scents, this perfume brings a touch of luxury and mystery to your signature style.",
      brand: brands[9],
      salePrice: 64.99,
      sku: 'SKU-PERFUME',
      categoryId: '15',
      productType: 'ProductType.single',
    ),

    // 008
    ProductModel(
      id: '8',
      title: 'Bloom Pour Femme – Long Lasting Perfume 200ml',
      stock: 50,
      price: 55.99,
      thumbnail: UImages.productImage8,
      description:
          'Bloom Pour Femme is a delightful fragrance that captures the beauty of blossoming flowers in every spray. With soft floral notes and a refreshing finish, this perfume is perfect for daily wear and adds a gentle, graceful touch to your presence.',
      salePrice: 49.99,
      brand: brands[9],
      sku: 'SKU-PERFUME',
      categoryId: '15',
      productType: 'ProductType.single',
    ),

    // 009
    ProductModel(
      id: '9',
      title: 'Warm Striped Socks – Red and Cream Colo',
      stock: 30,
      salePrice: 7.99,
      price: 8.99,
      thumbnail: UImages.productImage9,
      description:
          "Add a pop of color to your step with these soft, cozy striped socks in a vibrant red and cream design. Perfect for daily wear, lounging, or gifting – these socks offer warmth and comfort without compromising on style.",
      brand: brands[10],
      sku: 'NDURE_SOCKS',
      categoryId: '9',
      productType: 'ProductType.single',
    ),

    // 010
    ProductModel(
        id: '10',
        title: 'Urban Edge High-Top Sneakers – Blue Edition',
        brand: brands[3],
        thumbnail: UImages.productImage10,
        description:
            "Step up your street style with these trendy blue high-top sneakers. Designed with breathable mesh panels, cushioned ankle support, and durable laces, they offer a perfect mix of comfort and edge — ideal for casual outings or everyday wear.",
        price: 59.99,
        stock: 10,
        categoryId: '11',
        sku: 'BATA-SHOES',
        productAttributes: [
          ProductAttributeModel(name: 'Size', values: ['40', '41', '42'])
        ],
        productType: 'ProductType.variable',
        productVariations: [
          ProductVariationModel(
              id: '1',
              description: 'This is description of Blue 40 Size Shoes',
              price: 59.99,
              stock: 10,
              image: UImages.productImage10,
              attributeValues: {'Size': '40'}),
          ProductVariationModel(
              id: '2',
              description: 'This is description of Blue 41 Size Shoes',
              price: 59.99,
              stock: 10,
              image: UImages.productImage10,
              attributeValues: {'Size': '41'}),
          ProductVariationModel(
              id: '3',
              description: 'This is description of Blue 42 Size Shoes',
              price: 59.99,
              stock: 10,
              image: UImages.productImage10,
              attributeValues: {'Size': '42'}),
        ]),

    // 011
    ProductModel(
      id: '11',
      title: 'Bata Ankle Socks – Black & White (Unisex)',
      stock: 200,
      price: 4,
      description:
          "These classic ankle-length Bata socks combine a sleek black base with a white cuff and a snug fit for all-day comfort. Perfect for daily wear, sports, or casual outings, they offer a breathable and stretchable design with premium-quality fabric.",
      thumbnail: UImages.productImage11,
      sku: 'BATA-SOCKS',
      categoryId: '9',
      isFeatured: true,
      brand: brands[3],
      productType: 'ProductType.single',
    ),

    // 012
    ProductModel(
        id: '12',
        title: 'Bata Formal Socks – Black with Grey Stripes,  Classic, Breathable & Office-Ready',
        stock: 10,
        price: 4.99,
        thumbnail: UImages.productImage12,
        description:
            "Designed for everyday elegance, these black formal socks from Bata feature subtle grey stripes and a comfortable stretch fit. Ideal for workwear or formal occasions, they provide a smooth finish, reinforced toe, and breathable fabric for all-day wear.",
        sku: "BATA-SOCKS",
        brand: brands[3],
        categoryId: '9',
        productType: 'ProductType.single'),

    // 013
    ProductModel(
        id: '13',
        title: 'Chic Mini Handbag – Electric Blue',
        price: 39.99,
        stock: 23,
        thumbnail: UImages.productImage13,
        description:
            "Turn heads with this vibrant electric blue mini handbag, designed for fashion-forward women on the go. Featuring a sleek structure, sturdy handles, and a polished zipper finish, it’s perfect for essentials like your phone, wallet, and keys — ideal for both day and",
        sku: 'J.-BAGS',
        brand: brands[9],
        categoryId: '14',
        productType: 'ProductType.single'),

    // 014
    ProductModel(
        id: '14',
        title: 'Men’s Classic Black Loafers – Tassel Design',
        price: 99.99,
        stock: 3,
        salePrice: 87.99,
        thumbnail: UImages.productImage14,
        description:
            "Step into sophistication with these sleek black loafers featuring a polished finish and stylish tassel detail. Designed for formal events, office wear, or smart-casual outings, these shoes offer both comfort and class with every step.",
        sku: 'NDURE-FORMAL',
        brand: brands[10],
        categoryId: '10',
        productType: 'ProductType.single'),

    // 015
    ProductModel(
        id: '15',
        title: 'Men’s Athletic Running Shoes – Blue & Grey Lightweight. Breathable. Performance-Ready',
        price: 54.99,
        stock: 54,
        salePrice: 47.99,
        thumbnail: UImages.productImage15,
        description:
            "Hit the ground running with these sporty blue and grey athletic shoes. Built for comfort and grip, they feature a breathable mesh upper, cushioned sole, and durable traction — ideal for workouts, jogs, or everyday active wear.",
        sku: 'SPORTS-SHOES',
        brand: brands[10],
        categoryId: '11',
        productType: 'ProductType.single'),

    // 016
    ProductModel(
      id: '16',
      title: 'Breakout Men’s Hooded Winter Jacket – Khaki',
      price: 79.99,
      salePrice: 71.99,
      thumbnail: UImages.productImage16a,
      images: [UImages.productImage16b],
      stock: 153,
      description:
          "Stay cozy and stylish with this khaki hooded winter jacket from Breakout. Designed with a soft inner lining, full front zip, and buttoned flap pockets, it’s perfect for chilly days and casual outings. The ribbed cuffs and hem ensure a snug fit all day long.",
      sku: 'JACKET-BREAKOUT',
      categoryId: '8',
      brand: brands[5],
      productType: 'ProductType.single',
    ),

    // 017
    ProductModel(
      id: '17',
      title: 'Breakout Men’s Checkered Flannel Shirt – Blue & Black',
      price: 34.99,
      salePrice: 31.99,
      stock: 19,
      brand: brands[5],
      thumbnail: UImages.productImage17,
      description:
          "Elevate your everyday look with this stylish blue and black checkered flannel shirt from Breakout. Crafted from soft, breathable fabric, it features twin front pockets, button-down design, and a classic fit — perfect for layering or wearing on its own.",
      sku: "SHORT-BREAKOUT",
      productType: 'ProductType.single',
      categoryId: '7',
    ),

    // 018
    ProductModel(
        id: '18',
        title: 'Breakout Men’s Relaxed Fit Shirt – Light Grey (Short Sleeve)',
        price: 29.99,
        salePrice: 23.99,
        thumbnail: UImages.productImage18,
        stock: 12,
        brand: brands[5],
        categoryId: '7',
        description:
            "Keep it cool and casual with this light grey relaxed fit shirt from Breakout. Featuring short sleeves, a soft collar, and breathable fabric, it’s perfect for summer days, beach outings, or layering over a tee. A wardrobe staple with effortless style.",
        sku: "SHORT-WHITE-BREAKOUT",
        productType: 'ProductType.single'),

    // 019
    ProductModel(
      id: '19',
      title: 'Men’s Classic Slip-On Dress Shoes – Tan Brown',
      price: 59.99,
      salePrice: 49.99,
      thumbnail: UImages.productImage19a,
      images: [UImages.productImage19b],
      stock: 12,
      brand: brands[10],
      categoryId: '10',
      description:
          "Add timeless charm to your formal look with these sleek tan brown slip-on dress shoes. Featuring a smooth leather finish, cushioned insole, and durable sole, they’re perfect for the office, business events, or formal occasions.",
      sku: "FORMAL-BROWN-NDURE",
      productType: 'ProductType.single',
    ),

    // 020
    ProductModel(
      id: '20',
      title: 'Men’s Casual Lace-Up Sneakers – Coffee Brown',
      thumbnail: UImages.productImage20,
      price: 44.99,
      salePrice: 39.99,
      stock: 43,
      brand: brands[3],
      categoryId: '11',
      description:
          "hese coffee brown lace-up sneakers are the perfect mix of casual and cool. With a smooth finish, contrasting navy laces, and cushioned sole, they’re designed for daily wear, from weekend hangouts to casual office days.",
      sku: "COFFEE-BROWN-BATA",
      productType: 'ProductType.single',
    ),

    // 021
    ProductModel(
        id: '21',
        title: 'Casual Winter Outfit Set – Olive Sweater, Blue Jeans & Grey Sneakers',
        thumbnail: UImages.productImage21,
        price: 89.99,
        salePrice: 78.87,
        categoryId: '7',
        brand: brands[1],
        stock: 23,
        description:
            "This cozy winter-ready combo features a chunky olive green knit sweater, classic blue denim jeans, and a pair of trendy grey sneakers with tan laces. Whether you’re heading out for a casual day or a weekend hangout, this outfit offers both comfort and effortless style.",
        sku: 'ADIDAS-COMBO',
        productType: 'ProductType.single'),

    // 022
    ProductModel(
        id: '22',
        title: 'Ultra-Slim Silver Laptop – 13.3” Display, Backlit Keyboard',
        price: 999.99,
        salePrice: 969.99,
        stock: 2,
        thumbnail: UImages.productImage22,
        brand: brands[8],
        categoryId: '18',
        productType: 'ProductType.variable',
        description:
            'This ultra-slim silver laptop combines performance and elegance with a 13.3” full HD display, sleek aluminum body, and smooth backlit keyboard. Ideal for professionals, students, and creatives, it’s lightweight and perfect for productivity on the go.',
        sku: "LAPTOP-HP",
        productAttributes: [
          ProductAttributeModel(name: 'Storage', values: ['512GB', '1TB'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributeValues: {'Storage': '512GB'},
              stock: 23,
              description: 'This is description of 512GB',
              sku: 'SKU-HP',
              price: 899.99,
              salePrice: 869.99,
              image: UImages.productImage22),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Storage': '1TB'},
              stock: 23,
              description: 'This is description of 1TB',
              sku: 'SKU-HP',
              price: 999.99,
              salePrice: 969.99,
              image: UImages.productImage22)
        ]),

    // 023
    ProductModel(
        id: '23',
        title: 'Sleek Silver Laptop – 15.6” Full HD Display',
        price: 1099,
        salePrice: 999.99,
        thumbnail: UImages.productImage23,
        description:
            "Featuring a large 15.6” display with ultra-thin bezels, this sleek silver laptop is perfect for work, streaming, and multitasking. The spacious keyboard and lightweight body make it ideal for professionals, students, and remote workers alike.",
        sku: "HP-LAPTOP",
        stock: 2,
        categoryId: '18',
        brand: brands[8],
        productType: 'ProductType.single'),

    // 024
    ProductModel(
      id: '24',
      title: 'Elegant Tassel Handbag – Berry Pink',
      thumbnail: UImages.productImage24,
      price: 59.99,
      salePrice: 48.99,
      stock: 43,
      brand: brands[9],
      description:
          "This berry pink handbag combines elegance with everyday functionality. Featuring dual top handles, a structured silhouette, and a statement gold-accented tassel, it’s perfect for elevating your outfit — whether at work, brunch, or a night out.",
      sku: 'BAGS-J.',
      categoryId: '14',
      productType: 'ProductType.single',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Red'])
      ],
    ),

    // 025
    ProductModel(
      id: '25',
      title: 'Kids’ Colorblock Hoodie – Pink, Peach & Sky Blue',
      price: 29.99,
      salePrice: 26.99,
      thumbnail: UImages.productImage25,
      stock: 23,
      brand: brands[5],
      description:
          "Brighten up your child’s wardrobe with this playful colorblock hoodie featuring vibrant shades of pink, peach, and sky blue. Made from ultra-soft fleece with a front pouch pocket and adjustable hood, it’s perfect for chilly days and everyday adventures.",
      sku: 'JACKET-Breakout',
      categoryId: '8',
      productType: 'ProductType.single',
    ),

    // 026
    ProductModel(
      id: '26',
      title: 'Premium Wooden Cricket Bat with Leather Ball – Full Size',
      price: 49.99,
      salePrice: 44.99,
      thumbnail: UImages.productImage26,
      stock: 23,
      brand: brands[7],
      description:
          "This high-quality cricket bat is crafted from durable seasoned wood, offering a strong grip, balanced weight, and excellent stroke power. Paired with a professional-grade leather cricket ball, it’s the perfect combo for practice sessions or street matches.",
      sku: 'CRICKET-BALL-BAT',
      categoryId: '22',
      productType: 'ProductType.single',
    ),

    // 027
    ProductModel(
        id: '27',
        title: 'Dari Mooch Beard Growth Shampoo – Caffeinated Formula (100ml)',
        price: 12.99,
        thumbnail: UImages.productImage27,
        brand: brands[6],
        description:
            'Boost your beard game with Dari Mooch’s caffeinated Beard Growth Shampoo. Infused with natural ingredients and caffeine, this powerful formula stimulates hair follicles, strengthens roots, and promotes healthier, fuller beard growth — all while keeping your beard clean and refreshed.',
        stock: 10,
        categoryId: '27',
        productType: 'ProductType.single',
        sku: 'DARIMOOCH-OIL'),

    // 028
    ProductModel(
        id: '28',
        title: 'Dari Mooch Charcoal Face Wash – Deep Cleansing (120ml)',
        thumbnail: UImages.productImage28,
        stock: 3,
        price: 8.99,
        salePrice: 7.76,
        description:
            'Dari Mooch Charcoal Face Wash is designed to deeply cleanse your skin by removing dirt, excess oil, and impurities. Infused with activated charcoal, it helps control pimples and leaves your face feeling fresh and energized — perfect for daily men’s skincare.',
        brand: brands[6],
        categoryId: '12',
        productType: 'ProductType.single',
        sku: "DARIMOOCH-FACEWASH"),

    // 029
    ProductModel(
      id: '29',
      title: 'Dari Mooch Hair Wax – Medium Hold with High Shine (50g)',
      thumbnail: UImages.productImage29,
      stock: 3,
      price: 9.99,
      salePrice: 7.56,
      description:
          'Achieve your desired hairstyle with Dari Mooch’s Medium Hold Hair Wax. Its non-greasy formula gives you control, texture, and a glossy finish — perfect for everyday styling with a natural touch. Ideal for short to medium-length hair.',
      brand: brands[6],
      categoryId: '13',
      productType: 'ProductType.single',
      sku: "DARIMOOCH-HAIRWAX",
    ),

    // 030
    ProductModel(
        id: '30',
        title: 'Dari Mooch Beard Growth Kit – Oil, Shampoo & Biotin Spray (3-in-1 Set)',
        thumbnail: UImages.productImage30,
        stock: 3,
        price: 29.99,
        salePrice: 27.99,
        description: 'Unlock your beard’s full potential with the Dari Mooch Beard Growth Supplement Kit.',
        brand: brands[6],
        categoryId: '13',
        productType: 'ProductType.single',
        sku: "BEARDOIL-KIT-DARIMOOCH"),

    // 031
    ProductModel(
      id: '31',
      title: 'RGB Wireless Gaming Headphones – Deep Bass & LED Glow',
      thumbnail: UImages.productImage31,
      price: 69.99,
      salePrice: 52.99,
      stock: 2,
      description:
          'tep into your game with these futuristic RGB wireless headphones. Featuring high-fidelity stereo sound, deep bass, noise isolation, and dynamic LED lighting on the earcups, they’re built for gamers, streamers, and music lovers alike. Soft cushioned ear pads and an adjustable headband ensure all-day comfort.',
      brand: brands[4],
      productType: 'ProductType.single',
      sku: "RGB-HEADPHONES-BLOODY",
      categoryId: '17',
    ),

    // 032
    ProductModel(
        id: '32',
        title: 'Apple iPhone 11 – 64GB/128GB (Matte Green)',
        thumbnail: UImages.productImage32,
        price: 499.99,
        salePrice: 475.99,
        stock: 3,
        productType: 'ProductType.variable',
        brand: brands[2],
        categoryId: '19',
        description:
            'The iPhone 11 delivers the perfect balance of performance, style, and innovation. Featuring a stunning 6.1” Liquid Retina HD display, powerful A13 Bionic chip, and dual 12MP ultra wide + wide cameras, it’s built for everything—from photography and gaming to everyday tasks. With long battery life and a sleek matte green finish, it’s as beautiful as it is fast.',
        sku: "iPHONE-11",
        productAttributes: [
          ProductAttributeModel(name: 'Storage', values: ['64GB', '128GB', '512GB'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributeValues: {'Storage': '64GB'},
              image: UImages.productImage32,
              stock: 3,
              price: 499.99,
              salePrice: 475.99,
              description: 'This is description of 64GB'),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Storage': '128GB'},
              image: UImages.productImage32,
              stock: 3,
              price: 566.99,
              salePrice: 499.99,
              description: 'This is description of 128GB'),
          ProductVariationModel(
              id: '3',
              attributeValues: {'Storage': '512GB'},
              image: UImages.productImage32,
              stock: 3,
              price: 699.99,
              salePrice: 599.99,
              description: 'This is description of 512GB')
        ]),

    // 033
    ProductModel(
        id: '33',
        title: 'Apple iPhone 12 – 64GB/128GB/256GB (Multiple Colors)',
        price: 849,
        thumbnail: UImages.productImage33a,
        images: [UImages.productImage33b, UImages.productImage33c, UImages.productImage33d],
        description:
            'iPhone 12 brings a powerful blend of speed, style, and innovation. Equipped with a 6.1” Super Retina XDR display and the blazing-fast A14 Bionic chip, this device delivers next-level performance. The dual 12MP camera system captures stunning photos and 4K videos, while Ceramic Shield ensures better durability. Choose from a bold range of colors to match your vibe.',
        brand: brands[2],
        stock: 3,
        productType: 'ProductType.variable',
        categoryId: '19',
        sku: "iPHONE-12",
        productAttributes: [
          ProductAttributeModel(name: 'Storage', values: ['64GB', '128GB', '512GB']),
          ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red', 'Black'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributeValues: {'Storage': '64GB', 'Color': 'Green'},
              image: UImages.productImage33b,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 64GB Green'),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Storage': '64GB', 'Color': 'Blue'},
              image: UImages.productImage33c,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 64GB Blue'),
          ProductVariationModel(
              id: '3',
              attributeValues: {'Storage': '64GB', 'Color': 'Red'},
              image: UImages.productImage33d,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 64GB Red'),
          ProductVariationModel(
              id: '4',
              attributeValues: {'Storage': '64GB', 'Color': 'Black'},
              image: UImages.productImage33a,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 64GB Black'),
          ProductVariationModel(
              id: '5',
              attributeValues: {'Storage': '128GB', 'Color': 'Green'},
              image: UImages.productImage33b,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 128GB Green'),
          ProductVariationModel(
            id: '6',
            attributeValues: {'Storage': '128GB', 'Color': 'Blue'},
            image: UImages.productImage33c,
            stock: 3,
            price: 849,
            salePrice: 799,
            description: 'This is description of 128GB Blue',
          ),
          ProductVariationModel(
              id: '7',
              attributeValues: {'Storage': '128GB', 'Color': 'Red'},
              image: UImages.productImage33d,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 128GB Red'),
          ProductVariationModel(
              id: '8',
              attributeValues: {'Storage': '128GB', 'Color': 'Black'},
              image: UImages.productImage33a,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 128GB Black'),
          ProductVariationModel(
              id: '9',
              attributeValues: {'Storage': '256GB', 'Color': 'Green'},
              image: UImages.productImage33b,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 256GB Green'),
          ProductVariationModel(
              id: '10',
              attributeValues: {'Storage': '256GB', 'Color': 'Blue'},
              image: UImages.productImage33c,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 256GB Blue'),
          ProductVariationModel(
            id: '11',
            attributeValues: {'Storage': '256GB', 'Color': 'Red'},
            image: UImages.productImage33d,
            stock: 3,
            price: 849,
            salePrice: 799,
            description: 'This is description of 256GB Red',
          ),
          ProductVariationModel(
              id: '12',
              attributeValues: {'Storage': '256GB', 'Color': 'Black'},
              image: UImages.productImage33a,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 256GB Black'),
          ProductVariationModel(
              id: '13',
              attributeValues: {'Storage': '512GB', 'Color': 'Green'},
              image: UImages.productImage33b,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 512GB Green'),
          ProductVariationModel(
              id: '14',
              attributeValues: {'Storage': '512GB', 'Color': 'Blue'},
              image: UImages.productImage33c,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 512GB Blue'),
          ProductVariationModel(
              id: '15',
              attributeValues: {'Storage': '512GB', 'Color': 'Red'},
              image: UImages.productImage33d,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 512GB Red'),
          ProductVariationModel(
              id: '16',
              attributeValues: {'Storage': '512GB', 'Color': 'Black'},
              image: UImages.productImage33a,
              stock: 3,
              price: 849,
              salePrice: 799,
              description: 'This is description of 512GB Black'),
        ]),

    // 034
    ProductModel(
      id: '34',
      title: 'Apple iPhone 13 Pro – Sierra Blue 1TB Only',
      thumbnail: UImages.productImage34,
      price: 1399.99,
      salePrice: 1268.99,
      stock: 76,
      description:
          'Experience the power of pro with the iPhone 13 Pro. Featuring a stunning 6.1” Super Retina XDR display with ProMotion for ultra-smooth visuals, it’s powered by the A15 Bionic chip for blazing-fast performance. The advanced triple 12MP Pro camera system brings cinematic mode, macro photography, and night mode to life — making it the ultimate choice for creators and pros alike.',
      brand: brands[2],
      sku: 'iPHONE-13PRO',
      categoryId: '19',
      productType: 'ProductType.single',
    ),

    // 035
    ProductModel(
      id: '35',
      title: 'Apple iPhone 14 Pro – Space Black 1TB',
      price: 1599,
      thumbnail: UImages.productImage35,
      salePrice: 1497.99,
      stock: 29,
      description:
          'The iPhone 14 Pro redefines what a smartphone can do. With the all-new Dynamic Island, a 48MP main camera, and the powerful A16 Bionic chip, it’s built for users who demand excellence. Enjoy cinematic 4K video, a super bright 6.1” ProMotion display, and industry-leading safety features like Crash Detection and Emergency SOS via satellite — all in a bold Space Black finish.',
      brand: brands[2],
      productType: 'ProductType.single',
      categoryId: '19',
      sku: 'iPHONE-14PRO',
    ),

    // 036
    ProductModel(
        id: '36',
        title: 'J. LA PROTECTION – Daily Hydrating, Brightening & Sun Protection Cream',
        price: 14.99,
        thumbnail: UImages.productImage36,
        stock: 3,
        productType: 'ProductType.single',
        sku: "SUN-PROTECTION-J-LA",
        categoryId: '12',
        brand: brands[9],
        description:
            "J. LA PROTECTION is your all-in-one solution for everyday skincare. This luxurious cream hydrates your skin, brightens your complexion, and provides essential sun protection — all in a smooth, non-greasy formula. Perfect for daily use, it keeps your skin fresh, protected, and radiant all day long."),

    // 037
    ProductModel(
      id: '37',
      title: 'Neon Blaze Mechanical Keyboard – Compact 60% RGB Hot-Swappable',
      productType: 'ProductType.single',
      stock: 12,
      price: 109.99,
      description:
          'The Neon Blaze mechanical keyboard combines performance and personality with its striking color scheme and compact 60% layout. Designed for gamers, coders, and creative professionals, it features hot-swappable keys, smooth tactile switches, and dynamic RGB backlighting. The transparent casing adds a futuristic edge to your desk setup.',
      thumbnail: UImages.productImage37,
      brand: brands[4],
      categoryId: '17',
      sku: "KEYBOARD-BLOODY",
    ),

    // 038
    ProductModel(
        id: '38',
        title: 'Space Gray TouchBar Laptop – 13” Retina Display',
        price: 1299,
        salePrice: 1133.99,
        stock: 34,
        thumbnail: UImages.productImage38a,
        images: [UImages.productImage38b, UImages.productImage38c],
        productType: 'ProductType.variable',
        categoryId: '18',
        sku: "LAPTOP-HP",
        brand: brands[8],
        description:
            'Elevate your workflow with this elegant space gray TouchBar laptop. Featuring a responsive TouchBar, retina-quality display, and a backlit keyboard, it’s ideal for creatives, developers, and professionals. The slim design paired with top-tier performance makes it a premium choice for multitasking on the go.',
        productAttributes: [
          ProductAttributeModel(name: 'Storage', values: ['512GB', '1TB'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributeValues: {'Storage': '512GB'},
              stock: 23,
              description: 'This is description of 512GB',
              sku: 'SKU-HP',
              price: 899.99,
              salePrice: 869.99,
              image: UImages.productImage38b),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Storage': '1TB'},
              stock: 23,
              description: 'This is description of 1TB',
              sku: 'SKU-HP',
              price: 999.99,
              salePrice: 969.99,
              image: UImages.productImage38c)
        ]),

    // 039
    ProductModel(
        id: '39',
        title: 'Matte Black UltraBook – 15.6” Full HD Display',
        price: 999,
        salePrice: 899,
        stock: 2,
        thumbnail: UImages.productImage39,
        productType: 'ProductType.variable',
        categoryId: '18',
        sku: "LAPTOP-HP",
        brand: brands[8],
        description:
            'Engineered for elegance and efficiency, this matte black UltraBook delivers premium performance in a sleek, minimalist design. With its edge-to-edge 15.6” Full HD display, whisper-quiet keyboard, and slim form factor, it’s perfect for professionals, students, and power users on the go.',
        productAttributes: [
          ProductAttributeModel(name: 'Storage', values: ['512GB', '1TB'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributeValues: {'Storage': '512GB'},
              stock: 23,
              description: 'This is description of 512GB',
              sku: 'SKU-HP',
              price: 899.99,
              salePrice: 869.99,
              image: UImages.productImage22),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Storage': '1TB'},
              stock: 23,
              description: 'This is description of 1TB',
              sku: 'SKU-HP',
              price: 999.99,
              salePrice: 969.99,
              image: UImages.productImage22)
        ]),
    // 040
    ProductModel(
        id: '40',
        title: 'VortexEdge 27” Gaming Monitor – 165Hz QHD Display',
        thumbnail: UImages.productImage40,
        productType: 'ProductType.single',
        stock: 2,
        price: 399.99,
        salePrice: 375.99,
        brand: brands[4],
        description:
            'Dive into stunning visuals and lightning-fast gameplay with the VortexEdge 27” Gaming Monitor. Featuring a frameless QHD display with a blazing 165Hz refresh rate, 1ms response time, and adaptive sync technology, it’s built for serious gamers who demand precision, speed, and visual clarity.',
        sku: "MONITOR-LCD-BLOODY",
        categoryId: '17'),

    // 041
    ProductModel(
      id: '41',
      title: 'BlushView 24” Designer Monitor – Soft Pink Edition',
      price: 179.99,
      salePrice: 144.99,
      stock: 22,
      thumbnail: UImages.productImage41,
      description:
          "Bring elegance and creativity to your workspace with the BlushView 24” Designer Monitor. This pastel pink display combines modern design with everyday performance. With a crisp full HD screen and anti-glare coating, it’s perfect for designers, students, and anyone who loves an aesthetically pleasing setup.",
      productType: 'ProductType.single',
      categoryId: '17',
      isFeatured: false,
      sku: "MONITOR-BLUE-BLOODY",
      brand: brands[4],
    ),

    // 042
    ProductModel(
      id: '42',
      title: 'AquaLite 24” Ultra-Slim Monitor – Ocean Blue Frame',
      price: 179.99,
      thumbnail: UImages.productImage42,
      stock: 23,
      brand: brands[4],
      description:
          "The AquaLite 24” Ultra-Slim Monitor blends soothing aesthetics with everyday performance. Designed for creators, remote workers, and minimalists, its ocean-inspired frame and Full HD display offer an immersive visual experience while complementing any modern workspace.",
      sku: "MONITOR-LCD-BLOODY-BLUE",
      productType: 'ProductType.single',
      categoryId: '17',
    ),

    // 043
    ProductModel(
        id: '43',
        title: 'ShadowCore 27” Curved Gaming Monitor – 240Hz UltraFast Display',
        thumbnail: UImages.productImage43,
        stock: 21,
        price: 479.99,
        salePrice: 452.99,
        productType: 'ProductType.single',
        categoryId: '17',
        isFeatured: false,
        brand: brands[4],
        sku: "MONITOR-GAMING-BLOODY",
        description:
            "The ShadowCore 27” Gaming Monitor is crafted for elite gamers who demand precision and immersion. Featuring a breathtaking curved 240Hz display, ultra-low 1ms response time, and G-SYNC/FreeSync compatibility, every frame is fluid, fast, and flawless. Its aggressive stand design adds a commanding presence to your battle station."),

    // 044
    ProductModel(
        id: '44',
        title: 'StrikeBlade X7 – Ergonomic Wireless Gaming Mouse (Blue Edition)',
        thumbnail: UImages.productImage44,
        stock: 21,
        price: 49.99,
        productType: 'ProductType.single',
        categoryId: '17',
        isFeatured: false,
        brand: brands[4],
        sku: "MOUSE-BLOODY",
        description:
            "The StrikeBlade X7 delivers responsive, lag-free performance with bold aesthetics. Its ergonomic grip ensures comfort during long sessions, while high-DPI tracking and customizable buttons make it perfect for gamers, designers, and power users. The vibrant blue & gray color combo adds futuristic flair to your setup."),

    // 045
    ProductModel(
        id: '45',
        title: 'North Star Classic Backpack – Red & Black Edition',
        thumbnail: UImages.productImage45a,
        images: [UImages.productImage45b],
        stock: 21,
        price: 29.99,
        salePrice: 28.99,
        productType: 'ProductType.variable',
        categoryId: '14',
        brand: brands[11],
        sku: "NORTHSTAR_BAG",
        description:
            "Step out in style with the North Star Classic Backpack, featuring a striking red-and-black design and practical layout for everyday use. Whether you’re heading to school, work, or a weekend trip, this durable backpack keeps your essentials organized and secure.",
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Red', 'Green'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributeValues: {'Color': 'Red'},
              stock: 23,
              description: 'This is description of Red',
              sku: 'SKU-NORTHSTAR',
              price: 29.99,
              salePrice: 28.99,
              image: UImages.productImage45a),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Color': 'Green'},
              stock: 23,
              description: 'This is description of Green',
              sku: 'SKU-NORTHSTAR',
              price: 29.99,
              salePrice: 28.99,
              image: UImages.productImage45b),
        ]),

    // 046
    ProductModel(
      id: '46',
      title: 'North Star UrbanTech Backpack – Grey Edition',
      thumbnail: UImages.productImage46,
      stock: 21,
      price: 39.99,
      salePrice: 37.99,
      productType: 'ProductType.single',
      categoryId: '14',
      brand: brands[11],
      sku: "NORTHSTAR_BAG",
      description:
          "The North Star UrbanTech Backpack combines sleek aesthetics with practical performance. Designed for students, professionals, and travelers, this modern grey backpack features a clean look with thoughtful storage, making it ideal for commuting, tech gear, or daily essentials.",
    ),

    // 047
    ProductModel(
      id: '47',
      title: 'BlushSprint Women’s Sneakers – Pink Gold Lace Edition',
      thumbnail: UImages.productImage47,
      stock: 21,
      price: 39.99,
      productType: 'ProductType.single',
      categoryId: '11',
      brand: brands[0],
      sku: "NIKE-SPORTS-SHOES",
      description:
          "Step into effortless fashion with the BlushSprint Women’s Sneakers, featuring a vibrant pink body, striking gold lace eyelets, and soft white laces. These casual yet stylish shoes are perfect for pairing with jeans, skirts, or athleisure wear—ideal for everything from brunch to weekend strolls.",
    ),

    // 048
    ProductModel(
      id: '48',
      title: 'BlushMode Luxe Handbag – Rosé Gold Accent Edition',
      thumbnail: UImages.productImage48,
      stock: 21,
      price: 59.99,
      salePrice: 52.99,
      productType: 'ProductType.single',
      categoryId: '14',
      brand: brands[9],
      sku: "J.-BAG",
      description:
          "Add timeless charm to your collection with the BlushMode Luxe Handbag. Crafted with premium faux leather in a soft blush tone, this structured bag features a stylish gold-lock clasp and a stunning marble-textured tag charm. It’s the perfect fusion of sophistication and practicality for everyday or occasional wear.",
    ),

    // 049
    ProductModel(
        id: '49',
        title: '“S” Varsity Bomber Jacket – Red & White Edition',
        thumbnail: UImages.productImage49a,
        images: [UImages.productImage49b],
        stock: 21,
        price: 89.99,
        salePrice: 84.99,
        productType: 'ProductType.variable',
        categoryId: '8',
        brand: brands[5],
        sku: "BREAKOUT-JACKET-RED",
        description:
            "Make a statement with this retro-inspired Varsity Bomber Jacket, featuring a bold red body, contrasting white leather-look sleeves, and a stitched S emblem on the chest. Whether you’re channeling school spirit or street-style cool, this jacket brings timeless edge and warmth in one fresh fit.",
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Blue', 'Red'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributeValues: {'Color': 'Blue'},
              stock: 23,
              description: 'This is description of Blue',
              sku: 'SKU-BREAKOUT',
              price: 89.99,
              salePrice: 84.99,
              image: UImages.productImage49a),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Color': 'Red'},
              stock: 23,
              description: 'This is description of Red',
              sku: 'SKU-BREAKOUT',
              price: 89.99,
              salePrice: 84.99,
              image: UImages.productImage49b),
        ]),

    // 050
    ProductModel(
      id: '50',
      title: 'SunGlow Modern Tufted Sofa – Mustard Yellow Velvet',
      thumbnail: UImages.productImage50,
      stock: 21,
      price: 499.99,
      salePrice: 456.99,
      productType: 'ProductType.single',
      categoryId: '20',
      brand: brands[7],
      sku: "INTERWOOD-SOFA",
      description:
          "Brighten your living space with the SunGlow Modern Tufted Sofa, featuring a bold mustard yellow velvet finish and sleek mid-century silhouette. Designed with deep cushions, wooden tapered legs, and a tufted backrest, it’s the perfect blend of retro charm and modern luxury.",
    ),

    // 051
    ProductModel(
      id: '51',
      title: 'Velvet Luxe Channel-Tufted Sofa – Teal Elegance',
      thumbnail: UImages.productImage51,
      stock: 21,
      price: 599.99,
      salePrice: 576.99,
      productType: 'ProductType.single',
      categoryId: '20',
      brand: brands[7],
      sku: "INTERWOOD-SOFA",
      description:
          "Transform your space with the Velvet Luxe Teal Sofa, boasting rich velvet upholstery and vertical channel tufting for a truly upscale look. With its curved silhouette, plush cushions, and sleek gold-tipped legs, it brings a pop of luxury and modern flair to any room.",
    ),

    // 052
    ProductModel(
      id: '52',
      title: 'SmartFit Pro – Sleek Black Fitness Smartwatch',
      thumbnail: UImages.productImage52,
      stock: 21,
      price: 89.99,
      salePrice: 75.99,
      productType: 'ProductType.single',
      categoryId: '16',
      brand: brands[2],
      sku: "APPLE-WATCH",
      description:
          "Stay connected and track your wellness goals in style with the SmartFit Pro. Featuring a minimalist black silicone strap and a bold, edge-to-edge display, this smartwatch is designed for both everyday wear and active lifestyles. Whether you’re on a run or in a meeting, its versatile look and functionality make it your perfect companion.",
    ),

    // 053
    ProductModel(
      id: '53',
      title: 'Apple Watch Series – Pink Edition',
      thumbnail: UImages.productImage53,
      stock: 21,
      price: 399.99,
      salePrice: 376.99,
      productType: 'ProductType.single',
      categoryId: '16',
      brand: brands[2],
      sku: "APPLE-WATCH",
      description:
          "The Apple Watch Pink Edition is where sophistication and technology unite. With its beautiful blush-toned silicone band and a sleek aluminum case, it’s designed for those who love to stay connected in style. Perfect for tracking health goals, receiving real-time notifications, and navigating your day with ease – all from your wrist.",
    ),

    // 054
    ProductModel(
      id: '54',
      title: '360° Ring Light with Adjustable Tripod Stand',
      thumbnail: UImages.productImage54,
      stock: 2,
      price: 60,
      productType: 'ProductType.single',
      categoryId: '17',
      brand: brands[4],
      sku: "BLOODY-TRIPOD",
      description:
          "Take your content creation to the next level with this LED Ring Light featuring a universal phone holder and a stable tripod stand. Whether you’re recording TikToks, going live on Instagram, joining a Zoom meeting, or taking selfies, this ring light ensures you always shine bright.",
    ),

    // 055
    ProductModel(
      id: '55',
      title: 'Apple Watch Series – White Sport Band Edition',
      thumbnail: UImages.productImage55,
      stock: 2,
      price: 299.99,
      salePrice: 275.99,
      productType: 'ProductType.single',
      categoryId: '16',
      brand: brands[2],
      sku: "APPLE-WATCH",
      description:
          "Stay connected, organized, and stylish with this premium Apple Watch featuring a clean white sport band. The sleek silver aluminum case houses a sharp Retina display with a classic analog watch face, combining traditional aesthetics with smart functionality.",
    ),

    // 056
    ProductModel(
      id: '56',
      title: 'Classic Gray Wool Blend Overcoat',
      thumbnail: UImages.productImage56,
      stock: 2,
      price: 180,
      salePrice: 177,
      productType: 'ProductType.single',
      categoryId: '8',
      brand: brands[5],
      sku: "BREAKOUT-COAT",
      description:
          "Step out in style with this timeless gray overcoat. Made with a premium wool-blend fabric, this coat is designed to keep you warm without compromising on sophistication. Its minimalist design, single-button closure, and structured shoulders make it perfect for both formal and smart-casual looks.",
    ),

    // 057
    ProductModel(
      id: '57',
      title: 'Minimalist White Hoodie – Streetwear Comfort Edition',
      thumbnail: UImages.productImage57,
      stock: 2,
      price: 49,
      productType: 'ProductType.single',
      categoryId: '8',
      brand: brands[5],
      sku: "BREAKOUT-COAT",
      description:
          "Embrace simplicity with a modern edge in this unisex white hoodie, designed for both comfort and style. With its clean aesthetic and relaxed fit, this hoodie is a staple for minimalist wardrobes, streetwear lovers, or anyone who appreciates cozy fashion with an urban twist.",
    ),

    // 058
    ProductModel(
      id: '58',
      title: 'Modern Wooden Bed with Upholstered Headboard',
      thumbnail: UImages.productImage58,
      stock: 2,
      price: 799.99,
      salePrice: 743.99,
      productType: 'ProductType.single',
      categoryId: '20',
      brand: brands[7],
      sku: "INTERWOOD-BED",
      description:
          "Redefine your bedroom space with this contemporary wooden bed, featuring a smooth, natural wood finish and a soft upholstered headboard for extra comfort. Perfect for a minimalist or modern decor theme, it offers a cozy and elegant centerpiece for any room.",
    ),

    // 059
    ProductModel(
      id: '59',
      title: 'Luxury Tufted Wingback Bed – Black Leather Finish',
      thumbnail: UImages.productImage59,
      stock: 2,
      price: 1299,
      salePrice: 743.99,
      productType: 'ProductType.single',
      categoryId: '20',
      brand: brands[7],
      sku: "INTERWOOD-BED",
      description:
          "Elevate your bedroom with this Luxurious Wingback Bed, wrapped in elegant black faux leather and detailed with deep button tufting. The curved high-back headboard adds drama and sophistication, while the plush cushioning ensures ultimate comfort and style.",
    ),

    // 060
    ProductModel(
      id: '60',
      title: 'Modern Upholstered Bed – Soft Taupe Linen with Plush Comfort',
      thumbnail: UImages.productImage60,
      stock: 2,
      price: 999,
      productType: 'ProductType.single',
      categoryId: '20',
      brand: brands[7],
      sku: "INTERWOOD-BED",
      description:
          "Indulge in the perfect blend of style and serenity with this Modern Upholstered Bed, featuring a clean-lined silhouette and wrapped in luxurious taupe linen fabric. The plush, layered bedding and multiple cushions create a relaxed yet refined aesthetic—ideal for minimalist, Scandinavian, or contemporary bedrooms.",
    ),

    // 061
    ProductModel(
      id: '61',
      title: 'Classic Ceramic Table Lamp – Ivory & Brass Finish with Fabric Shade',
      thumbnail: UImages.productImage61,
      stock: 2,
      price: 129,
      salePrice: 127,
      productType: 'ProductType.single',
      categoryId: '21',
      brand: brands[7],
      sku: "INTERWOOD-LAMP",
      description:
          "Bring timeless charm and soft ambiance to your home with this Classic Ceramic Table Lamp. Featuring a beautifully glazed ivory ceramic base accented with antique brass details, and topped with a linen-textured fabric shade, this piece is a perfect blend of elegance and function. Ideal for bedrooms, living rooms, or entryway consoles.",
    ),

    // 062
    ProductModel(
      id: '62',
      title: 'Classic Wooden Floor Lamp with Pleated Shade',
      thumbnail: UImages.productImage62,
      stock: 2,
      price: 259,
      productType: 'ProductType.single',
      categoryId: '21',
      brand: brands[7],
      sku: "INTERWOOD-LAMP",
      description:
          "Elevate your living space with this Classic Wooden Floor Lamp, featuring a beautifully carved solid wood base and a pleated fabric shade that emits a warm, inviting glow. Perfect for living rooms, bedrooms, or study areas, this lamp combines traditional craftsmanship with timeless elegance.",
    ),

    // 063
    ProductModel(
      id: '63',
      title: 'Velvet Dream Tufted Bed Frame – King Size',
      thumbnail: UImages.productImage63,
      stock: 2,
      price: 249,
      salePrice: 212,
      productType: 'ProductType.single',
      categoryId: '20',
      brand: brands[7],
      sku: "INTERWOOD-LAMP",
      description:
          "Experience luxury with our Velvet Dream Tufted Bed, designed with a tall, wingback headboard and deep button detailing. Upholstered in premium teal velvet, it brings both elegance and comfort to your bedroom. Comes with plush cushions and a sturdy wooden frame for ultimate support. Perfect for modern and chic interiors.",
    ),

    // 064
    ProductModel(
      id: '64',
      title: 'nfernoX Pro Gaming Chair – Ergonomic Racing Style',
      thumbnail: UImages.productImage64,
      stock: 2,
      price: 155,
      salePrice: 128,
      productType: 'ProductType.single',
      categoryId: '17',
      brand: brands[4],
      sku: "BLOODY-GAMING-CHAIR",
      description:
          "Level up your gaming with the InfernoX Pro – an ergonomic racing-style chair built for peak comfort and performance. Featuring a high backrest, adjustable armrests, lumbar and neck support, and PU leather finish in a sleek black & red combo. Ideal for gamers, streamers, and long work sessions.",
    ),

    // 065
    ProductModel(
      id: '65',
      title: 'Royal Elegance King Bed – Gold Edition',
      thumbnail: UImages.productImage65,
      stock: 2,
      price: 620,
      salePrice: 615,
      productType: 'ProductType.single',
      categoryId: '20',
      brand: brands[7],
      sku: "INTERWOOD-LAMP",
      description:
          "Experience the grandeur of royalty with the Royal Elegance King Bed. Featuring a hand-tufted golden velvet headboard with intricate carving and a sleek padded frame, this bed brings unmatched luxury and comfort to your bedroom. Ideal for master suites and high-end interiors.",
    ),

    // 066
    ProductModel(
      id: '66',
      title: 'Shadow Luxe Black Hoodie',
      thumbnail: UImages.productImage66,
      stock: 2,
      price: 15,
      productType: 'ProductType.single',
      categoryId: '8',
      brand: brands[5],
      sku: "BREAKOUT-JACKET",
      description:
          "Stay warm in style with the Shadow Luxe Black Hoodie – crafted from premium fleece and designed with a sleek matte finish. Its minimalist aesthetic and durable stitching make it perfect for both casual wear and outdoor adventures. Comes with a kangaroo pocket and adjustable hood for added comfort.",
    ),

    // 067
    ProductModel(
        id: '67',
        title: 'AquaCore Classic Polo',
        thumbnail: UImages.productImage67a,
        images: [UImages.productImage67b, UImages.productImage67c],
        stock: 2,
        price: 8,
        productType: 'ProductType.variable',
        categoryId: '7',
        brand: brands[12],
        sku: "POLO-SHIRT",
        description:
            "Add a splash of freshness to your wardrobe with the AquaCore Classic Polo. Made from breathable cotton, it features a sleek collar, button placket, and a perfect slim fit for all-day comfort. Ideal for both casual outings and semi-formal looks.",
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Blue', 'Dark Blue', 'Green']),
          ProductAttributeModel(name: 'Size', values: ['Medium', 'Large'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributeValues: {'Color': 'Blue', 'Size': 'Medium'},
              stock: 23,
              description: 'This is description of Blue',
              sku: 'SKU-BREAKOUT',
              price: 8,
              image: UImages.productImage67a),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Color': 'Blue', 'Size': 'Large'},
              stock: 23,
              description: 'This is description of Blue',
              sku: 'SKU-BREAKOUT',
              price: 8,
              image: UImages.productImage67b),
          ProductVariationModel(
              id: '3',
              attributeValues: {'Color': 'Dark Blue', 'Size': 'Medium'},
              stock: 23,
              description: 'This is description of Blue',
              sku: 'SKU-BREAKOUT',
              price: 8,
              image: UImages.productImage67c),
          ProductVariationModel(
              id: '4',
              attributeValues: {'Color': 'Dark Blue', 'Size': 'Large'},
              stock: 23,
              description: 'This is description of Blue',
              sku: 'SKU-BREAKOUT',
              price: 8,
              image: UImages.productImage67a),
          ProductVariationModel(
              id: '5',
              attributeValues: {'Color': 'Green', 'Size': 'Medium'},
              stock: 23,
              description: 'This is description of Blue',
              sku: 'SKU-BREAKOUT',
              price: 8,
              image: UImages.productImage67b),
          ProductVariationModel(
              id: '6',
              attributeValues: {'Color': 'Green', 'Size': 'Large'},
              stock: 23,
              description: 'This is description of Blue',
              sku: 'SKU-BREAKOUT',
              price: 8,
              image: UImages.productImage67a)
        ]),

    // 068
    ProductModel(
      id: '68',
      title: 'Blue Polo Jeans with White Shades (32 Waist Only)',
      thumbnail: UImages.productImage68,
      stock: 2,
      price: 27,
      productType: 'ProductType.single',
      categoryId: '9',
      brand: brands[12],
      sku: "POLO-JACKET",
      description: "Blue Polo Jeans with white Shades of one size only",
    ),
  ];
  //
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(categoryId: '1', brandId: '1'), // Clothes - Nike
    BrandCategoryModel(categoryId: '1', brandId: '2'), // Clothes - Adidas
    BrandCategoryModel(categoryId: '1', brandId: '6'), // Clothes - Breakout
    BrandCategoryModel(categoryId: '1', brandId: '13'), // Clothes - Polo

    BrandCategoryModel(categoryId: '2', brandId: '1'), // Shoes - Nike
    BrandCategoryModel(categoryId: '2', brandId: '11'), // Shoes - NDURE
    BrandCategoryModel(categoryId: '2', brandId: '4'), // Shoes - Bata
    BrandCategoryModel(categoryId: '2', brandId: '2'), // Shoes - Adidas

    BrandCategoryModel(categoryId: '3', brandId: '7'), // Cosmetics - Dari mooch
    BrandCategoryModel(categoryId: '3', brandId: '10'), // Cosmetics - j.
    BrandCategoryModel(categoryId: '3', brandId: '12'), // Cosmetics - North Star

    BrandCategoryModel(categoryId: '4', brandId: '3'), // Electronics - Apple
    BrandCategoryModel(categoryId: '4', brandId: '5'), // Electronics - Bloody
    BrandCategoryModel(categoryId: '4', brandId: '9'), // Electronics - HP

    BrandCategoryModel(categoryId: '5', brandId: '8'), // Furniture - InterWood

    BrandCategoryModel(categoryId: '6', brandId: '1'), // Sports - Nike
  ];

  static final List<ProductCategoryModel> productCategory = [
    // Clothes Category
    ProductCategoryModel(categoryId: '1', productId: '1'),
    ProductCategoryModel(categoryId: '1', productId: '17'),
    ProductCategoryModel(categoryId: '1', productId: '18'),
    ProductCategoryModel(categoryId: '1', productId: '21'),
    ProductCategoryModel(categoryId: '1', productId: '67'),
    ProductCategoryModel(categoryId: '1', productId: '16'),
    ProductCategoryModel(categoryId: '1', productId: '25'),
    ProductCategoryModel(categoryId: '1', productId: '49'),
    ProductCategoryModel(categoryId: '1', productId: '56'),
    ProductCategoryModel(categoryId: '1', productId: '57'),
    ProductCategoryModel(categoryId: '1', productId: '66'),
    ProductCategoryModel(categoryId: '1', productId: '9'),
    ProductCategoryModel(categoryId: '1', productId: '11'),
    ProductCategoryModel(categoryId: '1', productId: '68'),

    // Shoes Category
    ProductCategoryModel(categoryId: '2', productId: '14'),
    ProductCategoryModel(categoryId: '2', productId: '19'),
    ProductCategoryModel(categoryId: '2', productId: '10'),
    ProductCategoryModel(categoryId: '2', productId: '15'),
    ProductCategoryModel(categoryId: '2', productId: '20'),

    // Cosmetics Category
    ProductCategoryModel(categoryId: '3', productId: '28'),
    ProductCategoryModel(categoryId: '3', productId: '36'),
    ProductCategoryModel(categoryId: '3', productId: '27'),
    ProductCategoryModel(categoryId: '3', productId: '29'),
    ProductCategoryModel(categoryId: '3', productId: '30'),
    ProductCategoryModel(categoryId: '3', productId: '13'),
    ProductCategoryModel(categoryId: '3', productId: '24'),
    ProductCategoryModel(categoryId: '3', productId: '14'),
    ProductCategoryModel(categoryId: '3', productId: '45'),
    ProductCategoryModel(categoryId: '3', productId: '46'),
    ProductCategoryModel(categoryId: '3', productId: '48'),
    ProductCategoryModel(categoryId: '3', productId: '5'),
    ProductCategoryModel(categoryId: '3', productId: '6'),
    ProductCategoryModel(categoryId: '3', productId: '7'),
    ProductCategoryModel(categoryId: '3', productId: '8'),
    ProductCategoryModel(categoryId: '3', productId: '52'),
    ProductCategoryModel(categoryId: '3', productId: '53'),

    // Electronics Category
    ProductCategoryModel(categoryId: '4', productId: '31'),
    ProductCategoryModel(categoryId: '4', productId: '37'),
    ProductCategoryModel(categoryId: '4', productId: '40'),
    ProductCategoryModel(categoryId: '4', productId: '41'),
    ProductCategoryModel(categoryId: '4', productId: '42'),
    ProductCategoryModel(categoryId: '4', productId: '43'),
    ProductCategoryModel(categoryId: '4', productId: '44'),
    ProductCategoryModel(categoryId: '4', productId: '54'),
    ProductCategoryModel(categoryId: '4', productId: '55'),
    ProductCategoryModel(categoryId: '4', productId: '64'),
    ProductCategoryModel(categoryId: '4', productId: '22'),
    ProductCategoryModel(categoryId: '4', productId: '23'),
    ProductCategoryModel(categoryId: '4', productId: '38'),
    ProductCategoryModel(categoryId: '4', productId: '39'),
    ProductCategoryModel(categoryId: '4', productId: '3'),
    ProductCategoryModel(categoryId: '4', productId: '4'),
    ProductCategoryModel(categoryId: '4', productId: '32'),
    ProductCategoryModel(categoryId: '4', productId: '33'),
    ProductCategoryModel(categoryId: '4', productId: '34'),
    ProductCategoryModel(categoryId: '4', productId: '35'),

    // Furniture Category
    ProductCategoryModel(categoryId: '5', productId: '50'),
    ProductCategoryModel(categoryId: '5', productId: '51'),
    ProductCategoryModel(categoryId: '5', productId: '58'),
    ProductCategoryModel(categoryId: '5', productId: '59'),
    ProductCategoryModel(categoryId: '5', productId: '60'),
    ProductCategoryModel(categoryId: '5', productId: '63'),
    ProductCategoryModel(categoryId: '5', productId: '65'),
    ProductCategoryModel(categoryId: '5', productId: '61'),
    ProductCategoryModel(categoryId: '5', productId: '62'),

    // Shoes Category
    ProductCategoryModel(categoryId: '6', productId: '26'),
    ProductCategoryModel(categoryId: '6', productId: '2'),

    // Shirts
    ProductCategoryModel(categoryId: '7', productId: '1'),
    ProductCategoryModel(categoryId: '7', productId: '17'),
    ProductCategoryModel(categoryId: '7', productId: '18'),
    ProductCategoryModel(categoryId: '7', productId: '21'),
    ProductCategoryModel(categoryId: '7', productId: '67'),

    // Jackets
    ProductCategoryModel(categoryId: '8', productId: '16'),
    ProductCategoryModel(categoryId: '8', productId: '25'),
    ProductCategoryModel(categoryId: '8', productId: '49'),
    ProductCategoryModel(categoryId: '8', productId: '56'),
    ProductCategoryModel(categoryId: '8', productId: '57'),
    ProductCategoryModel(categoryId: '8', productId: '66'),

    // Shorts
    ProductCategoryModel(categoryId: '9', productId: '9'),
    ProductCategoryModel(categoryId: '9', productId: '11'),
    ProductCategoryModel(categoryId: '9', productId: '68'),

    // Formal Shoes
    ProductCategoryModel(categoryId: '10', productId: '14'),
    ProductCategoryModel(categoryId: '10', productId: '19'),

    // Sports Shoes
    ProductCategoryModel(categoryId: '11', productId: '10'),
    ProductCategoryModel(categoryId: '11', productId: '15'),
    ProductCategoryModel(categoryId: '11', productId: '20'),

    // Face
    ProductCategoryModel(categoryId: '12', productId: '28'),
    ProductCategoryModel(categoryId: '12', productId: '36'),

    // Hair Oils
    ProductCategoryModel(categoryId: '13', productId: '27'),
    ProductCategoryModel(categoryId: '13', productId: '29'),
    ProductCategoryModel(categoryId: '13', productId: '30'),

    // Bags
    ProductCategoryModel(categoryId: '14', productId: '13'),
    ProductCategoryModel(categoryId: '14', productId: '24'),
    ProductCategoryModel(categoryId: '14', productId: '14'),
    ProductCategoryModel(categoryId: '14', productId: '45'),
    ProductCategoryModel(categoryId: '14', productId: '46'),
    ProductCategoryModel(categoryId: '14', productId: '48'),

    // Perfumes
    ProductCategoryModel(categoryId: '15', productId: '5'),
    ProductCategoryModel(categoryId: '15', productId: '6'),
    ProductCategoryModel(categoryId: '15', productId: '7'),
    ProductCategoryModel(categoryId: '15', productId: '8'),

    // Watch
    ProductCategoryModel(categoryId: '16', productId: '52'),
    ProductCategoryModel(categoryId: '16', productId: '53'),

    // Gadgets
    ProductCategoryModel(categoryId: '17', productId: '31'),
    ProductCategoryModel(categoryId: '17', productId: '37'),
    ProductCategoryModel(categoryId: '17', productId: '40'),
    ProductCategoryModel(categoryId: '17', productId: '41'),
    ProductCategoryModel(categoryId: '17', productId: '42'),
    ProductCategoryModel(categoryId: '17', productId: '43'),
    ProductCategoryModel(categoryId: '17', productId: '44'),
    ProductCategoryModel(categoryId: '17', productId: '54'),
    ProductCategoryModel(categoryId: '17', productId: '55'),
    ProductCategoryModel(categoryId: '17', productId: '64'),

    // Laptops
    ProductCategoryModel(categoryId: '18', productId: '22'),
    ProductCategoryModel(categoryId: '18', productId: '23'),
    ProductCategoryModel(categoryId: '18', productId: '38'),
    ProductCategoryModel(categoryId: '18', productId: '39'),

    // Mobiles
    ProductCategoryModel(categoryId: '19', productId: '3'),
    ProductCategoryModel(categoryId: '19', productId: '4'),
    ProductCategoryModel(categoryId: '19', productId: '32'),
    ProductCategoryModel(categoryId: '19', productId: '33'),
    ProductCategoryModel(categoryId: '19', productId: '34'),
    ProductCategoryModel(categoryId: '19', productId: '35'),

    // Bed
    ProductCategoryModel(categoryId: '20', productId: '50'),
    ProductCategoryModel(categoryId: '20', productId: '51'),
    ProductCategoryModel(categoryId: '20', productId: '58'),
    ProductCategoryModel(categoryId: '20', productId: '59'),
    ProductCategoryModel(categoryId: '20', productId: '60'),
    ProductCategoryModel(categoryId: '20', productId: '63'),
    ProductCategoryModel(categoryId: '20', productId: '65'),

    // Lamp
    ProductCategoryModel(categoryId: '21', productId: '61'),
    ProductCategoryModel(categoryId: '21', productId: '62'),

    // Cricket
    ProductCategoryModel(categoryId: '22', productId: '26'),

    // Soccer
    ProductCategoryModel(categoryId: '23', productId: '2'),
  ];

  // static final List<PromoCodeModel> promoCodes = [
  //   PromoCodeModel(
  //       id: '1',
  //       code: 'WELCOME10',
  //       name: 'Welcome Offer',
  //       discount: 10,
  //       discountType: DiscountType.percentage,
  //       startDate: DateTime.now(),
  //       endDate: DateTime.now().add(Duration(days: 30)),
  //       isActive: true,
  //       minOrderPrice: 1000,
  //       noOfPromoCodes: 100),
  //   PromoCodeModel(
  //     id: '2',
  //     code: 'FLAT50',
  //     name: 'Flat ${UTexts.currency}50 Off',
  //     discount: 50,
  //     discountType: DiscountType.fixed,
  //     startDate: DateTime.now(),
  //     endDate: DateTime.now().add(Duration(days: 10)),
  //     isActive: true,
  //     minOrderPrice: 500,
  //     noOfPromoCodes: 50,
  //   ),
  //   PromoCodeModel(
  //     id: '3',
  //     code: 'SUMMER20',
  //     name: 'Summer Special 20% Off',
  //     discount: 20,
  //     discountType: DiscountType.percentage,
  //     startDate: DateTime.now(),
  //     endDate: DateTime.now().add(Duration(days: 20)),
  //     isActive: true,
  //     minOrderPrice: 1200,
  //     noOfPromoCodes: 200,
  //   ),
  //   PromoCodeModel(
  //     id: '4',
  //     code: 'FIRSTORDER',
  //     name: 'First Order Bonus',
  //     discount: 30,
  //     discountType: DiscountType.fixed,
  //     startDate: DateTime.now(),
  //     endDate: DateTime.now().add(Duration(days: 15)),
  //     isActive: true,
  //     minOrderPrice: 800,
  //     noOfPromoCodes: 75,
  //   ),
  //   PromoCodeModel(
  //     id: '5',
  //     code: 'FLASH15',
  //     name: 'Flash Sale 15% Off',
  //     discount: 15,
  //     discountType: DiscountType.percentage,
  //     startDate: DateTime.now(),
  //     endDate: DateTime.now().add(Duration(days: 5)),
  //     isActive: true,
  //     minOrderPrice: 1500,
  //     noOfPromoCodes: 30,
  //   ),
  //   PromoCodeModel(
  //     id: '6',
  //     code: 'BIGSAVE100',
  //     name: 'Big Save ${UTexts.currency}100 Off',
  //     discount: 100,
  //     discountType: DiscountType.fixed,
  //     startDate: DateTime.now(),
  //     endDate: DateTime.now().add(Duration(days: 45)),
  //     isActive: true,
  //     minOrderPrice: 3000,
  //     noOfPromoCodes: 120,
  //   ),
  //   PromoCodeModel(
  //     id: '7',
  //     code: 'FREESHIP',
  //     name: 'Free Shipping',
  //     discount: 5,
  //     discountType: DiscountType.percentage,
  //     startDate: DateTime.now(),
  //     endDate: DateTime.now().add(Duration(days: 90)),
  //     isActive: true,
  //     minOrderPrice: 0,
  //     noOfPromoCodes: 999,
  //   ),
  //   PromoCodeModel(
  //     id: '8',
  //     code: 'NEWYEAR25',
  //     name: 'New Year 25% Off',
  //     discount: 25,
  //     discountType: DiscountType.percentage,
  //     startDate: DateTime.now(),
  //     endDate: DateTime.now().add(Duration(days: 60)),
  //     isActive: true,
  //     minOrderPrice: 2000,
  //     noOfPromoCodes: 80,
  //   ),
  //   PromoCodeModel(
  //     id: '9',
  //     code: 'DIWALI500',
  //     name: 'Diwali Mega ${UTexts.currency}500 Off',
  //     discount: 500,
  //     discountType: DiscountType.fixed,
  //     startDate: DateTime.now(),
  //     endDate: DateTime.now().add(Duration(days: 25)),
  //     isActive: true,
  //     minOrderPrice: 3500,
  //     noOfPromoCodes: 40,
  //   ),
  //   PromoCodeModel(
  //     id: '10',
  //     code: 'SAVE70',
  //     name: 'Save ${UTexts.currency}70 Instantly',
  //     discount: 70,
  //     discountType: DiscountType.fixed,
  //     startDate: DateTime.now().subtract(Duration(days: 2)),
  //     endDate: DateTime.now().subtract(Duration(days: 1)),
  //     isActive: true,
  //     minOrderPrice: 1000,
  //     noOfPromoCodes: 70,
  //   ),
  // ];
}
