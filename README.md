# EAM Light

EAM Light is a responsive web application providing an alternative interface to some of the the core functionalities of HxGN EAM, previously Infor EAM. It is functional on all platforms, including smartphones and tablets, and allows users with no or limited training experience to perform common HxGN EAM tasks, such as:

- Viewing, creating, updating and deleting Work Orders, Equipment and Parts
- Custom Fields and User Defined Fields in all of the above
- Work Order features include Activities (with checklist support), Part Usage, Meter Readings and Child Work Orders
- Equipment features include Equipment Hierarchy, Work Order History and Equipment History

[comment]: # "## Screenshots"

## Quick Start

To run EAM Light using Docker, we have available a Docker image that exposes both the backend and frontend modules of the application.

The docker container may be started by providing a single argument: the HxGN EAM Web Server URL (EAMLIGHT_INFOR_WS_URL), which will look similar in your organization to the following: `https://hxgneamappserver/axis/services/EWSConnector`.

```
docker run -p 8080:80 -p 9990:9990 --env EAMLIGHT_INFOR_WS_URL=<Infor WS URL> cerneam/eam-light
```

If you want to build the image yourself:

```
docker build -t eamlight .
docker run \
    -e EAMLIGHT_INFOR_WS_URL=<Infor WS URL> \
    -p 8080:80 -p 9991:9990 eamlight
```

In addition, a new Grid must be created (Administration / Screen Configuration / Grid Designer) exactly as illustrated below with all available fields selected, with the exception of the Grid ID.

![Alt text](EAMLight_Layout_Grid.png?raw=true "EAM Light Layout Grid")

Once the docker container is started, browsing to [http://localhost:8080/eamlight](http://localhost:8080/eamlight) will open the standard login screen of EAM Light.

The docker container exposes the following ports:

| Port |           Description |
| ---- | --------------------: |
| 80   |     EAM Light (Nginx) |
| 9990 | JBoss Management Port |

The EAM Light REST backend is available at the endpoint [http://localhost:8080/apis/eamlightws/rest](http://localhost:8080/apis/eamlightws/rest).

The EAM Light frontend is available at the endpoint [http://localhost:8080/](http://localhost:8080/).

You may also configure the [backend](https://github.com/cern-eam/eam-light-backend) or the [frontend](https://github.com/cern-eam/eam-light-frontend) further.

## Repositories

| Name                                                                  | Description                                                                        |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| [EAM Light Frontend](https://github.com/cern-eam/eam-light-frontend)  | Frontend module of the EAM Light application                                       |
| [EAM Light Backend](https://github.com/cern-eam/eam-light-backend)    | Backend module of the EAM Light application                                        |
| [EAM WSHub Core](https://github.com/cern-eam/eam-wshub-core)          | Core library to provide a clean Java interface to HxGN EAM                         |
| [EAM Components](https://github.com/cern-eam/eam-components)          | Library with a set of reusable components for EAM frontend application development |
| [EAM WSHub Proxy Client](https://github.com/cern-eam/eam-proxyclient) | Low-level JAX-WS Proxy Client to consume HxGN  EAM Web Services                    |
| [EAM WSHub](https://github.com/cern-eam/eam-wshub)                    | Different application that exposes HxGN  EAM Web Services as SOAP/REST endpoints   |

[comment]: # "## Contributing"

## License

This software is published under the GNU General Public License v3.0 or later.
