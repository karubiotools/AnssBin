# Bash user manual
Bash scripts and command lines are well used worldwide. A great variety of tutorials are available online. 
This [example](https://doc.ubuntu-fr.org/tutoriel/console_ligne_de_commande) (in French) provides some basic bash commands.

# Simple examples on how to use Bash scripting language
## Introduction
Bash (Bourne Again Shell) is a command-line interpreter and scripting language used in Unix-based operating systems. This guide will help you get started with Bash scripting.

## Basics of Bash
### Running Commands
You can run Bash commands in the terminal or write them in a script file with a `.sh` extension.

```bash
#!/bin/bash
echo "Hello, World!"
```
Save the file as `script.sh` and run:
```bash
chmod +x script.sh
./script.sh
```

## Variables
### Defining Variables
```bash
name="Alice"
echo "Hello, $name!"
```

### Reading User Input
```bash
echo "Enter your name:"
read user_name
echo "Hello, $user_name!"
```

## Conditional Statements
### If Statements
```bash
num=10
if [ $num -gt 5 ]; then
  echo "Number is greater than 5"
fi
```

### If-Else
```bash
num=3
if [ $num -gt 5 ]; then
  echo "Greater than 5"
else
  echo "Less than or equal to 5"
fi
```

## Loops
### For Loop
```bash
for i in {1..5}
do
  echo "Iteration $i"
done
```

### While Loop
```bash
count=1
while [ $count -le 5 ]
do
  echo "Count: $count"
  ((count++))
done
```

## Functions
### Defining Functions
```bash
greet() {
  echo "Hello, $1!"
}
greet "Bob"
```

## Working with Files
### Checking if a File Exists
```bash
file="test.txt"
if [ -f "$file" ]; then
  echo "File exists"
else
  echo "File does not exist"
fi
```

### Reading a File Line by Line
```bash
while IFS= read -r line
do
  echo "$line"
done < file.txt
```

## Conclusion
Bash scripting is powerful for automating tasks and managing system operations. Bash or other Shell scripts are essential to simplify your workflows.
