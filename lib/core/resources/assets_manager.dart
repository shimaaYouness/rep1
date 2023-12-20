const String imagePath = 'assets/images';
const String portalImagePath = 'http://web2.sccc.local:9015/i/img/auth/';
const String eyadatImagePath = 'http://web2.sccc.local:9015/i/img/eyadat/';
class ImageAssets{
  static const String splashLogo = '$imagePath/SCA-logo.png';
  static const String backgroundImage = '$imagePath/background.jpeg';
  static const String appLogo = '$imagePath/new-logo.jpeg';
  static const String medicalLabIcon = '$imagePath/icons-lab.png';
}

const String _publicServerIP = 'http://41.33.76.5:5001/api';
const String _publicServer = 'https://portalapii.sca-cis.com/api';
const String _testServer = 'http://10.250.1.152:5001/api';
class ApiUrls{
  static const String login = '$_publicServer/Auth/login';
  static const String abaa = '$_publicServer/kashf/ABAA';
  static const String kashf = '$_publicServer/kashf/';
  static const String services = '$_publicServer/Kashf/ServiceImages';
  static const String base64PDF= '$_publicServer/Kashf/KashfPDFAsync/';
  static const String agazat = '$_publicServer/Rased';
  static const String agazatDetails = '$_publicServer/Rased/Details';
  static const String payroll = '$_publicServer/Salary';
  static const String sarfyat = '$_publicServer/Salary/Details';
  static const String log = '$_publicServer/Log';
  static const String fesha = '$_publicServer/Salary/MadfAndMost';
  static const String loans = '$_publicServer/Loans';
  static const String water = '$_publicServer/Water';
  static const String briza = '$_publicServer/Water/Users';
  static const String saveVCard = '$_publicServer/VCard/AddVCard';
  static const String deleteVCard = '$_publicServer/VCard/DeleteVCard?CardId=';
  static const String updateVCard = '$_publicServer/VCard/UpdateVCard';
  static const String getAllVCards = '$_publicServer/VCard/GetAllVCard';
}