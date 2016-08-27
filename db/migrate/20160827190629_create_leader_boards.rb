class CreateLeaderBoards < ActiveRecord::Migration[5.0]
  def change
    execute <<-SQL
      DROP VIEW IF EXISTS monthly_rankings;
      DROP VIEW IF EXISTS monthly_received;
      DROP VIEW IF EXISTS monthly_giving;

      CREATE VIEW monthly_received AS
        SELECT
          to_id       AS employee_id,
          month,
          year,
          sum(amount) AS total_received
        FROM kudo_transactions
        GROUP BY to_id, month, year;
      CREATE VIEW monthly_giving AS
        SELECT
          from_id     AS employee_id,
          month,
          year,
          sum(amount) AS total_giving
        FROM kudo_transactions
        GROUP BY from_id, month, year;

      CREATE VIEW monthly_rankings AS
        SELECT
          employee_id,
          month,
          year,
          total_received,
          rank()
          OVER (PARTITION BY month, year
            ORDER BY total_received DESC)
        FROM monthly_received;
    SQL
  end
end
