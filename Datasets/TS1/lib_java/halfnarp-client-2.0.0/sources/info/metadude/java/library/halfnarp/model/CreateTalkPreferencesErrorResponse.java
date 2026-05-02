package info.metadude.java.library.halfnarp.model;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
/* loaded from: halfnarp-client-2.0.0.jar:info/metadude/java/library/halfnarp/model/CreateTalkPreferencesErrorResponse.class */
public class CreateTalkPreferencesErrorResponse extends CreateResponse {

    @JsonProperty("status")
    private String status;

    @JsonProperty("errors")
    private List<CreateTalkPreferencesError> errors = new ArrayList();

    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap();

    @JsonProperty("status")
    public String getStatus() {
        return this.status;
    }

    @JsonProperty("status")
    public void setStatus(String status) {
        this.status = status;
    }

    @JsonProperty("errors")
    public List<CreateTalkPreferencesError> getErrors() {
        return this.errors;
    }

    @JsonProperty("errors")
    public void setErrors(List<CreateTalkPreferencesError> errors) {
        this.errors = errors;
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
        return "status = " + this.status + ", errors = " + this.errors;
    }
}
