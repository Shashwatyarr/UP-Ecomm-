# Fix TabBar Length Mismatch and Onboarding Persistence

This plan addresses two issues:
1.  **TabBar Error**: "Controller's length property (6) does not match the number of tabs (5)". This is caused by hardcoded tabs in the `UTabBar` widget.
2.  **Onboarding Issue**: Onboarding screen appearing on every restart. This is likely due to the "skip" action not saving the state and potential logic improvements in the redirection.

## Proposed Changes

### Common Widgets

#### [MODIFY] [tabbar.dart](file:///D:/ecomm/lib/common/widgets/appbar/tabbar.dart)
- Remove the hardcoded `tabs` list inside the `build` method.
- Use the `tabs` list passed through the constructor.

### Authentication Feature

#### [MODIFY] [onboarding_controller.dart](file:///D:/ecomm/lib/features/authentication/controllers/onboarding/onboarding_controller.dart)
- Update `skipPage` to optionally save the `isFirstTime` state and navigate to `LoginScreen` directly, OR just ensure that any navigation away from Onboarding marks it as completed.
- *Decision*: I will make `skipPage` immediately mark onboarding as done and redirect to `LoginScreen` to avoid confusion.

#### [MODIFY] [authentication_repository.dart](file:///D:/ecomm/lib/data/repository/authentication_repository.dart)
- Simplify the `screenRedirect` logic to be more robust.

## Verification Plan

### Manual Verification
1.  **TabBar**: Open the "Store" screen. Verify that the tabs match the categories fetched from the database and no crash occurs.
2.  **Onboarding**:
    - Run the app for the first time.
    - Click "Skip" or "Get Started".
    - Restart the app.
    - Verify that it goes directly to the Login/Home screen instead of Onboarding.
