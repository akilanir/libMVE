package com.google.android.exoplayer.smoothstreaming;

import android.content.Context;
import com.google.android.exoplayer.chunk.VideoFormatSelectorUtil;
import com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifest;
import com.google.android.exoplayer.smoothstreaming.SmoothStreamingTrackSelector;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.util.Arrays;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/DefaultSmoothStreamingTrackSelector.class */
public final class DefaultSmoothStreamingTrackSelector implements SmoothStreamingTrackSelector {
    private final int streamElementType;
    private final Context context;
    private final boolean filterVideoRepresentations;
    private final boolean filterProtectedHdContent;

    public static DefaultSmoothStreamingTrackSelector newVideoInstance(Context context, boolean filterVideoRepresentations, boolean filterProtectedHdContent) {
        return new DefaultSmoothStreamingTrackSelector(1, context, filterVideoRepresentations, filterProtectedHdContent);
    }

    public static DefaultSmoothStreamingTrackSelector newAudioInstance() {
        return new DefaultSmoothStreamingTrackSelector(0, null, false, false);
    }

    public static DefaultSmoothStreamingTrackSelector newTextInstance() {
        return new DefaultSmoothStreamingTrackSelector(2, null, false, false);
    }

    private DefaultSmoothStreamingTrackSelector(int streamElementType, Context context, boolean filterVideoRepresentations, boolean filterProtectedHdContent) {
        this.context = context;
        this.streamElementType = streamElementType;
        this.filterVideoRepresentations = filterVideoRepresentations;
        this.filterProtectedHdContent = filterProtectedHdContent;
    }

    @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingTrackSelector
    public void selectTracks(SmoothStreamingManifest manifest, SmoothStreamingTrackSelector.Output output) throws IOException {
        int[] trackIndices;
        for (int i = 0; i < manifest.streamElements.length; i++) {
            SmoothStreamingManifest.TrackElement[] tracks = manifest.streamElements[i].tracks;
            if (manifest.streamElements[i].type == this.streamElementType) {
                if (this.streamElementType == 1) {
                    if (this.filterVideoRepresentations) {
                        trackIndices = VideoFormatSelectorUtil.selectVideoFormatsForDefaultDisplay(this.context, Arrays.asList(tracks), null, this.filterProtectedHdContent && manifest.protectionElement != null);
                    } else {
                        trackIndices = Util.firstIntegersArray(tracks.length);
                    }
                    int trackCount = trackIndices.length;
                    if (trackCount > 1) {
                        output.adaptiveTrack(manifest, i, trackIndices);
                    }
                    for (int i2 : trackIndices) {
                        output.fixedTrack(manifest, i, i2);
                    }
                } else {
                    for (int j = 0; j < tracks.length; j++) {
                        output.fixedTrack(manifest, i, j);
                    }
                }
            }
        }
    }
}
