package nl.siegmann.epublib.domain;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.Serializable;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import nl.siegmann.epublib.Constants;
import nl.siegmann.epublib.epub.PackageDocumentBase;
import nl.siegmann.epublib.service.MediatypeService;
import nl.siegmann.epublib.util.IOUtil;
import nl.siegmann.epublib.util.StringUtil;
import nl.siegmann.epublib.util.commons.io.XmlStreamReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/domain/Resource.class */
public class Resource implements Serializable {
    private static final long serialVersionUID = 1043946707835004037L;
    private String id;
    private String title;
    private String href;
    private MediaType mediaType;
    private String inputEncoding;
    private byte[] data;
    private String fileName;
    private long cachedSize;
    private static final Logger LOG = LoggerFactory.getLogger(Resource.class);

    public Resource(String href) {
        this(null, new byte[0], href, MediatypeService.determineMediaType(href));
    }

    public Resource(byte[] data, MediaType mediaType) {
        this(null, data, null, mediaType);
    }

    public Resource(byte[] data, String href) {
        this(null, data, href, MediatypeService.determineMediaType(href), Constants.CHARACTER_ENCODING);
    }

    public Resource(Reader in, String href) throws IOException {
        this(null, IOUtil.toByteArray(in, Constants.CHARACTER_ENCODING), href, MediatypeService.determineMediaType(href), Constants.CHARACTER_ENCODING);
    }

    public Resource(InputStream in, String href) throws IOException {
        this(null, IOUtil.toByteArray(in), href, MediatypeService.determineMediaType(href));
    }

    public Resource(String fileName, long size, String href) {
        this(null, null, href, MediatypeService.determineMediaType(href));
        this.fileName = fileName;
        this.cachedSize = size;
    }

    public Resource(String id, byte[] data, String href, MediaType mediaType) {
        this(id, data, href, mediaType, Constants.CHARACTER_ENCODING);
    }

    public Resource(String id, byte[] data, String href, MediaType mediaType, String inputEncoding) {
        this.inputEncoding = Constants.CHARACTER_ENCODING;
        this.id = id;
        this.href = href;
        this.mediaType = mediaType;
        this.inputEncoding = inputEncoding;
        this.data = data;
    }

    public InputStream getInputStream() throws IOException {
        return new ByteArrayInputStream(getData());
    }

    public byte[] getData() throws IOException {
        if (this.data == null) {
            LOG.info("Initializing lazy resource " + this.fileName + "#" + this.href);
            ZipInputStream in = new ZipInputStream(new FileInputStream(this.fileName));
            ZipEntry nextEntry = in.getNextEntry();
            while (true) {
                ZipEntry zipEntry = nextEntry;
                if (zipEntry == null) {
                    break;
                }
                if (!zipEntry.isDirectory() && zipEntry.getName().endsWith(this.href)) {
                    this.data = IOUtil.toByteArray(in);
                }
                nextEntry = in.getNextEntry();
            }
            in.close();
        }
        return this.data;
    }

    public void close() {
        if (this.fileName != null) {
            this.data = null;
        }
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public boolean isInitialized() {
        return this.data != null;
    }

    public long getSize() {
        if (this.data != null) {
            return this.data.length;
        }
        return this.cachedSize;
    }

    public String getTitle() {
        return this.title;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return this.id;
    }

    public String getHref() {
        return this.href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getInputEncoding() {
        return this.inputEncoding;
    }

    public void setInputEncoding(String encoding) {
        this.inputEncoding = encoding;
    }

    public Reader getReader() throws IOException {
        return new XmlStreamReader(new ByteArrayInputStream(getData()), getInputEncoding());
    }

    public int hashCode() {
        return this.href.hashCode();
    }

    public boolean equals(Object resourceObject) {
        if (!(resourceObject instanceof Resource)) {
            return false;
        }
        return this.href.equals(((Resource) resourceObject).getHref());
    }

    public MediaType getMediaType() {
        return this.mediaType;
    }

    public void setMediaType(MediaType mediaType) {
        this.mediaType = mediaType;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String toString() {
        Object[] objArr = new Object[12];
        objArr[0] = "id";
        objArr[1] = this.id;
        objArr[2] = "title";
        objArr[3] = this.title;
        objArr[4] = "encoding";
        objArr[5] = this.inputEncoding;
        objArr[6] = "mediaType";
        objArr[7] = this.mediaType;
        objArr[8] = PackageDocumentBase.OPFAttributes.href;
        objArr[9] = this.href;
        objArr[10] = "size";
        objArr[11] = Integer.valueOf(this.data == null ? 0 : this.data.length);
        return StringUtil.toString(objArr);
    }
}
