import 'en.dart';

class Es implements En {
  Direction $direction = Direction.ltr;
  String $name = "Français";
  String $code = "fr";

  Map<String, String> dictionary = {
    // common
    "cancel": "Annuler",
    "close": "Fermer",
    "save": "Enregistrer",
    "reset": "Réinitialiser",
    "continue": "Continuer",
    "add": "Ajouter",
    "edit": "Modifier",
    "delete": "Supprimer",
    "archive": "Archiver",
    "restore": "Restaurer",
    "logout": "Déconnexion",
    "noResultsFound": "Aucun résultat trouvé",
    "home": "Accueil",
    "calendar": "Calendrier",
    "gettingImages": "Récupération des images",

    // call
    "callLaboratory": "Appeler le laboratoire",
    "callPatient": "Appeler le patient",
    "emailDoctor": "Envoyer un email au docteur",
    "callIssuer": "Appeler l'émetteur",

    // screens
    "settings": "Paramètres",
    "dashboard": "Tableau de bord",
    "appointments": "Rendez-vous",
    "patients": "Patients",
    "doctors": "Docteurs",
    "labworks": "Travaux de laboratoire",
    "statistics": "Statistiques",

    // dashboard
    "admin": "Admin",
    "fullStats": "Statistiques complètes",
    "payments": "Paiements",
    "appointmentsToday": "Rendez-vous aujourd'hui",
    "patientsToday": "Patients aujourd'hui",
    "newPatientsToday": "Nouveaux patients aujourd'hui",
    "paymentsMadeToday": "Paiements effectués aujourd'hui",
    "modeAdmin": "ADMIN",
    "modeUser": "UTILISATEUR",
    "modeOffline": "HORS LIGNE",
    "onceConnectionIsStable":
        "Une fois que votre connexion sera stable, vous pourrez utiliser le bouton en haut à droite pour vous reconnecter.",
    "unRestrictedAccess": "accès illimité dans l'application",
    "restrictedAccess":
        "accès restreint à certains écrans selon les directives de l'administrateur",
    "youAreCurrentlyIn": "Vous êtes actuellement en mode",
    "mode": "mode",
    "youHave": "Vous avez",
    "hello": "Bonjour",

    // datatable
    "archiveSelected": "Archiver la sélection",
    "searchPlaceholder": "Rechercher...",
    "showHideArchived": "Afficher/Masquer les archivés",
    "showing": "Affichage",
    "by": "Par",
    "byTitle": "Par titre",
    "byDate": "Par date",
    "noItemsFound": "Aucun élément trouvé",
    "filter": "Filtrer",

    // doctors
    "doctor": "Docteur",
    "newDoctor": "Nouveau docteur",
    "doctorDetails": "Détails du docteur",
    "pastAppointments": "Rendez-vous passés",
    "upcomingAppointments": "Rendez-vous à venir",
    "doctorName": "Nom du docteur",
    "doctorEmail": "Email du docteur",
    "dutyDays": "Jours de service",
    "addAppointment": "Ajouter un rendez-vous",
    "lockToUsers":
        "Seuls les utilisateurs suivants peuvent voir/modifier les données et les rendez-vous de ce docteur",
    "noUpcomingAppointmentsForThisDoctor":
        "Aucun rendez-vous à venir trouvé. Utilisez le bouton ci-dessous pour en enregistrer un nouveau",

    // days and months
    "monday": "Lundi",
    "tuesday": "Mardi",
    "wednesday": "Mercredi",
    "thursday": "Jeudi",
    "friday": "Vendredi",
    "saturday": "Samedi",
    "sunday": "Dimanche",
    "january": "Janvier",
    "february": "Février",
    "march": "Mars",
    "april": "Avril",
    "may": "Mai",
    "june": "Juin",
    "july": "Juillet",
    "august": "Août",
    "september": "Septembre",
    "october": "Octobre",
    "november": "Novembre",
    "december": "Décembre",

    // appointment card
    "appointment": "Rendez-vous",
    "patient": "Patient",
    "photos": "Photos",
    "pre-opNotes": "Notes pré-opératoires",
    "post-opNotes": "Notes post-opératoires",
    "prescription": "Ordonnance",
    "pay": "Payer",
    "paid": "Payé",
    "price": "Prix",
    "underpaid": "Sous-payé",
    "overpaid": "Surpayé",
    "fullyPaid": "Entièrement payé",
    "paymentSummary": "Résumé du paiement",
    "editingAppointment": "Modification du rendez-vous",
    "after": "Après",
    "days": "jours",
    "day": "jour",
    "isDone": "Le rendez-vous est terminé",

    // patients
    "patientDetails": "Détails du patient",
    "age": "Âge",
    "gender": "Genre",
    "last visit": "Dernière visite",
    "total payments": "Total des paiements",
    "daysAgo": "il y a jours",
    "noVisits": "Aucune visite",
    "addNewPatient": "Ajouter un nouveau patient",
    "name": "Nom",
    "birthYear": "Année de naissance",
    "phone": "Téléphone",
    "email": "Email",
    "address": "Adresse",
    "notes": "Notes",
    "patientTags": "Étiquettes du patient",
    "male": "Homme",
    "female": "Femme",
    "noAppointmentsFound":
        "Aucun rendez-vous trouvé pour ce patient, utilisez le bouton ci-dessous pour ajouter un nouveau rendez-vous.",
    "editPatient": "Modifier le patient",
    "editAppointment": "Modifier le rendez-vous",
    "patientPage": "Page Web du patient",
    "patientCanUseTheFollowing":
        "Le patient peut utiliser le lien suivant pour accéder à ses rendez-vous, paiements et photos.",
    "printQR": "Imprimer le code QR",
    "dentalNotes": "Notes dentaires",
    "showPrimary": "Afficher les primaires",
    "showPermanent": "Afficher les permanents",
    "primary": "Primaire",
    "permanent": "Permanent",
    "lower": "Inférieur",
    "upper": "Supérieur",
    "left": "Gauche",
    "right": "Droite",
    "centralIncisor": "Incisive centrale",
    "lateralIncisor": "Incisive latérale",
    "canine": "Canine",
    "firstPremolar": "Première prémolaire",
    "secondPremolar": "Deuxième prémolaire",
    "firstMolar": "Première molaire",
    "secondMolar": "Deuxième molaire",
    "thirdMolar": "Troisième molaire",
    "exportSelected": "Exporter la sélection",
    "noPatientsSelected": "Aucun patient sélectionné",

    // calendar (appointments)
    "allDoctors": "Tous les docteurs",
    "noAppointmentsForThisDay": "Aucun rendez-vous pour ce jour",
    "weekAbbr": "S",
    "twoWeeksAbbr": "2S",
    "monthAbbr": "M",
    "today": "Aujourd'hui",
    "newPatient": "Nouveau patient",
    "date": "Date",
    "changeDate": "Changer la date",
    "changeTime": "Changer l'heure",
    "attention": "Attention",
    "doctorNotAvailable":
        "L'un des docteurs sélectionnés pourrait ne pas être disponible à la date sélectionnée.",
    "time": "Heure",
    "preOperativeNotes": "Notes pré-opératoires",
    "selectDoctors": "Sélectionner les docteurs",
    "selectPatient": "Sélectionner le patient",
    "operativeDetails": "Détails opératoires",
    "postOperativeNotes": "Notes post-opératoires",
    "printPrescription": "Imprimer l'ordonnance",
    "priceIn": "Prix en",
    "paidIn": "Payé en",
    "gallery": "Galerie",
    "link": "Lien",
    "upload": "Télécharger",
    "camera": "Caméra",
    "emptyGallery": "Galerie vide",
    "noPhotos": "Aucune photo n'a été téléchargée pour le moment.",
    "importingPhotosFromLink": "Importation de photos depuis un lien",
    "useThisForm":
        "Utilisez ce formulaire pour importer des photos à partir de liens de partage, comme Google Photos, ou toute page web accessible contenant des photos que vous souhaitez ajouter à ce rendez-vous.",
    "error": "Erreur",
    "enterLink": "Entrez une URL contenant des photos",
    "import": "Importer",

    // labworks
    "laboratory": "Laboratoire",
    "month": "mois",
    "newLabwork": "Nouveau travail de laboratoire",
    "labwork": "travail de laboratoire",
    "labworkTitle": "Titre du travail de laboratoire",
    "orderNotes": "Notes de commande",
    "unpaid": "Non payé",
    "noSuggestions": "Aucune suggestion",

    // expenses
    "expense": "Dépense",
    "expenses": "Dépenses",
    "receipt": "Reçu",
    "title": "Titre",
    "cost": "Coût",
    "issuer": "Émetteur",
    "amount": "Montant",
    "amountIn": "Montant en",
    "status": "Statut",
    "due": "Dû",
    "receiptTitle": "Titre du reçu",
    "receiptNotes": "Notes du reçu",
    "newReceipt": "Nouveau reçu",
    "receiptTags": "Étiquettes du reçu",
    "receiptItems": "Articles du reçu",
    "specificForDoctors": "Spécifique pour les docteurs suivants",

    // stats
    "pickRange": "Choisir la plage",
    "start": "Début",
    "end": "Fin",
    "weeks": "Semaines",
    "months": "Mois",
    "quarters": "Trimestres",
    "years": "Années",
    "appointmentsPer": "Rendez-vous par",
    "paymentsAndExpensesPer": "Paiements et dépenses par",
    "newPatientsPer": "Nouveaux patients par",
    "doneMissedPer": "Terminés & Manqués par",
    "timeOfDay": "Heure de la journée",
    "dayOfWeek": "Jour de la semaine",
    "dayOfMonth": "Jour du mois",
    "monthOfYear": "Mois de l'année",
    "patientsGender": "Genre des patients",
    "total": "Total",
    "in_Duration_": "en",
    "acquiredPatientsIn": "Patients acquis en",
    "doneAndMissedAppointmentsIn": "Rendez-vous terminés et manqués en",
    "distributionOfAppointments": "Répartition des rendez-vous",
    "maleAndFemalePatients": "Patients hommes et femmes",
    "done": "terminé",
    "missed": "manqué",

    // settings
    "currency": "Devise",
    "currency_desc":
        "Code de devise à utiliser dans toute l'application (par exemple, USD, EUR, IQD).",
    "phone_desc":
        "Le numéro de téléphone sera affiché dans les impressions et la page web des patients.",
    "prescriptionFooter": "Pied de page de l'ordonnance",
    "prescriptionFooter_desc": "Ce texte sera affiché en bas de l'ordonnance.",
    "language": "Langue",
    "language_desc":
        "La langue de l'interface pour les menus, boutons et informations utilisés dans l'application.",
    "startingDayOfWeek": "Jour de début de la semaine",
    "startingDayOfWeek_desc": "Le jour de la semaine où commence la semaine.",
    "dateFormat": "Format de date",
    "dateFormat_desc":
        "Ce format sera utilisé pour afficher les dates là où c'est applicable.",
    "cacheReset": "Réinitialisation du cache",
    "cacheReset_desc":
        "En utilisant le bouton ci-dessous, vous pouvez supprimer les données enregistrées localement (sauf les images), cela pourrait résoudre certains problèmes de synchronisation si vous en rencontrez.",
    "month/day/year": "Mois/Jour/Année",
    "day/month/year": "Jour/Mois/Année",
    "appliesTo": "S'applique à",
    "all": "Tous",
    "you": "vous",
    "initialSynchronization": "Synchronisation initiale",
    "synchronizing": "Synchronisation",
    "clearingLocalData": "Effacement des données locales",

    // advanced settings: Backups
    "backups": "Sauvegardes",
    "refresh": "Rafraîchir",
    "download": "Télécharger",
    "createNew": "Créer nouveau",
    "restoreBackup": "Restaurer la sauvegarde",
    "restoreBackupWarning1":
        "La restauration de cette sauvegarde écrasera toutes les données actuellement présentes dans l'application. Toutes les modifications que vous avez apportées après la date de cette sauvegarde",
    "restoreBackupWarning2":
        "seront perdues.\n\nÊtes-vous sûr de vouloir restaurer cette sauvegarde?",
    "sureDeleteBackup": "Êtes-vous sûr de vouloir supprimer cette sauvegarde",
    "backupDate": "Date de la sauvegarde",
    "useTheFollowingLinkToDownloadTheBackup":
        "Utilisez le lien suivant pour télécharger la sauvegarde",

    // advanced settings: Admins
    "admins": "Administrateurs",
    "accountCreated": "Compte créé",
    "editAdmin": "Modifier l'administrateur",
    "validEmailMustBeProvided": "Un email valide doit être fourni",
    "password": "Mot de passe",
    "leaveBlankToKeepUnchanged": "Laissez vide pour ne pas changer",
    "updatingPassword": "Mise à jour du mot de passe",
    "leaveItEmpty":
        "Laissez le champ du mot de passe vide si vous ne souhaitez pas le changer.",
    "newAdmin": "Nouvel administrateur",
    "minimumPasswordLength": "Mot de passe de minimum 10 caractères",

    // advanced settings: Users
    "users": "Utilisateurs",
    "editUser": "Modifier l'utilisateur",
    "newUser": "Nouvel utilisateur",

    // advanced settings: Permissions
    "permissions": "Permissions des utilisateurs",
    "usersCanAccess": "Les utilisateurs peuvent accéder",
    "permissionsNotice":
        "Les permissions suivantes s'appliquent aux utilisateurs listés ci-dessus et à l'accès hors ligne. Cependant, les administrateurs comme vous, ont un accès illimité dans l'application, sauf si vous êtes hors ligne.",

    // advanced settings: prod tests
    "prodTests": "Tests de production",
    "fileStorageTest": "Test de stockage de fichiers",
    "fileStorageTestDesc":
        "Utilisez le bouton suivant pour tester si le stockage S3 fonctionne correctement.",
    "fileStorageButton": "Tester la configuration S3",
    "fileStorageFail": "Échec de la configuration S3",
    "fileStorageSuccess": "La configuration S3 fonctionne correctement",
    "emailTest": "Test d'email",
    "emailTestDesc":
        "Utilisez le bouton suivant pour tester si votre serveur peut envoyer des emails correctement. Un email de type réinitialisation de mot de passe devrait être envoyé à l'adresse email cible.",
    "targetEmail": "Email cible",
    "emailTestButton": "Envoyer un email de test",
    "emailTestFail": "Échec du test d'email",
    "emailTestSuccess":
        "Email envoyé avec succès, veuillez vérifier votre boîte de réception.",
    "fail": "Échec",
    "success": "Succès",

    // login
    "login": "Connexion",
    "resetPassword": "Réinitialiser le mot de passe",
    "serverUrl": "URL du serveur",
    "proceedOffline": "Continuer hors ligne",
    "youLLGet": "Recevoir un lien de réinitialisation par email",
    "beenSent":
        "Les instructions de réinitialisation du mot de passe vous ont été envoyées, vérifiez votre boîte de réception.",

    // other
    "sureArchiveSelected":
        "Êtes-vous sûr de vouloir archiver les éléments sélectionnés?",
    "sureClosePanel":
        "Êtes-vous sûr de vouloir fermer ce panneau? Toutes les modifications non enregistrées seront perdues.",
    "sure": "Sûr",
    "back": "Retour",
    "firstLaunchDialogTitle": "Bienvenue sur Apexo",
    "firstLaunchDialogContent":
        "Vous avez installé Apexo avec succès. Cependant, pour une meilleure expérience et une utilisation réelle, vous aurez quelques configurations à faire. Scannez le code QR ci-dessous pour commencer.",
    "newVersionDialogTitle": "Nouvelle version disponible",
    "newVersionDialogContent":
        "Une nouvelle version d'Apexo est disponible. Veuillez mettre à jour vers la dernière version pour obtenir la meilleure expérience. Scannez le code QR ci-dessous pour commencer.",
  };
}
