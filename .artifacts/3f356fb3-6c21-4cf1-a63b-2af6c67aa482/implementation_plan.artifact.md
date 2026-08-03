# Fix Products Not Showing on Home Screen

The products are not appearing on the Home screen due to a combination of variable naming mismatches in Firestore queries and logic errors in the `ProductController`. Additionally, the product cards are using hardcoded data instead of the actual product object.

## Proposed Changes

### Data Layer

#### [MODIFY] [product_repository.dart](file:///D:/ecomm/lib/data/repository/product/product_repository.dart)
- Update the Firestore query in `fetchfeaturedProducts` to use the correct field name `IsFeatured` (PascalCase) to match how the data is stored in the database.

### Shop Feature

#### [MODIFY] [product_controller.dart](file:///D:/ecomm/lib/features/shop/controllers/product/product_controller.dart)
- Fix the logic error in `getFeaturedProducts` where it was trying to assign `featuredProducts` to itself instead of using the `products` list fetched from the repository.

### Common Widgets

#### [MODIFY] [product_card_vertical.dart](file:///D:/ecomm/lib/common/widgets/products/product_cards/product_card_vertical.dart)
- Replace hardcoded values with actual data from the `product` model:
    - Use `product.title` for the title.
    - Use `product.price` for the price.
    - Use `product.brand.name` for the brand title.

## Verification Plan

### Manual Verification
- Hot restart the app and navigate to the Home screen.
- Verify that the "Popular Products" section now displays actual product data fetched from Firestore.
- Ensure the title, price, and brand on the cards match the data in Firestore/DummyData.
