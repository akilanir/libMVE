package org.dmfs.xmlobjects.pull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/pull/ParserContext.class */
public class ParserContext {
    private final Map<ElementDescriptor<?>, Object> mRecycledObjects = new HashMap(32);
    private List<Map<ElementDescriptor<?>, Object>> mState;
    private XmlPullParser mParser;
    private XmlObjectPull mObjectPullParser;

    void setObjectPullParser(XmlObjectPull xmlObjectPull) {
        this.mObjectPullParser = xmlObjectPull;
    }

    void setXmlPullParser(XmlPullParser xmlPullParser) {
        this.mParser = xmlPullParser;
    }

    public XmlPullParser getXmlPullParser() {
        return this.mParser;
    }

    public <T> void recycle(ElementDescriptor<T> elementDescriptor, T t) {
        if (t != null) {
            this.mRecycledObjects.put(elementDescriptor, t);
        }
    }

    public <T> T getRecycled(ElementDescriptor<T> elementDescriptor) {
        return (T) this.mRecycledObjects.remove(elementDescriptor);
    }

    public void setState(Object obj) {
        getDepthStateMap(this.mObjectPullParser.getCurrentDepth(), true).put(this.mObjectPullParser.getCurrentElementDescriptor(), obj);
    }

    public Object getState() {
        Map<ElementDescriptor<?>, Object> depthStateMap = getDepthStateMap(this.mObjectPullParser.getCurrentDepth(), false);
        if (depthStateMap == null) {
            return null;
        }
        return depthStateMap.get(this.mObjectPullParser.getCurrentElementDescriptor());
    }

    private Map<ElementDescriptor<?>, Object> getDepthStateMap(int i, boolean z) {
        if (this.mState == null) {
            this.mState = new ArrayList(Math.max(16, i + 8));
        }
        while (i > this.mState.size()) {
            this.mState.add(null);
        }
        Map<ElementDescriptor<?>, Object> map = this.mState.get(i - 1);
        if (!z || map != null) {
            return map;
        }
        HashMap hashMap = new HashMap(8);
        this.mState.set(i - 1, hashMap);
        return hashMap;
    }
}
