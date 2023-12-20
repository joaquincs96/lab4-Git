# Iteramos sobre todos los archivos fastq en la carpeta actual
for file in *.fastq; do
    # Obtenemos el cuarto superior del archivo y sobreescribimos el archivo original
    head -n $(($(wc -l < "$file") / 4)) "$file" > "$file".temp
    mv "$file".temp "$file"
done


