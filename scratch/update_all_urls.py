import json
import re
import os

def update_all_urls(file_path):
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        return

    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Regex to match the city-specific base URL
    # Matches gs://.../All_places/ followed by optional "new cities/" and the first folder name
    pattern = r"gs://journey-partnet.appspot.com/All_places/(?:new cities/)?[^/]+/"
    replacement = "https://res.cloudinary.com/da1tzfmuk/image/upload/"

    # Replace all occurrences in the content string directly
    # This is safe because these URLs are always in strings in the JSON
    updated_content = re.sub(pattern, replacement, content)

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)
    
    print(f"Successfully updated {file_path}")

# Files to update
files = [
    r"c:\flutter Projects\Kemet Odyssey\Project Assets\Egypt.json",
    r"c:\flutter Projects\Kemet Odyssey\Project Development Files\Kemet-Odyssey\kemet_odyssey\lib\core\assets\data\Egypt.json"
]

for file in files:
    update_all_urls(file)
