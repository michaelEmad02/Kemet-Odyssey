import json
import os

def transform_json(file_path, old_prefix, new_prefix):
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        return

    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    def process_item(item):
        if isinstance(item, dict):
            for key, value in item.items():
                if isinstance(value, str):
                    if value.startswith(old_prefix):
                        item[key] = value.replace(old_prefix, new_prefix, 1)
                elif isinstance(value, (dict, list)):
                    process_item(value)
        elif isinstance(item, list):
            for i in range(len(item)):
                if isinstance(item[i], str):
                    if item[i].startswith(old_prefix):
                        item[i] = item[i].replace(old_prefix, new_prefix, 1)
                elif isinstance(item[i], (dict, list)):
                    process_item(item[i])

    process_item(data)

    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    
    print(f"Successfully updated {file_path}")

# Configuration
old_base = "gs://journey-partnet.appspot.com/All_places/cairo/"
new_base = "https://res.cloudinary.com/da1tzfmuk/image/upload/"

# Files to update
files = [
    r"c:\flutter Projects\Kemet Odyssey\Project Assets\Egypt.json",
    r"c:\flutter Projects\Kemet Odyssey\Project Development Files\Kemet-Odyssey\kemet_odyssey\lib\core\assets\data\Egypt.json"
]

for file in files:
    transform_json(file, old_base, new_base)
