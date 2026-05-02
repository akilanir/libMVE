package org.osmdroid.contributor;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.InputStreamBody;
import org.osmdroid.contributor.util.RecordedGeoPoint;
import org.osmdroid.contributor.util.RecordedRouteGPXFormatter;
import org.osmdroid.contributor.util.Util;
import org.osmdroid.http.HttpClientFactory;
import org.osmdroid.tileprovider.util.StreamUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/contributor/GpxToPHPUploader.class */
public class GpxToPHPUploader {
    private static final Logger logger = LoggerFactory.getLogger(GpxToPHPUploader.class);
    protected static final String UPLOADSCRIPT_URL = "http://www.PLACEYOURDOMAINHERE.com/anyfolder/gpxuploader/upload.php";

    private GpxToPHPUploader() {
    }

    public static void uploadAsync(final ArrayList<RecordedGeoPoint> recordedGeoPoints) {
        new Thread(new Runnable() { // from class: org.osmdroid.contributor.GpxToPHPUploader.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (!Util.isSufficienDataForUpload(recordedGeoPoints)) {
                        return;
                    }
                    InputStream gpxInputStream = new ByteArrayInputStream(RecordedRouteGPXFormatter.create(recordedGeoPoints).getBytes());
                    HttpClient httpClient = HttpClientFactory.createHttpClient();
                    HttpPost request = new HttpPost(GpxToPHPUploader.UPLOADSCRIPT_URL);
                    MultipartEntity requestEntity = new MultipartEntity();
                    requestEntity.addPart("gpxfile", new InputStreamBody(gpxInputStream, "" + System.currentTimeMillis() + ".gpx"));
                    httpClient.getParams().setBooleanParameter("http.protocol.expect-continue", false);
                    request.setEntity(requestEntity);
                    HttpResponse response = httpClient.execute(request);
                    int status = response.getStatusLine().getStatusCode();
                    if (status != 200) {
                        GpxToPHPUploader.logger.error("GPXUploader", "status != HttpStatus.SC_OK");
                    } else {
                        Reader r = new InputStreamReader(new BufferedInputStream(response.getEntity().getContent()));
                        char[] buf = new char[StreamUtils.IO_BUFFER_SIZE];
                        StringBuilder sb = new StringBuilder();
                        while (true) {
                            int read = r.read(buf);
                            if (read == -1) {
                                break;
                            } else {
                                sb.append(buf, 0, read);
                            }
                        }
                        GpxToPHPUploader.logger.debug("GPXUploader", "Response: " + sb.toString());
                    }
                } catch (Exception e) {
                }
            }
        }).start();
    }
}
