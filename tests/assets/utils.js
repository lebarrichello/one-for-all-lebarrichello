const hasForeignKey = async (table, referencedTable, sequelize) => {
    const query = `
    SELECT COUNT(COLUMN_NAME) AS REFERENCE_COUNT
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE
      TABLE_SCHEMA = 'SpotifyClone'
        AND TABLE_NAME = '${table}'
        AND REFERENCED_TABLE_NAME = '${referencedTable}'
        AND REFERENCED_COLUMN_NAME = (
        SELECT COLUMN_NAME
            FROM information_schema.KEY_COLUMN_USAGE
            WHERE TABLE_SCHEMA = 'SpotifyClone'
            AND TABLE_NAME = '${referencedTable}' AND CONSTRAINT_NAME = 'PRIMARY'
        );`;
    const [{ REFERENCE_COUNT: referenceCount }] = await sequelize.query(
      query,
      { type: 'SELECT' },
    );

    return (referenceCount === 1);
  };

const getColumns = async (tableName, sequelize) => {
  const query = `
    SHOW COLUMNS
    FROM SpotifyClone.${tableName}`;

  const data = await sequelize.query(
    query,
    { type: 'SELECT' },
  );

  return data.filter((column) => column.Extra !== 'auto_increment');
};

const typeValues = {
  boolean: false,
  date: '"2022-02-28"',
  datetime: '"2022-02-28 10:45:55"',
  decimal: 20.1,
  int: 1,
  time: '"10:45:55"',
  year: 2022,
};

const createInsertQuery = (columns, table) => {
  const columnsNames = columns.map((column) => column.Field).join();
  const columnValues = columns.map((column) => typeValues[column.Type] || '"teste"');
  return `INSERT INTO SpotifyClone.${table} (${columnsNames}) VALUES (${columnValues})`;
};

const cleanRelationTables = async (sequelize, table) => {
  await sequelize.query(
    `DELETE FROM SpotifyClone.${table}`,
    { type: 'DELETE' },
  );
};

const duplicateForeignKey = async (table, sequelize) => {
  await cleanRelationTables(sequelize, table);
  const columns = await getColumns(table, sequelize);

  const [, rowsUpdated] = await sequelize.query(
    createInsertQuery(columns, table),
    { type: 'INSERT' },
  );

  if (!rowsUpdated) return false;

  try {
    const [error] = await sequelize.query(
      createInsertQuery(columns, table),
      { type: 'INSERT' },
    );
    if (error) return false;
  } catch (error) {
    return true;  
  }
};

  module.exports = { hasForeignKey, duplicateForeignKey };
