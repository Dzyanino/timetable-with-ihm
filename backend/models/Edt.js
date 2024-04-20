module.exports = (sequelize,DataTypes) => {
    const EdtModel = sequelize.define('Edt',
        {
            numeroEdt: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            codeCours: {
                type: DataTypes.INTEGER,
                allowNull: false,
            },
            idEnseignant: {
                type: DataTypes.INTEGER,
                allowNull: false,
            },
            numeroSalle: {
                type: DataTypes.STRING(3),
                allowNull: false,
            },
            niveau: {
                type: DataTypes.STRING(2),
                allowNull: false,
            },
            codeParcours: {
                type: DataTypes.INTEGER,
                allowNull: false,
            },
            groupe: {
                type: DataTypes.STRING(8),
                allowNull: false,
            },
            date: {
                type: DataTypes.DATE,
                allowNull: false,
            },
            horaire: {
                type: DataTypes.INTEGER,
                allowNull: false,
            }
        },
        {
            tableName: "EDT",
            timestamps: false,
        }
    );
    
    return EdtModel;
}