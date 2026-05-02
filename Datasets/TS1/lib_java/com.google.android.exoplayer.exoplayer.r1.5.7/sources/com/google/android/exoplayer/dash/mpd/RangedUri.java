package com.google.android.exoplayer.dash.mpd;

import android.net.Uri;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.UriUtil;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/RangedUri.class */
public final class RangedUri {
    public final long start;
    public final long length;
    private final String baseUri;
    private final String referenceUri;
    private int hashCode;

    public RangedUri(String baseUri, String referenceUri, long start, long length) {
        Assertions.checkArgument((baseUri == null && referenceUri == null) ? false : true);
        this.baseUri = baseUri;
        this.referenceUri = referenceUri;
        this.start = start;
        this.length = length;
    }

    public Uri getUri() {
        return UriUtil.resolveToUri(this.baseUri, this.referenceUri);
    }

    public String getUriString() {
        return UriUtil.resolve(this.baseUri, this.referenceUri);
    }

    public RangedUri attemptMerge(RangedUri other) {
        if (other == null || !getUriString().equals(other.getUriString())) {
            return null;
        }
        if (this.length != -1 && this.start + this.length == other.start) {
            return new RangedUri(this.baseUri, this.referenceUri, this.start, other.length == -1 ? -1L : this.length + other.length);
        }
        if (other.length != -1 && other.start + other.length == this.start) {
            return new RangedUri(this.baseUri, this.referenceUri, other.start, this.length == -1 ? -1L : other.length + this.length);
        }
        return null;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            int result = (31 * 17) + ((int) this.start);
            this.hashCode = (31 * ((31 * result) + ((int) this.length))) + getUriString().hashCode();
        }
        return this.hashCode;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        RangedUri other = (RangedUri) obj;
        return this.start == other.start && this.length == other.length && getUriString().equals(other.getUriString());
    }
}
