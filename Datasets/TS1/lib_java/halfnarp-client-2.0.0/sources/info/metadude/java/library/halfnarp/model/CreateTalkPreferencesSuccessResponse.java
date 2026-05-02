package info.metadude.java.library.halfnarp.model;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.HashMap;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
/* loaded from: halfnarp-client-2.0.0.jar:info/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse.class */
public class CreateTalkPreferencesSuccessResponse extends CreateResponse {

    @JsonProperty("update_url")
    private String updateUrl;

    @JsonProperty("uid")
    private String uid;

    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap();

    @JsonProperty("update_url")
    public String getUpdateUrl() {
        return this.updateUrl;
    }

    @JsonProperty("update_url")
    public void setUpdateUrl(String updateUrl) {
        this.updateUrl = updateUrl;
    }

    @JsonProperty("uid")
    public String getUid() {
        return this.uid;
    }

    @JsonProperty("uid")
    public void setUid(String uid) {
        this.uid = uid;
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
        return "updateUrl = " + this.updateUrl + ", uid = " + this.uid;
    }
}
