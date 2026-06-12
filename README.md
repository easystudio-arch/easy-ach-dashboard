# Easy Dashboard

Sales analytics dashboard demo built with Flutter Web. Visual-only — no API or database connections. All data is static/mock for demonstration purposes.

## Features

- **KPI Cards** — Total Revenue, Orders, Customers, Conversion Rate with growth indicators
- **Revenue Chart** — Monthly revenue trend (line chart)
- **Category Breakdown** — Sales distribution by category (pie chart)
- **Top Products Table** — Best-selling products with revenue data
- **Responsive Layout** — Adapts to desktop and mobile viewports

## Tech Stack

- Flutter Web + Material 3
- fl_chart — Line and Pie charts
- intl — Number formatting
- 100% static demo data (no backend)

## Build & Deploy

```bash
flutter clean
flutter pub get
flutter build web --base-href /dashboard/ --release
```

### Deploy to GitHub Pages

```bash
robocopy build\web docs /MIR
git add .
git commit -m "deploy web"
git push
```

Configure GitHub Pages to serve from `/docs` folder on `master` branch.

## Project Structure

```
lib/
├── main.dart                    # App entry, Material 3 theme
├── data/
│   └── mock_data.dart           # Static sales data
└── screens/
    └── dashboard_screen.dart    # KPIs, charts, table
```

## License

MIT
