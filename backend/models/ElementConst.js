module.exports = (sequelize,DataTypes) => {
    const ElementConstModel = sequelize.define('ElementConst',
        {
            codeElement: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            designation: {
                type: DataTypes.STRING(100),
                allowNull: false,
            },
            appelation: {
                type: DataTypes.STRING(25),
                allowNull: false,
            }
        },
        {
            tableName: "ElementConst",
            timestamps: false,
        }
    );

    return ElementConstModel;
}