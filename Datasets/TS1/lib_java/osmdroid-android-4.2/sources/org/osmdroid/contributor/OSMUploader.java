package org.osmdroid.contributor;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import org.osmdroid.contributor.util.RecordedGeoPoint;
import org.osmdroid.contributor.util.RecordedRouteGPXFormatter;
import org.osmdroid.contributor.util.Util;
import org.osmdroid.contributor.util.constants.OpenStreetMapContributorConstants;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/contributor/OSMUploader.class */
public class OSMUploader implements OpenStreetMapContributorConstants {
    public static final String API_VERSION = "0.5";
    private static final int BUFFER_SIZE = 65535;
    private static final String BASE64_ENC = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    private static final String BOUNDARY = "----------------------------d10f7aa230e8";
    private static final String LINE_END = "\r\n";
    private static final String DEFAULT_DESCRIPTION = "AndNav - automatically created route.";
    private static final String DEFAULT_TAGS = "AndNav";
    public static final SimpleDateFormat pseudoFileNameFormat = new SimpleDateFormat("yyyyMMdd'_'HHmmss'_'SSS");
    private static final SimpleDateFormat autoTagFormat = new SimpleDateFormat("MMMM yyyy");

    private OSMUploader() {
    }

    public static void uploadAsync(ArrayList<RecordedGeoPoint> recordedGeoPoints) {
        uploadAsync(DEFAULT_DESCRIPTION, DEFAULT_TAGS, true, recordedGeoPoints);
    }

    public static void uploadAsync(String description, String tags, boolean addDateTags, ArrayList<RecordedGeoPoint> recordedGeoPoints) {
        uploadAsync(OpenStreetMapContributorConstants.OSM_USERNAME, OpenStreetMapContributorConstants.OSM_PASSWORD, description, tags, addDateTags, recordedGeoPoints, pseudoFileNameFormat.format(new GregorianCalendar().getTime()) + "_" + OpenStreetMapContributorConstants.OSM_USERNAME + ".gpx");
    }

    public static void uploadAsync(final String username, final String password, final String description, final String tags, final boolean addDateTags, final ArrayList<RecordedGeoPoint> recordedGeoPoints, final String pseudoFileName) {
        if (username == null || username.length() == 0 || password == null || password.length() == 0 || description == null || description.length() == 0 || tags == null || tags.length() == 0 || pseudoFileName == null || pseudoFileName.endsWith(".gpx")) {
            return;
        }
        new Thread(new Runnable() { // from class: org.osmdroid.contributor.OSMUploader.1
            @Override // java.lang.Runnable
            public void run() {
                if (!Util.isSufficienDataForUpload(recordedGeoPoints)) {
                    return;
                }
                InputStream gpxInputStream = new ByteArrayInputStream(RecordedRouteGPXFormatter.create(recordedGeoPoints).getBytes());
                String tagsToUse = tags;
                if (addDateTags || tagsToUse == null) {
                    tagsToUse = tagsToUse == null ? OSMUploader.autoTagFormat.format(new GregorianCalendar().getTime()) : tagsToUse + " " + OSMUploader.autoTagFormat.format(new GregorianCalendar().getTime());
                }
                try {
                    String urlDesc = description == null ? OSMUploader.DEFAULT_DESCRIPTION : description.replaceAll("\\.;&?,/", "_");
                    String urlTags = tagsToUse == null ? OSMUploader.DEFAULT_TAGS : tagsToUse.replaceAll("\\\\.;&?,/", "_");
                    URL url = new URL("http://www.openstreetmap.org/api/0.5/gpx/create");
                    HttpURLConnection con = (HttpURLConnection) url.openConnection();
                    con.setConnectTimeout(15000);
                    con.setRequestMethod("POST");
                    con.setDoOutput(true);
                    con.addRequestProperty("Authorization", "Basic " + OSMUploader.encodeBase64(username + ":" + password));
                    con.addRequestProperty("Content-Type", "multipart/form-data; boundary=----------------------------d10f7aa230e8");
                    con.addRequestProperty("Connection", "close");
                    con.addRequestProperty("Expect", "");
                    con.connect();
                    DataOutputStream out = new DataOutputStream(new BufferedOutputStream(con.getOutputStream()));
                    OSMUploader.writeContentDispositionFile(out, "file", gpxInputStream, pseudoFileName);
                    OSMUploader.writeContentDisposition(out, "description", urlDesc);
                    OSMUploader.writeContentDisposition(out, "tags", urlTags);
                    OSMUploader.writeContentDisposition(out, "public", "1");
                    out.writeBytes("------------------------------d10f7aa230e8--\r\n");
                    out.flush();
                    int retCode = con.getResponseCode();
                    String retMsg = con.getResponseMessage();
                    if (retCode != 200) {
                        if (con.getHeaderField("Error") != null) {
                            retMsg = retMsg + "\n" + con.getHeaderField("Error");
                        }
                        con.disconnect();
                        throw new RuntimeException(retCode + " " + retMsg);
                    }
                    out.close();
                    con.disconnect();
                } catch (Exception e) {
                }
            }
        }, "OSMUpload-Thread").start();
    }

    public static void upload(String username, String password, String description, String tags, boolean addDateTags, ArrayList<RecordedGeoPoint> recordedGeoPoints, String pseudoFileName) throws IOException {
        uploadAsync(username, password, description, tags, addDateTags, recordedGeoPoints, pseudoFileName);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void writeContentDispositionFile(DataOutputStream out, String name, InputStream gpxInputStream, String pseudoFileName) throws IOException {
        out.writeBytes("------------------------------d10f7aa230e8\r\n");
        out.writeBytes("Content-Disposition: form-data; name=\"" + name + "\"; filename=\"" + pseudoFileName + "\"" + LINE_END);
        out.writeBytes("Content-Type: application/octet-stream\r\n");
        out.writeBytes(LINE_END);
        byte[] buffer = new byte[BUFFER_SIZE];
        int sumread = 0;
        InputStream in = new BufferedInputStream(gpxInputStream);
        while (true) {
            int read = in.read(buffer);
            if (read >= 0) {
                out.write(buffer, 0, read);
                out.flush();
                sumread += read;
            } else {
                in.close();
                out.writeBytes(LINE_END);
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void writeContentDisposition(DataOutputStream out, String name, String value) throws IOException {
        out.writeBytes("------------------------------d10f7aa230e8\r\n");
        out.writeBytes("Content-Disposition: form-data; name=\"" + name + "\"" + LINE_END);
        out.writeBytes(LINE_END);
        out.writeBytes(value + LINE_END);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String encodeBase64(String s) {
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < (s.length() + 2) / 3; i++) {
            int l = Math.min(3, s.length() - (i * 3));
            String buf = s.substring(i * 3, (i * 3) + l);
            out.append(BASE64_ENC.charAt(buf.charAt(0) >> 2));
            out.append(BASE64_ENC.charAt(((buf.charAt(0) & 3) << 4) | (l == 1 ? 0 : (buf.charAt(1) & 240) >> 4)));
            out.append(l > 1 ? BASE64_ENC.charAt(((buf.charAt(1) & 15) << 2) | (l == 2 ? 0 : (buf.charAt(2) & 192) >> 6)) : '=');
            out.append(l > 2 ? BASE64_ENC.charAt(buf.charAt(2) & '?') : '=');
        }
        return out.toString();
    }
}
