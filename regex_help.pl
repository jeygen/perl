#   \d - Matches any digit (0-9).
#   \D - Matches any non-digit character.
#   \w - Matches any word character (letters, digits, and underscore). Equivalent to [a-zA-Z0-9_].
#   \W - Matches any non-word character. Equivalent to [^a-zA-Z0-9_].
#   \s - Matches any whitespace character (space, tab, newline, etc.).
#   \S - Matches any non-whitespace character.
#   \b - Matches a word boundary.
#   \B - Matches a non-word boundary.
#   . - Matches any character except newline.

# Matching a pattern in a string
if ($string =~ /pattern/) {
    # Pattern found
} else {
    # Pattern not found
}

# Matching case-insensitively
if ($string =~ /pattern/i) {
    # Pattern found (case-insensitive)
}

# Matching with word boundary
if ($string =~ /\bword\b/) {
    # Word found
}

# Matching with multiple alternatives
if ($string =~ /apple|banana/) {
    # Either "apple" or "banana" found
}

# Matching any character except newline
if ($string =~ /./) {
    # Any character found
}

# Matching a specific character set
if ($string =~ /[aeiou]/) {
    # Any vowel found
}

# Matching word characters
if ($string =~ /\w/) {
    # Word character found
}

# Matching a range of characters
if ($string =~ /[a-z]/) {
    # Any lowercase letter found
}

# Matching a character not in a set
if ($string =~ /[^0-9]/) {
    # Any non-digit found
}

# Matching a specific number of repetitions
if ($string =~ /a{3}/) {
    # "aaa" found
}

# Matching a range of repetitions
if ($string =~ /a{2,4}/) {
    # Two to four "a"s found
}

# Matching zero or more repetitions
if ($string =~ /a*/) {
    # Zero or more "a"s found
}

# Matching one or more repetitions
if ($string =~ /a+/) {
    # One or more "a"s found
}

# Matching optional characters
if ($string =~ /colou?r/) {
    # "color" or "colour" found
}

# Capturing groups and extracting matches
if ($string =~ /(pattern)/) {
    my $match = $1;  # Captured group value
}

# Global matching and extracting all matches
while ($string =~ /(\d+)/g) {
    my $match = $1;  # Captured group value
}

# Replacing matches
$string =~ s/pattern/replacement/;

# Splitting a string based on a delimiter
my @parts = split /delimiter/, $string;

# Anchoring to the beginning of the string
if ($string =~ /^pattern/) {
    # Pattern found at the beginning of the string
}

# Anchoring to the end of the string
if ($string =~ /pattern$/) {
    # Pattern found at the end of the string
}

