

# CycleGAN-S2R

## Conexión con el servidor 

* **1- Transferir archivos desde carpeta local a carpeta en el cluster**
```bash
scp path_local_archivo usuario@IP_cluster:path_cluster
```

* **2- Transferir carpetas desde carpeta local a carpeta en el cluster**
```bash
scp -r path_local_carpeta usuario@IP_cluster:path_cluster
```

* **3- conexión ssh**
```bash
ssh usuario@IP_cluster
```

* **4- Crear imagen**
```bash
docker build --tag cyclegan .
```

* **5- Comando para ejecutar el script que corre el container**
```bash
sh run_docker.sh
```
* **6- Entrar al contenedor**
```bash
docker exec -it <mycontainer> bash
```
* **7- Salir del contenedor**
```bash
Ctrl + d
```

## Entrenamiento y prueba de la red

* **1- Entrenamiento**
```bash
python train.py --dataroot ./datasets/Jaime --name <nombre modelo entrenado> --print_freq 1000 --load_size 296 --lambda_identity 0 --display_id 0
```

* **2- Test**
```bash
python test.py --dataroot ./datasets/Jaime --name <nombre modelo entrenado> --model cycle_gan --netG resnet_9blocks --num_test 100 --load_size 296 --crop_size 256
```
 
## Transferir datos desde el servidor a computador local

* **1-Copiar archivos desde contenedor a remoto**
```bash
docker cp <mycontainer>:path_contenedor path_cluster
```

* **2- Copiar archivos de remoto a local**
```bash
scp -r usuario@IP_cluster:path_cluster path_local
```
