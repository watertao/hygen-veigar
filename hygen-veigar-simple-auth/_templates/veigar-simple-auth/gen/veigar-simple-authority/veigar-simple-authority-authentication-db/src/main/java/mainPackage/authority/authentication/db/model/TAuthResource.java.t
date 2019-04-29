---
to: <%= h.authenticationDbPomLocation(h, locals) %>/src/main/java/<%= h.authenticationDbPackageDir(h, locals) %>/model/TAuthResource.java
---
package <%= h.authenticationDbPackage(h, locals) %>.model;

public class TAuthResource {
    private Integer id;

    private String verb;

    private String type;

    private String uriPattern;

    private String name;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getVerb() {
        return verb;
    }

    public void setVerb(String verb) {
        this.verb = verb == null ? null : verb.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getUriPattern() {
        return uriPattern;
    }

    public void setUriPattern(String uriPattern) {
        this.uriPattern = uriPattern == null ? null : uriPattern.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}
