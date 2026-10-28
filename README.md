# Bash File Organizer

## 1. Project Description

The **Bash File Organizer** is a command-line tool written in Bash that organizes files in a specified directory into separate folders based on their file extensions.

Instead of manually sorting files, users can run a single command to automatically group images, documents, audio, videos, archives, and other files into their respective folders.

This project demonstrates the use of Bash scripting, command-line arguments, conditional statements, loops, file handling, and basic error handling.

## 2. Features

- **Directory validation:** Checks that the user provides a folder path and that the folder exists.
- **Automatic categorization:** Sorts files into folders according to their extensions.
- **Case-insensitive extension handling:** Recognizes extensions such as `.JPG`, `.jpg`, and `.Jpg` as the same file type.
- **Automatic folder creation:** Creates category folders when needed.
- **Safe file handling:** Avoids overwriting files that already exist in the destination.
- **Duplicate filename handling:** Renames conflicting files by adding a number, such as `photo(1).jpg` and `photo(2).jpg`.
- **Top-level organization:** Processes files directly inside the specified folder without organizing files inside its subfolders.
- **Progress messages:** Displays each successful file move.
- **Final summary:** Reports the total number of files moved.
- **Error handling:** Displays an error and exits when no folder is provided or the specified folder does not exist.

## 3. File Categories

The script organizes files into the following categories:

| Category | Supported extensions |
| --- | --- |
| Images | `.jpg`, `.jpeg`, `.png`, `.gif`, `.webp` |
| Documents | `.pdf`, `.doc`, `.docx`, `.txt`, `.xlsx`, `.pptx` |
| Audio | `.mp3`, `.wav`, `.m4a` |
| Video | `.mp4`, `.mkv`, `.mov` |
| Archives | `.zip`, `.rar`, `.tar`, `.gz` |
| Other | Files with unsupported extensions or no extension |

Extensions are matched without regard to uppercase or lowercase letters.

## 4. Requirements

To run this project, you need:

- A Bash-compatible terminal.
- A system with standard command-line utilities, including `mkdir` and `mv`.
- A folder containing files you want to organize.

The script can be used on Linux and other environments that support Bash and the required utilities.

## 5. Installation

### Step 1: Create the script

Create a file named `organise.sh` and paste the Bash script into it.

### Step 2: Save the file

Save the file in a directory where you can access it from your terminal.

### Step 3: Make the script executable

Run:

```bash
chmod +x organise.sh
```

This gives the script permission to execute.

## 6. Usage

The script requires a folder path as a command-line argument.

### Syntax

```bash
./organise.sh <folder_path>
```

### Example

To organize files inside a folder named `Downloads`:

```bash
./organise.sh ~/Downloads
```

Replace the example paths with the actual location of the folder you want to organize.

**Important:** Always provide the folder you intend to organize. The script does not automatically use the current directory when no argument is supplied.

## 7. Example

### Before running the script

Suppose the target folder contains these files:

```text
Downloads/
├── photo.jpg
├── report.pdf
├── song.mp3
├── movie.mp4
├── backup.zip
├── notes.txt
├── README
└── project/
```

### Run the script

```bash
./organise.sh Downloads
```

### Expected folder structure

After successful organization, the directory may look like this:

```text
Downloads/
├── Images/
│   └── photo.jpg
├── Documents/
│   ├── report.pdf
│   └── notes.txt
├── Audio/
│   └── song.mp3
├── Video/
│   └── movie.mp4
├── Archives/
│   └── backup.zip
├── Other/
│   └── README
└── project/
```

The existing `project` subfolder is left untouched because the script only processes files directly inside the specified directory.

Category folders are created only when needed.

### Example terminal output

![alt text](<assets/img/Screenshot From 2026-10-28 13-45-56.png>)

![alt text](<assets/img/Screenshot From 2026-10-28 15-23-34.png>)

The output above is an illustration of a successful run. The actual output depends on the files in the target folder.

## 8. Duplicate File Handling

The script checks whether a filename already exists in the destination category folder before moving a file.

For example, if `Images/photo.jpg` already exists, the incoming file is assigned a new name rather than replacing the existing file.

```text
Images/
├── photo.jpg
├── photo(1).jpg
├── photo(2).jpg
└── photo(3).jpg
```

This approach helps prevent accidental loss of files due to duplicate filenames.

## 9. Error Handling

The script checks for common errors before organizing files.

### No folder argument

Command:

```bash
./organise.sh
```

Expected message:

```text
Error: Please provide a folder to organise.
```

### Folder does not exist

Command:

```bash
./organise.sh missing_folder
```

Expected message:

```text
Error: Folder 'missing_folder' does not exist.
```

In both cases, the script exits with a non-zero status to indicate that it could not complete the requested operation.

## 13. Conclusion

The Bash File Organizer automates a common file-management task through a simple command-line interface. It applies Bash programming concepts to solve a practical problem while taking care to avoid overwriting existing files and to leave subdirectories untouched.

The project is a useful beginner exercise for developing skills in shell scripting, automation, and command-line file management.

Tata Stanley Mbajing
Junior FrontEnd Developer
[📩 Email: (stanleymbajingtata@gmail.com)]
🌍 Based in Cameroon | Open to remote opportunities
