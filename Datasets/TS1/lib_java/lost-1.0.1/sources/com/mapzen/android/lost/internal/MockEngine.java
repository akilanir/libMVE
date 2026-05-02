package com.mapzen.android.lost.internal;

import android.content.Context;
import android.location.Location;
import android.os.Handler;
import com.mapzen.android.lost.internal.LocationEngine;
import java.io.File;
import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/internal/MockEngine.class */
public class MockEngine extends LocationEngine {
    public static final String MOCK_PROVIDER = "mock";
    public static final String TAG_TRACK_POINT = "trkpt";
    public static final String TAG_SPEED = "speed";
    public static final String TAG_LAT = "lat";
    public static final String TAG_LNG = "lon";
    private Location location;
    private File traceFile;
    private TraceThread traceThread;

    public MockEngine(Context context, LocationEngine.Callback callback) {
        super(context, callback);
    }

    @Override // com.mapzen.android.lost.internal.LocationEngine
    public Location getLastLocation() {
        return this.location;
    }

    @Override // com.mapzen.android.lost.internal.LocationEngine
    protected void enable() {
        if (this.traceFile != null) {
            this.traceThread = new TraceThread();
            this.traceThread.start();
        }
    }

    @Override // com.mapzen.android.lost.internal.LocationEngine
    protected void disable() {
        if (this.traceThread != null) {
            this.traceThread.cancel();
        }
    }

    public void setLocation(Location location) {
        this.location = location;
        if (getCallback() != null) {
            getCallback().reportLocation(location);
        }
    }

    public void setTrace(File file) {
        this.traceFile = file;
    }

    /* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/internal/MockEngine$TraceThread.class */
    private class TraceThread extends Thread {
        private boolean canceled;

        private TraceThread() {
        }

        public void cancel() {
            this.canceled = true;
            interrupt();
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            XPath xPath = XPathFactory.newInstance().newXPath();
            NodeList nodeList = null;
            NodeList speedList = null;
            try {
                DocumentBuilder builder = factory.newDocumentBuilder();
                Document document = builder.parse(MockEngine.this.traceFile);
                nodeList = (NodeList) xPath.compile("//trkpt").evaluate(document, XPathConstants.NODESET);
                speedList = (NodeList) xPath.compile("//speed").evaluate(document, XPathConstants.NODESET);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ParserConfigurationException e2) {
                e2.printStackTrace();
            } catch (XPathExpressionException e3) {
                e3.printStackTrace();
            } catch (SAXException e4) {
                e4.printStackTrace();
            }
            parse(nodeList, speedList);
        }

        private void parse(NodeList nodeList, NodeList speedList) {
            if (nodeList != null) {
                for (int i = 0; i < nodeList.getLength(); i++) {
                    postMockLocation(nodeToLocation(nodeList, speedList, i));
                    sleepFastestInterval();
                }
            }
        }

        private Location nodeToLocation(NodeList nodeList, NodeList speedList, int i) {
            Node node = nodeList.item(i);
            String lat = node.getAttributes().getNamedItem(MockEngine.TAG_LAT).getNodeValue();
            String lng = node.getAttributes().getNamedItem(MockEngine.TAG_LNG).getNodeValue();
            Location location = new Location(MockEngine.MOCK_PROVIDER);
            location.setLatitude(Double.parseDouble(lat));
            location.setLongitude(Double.parseDouble(lng));
            location.setTime(System.currentTimeMillis());
            location.setSpeed(Float.parseFloat(speedList.item(i).getFirstChild().getNodeValue()));
            return location;
        }

        private void sleepFastestInterval() {
            if (MockEngine.this.getRequest() != null) {
                try {
                    Thread.sleep(MockEngine.this.getRequest().getFastestInterval());
                } catch (InterruptedException e) {
                    this.canceled = true;
                }
            }
        }

        private void postMockLocation(final Location mockLocation) {
            new Handler(MockEngine.this.getContext().getMainLooper()).post(new Runnable() { // from class: com.mapzen.android.lost.internal.MockEngine.TraceThread.1
                @Override // java.lang.Runnable
                public void run() {
                    if (!TraceThread.this.canceled) {
                        MockEngine.this.setLocation(mockLocation);
                    }
                }
            });
        }
    }
}
