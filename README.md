# user-core-pro

Full-featured user management system with CRUD, role-based access control, and real-time activity monitoring.

## Teknoloji

| | |
|---|---|
| Mimari | aspnet-core |
| Frontend | React + Vite + Tailwind + Headless UI |
| Backend | ASP.NET Core Web API 8.0 |
| Veritabani | PostgreSQL + Entity Framework Core |
| Deployment | Docker + Nginx |

## Kurulum

```bash
cd Backend
dotnet restore
dotnet run
```

## Dosya Yapisi

```
user-core-pro/
  styles/variables.css
  styles/reset.css
  styles/global.css
  database/schema.sql
  database/seed.sql
  Backend/UserCorePro.API/UserCorePro.API.csproj
  Backend/UserCorePro.API/appsettings.json
  Backend/UserCorePro.Core/Entities/User.cs
  Backend/UserCorePro.Infrastructure/Data/AppDbContext.cs
  Backend/UserCorePro.API/Program.cs
  Backend/UserCorePro.API/Controllers/AuthController.cs
  Backend/UserCorePro.API/Controllers/UsersController.cs
  Frontend/package.json
  Frontend/vite.config.js
  Frontend/tailwind.config.js
  Frontend/src/services/api.js
  Frontend/src/context/AuthContext.jsx
  Frontend/src/components/ProtectedRoute.jsx
  Frontend/src/pages/Login.jsx
  Frontend/src/pages/Dashboard.jsx
  Frontend/src/components/Layout.jsx
  Frontend/src/App.jsx
  Frontend/src/main.jsx
  Frontend/src/index.css
  tests/test-plan.md
  tests/checklist.md
  .gitignore
  Dockerfile
  docker-compose.yml
  .github/workflows/deploy.yml
```

## Uretim Raporu

- uiux: Tamamlandi
- db: Tamamlandi
- backend: Tamamlandi
- frontend: Tamamlandi
- qa: Tamamlandi
- devops: Tamamlandi

---

> Bu proje Kurumsal AI Yazilim Ajansi tarafindan otomatik olarak uretilmistir.
