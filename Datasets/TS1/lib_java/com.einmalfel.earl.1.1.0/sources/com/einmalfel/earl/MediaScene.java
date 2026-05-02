package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaScene.class */
public class MediaScene {
    static final String XML_TAG = "scene";
    private static final String TAG = "Earl.MediaScene";

    @Nullable
    public final String sceneTitle;

    @Nullable
    public final String sceneDescription;

    @Nullable
    public final Integer sceneStartTime;

    @Nullable
    public final Integer sceneEndTime;

    @NonNull
    static MediaScene read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String sceneTitle = null;
        String sceneDescription = null;
        Integer sceneStartTime = null;
        Integer sceneEndTime = null;
        while (parser.nextTag() == 2) {
            switch (parser.getName()) {
                case "sceneTitle":
                    sceneTitle = parser.nextText();
                    break;
                case "sceneDescription":
                    sceneDescription = parser.nextText();
                    break;
                case "sceneStartTime":
                    sceneStartTime = Utils.parseMediaRssTime(parser.nextText());
                    break;
                case "sceneEndTime":
                    sceneEndTime = Utils.parseMediaRssTime(parser.nextText());
                    break;
                default:
                    Log.w(TAG, "Unexpected tag inside media:scene: " + parser.getName());
                    Utils.skipTag(parser);
                    break;
            }
            Utils.finishTag(parser);
        }
        return new MediaScene(sceneTitle, sceneDescription, sceneStartTime, sceneEndTime);
    }

    public MediaScene(@Nullable String sceneTitle, @Nullable String sceneDescription, @Nullable Integer sceneStartTime, @Nullable Integer sceneEndTime) {
        this.sceneTitle = sceneTitle;
        this.sceneDescription = sceneDescription;
        this.sceneStartTime = sceneStartTime;
        this.sceneEndTime = sceneEndTime;
    }
}
