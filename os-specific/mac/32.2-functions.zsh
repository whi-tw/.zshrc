function heic2jpg() {
  # Convert HEIC to JPG
  # Usage: heic2jpg <file.heic>
  heif-convert "${1}" "${1/${1##*.}/jpg}"
}
