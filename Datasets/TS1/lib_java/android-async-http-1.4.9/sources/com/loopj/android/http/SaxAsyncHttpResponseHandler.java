package com.loopj.android.http;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/SaxAsyncHttpResponseHandler.class */
public abstract class SaxAsyncHttpResponseHandler<T extends DefaultHandler> extends AsyncHttpResponseHandler {
    private static final String LOG_TAG = "SaxAsyncHttpRH";
    private T handler;

    public abstract void onSuccess(int i, Header[] headerArr, T t);

    public abstract void onFailure(int i, Header[] headerArr, T t);

    public SaxAsyncHttpResponseHandler(T t) {
        this.handler = null;
        if (t == null) {
            throw new Error("null instance of <T extends DefaultHandler> passed to constructor");
        }
        this.handler = t;
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    protected byte[] getResponseData(HttpEntity entity) throws IOException {
        if (entity == null) {
            return null;
        }
        InputStream instream = entity.getContent();
        InputStreamReader inputStreamReader = null;
        try {
            if (instream == null) {
                return null;
            }
            try {
                try {
                    SAXParserFactory sfactory = SAXParserFactory.newInstance();
                    SAXParser sparser = sfactory.newSAXParser();
                    XMLReader rssReader = sparser.getXMLReader();
                    rssReader.setContentHandler(this.handler);
                    inputStreamReader = new InputStreamReader(instream, getCharset());
                    rssReader.parse(new InputSource(inputStreamReader));
                    AsyncHttpClient.silentCloseInputStream(instream);
                    if (inputStreamReader != null) {
                        try {
                            inputStreamReader.close();
                        } catch (IOException e) {
                        }
                    }
                } catch (ParserConfigurationException e2) {
                    AsyncHttpClient.log.e(LOG_TAG, "getResponseData exception", e2);
                    AsyncHttpClient.silentCloseInputStream(instream);
                    if (inputStreamReader != null) {
                        try {
                            inputStreamReader.close();
                        } catch (IOException e3) {
                        }
                    }
                }
            } catch (SAXException e4) {
                AsyncHttpClient.log.e(LOG_TAG, "getResponseData exception", e4);
                AsyncHttpClient.silentCloseInputStream(instream);
                if (inputStreamReader != null) {
                    try {
                        inputStreamReader.close();
                    } catch (IOException e5) {
                    }
                }
            }
            return null;
        } catch (Throwable th) {
            AsyncHttpClient.silentCloseInputStream(instream);
            if (inputStreamReader != null) {
                try {
                    inputStreamReader.close();
                } catch (IOException e6) {
                }
            }
            throw th;
        }
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
        onSuccess(statusCode, headers, (Header[]) this.handler);
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
        onFailure(statusCode, headers, this.handler);
    }
}
