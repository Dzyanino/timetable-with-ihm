const { Sequelize, DataTypes } = require("sequelize");

const EdtModel = require("../models/Edt");
const ElementConstModel = require("../models/ElementConst");
const EnseignantModel = require("../models/Enseignant");
const GradeModel = require("../models/Grade");
const MentionModel = require("../models/Mention");
const ParcoursModel = require("../models/Parcours");
const SalleModel = require("../models/Salle");
const UniteEnsModel = require("../models/UniteEns");

const conProps = {
    databaseName: "timetable-with-ihm",
    username: "remoteUser",
    password: "remote_User",
    host: "192.168.56.103",
    dialect: "postgres"
};
const sequelize = new Sequelize(conProps.databaseName, conProps.username, conProps.password, {
    host: conProps.host,
    dialect: conProps.dialect,
    pool: {
        max: 10,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});

const Edt = EdtModel(sequelize, DataTypes);
const ElementConst = ElementConstModel(sequelize, DataTypes);
const Enseignant = EnseignantModel(sequelize, DataTypes);
const Grade = GradeModel(sequelize, DataTypes);
const Mention = MentionModel(sequelize, DataTypes);
const Parcours = ParcoursModel(sequelize, DataTypes);
const Salle = SalleModel(sequelize, DataTypes);
const UniteEns = UniteEnsModel(sequelize, DataTypes);


module.exports = {
    sequelize,
    Edt,
    ElementConst,
    Enseignant,
    Grade,
    Mention,
    Parcours,
    Salle,
    UniteEns
}