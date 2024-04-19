// import { Sequelize, DataTypes } from "sequelize";
// const config = useRuntimeConfig();


// const sequelize = new Sequelize(config.dbName, config.username, config.password, {
//     host: config.host,
//     dialect: config.dialect
// });

// const Edt = sequelize.define('Edt',
//     {
//         numeroEdt: {
//             type: DataTypes.INTEGER,
//             autoIncrement: true,
//             primaryKey: true,
//         },
//         codeCours: {
//             type: DataTypes.INTEGER,
//             allowNull: false,
//         },
//         idEnseignant: {
//             type: DataTypes.INTEGER,
//             allowNull: false,
//         },
//         numeroSalle: {
//             type: DataTypes.STRING(3),
//             allowNull: false,
//         },
//         niveau: {
//             type: DataTypes.STRING(2),
//             allowNull: false,
//         },
//         codeParcours: {
//             type: DataTypes.INTEGER,
//             allowNull: false,
//         },
//         groupe: {
//             type: DataTypes.STRING(8),
//             allowNull: false,
//         },
//         date: {
//             type: DataTypes.DATE,
//             allowNull: false,
//         },
//         horaire: {
//             type: DataTypes.INTEGER,
//             allowNull: false,
//         }
//     },
//     {
//         tableName: "EDT",
//         timestamps: false,
//     }
// );

// export default async () => {
//     try {
//         sequelize.sync().then(() => {
//             console.log("Here from sequelize");
            
//         });
//     } catch (error) {
//         console.error("Yoo erreur" + error);
        
//     }
// }

console.log("Index.ts");
