module.exports = (sequelize,DataTypes) => {
    const SalleModel = sequelize.define('Salle',
        {
            numeroSalle: {
                type: DataTypes.STRING(3),
                autoIncrement: false,
                primaryKey: true,
            }
        },
        {
            tableName: "Salle",
            timestamps: false,
        }
    );

    return SalleModel;
}