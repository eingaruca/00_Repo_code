# Oracle Cloud

## 1. Configurar OCI Client
###  - Instalar
  ```
    https://docs.oracle.com/es-ww/iaas/Content/API/SDKDocs/cliinstall.htm#InstallingCLI__linux_and_unix
      * bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)" --accept-all-defaults
      * exec -l $SHELL
      *********** sudo python3 -m pip install pip --upgrade 
      * pip3 install oci-cli --upgrade
      * oci session authenticate  / oci setup config
  ```
###  - (No usar temporalmente) Configurar config file:
    https://docs.oracle.com/es-ww/iaas/Content/API/Concepts/apisigningkey.htm
    chmod go-rwx ~/.oci/oci_api_key.pem

## 2. Kubernetes
###   2.1. Infraestructura
- Crear Container Registry
Información básica: [Registry](https://docs.oracle.com/es-ww/iaas/Content/Registry/Concepts/registryprerequisites.htm)

- Subir imágenes al Registry (Docker push)
  - Login docker: [URL referencia](https://docs.oracle.com/es-ww/iaas/Content/Functions/Tasks/functionslogintoocir.htm)
    Es importante obtener el token del usuario.
    ```
      * docker login mad.ocir.io
        - user: axy8e4ngy2gp/isaac.agudo@atmira.com
        - pass: <use-token>
    ```
  - Necesitamos cambiar el TAG de las imágenes en local con el formato/ruta en el registry de Oracle Cloud
    ```
      Usar <url-login>/<object-tenancy>/<repo>:<version>
      docker tag <imageID> <mad.ocir.io/axy8e4ngy2gp/core:MIG-0.2.73>
    ```
  - Docker push images
    ```
      docker push <mad.ocir.io/axy8e4ngy2gp/core:MIG-0.2.73>
    ```
    
- Crear clúster en OCI 
  - Requerimientos de Red
    - Referencia: [url](https://docs.oracle.com/es-ww/iaas/Content/ContEng/Concepts/contengnetworkconfigexample.htm)
  - Creacion clúster
    -  Referencia: [url](https://docs.oracle.com/es-ww/iaas/Content/ContEng/Tasks/contengcreatingclusterusingoke_topic-Using_the_Console_to_create_a_Custom_Cluster_with_Explicitly_Defined_Settings.htm)
- Acceso al cluster
  Referencia: [url](https://docs.oracle.com/es-ww/iaas/Content/ContEng/Tasks/contengdownloadkubeconfigfile.htm#localdownload)
  - Añadir a la cadena de conexión:
  ```
        --profile eldo.ingaruca --auth security_token
      vi ~/.kube/config
          - --profile
          - eldo.ingaruca
          - --auth
          - security_token
      export OCI_CLI_PROFILE=eldo.ingaruca
  ```
  ```
      *** Cada cierto tiempo **
      oci session validate --profile XXXXXX
  ```    
- Para configurar OKE con OCI SDK Client
  Opción "Access cluster" del cluster de Kubernetes en la consola WEB (Access cluster)

### 2.2. Objectos Kubernetes
- Deployments using Container Repository
  Referencia: [url](https://www.oracle.com/webfolder/technetwork/tutorials/obe/oci/oke-and-registry/index.html)
  Para que los pods puedan utilizar las imágenes del Registry, se crea un "secret" con las credenciales y se añade el parámetro imagePullSecrets al deployment
    ```
    kubectl create secret docker-registry ocirsecret --docker-server=mad.ocir.io --docker-username=axy8e4ngy2gp/isaac.agudo@atmira.com --docker-password='<use-token>' --docker-email=isaac.agudo@atmira.com
    ```
    Modificación en yaml. Ruta imagen y parámetro imagePullSecrets
    ```  
         spec:
            containers:
            - name: core
              image: mad.ocir.io/axy8e4ngy2gp/core:MIG-0.2.73
              ports:
              - containerPort: 80
            imagePullSecrets:
              - name: ocirsecret
    ```
  
### Extra:
Ejemplo Ingress
  - Crear ingress-controller y un ingress de ejemplo
    https://docs.oracle.com/es-ww/iaas/Content/ContEng/Tasks/contengsettingupingresscontroller.htm
