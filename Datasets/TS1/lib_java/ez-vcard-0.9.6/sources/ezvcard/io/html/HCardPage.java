package ezvcard.io.html;

import ezvcard.Ezvcard;
import ezvcard.VCard;
import ezvcard.io.scribe.ScribeIndex;
import ezvcard.parameter.ImageType;
import ezvcard.property.Photo;
import ezvcard.util.DataUri;
import ezvcard.util.IOUtils;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/html/HCardPage.class */
public class HCardPage {
    private static final Template template;
    private final List<VCard> vcards = new ArrayList();

    static {
        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(HCardPage.class, "");
        cfg.setObjectWrapper(new DefaultObjectWrapper());
        cfg.setWhitespaceStripping(true);
        try {
            template = cfg.getTemplate("hcard-template.html");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void add(VCard vcard) {
        this.vcards.add(vcard);
    }

    public String write() {
        StringWriter sw = new StringWriter();
        try {
            write(sw);
        } catch (IOException e) {
        }
        return sw.toString();
    }

    public void write(OutputStream out) throws IOException {
        write(new OutputStreamWriter(out));
    }

    public void write(File file) throws IOException {
        FileWriter writer = null;
        try {
            writer = new FileWriter(file);
            write(writer);
            IOUtils.closeQuietly(writer);
        } catch (Throwable th) {
            IOUtils.closeQuietly(writer);
            throw th;
        }
    }

    public void write(Writer writer) throws IOException {
        Map<String, Object> map = new HashMap<>();
        map.put("vcards", this.vcards);
        map.put("utils", new TemplateUtils());
        map.put("translucentBg", readImage("translucent-bg.png", ImageType.PNG));
        map.put("noProfile", readImage("no-profile.png", ImageType.PNG));
        map.put("ezVCardVersion", Ezvcard.VERSION);
        map.put("ezVCardUrl", Ezvcard.URL);
        map.put("scribeIndex", new ScribeIndex());
        try {
            template.process(map, writer);
            writer.flush();
        } catch (TemplateException e) {
            throw new RuntimeException((Throwable) e);
        }
    }

    private Photo readImage(String name, ImageType mediaType) throws IOException {
        return new Photo(getClass().getResourceAsStream(name), mediaType);
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/html/HCardPage$TemplateUtils.class */
    public static class TemplateUtils {
        private final Pattern newlineRegex = Pattern.compile("\\r\\n|\\r|\\n");

        public String base64(String contentType, byte[] data) {
            return new DataUri(contentType, data).toString();
        }

        public String lineBreaks(String value) {
            return this.newlineRegex.matcher(value).replaceAll("<br />");
        }
    }
}
