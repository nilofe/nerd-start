import subprocess
import os
import sys

def mi_funcion():
    mi_variable = sys.argv[1]
    print("Mi variable:", mi_variable)
    return mi_variable

def crear_instancia():
    mi_variable = mi_funcion()  # Llamar a la función mi_funcion para obtener mi_variable
    
    comando = [
        "gcloud",
        "compute",
        "instances",
        "create",
        "instance-1",
        "--project=" + mi_variable,
        "--zone=us-central1-a",
        "--machine-type=e2-micro",
        "--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default",
        "--metadata=startup-script=#! /bin/bash\napt update\napt -y install apache2\ncat <<EOF > /var/www/html/index.html\n<html><body><p>Linux startup script from a local file.</p></body></html>\nEOF",
        "--maintenance-policy=MIGRATE",
        "--provisioning-model=STANDARD",
        "--service-account=356036604186-compute@developer.gserviceaccount.com",
        "--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append",
        "--create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2210-kinetic-amd64-v20230602,mode=rw,size=10,type=projects/test-dev-54830/zones/us-central1-a/diskTypes/pd-balanced",
        "--no-shielded-secure-boot",
        "--shielded-vtpm",
        "--shielded-integrity-monitoring",
        "--labels=goog-ec-src=vm_add-gcloud",
        "--reservation-affinity=any"
    ]
    
    # Ejecutar el comando
    try:
        resultado = subprocess.run(comando, check=True, capture_output=True, text=True)
        print("Instancia creada:", resultado.stdout)
    except subprocess.CalledProcessError as e:
        print("Error al crear la instancia:", e.stderr)

crear_instancia()
