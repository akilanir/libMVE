package org.jivesoftware.smack.provider;

import org.jivesoftware.smack.packet.IQ;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/provider/IQProvider.class */
public interface IQProvider {
    IQ parseIQ(XmlPullParser xmlPullParser) throws Exception;
}
