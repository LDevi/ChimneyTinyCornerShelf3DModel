// Dimensions de l'étagère
longueur = 280;
largeur = 115;
largeur_suppl_etage_2 = 14;
largeur_deuxieme_etage = largeur + largeur_suppl_etage_2;
epaisseur = 10;
epaisseur_fond = 2;
epaisseur_rebord = 5;
hauteur_etage = 140;
diametre_pied = 4;
rayon_pied = diametre_pied/2;
hauteur_pied = hauteur_etage * 2 + 2; // Hauteur des pieds

angle_inclinaison_pieds = 5; // Angle d'inclinaison des pieds

module etagere_avec_rebord(largeur_additionnelle = 0) {
    difference() {
        cube([longueur, largeur+largeur_additionnelle, epaisseur]);
        translate([epaisseur_rebord/2, epaisseur_rebord/2, epaisseur_fond])
            cube([longueur - epaisseur_rebord, largeur - epaisseur_rebord + largeur_additionnelle, epaisseur * 2 ]);
    }
}

// Fonction pour créer un pied
module pied_incline() {
    rotate([angle_inclinaison_pieds, 0, 0])
        pied();
}

module pied() {
    cylinder(h = hauteur_pied, d = diametre_pied);
}

// Création de l'étagère principale
etagere_avec_rebord();

// Création de l'étage à hauteur_etage cm de hauteur
translate([0, -largeur_suppl_etage_2, hauteur_etage])
    etagere_avec_rebord(largeur_suppl_etage_2);

// Création de l'étage à hauteur_etage cm de hauteur
translate([0, -largeur_suppl_etage_2 *2, hauteur_etage*2])
    etagere_avec_rebord(largeur_suppl_etage_2*2);
    
    


//Pied coin 1
translate([rayon_pied, rayon_pied, 0])
    pied_incline();

//Pied millieu 1
translate([longueur/2 - rayon_pied, rayon_pied, 0])
    pied_incline();
//Pied coin 2
translate([longueur - rayon_pied, rayon_pied, 0])
    pied_incline();
//Pied coin 3 
translate([rayon_pied, largeur - rayon_pied, 0])
    pied();

//Pied coin 4 
translate([longueur - rayon_pied, largeur - rayon_pied, 0])
    pied();

//Pied coin 4 
translate([longueur - rayon_pied, largeur/2 - rayon_pied, 0])
    pied();


