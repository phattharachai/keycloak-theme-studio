# Softcakes Theme for Keycloak

A custom Keycloak theme with a sweet, modern design featuring pink/rose color scheme.

## Theme Components

### 1. Login Theme
- Custom login pages with gradient background
- Rounded corners and modern styling
- Pink/rose color scheme
- Smooth transitions and hover effects

### 2. Account Theme
- User account management pages
- Consistent styling with login theme
- Responsive design

### 3. Admin Theme
- Admin console customization
- Brand colors applied to admin interface
- Clean and professional look

### 4. Email Theme
- HTML and text email templates
- Branded email design with gradients
- Responsive email layout

## Color Palette

- Primary: `#FF6B9D` (Soft Pink)
- Secondary: `#C44569` (Rose)
- Background: `#FFF5F7` (Light Pink)
- Text: `#2C3E50` (Dark Blue-Gray)

## Installation

1. Copy the `softcakes` folder to your Keycloak themes directory
2. Restart Keycloak or reload themes
3. In Keycloak Admin Console:
   - Go to Realm Settings → Themes
   - Select "softcakes" for Login, Account, Admin, and Email themes
   - Save changes

## Customization

Edit the CSS files in each theme's `resources/css/` directory to customize colors, fonts, and styling.

### Files Structure

```
softcakes/
├── login/
│   ├── theme.properties
│   └── resources/
│       └── css/
│           └── login.css
├── account/
│   ├── theme.properties
│   └── resources/
│       └── css/
│           └── account.css
├── admin/
│   ├── theme.properties
│   └── resources/
│       └── css/
│           └── admin.css
└── email/
    ├── theme.properties
    ├── html/
    │   └── template.ftl
    └── text/
        └── template.ftl
```

## Credits

Created for Softcakes platform
