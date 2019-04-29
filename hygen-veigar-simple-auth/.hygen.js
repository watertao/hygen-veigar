const { join } = require('path');

// where to generate sources
const OUTPUT_DIR = 'output';

const POM_NAME_SUFFIX_MAIN = 'authority';
const POM_NAME_SUFFIX_AUTHENTICATION_DB = 'authority-authentication-db';
const POM_NAME_SUFFIX_MANAGEMENT = 'authority-mgn';
const POM_NAME_SUFFIX_SESSION = 'authority-session';

module.exports = {
  helpers: {
    // e.g. myapp-authority
    mainPomName: (h, locals) => `${h.changeCase.paramCase(locals.appName)}-${POM_NAME_SUFFIX_MAIN}`,
    // e.g. myapp-authority-authentication-db
    authenticationDbPomName: (h, locals) => `${h.changeCase.paramCase(locals.appName)}-${POM_NAME_SUFFIX_AUTHENTICATION_DB}`,
    // e.g. myapp-authority-mgn
    mgnPomName: (h, locals) => `${h.changeCase.paramCase(locals.appName)}-${POM_NAME_SUFFIX_MANAGEMENT}`,
    // e.g. myapp-authority-session
    sessionPomName: (h, locals) => `${h.changeCase.paramCase(locals.appName)}-${POM_NAME_SUFFIX_SESSION}`,
    
    // e.g. output/myapp-authority
    mainPomLocation: (h, locals) => join(OUTPUT_DIR, h.mainPomName(h, locals)),
    // e.g. output/myapp-authority/myapp-authority-authentication-db
    authenticationDbPomLocation: (h, locals) => join(OUTPUT_DIR, h.mainPomName(h, locals), h.authenticationDbPomName(h, locals)),
    // e.g. output/myapp-authority/myapp-authority-mgn
    mgnPomLocation: (h, locals) => join(OUTPUT_DIR, h.mainPomName(h, locals), h.mgnPomName(h, locals)),
    // e.g. output/myapp-authority/myapp-authority-session
    sessionPomLocation: (h, locals) => join(OUTPUT_DIR, h.mainPomName(h, locals), h.sessionPomName(h, locals)),

    // e.g. com.google.myapp.authority
    mainPackage: (h, locals) => `${locals.groupId}.${locals.appName}.authority`,
    // e.g. com.google.myapp.authority.authentication.db
    authenticationDbPackage: (h, locals) => `${h.mainPackage(h, locals)}.authentication.db`,
    // e.g. com.google.myapp.authority.mgn
    mgnPackage: (h, locals) => `${h.mainPackage(h, locals)}.mgn`,
    // e.g. com.google.myapp.authority.session
    sessionPackage: (h, locals) => `${h.mainPackage(h, locals)}.session`,

    // e.g. com/google/myapp/authority
    mainPackageDir: (h, locals) => join(...(h.mainPackage(h,locals).split('.'))),
    // e.g. com/google/myapp/authority/authentication/db
    authenticationDbPackageDir: (h, locals) => join(...(h.authenticationDbPackage(h,locals).split('.'))),
    // e.g. com/google/myapp/authority/mgn
    mgnPackageDir: (h, locals) => join(...(h.mgnPackage(h,locals).split('.'))),
    // e.g. com/google/myapp/authority/session
    sessionPackageDir: (h, locals) => join(...(h.sessionPackage(h,locals).split('.'))),

  }
} 
