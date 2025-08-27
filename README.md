# rails-issue-tracker
A simple issue tracker in Ruby on Rails, built to practice web app development by extending a message board tutorial.

## Features

### User Accounts
- Sign up, log in, and edit/cancel accounts
### Issues
- Create, edit, and destroy issues (authors can only delete their own issues)
- Track a history of changes: who made the change, what changed (text, name, assignee, etc.), and when
- View individual issues or all issues in a list
- Filter and sort issue lists
- Assign issues to specific users
- Leave comments on issues
### Persistence
- Data stored in a local Rails database (SQLite by default)

## Setup

### Prerequisites
- [Ruby](https://www.ruby-lang.org/en/) (version 3.2.2)
- [Bundler](https://bundler.io/)

### Running
1. **Clone the repository:**
    ```
    git clone https://github.com/nadrajak/rails-issue-tracker.git
    cd rails-issue-tracker
    ```
2. **Install required ruby gems using bundler:**
    ```
    bundle install
    ```

3. **Setup a local Rails database:**
    ```
    rails db:setup
    ```

4. **Start Rails server:**
    ```
    rails s
    ```

The application is then available on http://localhost:3000/.

