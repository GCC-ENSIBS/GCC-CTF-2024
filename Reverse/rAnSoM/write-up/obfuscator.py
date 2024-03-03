#!/usr/bin/env python3
import re
import secrets


def remove_comments(code: str) -> str:
    """Removes comments from assembly code."""
    lines = code.split("\n")
    cleaned_lines = []

    for line in lines:
        comment_start = line.find(";")
        if comment_start != -1:
            line = line[:comment_start]

        cleaned_lines.append(line.rstrip())
    return "\n".join(cleaned_lines)

def replace_single_opcode_instruction(code: str) -> str:
    """Replace single opcode instructions with obfuscated equivalent."""
    targets = {
        re.compile(r"\binc esi\b"): "46h",
        re.compile(r"\binc ecx\b"): "41h",
    }
    lines = code.split("\n")
    transformed_lines = []

    for line in lines:
        found = False
        for pattern, opcode in targets.items():
            match = pattern.search(line)
            if match:
                found = True
                transformed_lines.append(f"""
    push eax
    jmp $+3
    mov al, {opcode}
    pop eax""")
        if not found:
            transformed_lines.append(line)
    return "\n".join(transformed_lines)


def replace_labels(code: str) -> str:
    """Replace labels with random name."""
    labels = re.findall(r"^\s*(\w+):$", code, re.MULTILINE)
    for label in labels:
        if label != "_start":
            code = code.replace(label, "l" + secrets.token_hex(8))
    return code

def replace_mov_eax(code):
    """Replace mov eax, <number> with xor eax, eax; inc eax; ..."""
    mov_pattern = re.compile(r"\bmov eax, (\d+)\b")
    lines = code.split("\n")
    transformed_lines = []

    for line in lines:
        match = mov_pattern.search(line)
        if match:
            number = int(match.group(1))
            transformed_lines.append("    xor eax, eax")
            for _ in range(number):
                transformed_lines.append("    inc eax")
        else:
            transformed_lines.append(line)
    return "\n".join(transformed_lines)


if __name__ == "__main__":
    with open("rAnSoM.asm") as src_file:
        code = src_file.read()

    code = remove_comments(code)
    code = replace_single_opcode_instruction(code)
    code = replace_labels(code)
    code = replace_mov_eax(code)
    print(code)
