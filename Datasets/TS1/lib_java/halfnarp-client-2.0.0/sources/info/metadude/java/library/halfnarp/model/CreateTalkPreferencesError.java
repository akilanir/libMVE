package info.metadude.java.library.halfnarp.model;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.HashMap;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
/* loaded from: halfnarp-client-2.0.0.jar:info/metadude/java/library/halfnarp/model/CreateTalkPreferencesError.class */
public class CreateTalkPreferencesError {

    @JsonProperty("location")
    private String location;

    @JsonProperty("name")
    private String name;

    @JsonProperty("description")
    private String description;

    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap();

    @JsonProperty("location")
    public String getLocation() {
        return this.location;
    }

    @JsonProperty("location")
    public void setLocation(String location) {
        this.location = location;
    }

    @JsonProperty("name")
    public String getName() {
        return this.name;
    }

    @JsonProperty("name")
    public void setName(String name) {
        this.name = name;
    }

    @JsonProperty("description")
    public String getDescription() {
        return this.description;
    }

    @JsonProperty("description")
    public void setDescription(String description) {
        this.description = description;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    public String toString() {
        return "location = " + this.location + ", name = " + this.name + ", description = " + this.description;
    }
}
