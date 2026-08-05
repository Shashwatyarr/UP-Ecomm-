# Fix Brand Products Visibility

The brand products are not showing up because of a mismatch in Firestore field names within the repository queries. Specifically, the queries are using lowercase field names while the data is stored using PascalCase.

## Proposed Changes

### Data Layer

#### [MODIFY] [product_repository.dart](file:///D:/ecomm/lib/data/repository/product/product_repository.dart)
- Update `getProductsForBrand` to use the correct nested field path `Brand.Id` instead of `brand.id` to match the `ProductModel` and `BrandModel` serialization logic.

### Shop Feature

#### [MODIFY] [brand_controller.dart](file:///D:/ecomm/lib/features/shop/controllers/brand/brand_controller.dart)
- Update `getBrandProducts` to correctly pass the `limit` parameter to the repository method.

## Verification Plan

### Manual Verification
- Navigate to the "Store" screen.
- Click on any Brand (e.g., Nike, Adidas).
- Verify that the products associated with that brand are now correctly fetched and displayed on the `BrandProductsScreen`.
