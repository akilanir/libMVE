package com.google.android.apps.muzei.api.internal;

import android.os.Bundle;
import com.google.android.apps.muzei.api.Artwork;
import com.google.android.apps.muzei.api.UserCommand;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: muzei-api-2.0.jar:com/google/android/apps/muzei/api/internal/SourceState.class */
public class SourceState {
    private Artwork mCurrentArtwork;
    private String mDescription;
    private boolean mWantsNetworkAvailable;
    private List<UserCommand> mUserCommands = new ArrayList();

    public Artwork getCurrentArtwork() {
        return this.mCurrentArtwork;
    }

    public String getDescription() {
        return this.mDescription;
    }

    public boolean getWantsNetworkAvailable() {
        return this.mWantsNetworkAvailable;
    }

    public int getNumUserCommands() {
        return this.mUserCommands.size();
    }

    public UserCommand getUserCommandAt(int index) {
        return this.mUserCommands.get(index);
    }

    public void setCurrentArtwork(Artwork artwork) {
        this.mCurrentArtwork = artwork;
    }

    public void setDescription(String description) {
        this.mDescription = description;
    }

    public void setWantsNetworkAvailable(boolean wantsNetworkAvailable) {
        this.mWantsNetworkAvailable = wantsNetworkAvailable;
    }

    public void setUserCommands(int... userCommands) {
        this.mUserCommands = new ArrayList();
        if (userCommands != null) {
            for (int command : userCommands) {
                this.mUserCommands.add(new UserCommand(command));
            }
        }
    }

    public void setUserCommands(UserCommand... userCommands) {
        this.mUserCommands = new ArrayList();
        if (userCommands != null) {
            Collections.addAll(this.mUserCommands, userCommands);
        }
    }

    public void setUserCommands(List<UserCommand> userCommands) {
        this.mUserCommands = new ArrayList();
        if (userCommands != null) {
            for (UserCommand command : userCommands) {
                this.mUserCommands.add(command);
            }
        }
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        if (this.mCurrentArtwork != null) {
            bundle.putBundle("currentArtwork", this.mCurrentArtwork.toBundle());
        }
        bundle.putString("description", this.mDescription);
        bundle.putBoolean("wantsNetworkAvailable", this.mWantsNetworkAvailable);
        String[] commandsSerialized = new String[this.mUserCommands.size()];
        for (int i = 0; i < commandsSerialized.length; i++) {
            commandsSerialized[i] = this.mUserCommands.get(i).serialize();
        }
        bundle.putStringArray("userCommands", commandsSerialized);
        return bundle;
    }

    public static SourceState fromBundle(Bundle bundle) {
        SourceState state = new SourceState();
        Bundle artworkBundle = bundle.getBundle("currentArtwork");
        if (artworkBundle != null) {
            state.mCurrentArtwork = Artwork.fromBundle(artworkBundle);
        }
        state.mDescription = bundle.getString("description");
        state.mWantsNetworkAvailable = bundle.getBoolean("wantsNetworkAvailable");
        String[] commandsSerialized = bundle.getStringArray("userCommands");
        if (commandsSerialized != null && commandsSerialized.length > 0) {
            for (String s : commandsSerialized) {
                state.mUserCommands.add(UserCommand.deserialize(s));
            }
        }
        return state;
    }

    public JSONObject toJson() throws JSONException {
        JSONObject jsonObject = new JSONObject();
        if (this.mCurrentArtwork != null) {
            jsonObject.put("currentArtwork", this.mCurrentArtwork.toJson());
        }
        jsonObject.put("description", this.mDescription);
        jsonObject.put("wantsNetworkAvailable", this.mWantsNetworkAvailable);
        JSONArray commandsSerialized = new JSONArray();
        for (UserCommand command : this.mUserCommands) {
            commandsSerialized.put(command.serialize());
        }
        jsonObject.put("userCommands", commandsSerialized);
        return jsonObject;
    }

    public void readJson(JSONObject jsonObject) throws JSONException {
        JSONObject artworkJsonObject = jsonObject.optJSONObject("currentArtwork");
        if (artworkJsonObject != null) {
            this.mCurrentArtwork = Artwork.fromJson(artworkJsonObject);
        }
        this.mDescription = jsonObject.optString("description");
        this.mWantsNetworkAvailable = jsonObject.optBoolean("wantsNetworkAvailable");
        this.mUserCommands.clear();
        JSONArray commandsSerialized = jsonObject.optJSONArray("userCommands");
        if (commandsSerialized != null && commandsSerialized.length() > 0) {
            int length = commandsSerialized.length();
            for (int i = 0; i < length; i++) {
                this.mUserCommands.add(UserCommand.deserialize(commandsSerialized.optString(i)));
            }
        }
    }

    public static SourceState fromJson(JSONObject jsonObject) throws JSONException {
        SourceState state = new SourceState();
        state.readJson(jsonObject);
        return state;
    }
}
