# RD-ACTIVEOFFICERS FIVEM SCRIPT

[![GitHub license](https://img.shields.io/github/license/red1gr/rd-activeofficers?style=for-the-badge&logo=apache&logoColor=white)](LICENSE)

## OVERVIEW
rd-activeofficers is a police management utility for QBCore servers that allows law enforcement personnel to track active officers through an integrated tablet interface. It provides real-time visibility into officer duty status, ranks, and radio channels, while allowing individuals to manage their own callsigns and availability status.
[![Preview](https://i.imgur.com/T6NNkOO.png)](https://imgur.com/T6NNkOO)
## FEATURES
- **Active Personnel Tracking:** View a real-time, sorted list of on-duty police officers including their name, badge number, rank, and current radio frequency.
- **Callsign Management:** Set and update personal police callsigns via a dedicated in-game command and input dialog.
- **Duty Status Toggles:** Quickly update availability using status codes (e.g., 10-06) to signal breaks or availability to other officers.
- **Interactive Tablet UI:** A dedicated NUI interface that triggers a tablet animation and provides a clean, visual directory of active personnel.

## TECH STACK
[![Lua](https://img.shields.io/badge/Lua-5.4-2C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
[![HTML5](https://img.shields.io/badge/HTML5-5.0-E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/HTML)
[![CSS3](https://img.shields.io/badge/CSS3-3.0-1572B6.svg?style=for-the-badge&logo=css3&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/CSS)
[![JavaScript](https://img.shields.io/badge/JavaScript-ES6-F7DF1E.svg?style=for-the-badge&logo=javascript&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

### INSTALLATION
1. **Resource Deployment**
    - Move the `rd-activeofficers` folder into your server's `resources` directory.
2. **Dependency Verification**
    - Ensure the following dependencies are installed and started on your server:
        - `qb-core`
        - `rd-core`
        - `rpemotes`
        - `qb-input`
3. **Server Configuration**
    - Add the following line to your `server.cfg` to enable the resource:
      ```cfg
      ensure rd-activeofficers
      ```

## PROJECT STRUCTURE
```
rd-activeofficers/
├── UI/                      # User interface assets
│   ├── img/                 # UI images
│   │   └── logo.png         # Tablet logo
│   ├── rd.css               # Stylesheets for the tablet UI
│   ├── rd.html              # Main HTML structure for the tablet
│   └── rd.js                # Frontend logic and NUI callbacks
├── client.lua               # Client-side logic, commands, and NUI triggers
├── fxmanifest.lua           # Resource manifest and dependency definitions
└── server.lua               # Server-side callbacks and metadata management
```

## CONTRIBUTING
- WE WELCOME CONTRIBUTIONS! IF YOU HAVE SUGGESTIONS FOR IMPROVEMENTS, FEATURE REQUESTS, OR BUG REPORTS, PLEASE OPEN AN ISSUE OR SUBMIT A PULL REQUEST ON OUR GITHUB REPOSITORY.

## LICENSE
THIS PROJECT IS LICENSED UNDER THE [APACHE-2.0](LICENSE) - SEE THE [LICENSE](LICENSE) FILE FOR DETAILS.

## SUPPORT & CONTACT
- CONTACT: [SUPPORT CONTACT](mailto:mail@red1gr.dev)
