# Laboratorio Terraform con Docker

Este proyecto despliega una arquitectura simple usando Terraform y Docker:

- Frontend (Nginx)
- Backend (Node.js)
- Base de datos (MySQL)
- Red Docker compartida

---

## 📌 Requisitos

- Docker instalado
- Terraform instalado

---

## 🚀 Pasos para ejecutar

### 1. Construir las imágenes Docker

```bash
cd src/api
docker build -t lab/api .

cd ../web
docker build -t lab/web .
```

---

### 2. Ir a la carpeta de Terraform

```bash
cd ../../iac
```

---

### 3. Inicializar Terraform

```bash
terraform init
```

---

### 4. Crear workspace (entorno)

```bash
terraform workspace new dev
```

Ver workspaces:

```bash
terraform workspace list
```

---

### 5. Ver el plan

```bash
terraform plan
```

---

### 6. Aplicar configuración

```bash
terraform apply
```

Escribir:

```
yes
```

---

## 🌐 Acceso

- Frontend: http://localhost:5001
- Backend: http://localhost:5002

---

## 🧠 Notas

- La base de datos MySQL no expone puertos (solo red interna)
- Los contenedores se comunican mediante la red Docker
- Se utilizan workspaces para manejar entornos (dev / default)

---