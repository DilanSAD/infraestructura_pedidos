import zipfile
import os

def create_zip(zip_name, folder):
    with zipfile.ZipFile(zip_name, 'w') as zipf:
        for root, _, files in os.walk(folder):
            for file in files:
                file_path = os.path.join(root, file)
                # Agregar el archivo al ZIP manteniendo la estructura de directorios
                zipf.write(file_path, os.path.relpath(file_path, os.path.join(folder, '..')))

def main():
    # Lista de carpetas y nombres de ZIP correspondientes
    functions = {
        'lambda_procesar_pedidos': 'lambda_procesar_pedidos.zip',
        'lambda_publicar_sns': 'lambda_publicar_sns.zip'
    }

    for folder, zip_name in functions.items():
        # Crear la ruta completa para el archivo ZIP en la carpeta terraform-container
        zip_path = os.path.join(os.path.dirname(__file__), '..', zip_name)
        create_zip(zip_path, f'modules/{folder}')  # Cambia la ruta según tu estructura de carpetas
        print(f'Creado: {zip_path}')

if __name__ == "__main__":
    main()