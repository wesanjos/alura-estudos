export default async function handler(req, res) {
  //voltando pra página que estava
  const previousPage = req.headers.referer;

  //Se tiver ligado o preview desliga o mesmo
  if (req.preview) {
    res.clearPreviewData();
    res.writeHead(307, { Location: previousPage });
    res.end();
  }

  //Inserção de senha para visualização do preview
  const password = "SENHA";
  if (req.query.password !== password) {
    return res.status(401).json({ message: "Invalid password" });
  }

  //Verificando se o preview está desligado, caso esteja liga
  res.setPreviewData({});
  res.writeHead(307, { Location: previousPage });
  res.end();
}
