import shlex
import subprocess
import sys
from typing import List, Union


def bash_to_subprocess(bash_command: str) -> Union[subprocess.CompletedProcess, None]:
    """
    Converts a bash command line into subprocess calls and executes it.
    
    Parameters:
        bash_command (str): The bash command line to be converted and executed.
        
    Returns:
        subprocess.CompletedProcess or None: The result of the subprocess call.
    """
    # Split the command into tokens
    tokens = shlex.split(bash_command)

    # Check for pipes
    if '|' in tokens:
        return handle_pipes(tokens)
    else:
        return handle_simple_command(tokens)


def handle_simple_command(tokens: List[str]) -> subprocess.CompletedProcess:
    # Initialize redirection
    stdout = None
    stdin = None
    stderr = None
    args = []
    it = iter(tokens)
    for token in it:
        if token == '>':
            outfile = next(it)
            stdout = open(outfile, 'w')
        elif token == '>>':
            outfile = next(it)
            stdout = open(outfile, 'a')
        elif token == '<':
            infile = next(it)
            stdin = open(infile, 'r')
        elif token == '2>':
            errfile = next(it)
            stderr = open(errfile, 'w')
        else:
            args.append(token)

    # Execute the command
    result = subprocess.run(args, stdout=stdout,
                            stdin=stdin, stderr=stderr, check=True)

    # Close any files opened for redirection
    if stdout:
        stdout.close()
    if stdin:
        stdin.close()
    if stderr:
        stderr.close()

    return result



def handle_pipes(tokens: List[str]) -> None:
    """
    Handles commands with pipes.
    """
    # Split the tokens into commands separated by pipes
    commands = []
    current_command = []
    for token in tokens:
        if token == '|':
            commands.append(current_command)
            current_command = []
        else:
            current_command.append(token)
    commands.append(current_command)

    # Create the pipeline
    processes = []
    prev_process = None
    for i, cmd_tokens in enumerate(commands):
        stdin = prev_process.stdout if prev_process else None
        stdout = subprocess.PIPE if i < len(commands) - 1 else None

        # Handle redirections in the last command
        if i == len(commands) - 1:
            cmd_tokens, stdout, stderr = parse_redirections(cmd_tokens)

        process = subprocess.Popen(
            cmd_tokens, stdin=stdin, stdout=stdout, stderr=stderr)
        if prev_process:
            prev_process.stdout.close()
        prev_process = process

    # Wait for the last process to finish
    prev_process.communicate()


def parse_redirections(cmd_tokens: List[str]):
    """
    Parses redirections in command tokens.
    """
    stdout = None
    stderr = None
    args = []
    it = iter(cmd_tokens)
    for token in it:
        if token == '>':
            outfile = next(it)
            stdout = open(outfile, 'w')
        elif token == '>>':
            outfile = next(it)
            stdout = open(outfile, 'a')
        elif token == '2>':
            errfile = next(it)
            stderr = open(errfile, 'w')
        else:
            args.append(token)
    return args, stdout, stderr


# Example usage
if __name__ == "__main__":
    bash_command = input("Enter a bash command: ")
    try:
        bash_to_subprocess(bash_command)
    except subprocess.CalledProcessError as e:
        print(f"An error occurred: {e}", file=sys.stderr)
