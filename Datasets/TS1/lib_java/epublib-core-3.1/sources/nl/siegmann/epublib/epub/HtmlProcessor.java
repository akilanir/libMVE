package nl.siegmann.epublib.epub;

import java.io.OutputStream;
import nl.siegmann.epublib.domain.Resource;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/HtmlProcessor.class */
public interface HtmlProcessor {
    void processHtmlResource(Resource resource, OutputStream outputStream);
}
