package com.einmalfel.earl;

import android.support.annotation.NonNull;
import com.einmalfel.earl.MediaCommon;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaItem.class */
public class MediaItem extends MediaCommon {
    private static final String TAG = "Earl.MediaItem";

    @NonNull
    public final List<MediaGroup> groups;

    @NonNull
    public final List<MediaContent> contents;

    /* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaItem$MediaItemBuilder.class */
    static class MediaItemBuilder {
        private List<MediaGroup> groups = new LinkedList();
        private List<MediaContent> contents = new LinkedList();
        private MediaCommon.MediaCommonBuilder builder = new MediaCommon.MediaCommonBuilder();

        MediaItemBuilder() {
        }

        boolean parseTag(XmlPullParser parser) throws XmlPullParserException, IOException {
            String tagName = parser.getName();
            switch (tagName) {
                case "group":
                    this.groups.add(MediaGroup.read(parser));
                    return true;
                case "content":
                    this.contents.add(MediaContent.read(parser));
                    return true;
                default:
                    return this.builder.parseTag(parser);
            }
        }

        MediaItem build() {
            return new MediaItem(this.groups, this.contents, this.builder.build());
        }
    }

    public MediaItem(@NonNull List<MediaGroup> groups, @NonNull List<MediaContent> contents, @NonNull MediaCommon common) {
        super(common);
        this.groups = groups;
        this.contents = contents;
    }
}
