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
        return 'Application name should be composed of lowercase alphabet (e.g. apifusion)';
      }
    },
  },
  {
    type: 'input',
    name: 'moduleName',
    message: "Module Name (e.g. productmgn), left empty if no module definition:",
    validate: (answer) => {
      if (!answer) {
        return true;
      }
      if (APP_NAME_REG.test(answer)) {
        return true;
      } else {
        return 'Module name should be composed of lowercase alphabet (e.g. productmgn)';
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
  {
    type: 'list',
    name: 'database',
    message: 'Need to access database?',
    choices: [
      { name: 'no', value: 'no'},
      { name: 'yes', value: 'yes'},
    ],
  },

]
