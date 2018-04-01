module.exports = {
  up: (queryInterface, Sequelize) => 
    queryInterface.createTable('logs', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      query: {
        type: Sequelize.STRING,
        allowNull: false
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      member_id: {
        type: Sequelize.STRING,
        allowNull:false,
        onDelete: 'CASCADE',
        references: {
          model: 'members',
          key: 'id',
          as: 'member_id',
        }
      }
    }),
  down: (queryInterface, Sequelize) => queryInterface.dropTable('logs'),
};