# Debug and Fix Firestore Collection Creation Issue

The user is experiencing an "unexpected Firebase error" when trying to save a user record to Firestore. This usually happens when Firestore is not enabled, security rules are blocking the request, or the configuration is incorrect.

## User Review Required

> [!IMPORTANT]
> To fix the "collection nhi banra" (collection not creating) issue, you must verify the following in your **Firebase Console**:
> 1. **Firestore Database Enabled**: Go to "Firestore Database" and ensure you have clicked "Create Database".
> 2. **Security Rules**: In the "Rules" tab of Firestore, ensure they are set to allow writes. A common starting point for development is:
>    ```
>    rules_version = '2';
>    service cloud.firestore {
>      match /databases/{database}/documents {
>        match /{document=**} {
>          allow read, write: if request.auth != null;
>        }
>      }
>    }
>    ```
> 3. **Firebase Region**: Ensure you have selected a location for your database.

## Proposed Changes

### Data Layer

#### [MODIFY] [user_repository.dart](file:///D:/ecomm/lib/data/repository/user/user_repository.dart)
- Update the `catch` block to print the actual error code and message to the console. This will help identify the exact problem (e.g., `permission-denied`).
- Add `permission-denied` handling in `UFirebaseException` to provide a better error message.

#### [MODIFY] [firebase_exceptions.dart](file:///D:/ecomm/lib/utils/exceptions/firebase_exceptions.dart)
- Add missing common Firestore error codes like `permission-denied`, `unavailable`, and `not-found`.

## Verification Plan

### Manual Verification
- Update the code to print the exact error.
- Run the app and try to sign up again.
- Check the debug console for the error output.
- Adjust Firestore rules based on the error.
- Verify that the "Users" collection appears in the Firebase Console.
