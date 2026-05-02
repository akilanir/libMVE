package ezvcard.util;

import java.util.Iterator;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/HtmlUtils.class */
public class HtmlUtils {
    public static boolean isChildOf(Element child, Elements possibleParents) {
        Iterator i$ = child.parents().iterator();
        while (i$.hasNext()) {
            Element parent = (Element) i$.next();
            if (possibleParents.contains(parent)) {
                return true;
            }
        }
        return false;
    }

    public static Element toElement(String html) {
        return toElement(html, null);
    }

    public static Element toElement(String html, String baseUrl) {
        Document d = baseUrl == null ? Jsoup.parse(html) : Jsoup.parse(html, baseUrl);
        return d.getElementsByTag("body").first().children().first();
    }

    private HtmlUtils() {
    }
}
