#Thanks to Remo
#!/bin/bash
# Update and install Apache2
apt update
apt install -y apache2

# Start and enable Apache2
systemctl start apache2
systemctl enable apache2

# GCP Metadata server base URL and header
METADATA_URL="http://metadata.google.internal/computeMetadata/v1"
METADATA_FLAVOR_HEADER="Metadata-Flavor: Google"

# Use curl to fetch instance metadata
local_ipv4=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/network-interfaces/0/ip")
zone=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/zone")
project_id=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/project/project-id")
network_tags=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/tags")

# Create a simple HTML page and include instance details
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Thee Baddit Bucket List</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Round"> 
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap');

        :root {
        --primary: #2C5235;;
        --primary-100: #FEE11A;
        --primary-200: #62BB46;
        --primary-300: #A2AAAD;
        --primary-400: #A2AAAD;
        --background: #202124;
        --background-100: rgba(122, 223, 49, 0.575);
        --background-200: rgba(224, 210, 18, 0.466);
        --font-xs: 10px;
        --font-sm: 12px;
        --font-base: 14px;
        --font-lg: 16px;
        --font-xl: 18px;
        --font-2xl: 20px;
        --font-3xl: 22px;
        }

        *{
        font-family: 'Inter', sans-serif;
        margin: 0;
        padding: 0;
        }

        body{
        background-image: url(https://st4.depositphotos.com/11634452/24647/v/450/depositphotos_246470530-stock-illustration-basketball-court-floor-line-wood.jpg);
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        display: grid;
        grid-template-columns: 300px 1fr;
        grid-template-areas: 'sidebar content';
        height: 100vh;
        }

        /* GENERAL STYLES */

        h2 {
        font-size: var(--font-3xl);
        }

        h3 {
        font-size: var(--font-2xl);
        }

        h4 {
        font-size: var(--font-xl);
        }

        h5 {
        font-size: var(--font-lg);
        }

        button {
        padding: 8px 15px;
        cursor: pointer;
        height: 40px;
        font-size: 14px;
        background-color: var(--primary);
        color: white;
        border-radius: 100px;
        border: none;
        display: flex;
        align-items: center;
        column-gap: 5px;
        }

        button:hover {
        background-color: var(--primary-200);
        }

        /* SIDEBAR STYLES */

        #sidebar {
        background-color: var(--background-100);
        padding: 25px;
        display: flex;
        flex-direction: column;
        row-gap: 40px;
        }

        #webserver-info {
        display: flex;
        flex-direction: column;
        row-gap: 15px;
        }

        #webserver-info li {
        list-style-type: none;
        padding: 15px;
        border-radius: 10px;
        font-size: 14px;
        cursor: pointer;
        display: flex;
        align-items: center;
        column-gap: 10px;
        }

        #webserver-info li:hover {
        background-color: var(--primary-100);
        }

        /* CONTENT STYLES */

        #content {

        }

        header {
        padding: 30px 40px;
        display: flex;
        align-items: center;
        justify-content: space-between;    
        }

        .main-page-content {
        display: grid;
        padding: 20xp 40px;
        gap: 30px;
        grid-template-columns: 475px 1fr;
        height: 100%;
        padding-bottom: 30px;
        }

        .baddie-content {
        background-color: var(--background-200);
        padding: 25px;
        border-radius: 10px;
        display: flex;
        row-gap: 30px;
        padding-left: 30px;
        padding-right: 30px;
        }

        .baddie-content li {
        list-style-type: none;
        float: left;
        }

        .baddie-content li:hover {
        background-color: var(--primary);
        }



        .viewport {
        background-color: var(--background-200);
        border-radius: 8px;
        display: flex;


        }
    </style>
</head>
<body>
    <aside id="sidebar">
        <ul id="webserver-info"><h2>Webserver Info - PNW</h2>

            <li>Instance Name:</b> $(hostname -f)</li>
            <li>Instance Private IP Address: </b> $local_ipv4</li>
            <li>Zone: </b> $zone</li>
            <li>Project ID:</b> $project_id</li>
            <li>Network Tags:</b> $network_tags</li>

        </ul>
    </aside>
        <main id="content">
        <header><h1>We taking it this year!</h1>        
            <div>
                <button onclick="redirectTo()"><span class="material-icons-round">add</span>REPO</button>                
            </div>
        </header>

        <div class="main-page content">
            <div style="padding-left: 30px; padding-right: 30px;">
                <div class="baddie-content">
                    <ul>
                        <li>

                            <img src="https://cdn.wnba.com/headshots/wnba/latest/1040x760/203400.png" alt="My Image" width="300" height="200">
                        </li>
                        <li>

                            <img src="https://cdn.wnba.com/headshots/wnba/latest/1040x760/1628882.png" alt="My Image" width="300" height="200">
                        </li>
                        <li>

                            <img src="https://cdn.wnba.com/headshots/wnba/latest/1040x760/1641660.png" alt="My Image" width="300" height="200">
                        </li>
                        <li>

                            <img src="https://cdn.wnba.com/headshots/wnba/latest/1040x760/202252.png" alt="My Image" width="300" height="200">
                        </li>
                        <li>

                            <img src="https://cdn.wnba.com/headshots/wnba/latest/1040x760/1642798.png" alt="My Image" width="300" height="200">         
                        </li>
                        
                    </ul>
                </div>
            </div>
        </div>       
    </main>
</body>
</html>
EOF
