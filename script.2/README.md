## Add the following lines to your .bashrc or .bash_profile file

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



## Automated Git Fetch and Pull Script

This bash script automates the process of fetching and pulling changes from a remote Git repository whenever you open Git Bash. It helps you keep your local repository up-to-date effortlessly.

## Usage:
- Open your `.bashrc` or `.bash_profile` file (/home/your_username/.bashrc) using a text editor.
- Add the following line at the end of the file to call the script whenever Git Bash is opened.
