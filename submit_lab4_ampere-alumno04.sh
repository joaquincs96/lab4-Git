#!/bin/bash

#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno04
#SBATCH --job-name=primes_calculation
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4

# Cambia la ruta a la carpeta que contiene los archivos fastq
cd fastqc

# Mostrar tamaño inicial de la carpeta
echo "Tamaño inicial de la carpeta:"
du -sh .

# Iteramos sobre todos los archivos fastq en la carpeta actual
for file in *.fastq; do
    # Obtenemos el cuarto superior del archivo y sobreescribimos el archivo original
    head -n $(($(wc -l < "$file") / 4)) "$file" > "$file".temp
    mv "$file".temp "$file"
done

# Mostrar tamaño final de la carpeta
echo "Tamaño final de la carpeta:"
du -sh .
