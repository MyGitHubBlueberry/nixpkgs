{ lib
, aiohttp
, async-timeout
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
}:

buildPythonPackage rec {
  pname = "adax";
  version = "0.3.0";
  format = "setuptools";

  disabled = pythonOlder "3.5";

  src = fetchFromGitHub {
    owner = "Danielhiversen";
    repo = "pyadax";
    rev = version;
    hash = "sha256-y4c1RBy/UxmKP7+mHXi86XJ2/RXGrqkj94I2Q699EJU=";
  };

  propagatedBuildInputs = [
    aiohttp
    async-timeout
  ];

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [ "adax" ];

  meta = with lib; {
    description = "Python module to communicate with Adax";
    homepage = "https://github.com/Danielhiversen/pyAdax";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
