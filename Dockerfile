# Utilise l'image officielle Ubuntu comme système d'exploitation de base
FROM ubuntu

# Définit le répertoire de travail à l'intérieur du conteneur.
# Toutes les commandes suivantes seront exécutées dans /app.
WORKDIR /app

# Copie uniquement le fichier requirements.txt depuis le projet
# vers le dossier /app du conteneur.
COPY requirements.txt /app/

# Copie tous les fichiers et dossiers du projet actuel
# dans le dossier /app du conteneur.
COPY . /app/

# Met à jour la liste des paquets Ubuntu
# puis installe Python3 et pip3.
RUN apt-get update && apt-get install -y python3 python3-pip

# Installe toutes les dépendances Python indiquées
# dans le fichier requirements.txt.
RUN pip3 install --break-system-packages --no-cache-dir -r requirements.txt

# Informe Docker que l'application écoute sur le port 8000.
# Cela ne publie pas automatiquement le port.
EXPOSE 8000

# Commande principale exécutée lorsque le conteneur démarre.
# Elle lance le fichier manage.py.
ENTRYPOINT ["python3", "manage.py"]

# Arguments ajoutés à ENTRYPOINT.
# La commande finale sera :
CMD ["runserver", "0.0.0.0:8000"]
