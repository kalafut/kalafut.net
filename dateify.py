import os
import glob
from enum import Enum, auto

class HeaderState(Enum):
    NOT_STARTED = auto()
    STARTED = auto()
    ENDED = auto()

for fn in glob.glob("*.md"):
    header_state = HeaderState.NOT_STARTED
    valid = False
    new_lines = []

    with open(fn) as f:
        for line in f.readlines():
            match [line[:5].strip(), header_state]:
                case ["date:", *_]:
                    valid = True
                case ["---", HeaderState.NOT_STARTED]:
                    header_state = HeaderState.STARTED
                case ["---", HeaderState.STARTED]:
                    new_lines.append(f"date: {fn[:10]}\n")
                    header_state = HeaderState.ENDED

            new_lines.append(line)

    if not valid:
        with open(fn, "w") as f:
            f.writelines(new_lines)
