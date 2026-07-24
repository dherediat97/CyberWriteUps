$i = 1
Get-ChildItem -Path "images" -File | Sort-Object LastWriteTime | ForEach-Object {
    $nuevoNombre = "star_wars_II_$i.png"
    Rename-Item -Path $_.FullName -NewName $nuevoNombre
    $i++
}