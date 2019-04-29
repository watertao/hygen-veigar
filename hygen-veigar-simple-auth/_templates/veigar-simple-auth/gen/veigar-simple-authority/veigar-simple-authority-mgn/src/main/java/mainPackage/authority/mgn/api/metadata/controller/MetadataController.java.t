---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/api/metadata/controller/MetadataController.java
---
package <%= h.mgnPackage(h, locals) %>.api.metadata.controller;

import <%= h.mgnPackage(h, locals) %>.api.resource.controller.ResourceController;
import <%= h.mgnPackage(h, locals) %>.api.resource.payload.ResourceRes;
import <%= h.mgnPackage(h, locals) %>.model.TAuthResource;
import <%= h.mgnPackage(h, locals) %>.service.resource.ResourceService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/metadata")
public class MetadataController {

  private static final Logger logger = LoggerFactory.getLogger(ResourceController.class);

  @Autowired
  private ResourceService resourceService;


  @GetMapping("/resources")
  List<ResourceRes> findResources(
    HttpServletResponse response
  ) {

    ResourceService.ResourceFilterParam filterParam = new ResourceService.ResourceFilterParam();
    filterParam.setInfinite_count(true);

    PageInfo<TAuthResource> resourcesPageInfo = resourceService.findResources(filterParam);

    List<ResourceRes> resources = new ArrayList<>();
    resourcesPageInfo.getList().forEach(item -> {
      ResourceRes resourceRes = new ResourceRes();
      resourceRes.setId(item.getId());
      resourceRes.setName(item.getName());
      resourceRes.setRemark(item.getRemark());
      resourceRes.setUri_pattern(item.getUriPattern());
      resourceRes.setVerb(item.getVerb());
      resources.add(resourceRes);
    });

    response.setHeader("X-Total-Count", String.valueOf(resourcesPageInfo.getTotal()));

    return resources;

  }

}
