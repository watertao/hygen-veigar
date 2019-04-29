---
to: <%= h.mgnPomLocation(h, locals) %>/src/main/java/<%= h.mgnPackageDir(h, locals) %>/service/resource/ResourceService.java
---
package <%= h.mgnPackage(h, locals) %>.service.resource;

import <%= h.mgnPackage(h, locals) %>.mapper.autogen.TAuthResourceMapper;
import <%= h.mgnPackage(h, locals) %>.model.TAuthResource;
import <%= h.mgnPackage(h, locals) %>.model.TAuthResourceExample;
import <%= h.mgnPackage(h, locals) %>.service.AbstractFilterParam;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ResourceService {

  private static final Logger logger = LoggerFactory.getLogger(ResourceService.class);

  @Autowired
  private TAuthResourceMapper resourceMapper;


  public PageInfo<TAuthResource> findResources(ResourceFilterParam filterParam) {

    TAuthResourceExample resourceExample = new TAuthResourceExample();
    if(filterParam.makeOrderClause() != null) {
      resourceExample.setOrderByClause(filterParam.makeOrderClause());
    }

    if (!filterParam.isInfinite_count()) {
      PageHelper.offsetPage(filterParam.getLast_cursor(), filterParam.getCount());
    }

    List<TAuthResource> resources = resourceMapper.selectByExample(resourceExample);
    return new PageInfo<>(resources);

  }


  public static class ResourceFilterParam extends AbstractFilterParam {

    @Override
    protected String getRealSortField(String sortFieldInQueryParam) {
      if ("verb".equals(sortFieldInQueryParam)) {
        return "verb";
      } else if ("uri_pattern".equals(sortFieldInQueryParam)) {
        return "uri_pattern";
      }
      return null;
    }

  }

}
