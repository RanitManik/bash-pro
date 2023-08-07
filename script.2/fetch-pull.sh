# Auto-fetch and pull Git repository on Git Bash startup
function git_auto_fetch_pull() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    remote="origin"
    
    echo "Fetching latest changes from $remote..."
    git fetch $remote > /dev/null 2>&1
    
    if [ $(git rev-list HEAD...$remote/$branch --count) -gt 0 ]; then
        echo "Pulling changes from $remote/$branch..."
        git pull $remote $branch
    else
        echo "Your repository is up to date."
    fi
}

# Check if the current directory is a Git repository and auto-fetch/pull
function git_auto_fetch_pull_on_startup() {
    if [ -d ".git" ]; then
        echo "Welcome to your Git repository!"
        git_auto_fetch_pull
        echo "You are all set!"
    else
        echo "You are not inside a Git repository."
    fi
}

# Call the function on startup
git_auto_fetch_pull_on_startup
