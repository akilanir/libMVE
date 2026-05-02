package com.google.android.apps.muzei.api;

import android.text.TextUtils;

/* loaded from: muzei-api-2.0.jar:com/google/android/apps/muzei/api/UserCommand.class */
public class UserCommand {
    private int mId;
    private String mTitle;

    public UserCommand(int id) {
        this.mId = id;
    }

    public UserCommand(int id, String title) {
        this.mId = id;
        this.mTitle = title;
    }

    public int getId() {
        return this.mId;
    }

    public void setId(int id) {
        this.mId = id;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public void setTitle(String title) {
        this.mTitle = title;
    }

    public String serialize() {
        return Integer.toString(this.mId) + (TextUtils.isEmpty(this.mTitle) ? "" : ":" + this.mTitle);
    }

    public static UserCommand deserialize(String s) {
        int id = -1;
        if (TextUtils.isEmpty(s)) {
            return new UserCommand(-1, null);
        }
        String[] arr = s.split(":", 2);
        try {
            id = Integer.parseInt(arr[0]);
        } catch (NumberFormatException e) {
        }
        String title = null;
        if (arr.length > 1) {
            title = arr[1];
        }
        return new UserCommand(id, title);
    }
}
