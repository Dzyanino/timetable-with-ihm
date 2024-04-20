module.exports = (sequelize,DataTypes) => {
    const MentionModel = sequelize.define('Mention',
        {
            codeMention: {
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
            tableName: "Mention",
            timestamps: false,
        }
    );

    return MentionModel;
}