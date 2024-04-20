module.exports = (sequelize,DataTypes) => {
    const ParcoursModel = sequelize.define('Parcours',
        {
            codeParcours: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            designation: {
                type: DataTypes.STRING(100),
                allowNull: false,
            },
            abbreviation: {
                type: DataTypes.STRING(25),
                allowNull: false,
            },
            codeMention: {
                type: DataTypes.INTEGER,
                allowNull: false,
            }
        },
        {
            tableName: "Parcours",
            timestamps: false,
        }
    );

    return ParcoursModel;
}