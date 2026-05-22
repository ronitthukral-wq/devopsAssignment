module.exports = async function (context, req) {
  context.log('HTTP trigger function processed a request.');

  const page = req.query.page || 'home';

  const pages = {
    home: `
      <div class="hero">
        <h1>🚀 DevOps Assignment</h1>
        <p>Azure Function App successfully deployed via CI/CD Pipeline</p>
        <div class="badges">
          <span class="badge green">✅ Terraform</span>
          <span class="badge blue">✅ Build Pipeline</span>
          <span class="badge purple">✅ Release Pipeline</span>
        </div>
        <div class="nav">
          <a href="?page=about">About</a>
          <a href="?page=pipeline">Pipeline Info</a>
        </div>
      </div>
    `,
    about: `
      <div class="hero">
        <h1>📋 About</h1>
        <p>This is a DevOps assignment demonstrating 3 pipeline scenarios on Azure.</p>
        <div class="nav">
          <a href="?page=home">Home</a>
          <a href="?page=pipeline">Pipeline Info</a>
        </div>
      </div>
    `,
    pipeline: `
      <div class="hero">
        <h1>⚙️ Pipeline Info</h1>
        <ul>
          <li>Scenario 1: 3 Separate YML Pipelines</li>
          <li>Scenario 2: YML + Classic Release</li>
          <li>Scenario 3: Single YML Pipeline</li>
        </ul>
        <div class="nav">
          <a href="?page=home">Home</a>
          <a href="?page=about">About</a>
        </div>
      </div>
    `
  };

  const html = `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>DevOps Assignment</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #0f0f0f;
      color: #fff;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .hero {
      background: #1a1a2e;
      border: 1px solid #e94560;
      border-radius: 12px;
      padding: 50px 60px;
      text-align: center;
      max-width: 600px;
      box-shadow: 0 0 40px rgba(233,69,96,0.2);
    }
    h1 { color: #e94560; font-size: 2rem; margin-bottom: 16px; }
    p  { color: #aaa; margin-bottom: 20px; line-height: 1.6; }
    ul { color: #aaa; text-align: left; margin: 20px auto; max-width: 300px; line-height: 2; }
    .badges { display: flex; gap: 10px; justify-content: center; flex-wrap: wrap; margin-bottom: 24px; }
    .badge { padding: 6px 16px; border-radius: 20px; font-size: 0.85rem; font-weight: bold; }
    .green  { background: #1a4731; color: #4ade80; border: 1px solid #4ade80; }
    .blue   { background: #1a2e4a; color: #60a5fa; border: 1px solid #60a5fa; }
    .purple { background: #2e1a4a; color: #c084fc; border: 1px solid #c084fc; }
    .nav { display: flex; gap: 16px; justify-content: center; margin-top: 20px; }
    .nav a {
      color: #e94560;
      text-decoration: none;
      border: 1px solid #e94560;
      padding: 8px 20px;
      border-radius: 8px;
      transition: all 0.2s;
    }
    .nav a:hover { background: #e94560; color: white; }
  </style>
</head>
<body>
  ${pages[page] || pages.home}
</body>
</html>`;

  context.res = {
    status: 200,
    headers: { 'Content-Type': 'text/html' },
    body: html
  };
};