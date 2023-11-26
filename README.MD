## Prolog Grammar Checker and Translator
This Git project aims to develop a Prolog-based application that serves two main purposes:

1. **Grammar Checker:** The application will analyze an inputted sentence and determine whether it is grammatically correct in both English and Dutch.

2. **Language Translator:** Additionally, the application will provide functionality to convert an inputted phrase from English to Dutch and vice versa.

## Table of Contents
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

To get started with the project, follow the instructions below.

## Prerequisites

Before running the application, ensure that you have the following prerequisites installed:

- Prolog Compiler (e.g., SWI-Prolog)

## Installation

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/your-username/prolog-grammar-checker-translator.git
    ```

2. Change into the project directory:

    ```bash
    cd prolog-grammar-checker-translator
    ```

## Usage

1. Open your Prolog interpreter and consult the main file:

    ```prolog
    ?- [main].
    ```

2. Use the provided predicates for grammar checking and language translation:

    - `is_grammatically_correct/1`: Takes a sentence as input and confirms if it's grammatically correct in English and Dutch.

    - `translate_to_dutch/2`: Translates an English phrase to Dutch.

    - `translate_to_english/2`: Translates a Dutch phrase to English.

## Examples

### Grammar Checking

```prolog
?- is_grammatically_correct("This is a sample English sentence.").
true.

?- is_grammatically_correct("Dit is een voorbeeld Nederlandse zin.").
true.

?- is_grammatically_correct("This a sample English sentence.").
false.

?- is_grammatically_correct("Dit is een voorbeeld Nederlandse zin met fouten.").
false.
```

## Language Translation
```Prolog
?- translate_to_dutch("Hello, how are you?", Translation).
Translation = "Hallo, hoe gaat het met je?".

?- translate_to_english("Goedemorgen, hoe gaat het?", Translation).
Translation = "Good morning, how are you?".
```

## Contributing
Link will be provided later