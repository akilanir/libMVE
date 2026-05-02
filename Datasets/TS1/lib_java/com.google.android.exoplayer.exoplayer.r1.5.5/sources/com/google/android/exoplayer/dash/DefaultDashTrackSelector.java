package com.google.android.exoplayer.dash;

import android.content.Context;
import com.google.android.exoplayer.chunk.VideoFormatSelectorUtil;
import com.google.android.exoplayer.dash.DashTrackSelector;
import com.google.android.exoplayer.dash.mpd.AdaptationSet;
import com.google.android.exoplayer.dash.mpd.MediaPresentationDescription;
import com.google.android.exoplayer.dash.mpd.Period;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/dash/DefaultDashTrackSelector.class */
public final class DefaultDashTrackSelector implements DashTrackSelector {
    private final int adaptationSetType;
    private final Context context;
    private final boolean filterVideoRepresentations;
    private final boolean filterProtectedHdContent;

    public static DefaultDashTrackSelector newVideoInstance(Context context, boolean filterVideoRepresentations, boolean filterProtectedHdContent) {
        return new DefaultDashTrackSelector(0, context, filterVideoRepresentations, filterProtectedHdContent);
    }

    public static DefaultDashTrackSelector newAudioInstance() {
        return new DefaultDashTrackSelector(1, null, false, false);
    }

    public static DefaultDashTrackSelector newTextInstance() {
        return new DefaultDashTrackSelector(2, null, false, false);
    }

    private DefaultDashTrackSelector(int adaptationSetType, Context context, boolean filterVideoRepresentations, boolean filterProtectedHdContent) {
        this.adaptationSetType = adaptationSetType;
        this.context = context;
        this.filterVideoRepresentations = filterVideoRepresentations;
        this.filterProtectedHdContent = filterProtectedHdContent;
    }

    @Override // com.google.android.exoplayer.dash.DashTrackSelector
    public void selectTracks(MediaPresentationDescription manifest, int periodIndex, DashTrackSelector.Output output) throws IOException {
        int[] representations;
        Period period = manifest.getPeriod(periodIndex);
        for (int i = 0; i < period.adaptationSets.size(); i++) {
            AdaptationSet adaptationSet = period.adaptationSets.get(i);
            if (adaptationSet.type == this.adaptationSetType) {
                if (this.adaptationSetType == 0) {
                    if (this.filterVideoRepresentations) {
                        representations = VideoFormatSelectorUtil.selectVideoFormatsForDefaultDisplay(this.context, adaptationSet.representations, null, this.filterProtectedHdContent && adaptationSet.hasContentProtection());
                    } else {
                        representations = Util.firstIntegersArray(adaptationSet.representations.size());
                    }
                    int representationCount = representations.length;
                    if (representationCount > 1) {
                        output.adaptiveTrack(manifest, periodIndex, i, representations);
                    }
                    for (int i2 : representations) {
                        output.fixedTrack(manifest, periodIndex, i, i2);
                    }
                } else {
                    for (int j = 0; j < adaptationSet.representations.size(); j++) {
                        output.fixedTrack(manifest, periodIndex, i, j);
                    }
                }
            }
        }
    }
}
