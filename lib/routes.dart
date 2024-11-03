const rootRoute = "/";

const employeesPageDisplayName = "Employees";
const employeesPageRoute = "/employees";

const incrementPageDisplayName = "Increment";
const incrementPageRoute = "/increment";

const gradesPageDisplayName = "Grades";
const gradesPageRoute = "/grades";

const complaintsPageDisplayName = "Complaints";
const complaintsPageRoute = "/complaints";

const incentivePageDisplayName = "Incentive";
const incentivePageRoute = "/incentive";

const incentiveShareDisplayName = "Incentives Share";
const incentiveShareRoute = "/incentiveshare";

const conditionsPageDisplayName = "Conditions";
const conditionsPageRoute = "/conditions";

const reportsPageDisplayName = "ٌReports";
const reportsPageRoute = "/reports";

const filesPageDisplayName = "Files";
const filesPageRoute = "/files";

const aboutPageDisplayName = "About";
const aboutPageRoute = "/about";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const driversPageDisplayName = "Drivers";
const driversPageRoute = "/drivers";

const clientsPageDisplayName = "Clients";
const clientsPageRoute = "/clients";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(employeesPageDisplayName, employeesPageRoute),
  MenuItem(incrementPageDisplayName, incrementPageRoute),
  MenuItem(gradesPageDisplayName, gradesPageRoute),
  MenuItem(complaintsPageDisplayName, complaintsPageRoute),
  MenuItem(incentivePageDisplayName, incentivePageRoute),
  MenuItem(incentiveShareDisplayName, incentiveShareRoute),
  MenuItem(conditionsPageDisplayName, conditionsPageRoute),
  MenuItem(reportsPageDisplayName, reportsPageRoute),
  MenuItem(filesPageDisplayName, filesPageRoute),
  MenuItem(aboutPageDisplayName, aboutPageRoute),
  // MenuItem(overviewPageDisplayName, overviewPageRoute),
  // MenuItem(driversPageDisplayName, driversPageRoute),
  // MenuItem(clientsPageDisplayName, clientsPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];

List<MenuItem> fmSideMenuItemRoutes = [
  MenuItem(incrementPageDisplayName, incrementPageRoute),
  MenuItem(gradesPageDisplayName, gradesPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];

List<MenuItem> hrSideMenuItemRoutes = [
  MenuItem(employeesPageDisplayName, employeesPageRoute),
  MenuItem(complaintsPageDisplayName, complaintsPageRoute),
  MenuItem(aboutPageDisplayName, aboutPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
