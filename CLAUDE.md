# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

CHSDistance is a Ruby on Rails 8.0.2 application using modern Rails conventions. The project appears to be in early development stages with minimal custom code beyond the Rails scaffold.

## Key Commands

### Development Server
- `bin/rails server` - Start the development server
- `bin/rails console` - Open Rails console for interactive debugging

### Database Operations
- `bin/rails db:create` - Create databases
- `bin/rails db:migrate` - Run database migrations
- `bin/rails db:setup` - Create databases, load schema, and seed data
- `bin/rails db:reset` - Drop, recreate databases and load seeds

### Testing
- `bin/rails test` - Run all tests except system tests
- `bin/rails test:system` - Run system tests (Capybara/Selenium)
- `bin/rails test:db` - Reset database and run tests

### Code Quality
- `bundle exec rubocop` - Run Rubocop linter (Rails Omakase style)
- `bundle exec brakeman` - Run security vulnerability scanner

### Asset Management
- `bin/rails assets:precompile` - Compile assets for production
- `bin/rails importmap:install` - Setup importmap configuration

## Architecture

### Framework Stack
- **Rails**: 8.0.2 with modern Rails conventions
- **Database**: SQLite3 with Solid Cache, Queue, and Cable adapters
- **Frontend**: Turbo + Stimulus (Hotwire), Importmap for JavaScript
- **Assets**: Propshaft asset pipeline
- **Server**: Puma web server

### Key Directories
- `app/controllers/` - Application controllers (currently only ApplicationController)
- `app/models/` - ActiveRecord models (currently only ApplicationRecord)
- `app/views/` - ERB templates and layouts
- `app/javascript/` - Stimulus controllers and JavaScript
- `app/assets/` - Stylesheets and images
- `config/` - Rails configuration files
- `db/` - Database schema and migrations
- `test/` - Test files (using default Rails testing)

### Database Schema
The database is currently empty (version 0) with no custom tables defined. Uses SQLite3 for development.

### JavaScript Architecture
Uses Rails 8's default JavaScript setup:
- **Importmap**: For JavaScript module management
- **Stimulus**: For JavaScript behavior
- **Turbo**: For SPA-like navigation

### Deployment
- Configured for containerized deployment with Docker
- Kamal deployment configuration available
- Thruster for asset acceleration in production

## Styling Guidelines

### CSS Framework Preference
- **ALWAYS use Tailwind CSS** for styling instead of writing custom CSS
- Avoid creating custom CSS files whenever possible
- Use Tailwind utility classes for all styling needs
- Only write custom CSS as a last resort when Tailwind cannot achieve the desired design

### Tailwind CSS Setup
- Use `tailwindcss-rails` gem for Rails integration
- Configure Tailwind to work with Rails asset pipeline
- Utilize Tailwind's utility-first approach for rapid development