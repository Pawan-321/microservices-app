![cicd-architecture](https://github.com/user-attachments/assets/1a9dcd1a-a9c1-48e4-9f6f-12fd6aaea996)1. Clone Repository
git clone https://github.com/Pawan-321/microservices-app.git
cd microservices-app

2. Create SSH Key Pair
aws ec2 create-key-pair \
    --key-name <name>\
    --query 'KeyMaterial' \
    --output text > ~/.ssh/<name>.pem

chmod 400 ~/.ssh/<name>.pem

3. Configure Terraform Variables
cd terraform/environments/dev

# Create terraform.tfvars
cat > terraform.tfvars <<EOF
aws_region    = "ap-south-1"
environment   = "dev"
key_name      = "name"
db_username   = "dbadmin"
db_password   = "YourSecurePassword123!"
EOF
4. Deploy Infrastructure
# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Deploy infrastructure
terraform apply -auto-approve

# Save outputs
terraform output > outputs.txt
5. Access Kubernetes Cluster
# Get master node IP from outputs
K8S_MASTER_IP=$(terraform output -raw k8s_master_ip)

# SSH to Kubernetes master
ssh -i ~/.ssh/<name>.pem ubuntu@$K8S_MASTER_IP

# Verify cluster status
kubectl get nodes
kubectl get pods --all-namespaces


🔄 CI/CD Pipeline
![Uploadin<svg viewBox="0 0 1200 750" xmlns="http://www.w3.org/2000/svg" font-family="'Segoe UI', system-ui, sans-serif">
  <defs>
    <!-- Background gradient -->
    <linearGradient id="bgGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0a0e1a"/>
      <stop offset="100%" style="stop-color:#111827"/>
    </linearGradient>

    <!-- Card gradients -->
    <linearGradient id="githubGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#1e293b"/>
      <stop offset="100%" style="stop-color:#1a2333"/>
    </linearGradient>
    <linearGradient id="runnerGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#1e1b3a"/>
      <stop offset="100%" style="stop-color:#1a1733"/>
    </linearGradient>
    <linearGradient id="k8sGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0f2937"/>
      <stop offset="100%" style="stop-color:#0d2230"/>
    </linearGradient>
    <linearGradient id="monGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#2d1b0e"/>
      <stop offset="100%" style="stop-color:#251608"/>
    </linearGradient>
    <linearGradient id="awsGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#1a2e1a"/>
      <stop offset="100%" style="stop-color:#142314"/>
    </linearGradient>

    <!-- Glow filters -->
    <filter id="glowBlue" x="-30%" y="-30%" width="160%" height="160%">
      <feGaussianBlur in="SourceGraphic" stdDeviation="3" result="blur"/>
      <feMerge><feMergeNode in="blur"/><feMergeNode in="SourceGraphic"/></feMerge>
    </filter>
    <filter id="glowPurple" x="-30%" y="-30%" width="160%" height="160%">
      <feGaussianBlur in="SourceGraphic" stdDeviation="3" result="blur"/>
      <feMerge><feMergeNode in="blur"/><feMergeNode in="SourceGraphic"/></feMerge>
    </filter>
    <filter id="glowGreen" x="-30%" y="-30%" width="160%" height="160%">
      <feGaussianBlur in="SourceGraphic" stdDeviation="3" result="blur"/>
      <feMerge><feMergeNode in="blur"/><feMergeNode in="SourceGraphic"/></feMerge>
    </filter>
    <filter id="glowOrange" x="-30%" y="-30%" width="160%" height="160%">
      <feGaussianBlur in="SourceGraphic" stdDeviation="3" result="blur"/>
      <feMerge><feMergeNode in="blur"/><feMergeNode in="SourceGraphic"/></feMerge>
    </filter>
    <filter id="shadow">
      <feDropShadow dx="0" dy="4" stdDeviation="6" flood-color="#000" flood-opacity="0.3"/>
    </filter>
    <filter id="cardShadow">
      <feDropShadow dx="0" dy="2" stdDeviation="4" flood-color="#000" flood-opacity="0.4"/>
    </filter>

    <!-- Arrow marker -->
    <marker id="arrowBlue" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#38bdf8"/>
    </marker>
    <marker id="arrowPurple" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#a78bfa"/>
    </marker>
    <marker id="arrowGreen" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#4ade80"/>
    </marker>
    <marker id="arrowOrange" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#fb923c"/>
    </marker>

    <!-- Animated dash pattern -->
    <style>
      @keyframes dash {
        to { stroke-dashoffset: -20; }
      }
      .animated-arrow {
        animation: dash 1.5s linear infinite;
      }
      @keyframes pulse {
        0%, 100% { opacity: 0.6; }
        50% { opacity: 1; }
      }
      .pulse { animation: pulse 2s ease-in-out infinite; }
      @keyframes glow-pulse {
        0%, 100% { opacity: 0.3; }
        50% { opacity: 0.7; }
      }
      .glow-pulse { animation: glow-pulse 3s ease-in-out infinite; }
    </style>
  </defs>

  <!-- Background -->
  <rect width="1200" height="750" fill="url(#bgGrad)"/>

  <!-- Subtle grid pattern -->
  <defs>
    <pattern id="gridPattern" width="40" height="40" patternUnits="userSpaceOnUse">
      <path d="M 40 0 L 0 0 0 40" fill="none" stroke="#1f2937" stroke-width="0.5"/>
    </pattern>
  </defs>
  <rect width="1200" height="750" fill="url(#gridPattern)" opacity="0.4"/>

  <!-- Ambient glow blobs -->
  <ellipse cx="200" cy="150" rx="150" ry="100" fill="#38bdf8" opacity="0.04" class="glow-pulse"/>
  <ellipse cx="600" cy="400" rx="200" ry="120" fill="#a78bfa" opacity="0.03" class="glow-pulse" style="animation-delay:1s"/>
  <ellipse cx="1000" cy="200" rx="160" ry="100" fill="#4ade80" opacity="0.04" class="glow-pulse" style="animation-delay:2s"/>

  <!-- ======================== -->
  <!-- TITLE                     -->
  <!-- ======================== -->
  <text x="600" y="42" text-anchor="middle" font-size="24" font-weight="700" fill="#f1f5f9" letter-spacing="2">CI/CD PIPELINE ARCHITECTURE</text>
  <text x="600" y="65" text-anchor="middle" font-size="13" fill="#64748b" letter-spacing="1">Pawan-321 / microservices-app · Self-Hosted Runner · AWS EC2</text>
  <line x1="400" y1="75" x2="800" y2="75" stroke="#334155" stroke-width="1"/>

  <!-- ======================== -->
  <!-- AWS CLOUD BORDER          -->
  <!-- ======================== -->
  <rect x="385" y="85" width="440" height="590" rx="16" fill="url(#awsGrad)" stroke="#22c55e" stroke-width="1.5" stroke-dasharray="8,4" opacity="0.7" filter="url(#cardShadow)"/>
  <rect x="385" y="85" width="150" height="28" rx="8" fill="#16a34a" opacity="0.25"/>
  <text x="398" y="104" font-size="13" font-weight="600" fill="#4ade80" letter-spacing="1">☁  AWS CLOUD</text>

  <!-- ======================== -->
  <!-- STAGE 1: GITHUB          -->
  <!-- ======================== -->
  <rect x="30" y="120" width="220" height="200" rx="14" fill="url(#githubGrad)" stroke="#334155" stroke-width="1.5" filter="url(#cardShadow)"/>
  <!-- Top accent line -->
  <rect x="30" y="120" width="220" height="4" rx="2" fill="#38bdf8"/>
  <!-- Stage badge -->
  <rect x="42" y="132" width="60" height="22" rx="11" fill="#38bdf8" opacity="0.15" stroke="#38bdf8" stroke-width="0.8"/>
  <text x="72" y="148" text-anchor="middle" font-size="11" font-weight="700" fill="#38bdf8">STAGE 1</text>

  <!-- GitHub icon (octocat simplified) -->
  <circle cx="140" cy="185" r="28" fill="#24292e" stroke="#3b4556" stroke-width="1.5"/>
  <text x="140" y="193" text-anchor="middle" font-size="28" fill="#ffffff">⬡</text>

  <text x="140" y="232" text-anchor="middle" font-size="15" font-weight="700" fill="#f1f5f9">GitHub</text>
  <text x="140" y="250" text-anchor="middle" font-size="11" fill="#64748b">Repository</text>

  <!-- Sub items -->
  <rect x="45" y="268" width="90" height="24" rx="6" fill="#1e293b" stroke="#2d3a4f" stroke-width="0.8"/>
  <text x="90" y="284" text-anchor="middle" font-size="10" fill="#94a3b8">📝 Code Push</text>
  <rect x="145" y="268" width="90" height="24" rx="6" fill="#1e293b" stroke="#2d3a4f" stroke-width="0.8"/>
  <text x="190" y="284" text-anchor="middle" font-size="10" fill="#94a3b8">🔀 Pull Req</text>

  <!-- ======================== -->
  <!-- STAGE 2: GITHUB ACTIONS  -->
  <!-- ======================== -->
  <rect x="30" y="355" width="220" height="170" rx="14" fill="url(#githubGrad)" stroke="#334155" stroke-width="1.5" filter="url(#cardShadow)"/>
  <rect x="30" y="355" width="220" height="4" rx="2" fill="#a78bfa"/>
  <rect x="42" y="367" width="60" height="22" rx="11" fill="#a78bfa" opacity="0.15" stroke="#a78bfa" stroke-width="0.8"/>
  <text x="72" y="383" text-anchor="middle" font-size="11" font-weight="700" fill="#a78bfa">STAGE 2</text>

  <text x="140" y="418" text-anchor="middle" font-size="15" font-weight="700" fill="#f1f5f9">GitHub Actions</text>
  <text x="140" y="436" text-anchor="middle" font-size="11" fill="#64748b">CI/CD Trigger</text>

  <!-- Sub items -->
  <rect x="42" y="452" width="64" height="22" rx="6" fill="#1e1b3a" stroke="#3b3366" stroke-width="0.8"/>
  <text x="74" y="467" text-anchor="middle" font-size="9" fill="#a78bfa">🔍 Validate</text>
  <rect x="114" y="452" width="64" height="22" rx="6" fill="#1e1b3a" stroke="#3b3366" stroke-width="0.8"/>
  <text x="146" y="467" text-anchor="middle" font-size="9" fill="#a78bfa">🛡️ Scan</text>
  <rect x="186" y="452" width="52" height="22" rx="6" fill="#1e1b3a" stroke="#3b3366" stroke-width="0.8"/>
  <text x="212" y="467" text-anchor="middle" font-size="9" fill="#a78bfa">🚀 Deploy</text>

  <!-- ======================== -->
  <!-- STAGE 3: SELF-HOSTED     -->
  <!-- ======================== -->
  <rect x="395" y="118" width="420" height="165" rx="14" fill="url(#runnerGrad)" stroke="#6366f1" stroke-width="1.5" filter="url(#cardShadow)"/>
  <rect x="395" y="118" width="420" height="4" rx="2" fill="#6366f1"/>
  <rect x="407" y="130" width="60" height="22" rx="11" fill="#6366f1" opacity="0.15" stroke="#6366f1" stroke-width="0.8"/>
  <text x="437" y="146" text-anchor="middle" font-size="11" font-weight="700" fill="#6366f1">STAGE 3</text>

  <!-- Runner icon -->
  <circle cx="480" cy="190" r="22" fill="#312e81" stroke="#6366f1" stroke-width="1.5"/>
  <text x="480" y="197" text-anchor="middle" font-size="20" fill="#a5b4fc">⚙</text>

  <text x="570" y="178" font-size="16" font-weight="700" fill="#f1f5f9">Self-Hosted Runner</text>
  <text x="570" y="198" font-size="11" fill="#64748b">EC2 Instance · ip-10-0-1-206</text>

  <!-- Runner tasks -->
  <rect x="460" y="215" width="155" height="22" rx="6" fill="#1e1b3a" stroke="#3b3366" stroke-width="0.8"/>
  <text x="537" y="230" text-anchor="middle" font-size="10" fill="#a5b4fc">✓ YAML Validation (yq)</text>
  <rect x="625" y="215" width="175" height="22" rx="6" fill="#1e1b3a" stroke="#3b3366" stroke-width="0.8"/>
  <text x="712" y="230" text-anchor="middle" font-size="10" fill="#a5b4fc">✓ Security Scan (Trivy)</text>

  <!-- ======================== -->
  <!-- STAGE 4: KUBERNETES      -->
  <!-- ======================== -->
  <rect x="395" y="310" width="420" height="220" rx="14" fill="url(#k8sGrad)" stroke="#06b6d4" stroke-width="1.5" filter="url(#cardShadow)"/>
  <rect x="395" y="310" width="420" height="4" rx="2" fill="#06b6d4"/>
  <rect x="407" y="322" width="60" height="22" rx="11" fill="#06b6d4" opacity="0.15" stroke="#06b6d4" stroke-width="0.8"/>
  <text x="437" y="338" text-anchor="middle" font-size="11" font-weight="700" fill="#06b6d4">STAGE 4</text>

  <!-- K8s icon -->
  <circle cx="480" cy="380" r="24" fill="#0d2230" stroke="#06b6d4" stroke-width="2"/>
  <text x="480" y="388" text-anchor="middle" font-size="22" fill="#22d3ee">⚙</text>

  <text x="570" y="365" font-size="16" font-weight="700" fill="#f1f5f9">Kubernetes Cluster</text>
  <text x="570" y="385" font-size="11" fill="#64748b">Namespace: sock-shop</text>

  <!-- Microservices grid -->
  <text x="410" y="420" font-size="10" font-weight="600" fill="#475569" letter-spacing="1">MICROSERVICES</text>

  <!-- Row 1 -->
  <rect x="410" y="428" width="78" height="22" rx="5" fill="#0f3a4a" stroke="#06b6d4" stroke-width="0.7"/>
  <text x="449" y="443" text-anchor="middle" font-size="9" fill="#67e8f9">🛒 front-end</text>

  <rect x="496" y="428" width="68" height="22" rx="5" fill="#0f3a4a" stroke="#06b6d4" stroke-width="0.7"/>
  <text x="530" y="443" text-anchor="middle" font-size="9" fill="#67e8f9">🛍 carts</text>

  <rect x="572" y="428" width="80" height="22" rx="5" fill="#0f3a4a" stroke="#06b6d4" stroke-width="0.7"/>
  <text x="612" y="443" text-anchor="middle" font-size="9" fill="#67e8f9">📘 catalogue</text>

  <rect x="660" y="428" width="68" height="22" rx="5" fill="#0f3a4a" stroke="#06b6d4" stroke-width="0.7"/>
  <text x="694" y="443" text-anchor="middle" font-size="9" fill="#67e8f9">💳 payment</text>

  <!-- Row 2 -->
  <rect x="410" y="458" width="82" height="22" rx="5" fill="#0f3a4a" stroke="#06b6d4" stroke-width="0.7"/>
  <text x="451" y="473" text-anchor="middle" font-size="9" fill="#67e8f9">📦 shipping</text>

  <rect x="500" y="458" width="68" height="22" rx="5" fill="#0f3a4a" stroke="#06b6d4" stroke-width="0.7"/>
  <text x="534" y="473" text-anchor="middle" font-size="9" fill="#67e8f9">📬 orders</text>

  <rect x="576" y="458" width="62" height="22" rx="5" fill="#0f3a4a" stroke="#06b6d4" stroke-width="0.7"/>
  <text x="607" y="473" text-anchor="middle" font-size="9" fill="#67e8f9">👤 user</text>

  <rect x="646" y="458" width="82" height="22" rx="5" fill="#0f3a4a" stroke="#06b6d4" stroke-width="0.7"/>
  <text x="687" y="473" text-anchor="middle" font-size="9" fill="#67e8f9">🐰 rabbitmq</text>

  <!-- Row 3 - DBs -->
  <rect x="410" y="488" width="78" height="22" rx="5" fill="#0a2535" stroke="#0891b2" stroke-width="0.7"/>
  <text x="449" y="503" text-anchor="middle" font-size="9" fill="#a5f3fc">🗄 carts-db</text>

  <rect x="496" y="488" width="82" height="22" rx="5" fill="#0a2535" stroke="#0891b2" stroke-width="0.7"/>
  <text x="537" y="503" text-anchor="middle" font-size="9" fill="#a5f3fc">🗄 catalogue-db</text>

  <rect x="586" y="488" width="78" height="22" rx="5" fill="#0a2535" stroke="#0891b2" stroke-width="0.7"/>
  <text x="625" y="503" text-anchor="middle" font-size="9" fill="#a5f3fc">🗄 orders-db</text>

  <rect x="672" y="488" width="68" height="22" rx="5" fill="#0a2535" stroke="#0891b2" stroke-width="0.7"/>
  <text x="706" y="503" text-anchor="middle" font-size="9" fill="#a5f3fc">🗄 user-db</text>

  <!-- ======================== -->
  <!-- STAGE 5: MONITORING      -->
  <!-- ======================== -->
  <rect x="395" y="555" width="420" height="110" rx="14" fill="url(#monGrad)" stroke="#fb923c" stroke-width="1.5" filter="url(#cardShadow)"/>
  <rect x="395" y="555" width="420" height="4" rx="2" fill="#fb923c"/>
  <rect x="407" y="567" width="60" height="22" rx="11" fill="#fb923c" opacity="0.15" stroke="#fb923c" stroke-width="0.8"/>
  <text x="437" y="583" text-anchor="middle" font-size="11" font-weight="700" fill="#fb923c">STAGE 5</text>

  <text x="605" y="578" text-anchor="middle" font-size="15" font-weight="700" fill="#f1f5f9">Monitoring &amp; Observability</text>
  <text x="605" y="596" text-anchor="middle" font-size="11" fill="#64748b">Namespace: monitoring</text>

  <!-- Monitoring tools -->
  <rect x="415" y="610" width="100" height="34" rx="8" fill="#2d1b0e" stroke="#fb923c" stroke-width="1"/>
  <text x="465" y="624" text-anchor="middle" font-size="11" font-weight="600" fill="#fb923c">📈 Prometheus</text>
  <text x="465" y="638" text-anchor="middle" font-size="9" fill="#9ca3af">Metrics</text>

  <rect x="525" y="610" width="100" height="34" rx="8" fill="#2d1b0e" stroke="#fb923c" stroke-width="1"/>
  <text x="575" y="624" text-anchor="middle" font-size="11" font-weight="600" fill="#fb923c">📊 Grafana</text>
  <text x="575" y="638" text-anchor="middle" font-size="9" fill="#9ca3af">Dashboards</text>

  <rect x="635" y="610" width="120" height="34" rx="8" fill="#2d1b0e" stroke="#fb923c" stroke-width="1"/>
  <text x="695" y="624" text-anchor="middle" font-size="11" font-weight="600" fill="#fb923c">🔔 Alertmanager</text>
  <text x="695" y="638" text-anchor="middle" font-size="9" fill="#9ca3af">Alerts</text>

  <!-- ======================== -->
  <!-- ACCESS / OUTPUT          -->
  <!-- ======================== -->
  <rect x="860" y="310" width="280" height="150" rx="14" fill="#111827" stroke="#334155" stroke-width="1.5" filter="url(#cardShadow)"/>
  <rect x="860" y="310" width="280" height="4" rx="2" fill="#4ade80"/>
  <text x="880" y="335" font-size="13" font-weight="700" fill="#4ade80">🌐 Access Points</text>

  <rect x="875" y="348" width="250" height="26" rx="6" fill="#1a2e1a" stroke="#22c55e" stroke-width="0.8"/>
  <text x="1000" y="365" text-anchor="middle" font-size="11" fill="#4ade80">🛒  http://65.0.130.95:30001</text>

  <rect x="875" y="382" width="250" height="26" rx="6" fill="#2d1b0e" stroke="#fb923c" stroke-width="0.8"/>
  <text x="1000" y="399" text-anchor="middle" font-size="11" fill="#fb923c">📊  http://65.0.130.95:3000</text>

  <rect x="875" y="416" width="250" height="26" rx="6" fill="#2d1b0e" stroke="#fb923c" stroke-width="0.8"/>
  <text x="1000" y="433" text-anchor="middle" font-size="11" fill="#fb923c">📈  http://65.0.130.95:9090</text>

  <!-- ======================== -->
  <!-- EC2 INFO                  -->
  <!-- ======================== -->
  <rect x="860" y="480" width="280" height="100" rx="14" fill="#111827" stroke="#22c55e" stroke-width="1.5" filter="url(#cardShadow)"/>
  <rect x="860" y="480" width="280" height="4" rx="2" fill="#22c55e"/>
  <text x="880" y="505" font-size="13" font-weight="700" fill="#4ade80">☁  EC2 Instance</text>
  <text x="880" y="525" font-size="11" fill="#64748b">Public IP:  65.0.130.95</text>
  <text x="880" y="545" font-size="11" fill="#64748b">Private IP: 10.0.1.206</text>
  <text x="880" y="565" font-size="11" fill="#64748b">Node:       ip-10-0-1-206</text>

  <!-- ======================== -->
  <!-- LEGEND                    -->
  <!-- ======================== -->
  <rect x="860" y="600" width="280" height="100" rx="14" fill="#111827" stroke="#334155" stroke-width="1.5" filter="url(#cardShadow)"/>
  <text x="880" y="625" font-size="12" font-weight="700" fill="#94a3b8">LEGEND</text>
  <line x1="880" y1="638" x2="920" y2="638" stroke="#38bdf8" stroke-width="2.5" stroke-dasharray="6,3" class="animated-arrow"/>
  <text x="928" y="643" font-size="11" fill="#94a3b8">Code &amp; Trigger</text>
  <line x1="880" y1="658" x2="920" y2="658" stroke="#6366f1" stroke-width="2.5" stroke-dasharray="6,3" class="animated-arrow"/>
  <text x="928" y="663" font-size="11" fill="#94a3b8">Runner Jobs</text>
  <line x1="880" y1="678" x2="920" y2="678" stroke="#06b6d4" stroke-width="2.5" stroke-dasharray="6,3" class="animated-arrow"/>
  <text x="928" y="683" font-size="11" fill="#94a3b8">Deploy &amp; Monitor</text>

  <!-- ======================== -->
  <!-- ARROWS / FLOW LINES      -->
  <!-- ======================== -->

  <!-- Arrow 1: GitHub → GitHub Actions (vertical down) -->
  <line x1="140" y1="320" x2="140" y2="350" stroke="#38bdf8" stroke-width="2.5" stroke-dasharray="8,4" class="animated-arrow" marker-end="url(#arrowBlue)"/>

  <!-- Arrow 2: GitHub Actions → Self-Hosted Runner (horizontal) -->
  <line x1="250" y1="420" x2="390" y2="210" stroke="#a78bfa" stroke-width="2.5" stroke-dasharray="8,4" class="animated-arrow" marker-end="url(#arrowPurple)"/>

  <!-- Arrow 3: Self-Hosted Runner → Kubernetes (vertical down) -->
  <line x1="605" y1="283" x2="605" y2="306" stroke="#06b6d4" stroke-width="2.5" stroke-dasharray="8,4" class="animated-arrow" marker-end="url(#arrowBlue)"/>

  <!-- Arrow 4: Kubernetes → Monitoring (vertical down) -->
  <line x1="605" y1="530" x2="605" y2="551" stroke="#fb923c" stroke-width="2.5" stroke-dasharray="8,4" class="animated-arrow" marker-end="url(#arrowOrange)"/>

  <!-- Arrow 5: Kubernetes → Access Points (horizontal) -->
  <line x1="815" y1="400" x2="855" y2="385" stroke="#4ade80" stroke-width="2.5" stroke-dasharray="8,4" class="animated-arrow" marker-end="url(#arrowGreen)"/>

  <!-- Arrow 6: Monitoring → Access Points -->
  <line x1="815" y1="620" x2="855" y2="520" stroke="#fb923c" stroke-width="2" stroke-dasharray="6,3" class="animated-arrow" marker-end="url(#arrowOrange)" opacity="0.6"/>

  <!-- ======================== -->
  <!-- FLOW LABELS ON ARROWS    -->
  <!-- ======================== -->
  <rect x="48" y="330" width="58" height="18" rx="4" fill="#0a0e1a" stroke="#38bdf8" stroke-width="0.6"/>
  <text x="77" y="343" text-anchor="middle" font-size="9" fill="#38bdf8">trigger</text>

  <rect x="258" y="315" width="62" height="18" rx="4" fill="#0a0e1a" stroke="#a78bfa" stroke-width="0.6"/>
  <text x="289" y="328" text-anchor="middle" font-size="9" fill="#a78bfa">run jobs</text>

  <rect x="617" y="288" width="62" height="18" rx="4" fill="#0a0e1a" stroke="#06b6d4" stroke-width="0.6"/>
  <text x="648" y="301" text-anchor="middle" font-size="9" fill="#06b6d4">deploy</text>

  <rect x="617" y="535" width="70" height="18" rx="4" fill="#0a0e1a" stroke="#fb923c" stroke-width="0.6"/>
  <text x="652" y="548" text-anchor="middle" font-size="9" fill="#fb923c">monitor</text>

  <rect x="822" y="385" width="42" height="18" rx="4" fill="#0a0e1a" stroke="#4ade80" stroke-width="0.6"/>
  <text x="843" y="398" text-anchor="middle" font-size="9" fill="#4ade80">expose</text>

  <!-- ======================== -->
  <!-- STATUS DOTS               -->
  <!-- ======================== -->
  <circle cx="42" cy="145" r="4" fill="#4ade80" class="pulse"/>
  <circle cx="42" cy="372" r="4" fill="#4ade80" class="pulse" style="animation-delay:0.3s"/>
  <circle cx="407" cy="135" r="4" fill="#4ade80" class="pulse" style="animation-delay:0.6s"/>
  <circle cx="407" cy="327" r="4" fill="#4ade80" class="pulse" style="animation-delay:0.9s"/>
  <circle cx="407" cy="572" r="4" fill="#4ade80" class="pulse" style="animation-delay:1.2s"/>

  <!-- ======================== -->
  <!-- BOTTOM INFO BAR          -->
  <!-- ======================== -->
  <rect x="0" y="720" width="1200" height="30" fill="#0d1117"/>
  <line x1="0" y1="720" x2="1200" y2="720" stroke="#1e293b" stroke-width="1"/>
  <text x="30" y="741" font-size="10" fill="#475569">✅ Sock Shop Microservices · 14 Pods Running · Monitoring Active</text>
  <text x="600" y="741" text-anchor="middle" font-size="10" fill="#475569">Workflow: validate → security-scan → deploy → deploy-monitoring → notify</text>
  <text x="1170" y="741" text-anchor="end" font-size="10" fill="#475569">v1.0</text>
</svg>g cicd-architecture.svg…]()


📊 Monitoring & Observability
Prometheus + Grafana Setup
# SSH to Kubernetes master
ssh -i ~/.ssh/<name>.pem ubuntu@ip

# Add Prometheus Helm repository
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Create monitoring namespace
kubectl create namespace monitoring

#screenshots
<img width="1920" height="1080" alt="Screenshot 2026-02-03 172102" src="https://github.com/user-attachments/assets/cd3c6af3-8465-4501-8d0b-6bd135a3a766" />

 #grafana
 <img width="1920" height="1080" alt="Screenshot 2026-02-03 172259" src="https://github.com/user-attachments/assets/8a8be8ea-ad10-40ff-819d-e88dc91644b6" />

 #prometheus
 <img width="1920" height="1080" alt="Screenshot 2026-02-03 172446" src="https://github.com/user-attachments/assets/319d918d-0301-4302-9614-e9babef31170" />

#ci/cd deployment
<img width="1920" height="1080" alt="Screenshot 2026-02-03 172545" src="https://github.com/user-attachments/assets/c3143da6-7488-4925-a955-29f1b34cb96b" />

 


