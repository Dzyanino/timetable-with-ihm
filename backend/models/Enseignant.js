module.exports = (sequelize,DataTypes) => {
    const EnseignantModel = sequelize.define('Enseignant',
        {
            idEnseignant: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            nom: {
                type: DataTypes.STRING(100),
                allowNull: false,
            },
            prenom: {
                type: DataTypes.STRING(100),
                allowNull: true,
            },
            appelation: {
                type: DataTypes.STRING(25),
                allowNull: false,
            },
            codeGrade: {
                type: DataTypes.INTEGER,
                allowNull: false,
            }
        },
        {
            tableName: "Enseignant",
            timestamps: false,
        }
    );

    return EnseignantModel;
}