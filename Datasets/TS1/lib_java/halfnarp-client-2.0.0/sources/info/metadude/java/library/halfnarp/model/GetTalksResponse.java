package info.metadude.java.library.halfnarp.model;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.HashMap;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
/* loaded from: halfnarp-client-2.0.0.jar:info/metadude/java/library/halfnarp/model/GetTalksResponse.class */
public class GetTalksResponse {

    @JsonProperty("event_id")
    private int eventId;

    @JsonProperty("track_id")
    private int trackId;

    @JsonProperty("track_name")
    private String trackName;

    @JsonProperty("room_id")
    private int roomId;

    @JsonProperty("room_name")
    private String roomName;

    @JsonProperty("start_time")
    private String startTime;

    @JsonProperty("duration")
    private int duration;

    @JsonProperty("title")
    private String title;

    @JsonProperty("abstract")
    private String _abstract;

    @JsonProperty("speakers")
    private String speakers;

    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap();

    @JsonProperty("event_id")
    public int getEventId() {
        return this.eventId;
    }

    @JsonProperty("event_id")
    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    @JsonProperty("track_id")
    public int getTrackId() {
        return this.trackId;
    }

    @JsonProperty("track_id")
    public void setTrackId(int trackId) {
        this.trackId = trackId;
    }

    @JsonProperty("track_name")
    public String getTrackName() {
        return this.trackName;
    }

    @JsonProperty("track_name")
    public void setTrackName(String trackName) {
        this.trackName = trackName;
    }

    @JsonProperty("room_id")
    public int getRoomId() {
        return this.roomId;
    }

    @JsonProperty("room_id")
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    @JsonProperty("room_name")
    public String getRoomName() {
        return this.roomName;
    }

    @JsonProperty("room_name")
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    @JsonProperty("start_time")
    public String getStartTime() {
        return this.startTime;
    }

    @JsonProperty("start_time")
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    @JsonProperty("duration")
    public int getDuration() {
        return this.duration;
    }

    @JsonProperty("duration")
    public void setDuration(int duration) {
        this.duration = duration;
    }

    @JsonProperty("title")
    public String getTitle() {
        return this.title;
    }

    @JsonProperty("title")
    public void setTitle(String title) {
        this.title = title;
    }

    @JsonProperty("abstract")
    public String getAbstract() {
        return this._abstract;
    }

    @JsonProperty("abstract")
    public void setAbstract(String _abstract) {
        this._abstract = _abstract;
    }

    @JsonProperty("speakers")
    public String getSpeakers() {
        return this.speakers;
    }

    @JsonProperty("speakers")
    public void setSpeakers(String speakers) {
        this.speakers = speakers;
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
        return "eventId = " + this.eventId + ", trackId = " + this.trackId + ", trackName = " + this.trackName + ", roomId = " + this.roomId + ", roomName = " + this.roomName + ", startTime = " + this.startTime + ", duration = " + this.duration + ", title = " + this.title + ", _abstract = " + this._abstract + ", speakers = " + this.speakers;
    }
}
