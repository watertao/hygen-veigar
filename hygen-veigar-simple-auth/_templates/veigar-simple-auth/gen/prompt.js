const APP_NAME_REG = /^[a-z]+$/;
const GROUP_ID_REG = /^([a-z]+[a-z0-9]*)(\.([a-z]+[a-z0-9]*))*$/;


module.exports = [
  {
    type: 'input',
    name: 'appName',
    message: "Application Name (e.g. appfusion)",
    validate: (answer) => {
      if (APP_NAME_REG.test(answer)) {
        return true;
      } else {
        return 'appName should be composed of lowercase alphabet (e.g. apifusion)';
      }
    },
  },
  {
    type: 'input',
    name: 'groupId',
    message: "Group Id (e.g. com.mycompany)",
    validate: (answer) => {
      if (GROUP_ID_REG.test(answer)) {
        return true;
      } else {
        return 'group id should be a valid java package';
      }
    },
  },
  {
    type: 'input',
    name: 'version',
    message: "Version (e.g. 1.0.0-SNAPSHOT)",
    default: '1.0.0-SNAPSHOT',
  },

]
