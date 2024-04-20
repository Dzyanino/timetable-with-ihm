module.exports = (sequelize,DataTypes) => {
    const GradeModel = sequelize.define('Grade',
        {
            codeGrade: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            titre: {
                type: DataTypes.STRING(100),
                allowNull: false,
            }
        },
        {
            tableName: "Grade",
            timestamps: false,
        }
    );

    return GradeModel;
}