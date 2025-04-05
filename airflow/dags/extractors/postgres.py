import psycopg2
import pandas as pd


class PostgresExtractor:
    """
    Classe para extrair, inserir, atualizar e deletar dados em um banco de dados PostgreSQL.
    """

    def __init__(self, host, dbname, user, password, port=5432):
        self.conn_params = {
            "host": host,
            "dbname": dbname,
            "user": user,
            "password": password,
            "port": port,
        }
        self.connection = None

    def connect(self):
        if self.connection is None or self.connection.closed != 0:
            self.connection = psycopg2.connect(**self.conn_params)

    def fetch_dataframe(self, query, params=None):
        self.connect()
        with self.connection.cursor() as cursor:
            cursor.execute(query, params)
            columns = [desc[0] for desc in cursor.description]
            rows = cursor.fetchall()
        return pd.DataFrame(rows, columns=columns)

    def fetch_records(self, query, params=None):
        self.connect()
        with self.connection.cursor() as cursor:
            cursor.execute(query, params)
            return cursor.fetchall()

    def close(self):
        if self.connection and self.connection.closed == 0:
            self.connection.close()
