const { join } = require('path');

// where to generate sources
const OUTPUT_DIR = 'output';

module.exports = {
  helpers: {
    // e.g. myapp-productmgn
    mainPomName: (h, locals) => `${locals.appName}${locals.moduleName ? '-' + locals.moduleName : ''}`,
    
    // e.g. output/myapp-productmgn
    mainPomLocation: (h, locals) => join(OUTPUT_DIR, h.mainPomName(h, locals)),

    // e.g. com.google.myapp.productmgn
    mainPackage: (h, locals) => `${locals.groupId}.${locals.appName}${locals.moduleName ? '.' + locals.moduleName : ''}`,

    // e.g. com/google/myapp/productmgn
    mainPackageDir: (h, locals) => join(...(h.mainPackage(h,locals).split('.'))),

  }
} 
