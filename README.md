# Repo Tree
```n
.
├── LICENSE
├── README.md
├── description.md
├── generateREADME.sh
├── preamble.tex
├── references
│   └── src
│       ├── main.tex
│       ├── sections
│       │   ├── header.tex
│       │   └── sampleContacts.tex
│       └── style.cls
├── resume
│   └── src
│       ├── main.tex
│       ├── sections
│       │   ├── contactInfo.tex
│       │   ├── education.tex
│       │   ├── experience.tex
│       │   ├── otherExperience.tex
│       │   ├── projects.tex
│       │   └── skills.tex
│       └── style.cls
├── retired
│   └── retired.tex
└── setup.sh

8 directories, 19 files
```
# Purpose of this Project
I was tired of tinkering with Microsoft Word formatting and decided that writing something in LaTeX would be more straightforward. This builder makes it so the resume can be customized to my needs as my career moves forward. It allows me to change themes and also express some of the concepts I've learned throughout college.

# Setting Up
The environment to use this repository is VS Code as it provides an useful extension known as LaTeX Workshop.

In WSL, clone the repository.

Enter the repo parent directory. Add execution permissions to the generate README and setup bash scripts. Then run the setup bashscript which simply creates the output directory and installs dependencies (it will be updated as more functionality is added).
```Bash
cd ResumeBuilder
chmod +x setup.sh
chmod +x generateREADME.sh
./setup.sh
```

Once the setup script is run, open VS Code:
```Bash
code .
```

In VS Code, get the LaTeX Workshop extension. This makes building the PDF files extremely easy.

As with any extension, LaTeX Workshop's settings can be changed in .vscode/settings.json found in the resume/ and refer/ directories. There are two .vscode settings.json files since LaTeX Workshop was not designed with two main.tex files in mind (as far as I can tell from the documentation) and this project has been divided into two subprojects. 

In each settings.json, commands are defined along with the output directories and main.tex file location stated. Make sure these are adjusted to match whereever the main.tex file, alternatively you can use %DOC%. To see more about the LaTeX Workshop settings that can be applied, see their (wiki)[https://github.com/James-Yu/LaTeX-Workshop/wiki]. (Note for development: automating the main.tex path in the setup.sh is not a bad idea).

# Building PDFs in VS Code
This is where things can be a little weird since-- once again-- LaTeX Workshop was made with one main.tex file in mind. Unless you are editing the preamble.tex, do not open VS Code in the repo root directory to edit the LaTeX code. It will not build properly and generate output files in the wrong directory leaving clutter. It's because LaTeX Workshop recipes (commands) found in the settings.json are applied in the directory that VS Code was opened in. This is something to be looked into and understood further.

To work around this, open VS Code in the resume or references subproject directory folder depending on which one you would like to edit. If the settings.json is correctly configured and the output directories exist, then any changes made to the LaTeX files should automatically build a PDF.

# Notable Files
There are important files that help with modularity and excapsulation.
* **preamble.tex** - This is where formatting, custom commands, and packages are. This is the only file that should be edited when VS Code is opened in the repo root directory.
* **style.cls** - This is where the document class is defined and There is one of these in each subproject since loading it into each main.tex required them to be in the same directory (a good amount of time was spent trying to find a workaround).