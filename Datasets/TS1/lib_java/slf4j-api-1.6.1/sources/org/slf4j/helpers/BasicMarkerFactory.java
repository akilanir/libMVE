package org.slf4j.helpers;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.IMarkerFactory;
import org.slf4j.Marker;

/* loaded from: slf4j-api-1.6.1.jar:org/slf4j/helpers/BasicMarkerFactory.class */
public class BasicMarkerFactory implements IMarkerFactory {
    Map markerMap = new HashMap();

    @Override // org.slf4j.IMarkerFactory
    public synchronized Marker getMarker(String name) {
        if (name == null) {
            throw new IllegalArgumentException("Marker name cannot be null");
        }
        Marker marker = (Marker) this.markerMap.get(name);
        if (marker == null) {
            marker = new BasicMarker(name);
            this.markerMap.put(name, marker);
        }
        return marker;
    }

    @Override // org.slf4j.IMarkerFactory
    public synchronized boolean exists(String name) {
        if (name == null) {
            return false;
        }
        return this.markerMap.containsKey(name);
    }

    @Override // org.slf4j.IMarkerFactory
    public boolean detachMarker(String name) {
        return (name == null || this.markerMap.remove(name) == null) ? false : true;
    }

    @Override // org.slf4j.IMarkerFactory
    public Marker getDetachedMarker(String name) {
        return new BasicMarker(name);
    }
}
