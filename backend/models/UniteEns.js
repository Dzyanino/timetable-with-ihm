module.exports = (sequelize,DataTypes) => {
    const UniteEnsModel = sequelize.define('UniteEns',
        {
            codeUnite: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            designation: {
                type: DataTypes.STRING(100),
                allowNull: false,
            }
        },
        {
            tableName: "UniteEns",
            timestamps: false,
        }
    );
    
    return UniteEnsModel;
}