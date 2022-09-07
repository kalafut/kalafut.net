import os

files = []
with os.scandir(".") as it:
    for entry in it:
        if entry.name.endswith('.md') and entry.is_file():
            files.append(entry.name)

for fn in files[:2]:
    header_started = False
    header_finished = False
    valid = False
    changed = False
    new_lines = []

    with open(fn) as f:
        for line in f.readlines():
            if line.startswith("date:"):
                valid = True
                break

            if line.startswith("---") and not header_finished:
                if not header_started:
                    header_started = True
                else:
                    post_date = fn[:10]
                    new_lines.append(f"date: {post_date}\n")
                    header_finished = True

            new_lines.append(line)

    if not valid:
        with open(fn, "w") as f:
            f.writelines(new_lines)

#    if valid:
#        print(f"No updated needed for {fn}")


#print(files)
