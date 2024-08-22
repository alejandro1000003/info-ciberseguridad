
## Tipos de cuentas de usuario en Windows

### Usuario local (local user account)
Cuentas de usuario almacenadas localmente en el dispositivo. La información se encuentra en el archivo SAM.

#### Cuenta de usuario (User account)

- **Administrador (Administrator)**
  - Acceso completo a todas las características del sistema.
  - No se puede eliminar.
  - Deshabilitado por defecto.

- **Invitado (Guest)**
  - Usuario con acceso limitado y sin persistencia.
  - Deshabilitado por defecto.

- **Estándar (Standard)**
  - **Primer usuario (First user)**
    - Usuario con el que se instala el sistema y que pertenece al grupo Administradores (Administrators).

#### Cuenta de sistema (System account)

- **SYSTEM**
  - Cuenta interna utilizada por servicios que necesitan la capacidad de autenticarse internamente.
  - Tiene permisos absolutos sobre todo el sistema de archivos NTFS del sistema.

- **NETWORK SERVICE**
  - Cuenta predefinida para el Service Control Manager (SCM).
  - Un servicio que corre en el contexto de esta cuenta presenta las credenciales del ordenador a servicios remotos.

- **LOCAL SERVICE**
  - Cuenta predefinida usada por el Service Control Manager.
  - Tiene privilegios mínimos en el sistema local.
  - Presenta credenciales anónimas en la red.

### Cuenta de servicio (Service account)

- **Standalone Manage Service Account (MSA, Managed Service Account)**
  - Elimina la necesidad de que un administrador introduzca manualmente el SPN y credenciales de la cuenta.
  - No se pueden compartir recursos a otras máquinas.
  - Disponible a partir de Windows Server 2008 R2.

- **Group-Managed Service Account (gMSA)**
  - Son una extensión de Standalone Manage Service Account.
  - Proveen gestión de contraseñas automática, gestión de SPN simplificado y delegación de gestión a otros administradores.
  - Se pueden compartir recursos entre varias máquinas (load balancing).
  - Disponible a partir de Windows Server 2008 R2.

- **Virtual Service Account**
  - Cuentas locales gestionadas que simplifican la administración de servicios.
  - Se generan automáticamente.
  - Pueden acceder a la red en un entorno de dominio.
  - No requieren administración de contraseñas.
  - Los servicios que utilizan estas cuentas acceden a recursos de red usando credenciales de computer account con formato `<domain>\<computer-name>$`.
  - Disponible a partir de Windows Server 2008 R2 y Windows 7.

### Usuario de dominio (domain user account)
Cuentas de usuario en un entorno de Directorio Activo (AD).
- Se almacenan en Unidades Organizacionales (OU).
- Esta información está contenida en la base de datos NTDS.dit, que se replica en todos los Controladores de Dominio (DC) del dominio.

### Usuario Microsoft (Microsoft account)
Identidad que un usuario puede utilizar para acceder a varios servicios.
- Antiguamente se llamaba Windows Live ID.
- Requiere conexión a Internet.
- Utiliza SSO para ofrecer mayor comodidad.


# Notas sobre Órdenes de Usuarios del Sistema en Windows

Todas las órdenes harán referencia a usuarios del sistema (usuarios locales).

## Listar los usuarios del sistema:

```
net user
```
## Ver información de un usuario del sistema:

```
net user <user>
```

## Crear un usuario:

- Crear un usuario sin contraseña:

```
net user /add <user>
```

- Crear un usuario con contraseña:

```
net user /add <user> <password>
```

- Crear un usuario con contraseña aleatoria:

```
net user /add <user> *
```

## Eliminar un usuario:

```
net user /del <user>
```

## Listar la política de usuarios:

```
net accounts
```

