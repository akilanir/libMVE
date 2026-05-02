package org.springframework.http.converter.feed;

import com.google.code.rome.android.repackaged.com.sun.syndication.feed.rss.Channel;
import org.springframework.http.MediaType;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/feed/RssChannelHttpMessageConverter.class */
public class RssChannelHttpMessageConverter extends AbstractWireFeedHttpMessageConverter<Channel> {
    public RssChannelHttpMessageConverter() {
        super(MediaType.APPLICATION_RSS_XML);
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected boolean supports(Class<?> clazz) {
        return Channel.class.isAssignableFrom(clazz);
    }
}
