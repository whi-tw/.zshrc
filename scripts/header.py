import sys
header_text = sys.argv[1]
print('#' * 88)
print("#" + (" " * 86) + "#")
header_text_line = f"# {header_text}"
header_text_line += " " * ( 87 - len(header_text_line) ) + "#"
print(header_text_line)
print("#" + (" " * 86) + "#")
print('#' * 88)