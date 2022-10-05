# EAM Light
EAM Light is a responsive web application providing the core functionality of Infor EAM. It is functional on all platforms, including smartphones and tablets, and allows users with no or limited training experience to perform common Infor EAM tasks:

* Viewing, creating, updating and deleting Work Orders, Equipment and Parts
* Custom Fields and User Defined Fields in all of the above
* Work Order features include Activities (with checklist support), Part Usage, Meter Readings and Child Work Orders
* Equipment features include Equipment Hierarchy, Work Order History and Equipment History

[comment]: # (## Screenshots)

## Quick Start
To run EAM Light using Docker, we have available a Docker image that exposes both the backend and frontend modules of the application.

The docker container may be started by providing a single argument: the Infor Web Server URL (EAMLIGHT_INFOR_WS_URL), which will look similar in your organization to the following: `https://inforappserver/axis/services/EWSConnector`.
```
docker run -p 8080:8080 -p 9090:9090 --env EAMLIGHT_INFOR_WS_URL=<Infor WS URL> cerneam/eam-light
```

In addition, a new Grid must be created (Administration / Screen Configuration / Grid Designer) exactly as illustrated below with all available fields selected, with the exception of the Grid ID. 

![Alt text](EAMLight_Layout_Grid.png?raw=true "EAM Light Layout Grid")

Once the docker container is started, browsing to [http://localhost:8080/eamlight](http://localhost:8080/eamlight) will open the standard login screen of EAM Light.

The docker container exposes the following ports:

| Port          | Description           |
| ------------- | ---------------------:|
| 8080          | EAM Light Backend     | 
| 9090          | JBoss Management Port |

The EAM Light REST backend is available at the endpoint [http://localhost:8080/rest](http://localhost:8080/rest).

You may also configure the [backend](https://github.com/cern-eam/eam-light-backend) or the [frontend](https://github.com/cern-eam/eam-light-frontend) further.

## Repositories

| Name                                                                  | Description                                                                        |
|-----------------------------------------------------------------------|------------------------------------------------------------------------------------|
| [EAM Light Frontend](https://github.com/cern-eam/eam-light-frontend)  | Frontend module of the EAM Light application                                       |
| [EAM Light Backend](https://github.com/cern-eam/eam-light-backend)    | Backend module of the EAM Light application                                        |
| [EAM WSHub Core](https://github.com/cern-eam/eam-wshub-core)          | Core library to provide a clean Java interface to Infor EAM                        |
| [EAM Components](https://github.com/cern-eam/eam-components)          | Library with a set of reusable components for EAM frontend application development |
| [EAM WSHub Proxy Client](https://github.com/cern-eam/eam-proxyclient) | Low-level JAX-WS Proxy Client to consume Infor EAM Web Services                    |
| [EAM WSHub](https://github.com/cern-eam/eam-wshub)                    | Different application that exposes Infor EAM Web Services as SOAP/REST endpoints   |

[comment]: # (## Contributing)

## License
This software is published under the GNU General Public License v3.0 or later.