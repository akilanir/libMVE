package us.feras.mdv.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import us.feras.mdv.BuildConfig;

/* loaded from: us.feras.mdv.markdownview.1.1.0.jar:us/feras/mdv/util/HttpHelper.class */
public class HttpHelper {
    private static final String CHARSET_UTF8 = "UTF-8";
    public static final String CONTENT_TYPE_JSON = "json";
    public static final String CONTENT_TYPE_XML = "xml";
    private static final int DEFULT_READ_TIMEOUT = 5000;
    private static final int DEFULT_CONNECT_TIMEOUT = 5000;

    public static Response get(String url, String query) throws MalformedURLException, IOException {
        return get(url, query, 5000, 5000);
    }

    public static Response get(String url) throws MalformedURLException, IOException {
        return get(url, null, 5000, 5000);
    }

    public static Response get(String url, String query, int connectTimeout, int readTimeout) throws MalformedURLException, IOException {
        String fullUrl = url;
        if (query != null && !query.equals(BuildConfig.FLAVOR)) {
            fullUrl = fullUrl + "?" + query;
        }
        URLConnection connection = new URL(fullUrl).openConnection();
        connection.setReadTimeout(readTimeout);
        connection.setConnectTimeout(connectTimeout);
        connection.setRequestProperty("Accept-Charset", CHARSET_UTF8);
        return getResponse((HttpURLConnection) connection);
    }

    public static Response post(String url, String query, String contentType) throws MalformedURLException, IOException {
        return post(url, query, contentType, 5000, 5000);
    }

    public static Response post(String url, String query, String contentType, int connectTimeout, int readTimeout) throws MalformedURLException, IOException {
        URLConnection connection = new URL(url).openConnection();
        connection.setReadTimeout(readTimeout);
        connection.setConnectTimeout(connectTimeout);
        connection.setDoOutput(true);
        connection.setRequestProperty("Accept-Charset", CHARSET_UTF8);
        connection.setRequestProperty("Content-Type", "application/" + contentType);
        OutputStream output = null;
        try {
            output = connection.getOutputStream();
            output.write(query.getBytes(CHARSET_UTF8));
            closeSilently(output);
            return getResponse((HttpURLConnection) connection);
        } catch (Throwable th) {
            closeSilently(output);
            throw th;
        }
    }

    private static Response getResponse(HttpURLConnection connection) throws IOException {
        InputStream inputStream = connection.getInputStream();
        Response response = new Response();
        response.setHttpResponseCode(connection.getResponseCode());
        response.setHttpResponseHeader(connection.getHeaderFields().entrySet());
        response.setResponseMessage(getResponseMessage(inputStream, connection));
        response.setHttpResponseMessage(connection.getResponseMessage());
        return response;
    }

    private static String getResponseMessage(InputStream inputStream, HttpURLConnection connection) throws UnsupportedEncodingException, IOException {
        String responseMessage = null;
        StringBuffer sb = new StringBuffer();
        InputStream dis = connection.getInputStream();
        while (true) {
            int chr = dis.read();
            if (chr == -1) {
                break;
            }
            sb.append((char) chr);
        }
        if (sb != null) {
            responseMessage = sb.toString();
        }
        return responseMessage;
    }

    private static void closeSilently(OutputStream output) {
        if (output != null) {
            try {
                output.close();
            } catch (IOException e) {
            }
        }
    }

    /* loaded from: us.feras.mdv.markdownview.1.1.0.jar:us/feras/mdv/util/HttpHelper$Response.class */
    public static class Response {
        private Set<Map.Entry<String, List<String>>> httpResponseHeader;
        private int httpResponseCode;
        private String httpResponseMessage;
        private String serverResponseMessage;

        Response() {
        }

        Response(Set<Map.Entry<String, List<String>>> httpResponseHeader, int httpResponseCode, String httpResponseMessage, String responseMessage) {
            setHttpResponseHeader(httpResponseHeader);
            setHttpResponseCode(httpResponseCode);
            setHttpResponseMessage(httpResponseMessage);
            setResponseMessage(responseMessage);
        }

        public String getHttpResponseMessage() {
            return this.httpResponseMessage;
        }

        public void setHttpResponseMessage(String httpResponseMessage) {
            this.httpResponseMessage = httpResponseMessage;
        }

        public Set<Map.Entry<String, List<String>>> getHttpResponseHeader() {
            return this.httpResponseHeader;
        }

        public void setHttpResponseHeader(Set<Map.Entry<String, List<String>>> httpResponseHeader) {
            this.httpResponseHeader = httpResponseHeader;
        }

        public int getHttpResponseCode() {
            return this.httpResponseCode;
        }

        public void setHttpResponseCode(int httpResponseCode) {
            this.httpResponseCode = httpResponseCode;
        }

        public String getResponseMessage() {
            return this.serverResponseMessage;
        }

        public void setResponseMessage(String responseMessage) {
            this.serverResponseMessage = responseMessage;
        }

        public String toString() {
            return "httpResponseCode = " + this.httpResponseCode + " , httpResponseMessage = " + this.httpResponseMessage + " , serverResponseMessage = " + this.serverResponseMessage;
        }
    }
}
