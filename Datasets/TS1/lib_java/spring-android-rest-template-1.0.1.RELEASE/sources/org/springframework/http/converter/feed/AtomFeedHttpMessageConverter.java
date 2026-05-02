package org.springframework.http.converter.feed;

import com.google.code.rome.android.repackaged.com.sun.syndication.feed.atom.Feed;
import org.springframework.http.MediaType;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/feed/AtomFeedHttpMessageConverter.class */
public class AtomFeedHttpMessageConverter extends AbstractWireFeedHttpMessageConverter<Feed> {
    public AtomFeedHttpMessageConverter() {
        super(MediaType.APPLICATION_ATOM_XML);
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected boolean supports(Class<?> clazz) {
        return Feed.class.isAssignableFrom(clazz);
    }
}
