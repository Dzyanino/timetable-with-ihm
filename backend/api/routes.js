const express = require("express");
const router = express.Router();
const { Edt, ElementConst, Enseignant, Grade, Mention, Parcours, Salle, UniteEns, sequelize } = require("../database")
const { body, validationResult } = require("express-validator")



// GET EDT --------------------------------------------------------------------
router.get('/edt', async (request, response) => {
    const edt = await Edt.findAll({ order: ['date'], limit: 72 });
    response.json(edt);
})

// GET ELEMENT CONST --------------------------------------------------------------------
router.get('/element', async (request, response) => {
    const element = await ElementConst.findAll();
    response.json(element);
})

// GET ENSEIGNANT --------------------------------------------------------------------
router.get('/enseignant', async (request, response) => {
    const enseignant = await Enseignant.findAll();
    response.json(enseignant);
})
// GET GRADE --------------------------------------------------------------------
router.get('/grade', async (request, response) => {
    const grade = Grade.findAll();
    response.json(grade);
})
// GET MENTION --------------------------------------------------------------------
router.get('/mention', async (request, response) => {
    const mention = await Mention.findAll();
    response.json(mention);
})

// GET PARCOURS --------------------------------------------------------------------
router.get('/parcours', async (request, response) => {
    const parcours = await Parcours.findAll();
    response.json(parcours);
})

// GET SALLE --------------------------------------------------------------------
router.get('/salle', async (request, response) => {
    const salle = await Salle.findAll();
    response.json(salle);
})

// GET UNITE ENS --------------------------------------------------------------------
router.get('/unite', async (request, response) => {
    const unite = await UniteEns.findAll();
    response.json(unite);
})

// // GET ALL --------------------------------------------------------------------
// router.get('/enseignants', async (request, response) => {
//     const enseignants = await SalEns.findAll({ order: ['numEns'] }); // limit: 25,
//     response.json(enseignants);
// });
// router.get('/maxies', async (request, response) => {
//     const enseignants = await SalEns.findAll({
//         attributes: [
//             [sequelize.fn('MIN', sequelize.literal('"nbHeure" * "tauxHoraire"')), 'minSalaire'],
//             [sequelize.fn('MAX', sequelize.literal('"nbHeure" * "tauxHoraire"')), 'maxSalaire'],
//             [sequelize.fn('SUM', sequelize.literal('"nbHeure" * "tauxHoraire"')), 'totalSalaire']
//         ]
//     });
//     response.json(enseignants);
// });


// // EDIT ONE --------------------------------------------------------------------
// router.post('/edit-enseignant', [
//     body("numEns").isInt().notEmpty(),
//     body("nom").isString().notEmpty(),
//     body("nbHeure").isFloat().notEmpty(),
//     body("tauxHoraire").isFloat().notEmpty()
// ], async (request, response) => {
//     const validationErrors = validationResult(request);
//     if (!validationErrors.isEmpty()) {
//         return response.status(400).json({ erreurs: validationErrors.array() });
//     }

//     try {
//         await SalEns.update({
//             nom: request.body.nom,
//             nbHeure: request.body.nbHeure,
//             tauxHoraire: request.body.tauxHoraire
//         }, {
//             where: {
//                 numEns: request.body.numEns
//             }
//         });
//         response.status(200).json({ message: `Enseignant ${request.body.nom} modifié` });
//     } catch (error) {
//         return response.status(400).json({ erreurs: error })
//     }
// });


// // ADD ONE --------------------------------------------------------------------
// router.post('/add-enseignant', [
//     body("nom").isString().notEmpty(),
//     body("nbHeure").isFloat().notEmpty(),
//     body("tauxHoraire").isFloat().notEmpty()
// ], async (request, response) => {
//     const validationErrors = validationResult(request);
//     if (!validationErrors.isEmpty()) {
//         return response.status(400).json({ erreurs: validationErrors.array() });
//     }

//     try {
//         const enseignant = await SalEns.create({
//             nom: request.body.nom,
//             nbHeure: request.body.nbHeure,
//             tauxHoraire: request.body.tauxHoraire
//         });
//         response.status(200).json({ message: `Enseignant ${enseignant.nom} ajouté` });
//     } catch (error) {
//         return response.status(400).json({ erreurs: error })
//     }
// });


// // DELETE ONE --------------------------------------------------------------------
// router.delete('/remove-enseignant/:idEnseignant', async (request, response) => {
//     const idEns = request.params.idEnseignant
//     if (idEns == null || isNaN(parseInt(idEns))) {
//         return response.status(400).json({ erreurs: "Identifiant erroné ou manquant" });
//     }

//     try {
//         await SalEns.destroy({
//             where: {
//                 numEns: parseInt(idEns)
//             }
//         });
//         response.status(200).json({ message: "Enseignant supprimé" });
//     } catch (error) {
//         return response.status(400).json({ erreurs: error })
//     }
// });

module.exports = router;