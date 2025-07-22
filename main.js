let db;

initSqlJs({ locateFile: file => `https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.6.2/${file}` }).then(SQL => {
  db = new SQL.Database();
  const sql = document.getElementById("setup-sql").textContent;
  db.run(sql);
});

function executarQuery() {
  const query = document.getElementById('query').value;
  let resultado;
  try {
    const res = db.exec(query);
    if (res.length === 0) {
      resultado = "Query executada com sucesso (sem retorno).";
    } else {
      const colunas = res[0].columns;
      const valores = res[0].values;
      const linhas = valores.map(v => colunas.map((c, i) => `${c}: ${v[i]}`).join(" | "));
      resultado = linhas.join("\n");
    }
  } catch (e) {
    resultado = "Erro: " + e.message;
  }
  document.getElementById('resultado').innerText = resultado;
}