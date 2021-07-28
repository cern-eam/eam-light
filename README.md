# EAM Light
EAM Light is a responsive web application providing the core functionality of Infor EAM. It is functional on all platforms, including smartphones and tablets, and allows users with no or limited training experience to perform common Infor EAM tasks:

* Searching, viewing, creating, updating and deleting Work Orders, Equipment and Parts
* All screens composed of user selectable areas representing EAM blocks or tabs 
* Work Order screen with
   - Details, Scheduling, Closing Codes, Parts Child Work Orders, Comments, Activities, Book Labour, Checklist, Custom Fields, Equipment Custom fields, Meter Readings and Equipment 
* Equipment screens with
   -  Details, Part Association, Hierarchy, Events (split into Work Order History and Equipment History), Associated Parts, Comments, User Defined Fields, Custom Fields and Part Custom fields (not in EAM)
* Part screen with
   - User Defined Fields, Stock, Where Used, Assets (not in EAM), Comments and Custom Fields
* Additional functionalities comprise a global search, WO inboxes for the user and the user's department, a mail-a-link feature, a Meter Reading screen, an Install Equipment screen

[comment]: # (## Screenshots)

## Quick Start
To run EAM Light using Docker, we have available a Docker image that exposes both the backend and frontend modules of the application.

The docker container may be started by providing a single argument: the Infor Web Server URL (EAMLIGHT_INFOR_WS_URL), which will look similar in your organization to the following: `https://inforappserver/axis/services/EWSConnector`.
```
docker run -p 8080:8080 -p 9090:9090 --env EAMLIGHT_INFOR_WS_URL=<Infor WS URL> cerneam/eam-light
```

In addition, a new Grid must be created (Administration / Screen Configuration / Grid Designer) exactly as illustrated below, with the exception of the Grid ID. 

![Alt text](EAMLight_Layout_Grid.png?raw=true "EAM Light Layout Grid")

Once the docker container is started, browsing to [http://localhost:8080/eamlight](http://localhost:8080/eamlight) will open the standard login screen of EAM Light.

The docker container exposes the following ports:

| Port          | Description           |
| ------------- | ---------------------:|
| 8080          | EAM Light Backend     | 
| 9090          | JBoss Management Port |

The EAM Light REST backend is available at the endpoint [http://localhost:9090/rest](http://localhost:9090/rest).

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

## Screen shots
Some examples of the EAM Light screens.
1. Start screen with global search and My Open Work Orders inbox.

![EAM-Light_start_screen_global_search_my_WOs_inbox](https://user-images.githubusercontent.com/88059054/127224149-c59cb4a8-6f24-4eb7-babf-c2050e996fd7.png)

2. Work order list view

![image](https://user-images.githubusercontent.com/88059054/127315810-da00b380-8d0d-4483-b42e-f0f89e04b5e0.png)

3. Work order screen - Checklist panel zoomed to full screen

![EAM-Light_checklist_full_screen](https://user-images.githubusercontent.com/88059054/127225800-e5b75ff7-2ff6-480f-bdf2-db5b880f78cd.png)

4. Position list view - using multiple filters

![image](https://user-images.githubusercontent.com/88059054/127316403-a48d10aa-ef70-48c5-b7a9-9397d93b87d5.png)

5. Asset screen - panels General, Details and Part Custom Fields

![EAM-Light_asset_screen_general_details_CFs](https://user-images.githubusercontent.com/88059054/127224489-349997e6-552c-47b6-8cc4-72d55553e481.png)

6. Asset screen - panels Hierarchy and Work Orders

![EAM-Light_asset_screen_hierarchy_WOs](https://user-images.githubusercontent.com/88059054/127224783-97fb73c5-8413-4ed9-817f-f3d7ca5a368c.png)

7. Screen to attach equipment to a parent

![EAM-Light_install_equipment](https://user-images.githubusercontent.com/88059054/127225482-0a3bb753-fc69-4e58-81d7-3b33fe97bc81.png)

8. Screen for meter readings

![EAM-Light_meter_reading](https://user-images.githubusercontent.com/88059054/127225664-afa7b68b-7f85-4569-a7d7-6a849d78edee.png)

9. Part screen 

![EAM-Light_part_screen_part_stock](https://user-images.githubusercontent.com/88059054/127224864-9d933bf6-2415-438f-a53f-9feb1559075f.png)
 
10. Part screen - Part Stock zoomed to full screen

![EAM-Light_part_screen_part_stock_full_screen](https://user-images.githubusercontent.com/88059054/127225969-dcd63f35-45d7-4e00-8979-bdeb3f965620.png)
