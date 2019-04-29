---
to: <%= h.mainPomLocation(h, locals) %>/src/main/java/<%= h.mainPackageDir(h, locals) %>/service/AbstractFilterParam.java
---
package <%= h.mainPackage(h, locals) %>.service;

import io.github.watertao.veigar.core.exception.BadRequestException;

public abstract class AbstractFilterParam {

  private static final int MAX_COUNT = 100;

  private Integer last_cursor = 0;
  private Integer count = 20;
  boolean infinite_count = false;
  private String sort_field;
  private String sort_order = "ascend";   // ascend / descend

  public Integer getLast_cursor() {
    return this.last_cursor;
  }

  public void setLast_cursor(Integer last_cursor) {
    if (last_cursor == null || last_cursor < 0) {
      return;
    }
    this.last_cursor = last_cursor;
  }

  public Integer getCount() {
    return count;
  }

  public void setCount(Integer count) {
    if (count == null || count < 0) {
      return;
    }
    if (count > MAX_COUNT) {
      if (!infinite_count) {
        count = MAX_COUNT;
      }
    }
    this.count = count;
  }

  public boolean isInfinite_count() {
    return infinite_count;
  }

  public void setInfinite_count(boolean infinite_count) {
    this.infinite_count = infinite_count;
  }

  public String getSort_field() {
    return sort_field;
  }

  public void setSort_field(String sort_field) {
    this.sort_field = sort_field;
  }

  public String getSort_order() {
    return sort_order;
  }

  public void setSort_order(String sort_order) {
    if (sort_order == null) {
      this.sort_order = "ascend";
    } else {
      if (sort_order.equals("ascend") || sort_order.equals("descend")) {
        this.sort_order = sort_order;
      } else {
        throw new BadRequestException("sort_order should be 'ascend' or 'descend'");
      }
    }

  }

  /**
   * 若返回为 Null，则认为本次无需排序
   *
   * @return
   */
  public String makeOrderClause() {
    if (this.sort_field == null) {
      return null;
    }
    String realField = getRealSortField(this.sort_field);
    if (realField == null) {
      return null;
    }
    return realField + " " + (this.sort_order.equals("ascend") ? "asc" : "desc");
  }

  /**
   * 若返回为 Null， 则认为本次无需排序
   *
   * @param sortFieldInQueryParam
   * @return
   */
  protected abstract String getRealSortField(String sortFieldInQueryParam);

}
