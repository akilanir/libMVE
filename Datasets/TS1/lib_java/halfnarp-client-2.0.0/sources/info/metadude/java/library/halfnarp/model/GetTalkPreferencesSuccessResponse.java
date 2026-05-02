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
/* loaded from: halfnarp-client-2.0.0.jar:info/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse.class */
public class GetTalkPreferencesSuccessResponse extends GetTalkPreferencesResponse {

    @JsonProperty("uid")
    private String uid;

    @JsonProperty(TalkIds.API_DICTIONARY_KEY)
    private List<Integer> talkIds = new ArrayList();

    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap();

    @JsonProperty(TalkIds.API_DICTIONARY_KEY)
    public List<Integer> getTalkIds() {
        return this.talkIds;
    }

    @JsonProperty(TalkIds.API_DICTIONARY_KEY)
    public void setTalkIds(List<Integer> talkIds) {
        this.talkIds = talkIds;
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
        return "talk_ids = " + this.talkIds + ", uid = " + this.uid;
    }
}
