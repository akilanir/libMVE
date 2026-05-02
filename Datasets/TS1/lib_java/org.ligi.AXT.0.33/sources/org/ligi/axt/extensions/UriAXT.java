package org.ligi.axt.extensions;

import android.content.Context;
import android.net.Uri;
import java.io.File;
import org.ligi.axt.converter.ImageFromIntentUriToFileConverter;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/UriAXT.class */
public class UriAXT {
    private final Uri uri;

    public UriAXT(Uri uri) {
        this.uri = uri;
    }

    public File loadImage(Context context) {
        return new ImageFromIntentUriToFileConverter(context).extract(this.uri);
    }
}
