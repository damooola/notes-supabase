# Supabase Notes App

A Flutter notes application with user authentication using Supabase as the backend.

## Features

- User authentication (signup/login)
- Create and delete notes
- Real-time updates using Supabase streams
- User-specific notes
- Clean and simple UI

## Setup

1. Create a Supabase project
2. Create a `notes` table with columns:
   - `id` (int8, primary key)
   - `created_at` (timestamp with time zone)
   - `body` (text)
   - `user` (text)

3. Add environment variables:

```dart
await Supabase.initialize(
  url: 'YOUR_SUPABASE_URL',
  anonKey: 'YOUR_SUPABASE_ANON_KEY',
);
```

## Installation

```bash
flutter pub get
```

## Running

```bash
flutter run
```

## Dependencies

- supabase_flutter

## Structure

- `lib/services/notes_services.dart`: Supabase API calls
- `lib/pages/auth_page.dart`: Authentication state management
- `lib/pages/notes_page.dart`: Main notes interface
- `lib/pages/login_or_signup_page.dart`: Login/Signup UI

## Contributing

Contributions and comments are always welcome
