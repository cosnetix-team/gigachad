# Sessions
# Start a session
tmux new -s mysession
# List all sessions
tmux ls

# Jobs
az ssh vm --resource-group cosnetix --vm-name gigachad --subscription 3c7ce158-89ee-4d8e-b30c-3529d57ff735
# New job
tmux new -s longjob
# Reattach to job
tmux attach -t longjob
