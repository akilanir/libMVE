package org.jsoup.helper;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.IllegalCharsetNameException;
import java.util.Locale;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.XmlDeclaration;
import org.jsoup.parser.Parser;

/* loaded from: jsoup-1.9.2.jar:org/jsoup/helper/DataUtil.class */
public final class DataUtil {
    static final String defaultCharset = "UTF-8";
    private static final int bufferSize = 131072;
    private static final int UNICODE_BOM = 65279;
    static final int boundaryLength = 32;
    private static final Pattern charsetPattern = Pattern.compile("(?i)\\bcharset=\\s*(?:\"|')?([^\\s,;\"']*)");
    private static final char[] mimeBoundaryChars = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();

    private DataUtil() {
    }

    public static Document load(File in, String charsetName, String baseUri) throws IOException {
        ByteBuffer byteData = readFileToByteBuffer(in);
        return parseByteData(byteData, charsetName, baseUri, Parser.htmlParser());
    }

    public static Document load(InputStream in, String charsetName, String baseUri) throws IOException {
        ByteBuffer byteData = readToByteBuffer(in);
        return parseByteData(byteData, charsetName, baseUri, Parser.htmlParser());
    }

    public static Document load(InputStream in, String charsetName, String baseUri, Parser parser) throws IOException {
        ByteBuffer byteData = readToByteBuffer(in);
        return parseByteData(byteData, charsetName, baseUri, parser);
    }

    static void crossStreams(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[bufferSize];
        while (true) {
            int len = in.read(buffer);
            if (len != -1) {
                out.write(buffer, 0, len);
            } else {
                return;
            }
        }
    }

    static Document parseByteData(ByteBuffer byteData, String charsetName, String baseUri, Parser parser) {
        String docData;
        Document doc = null;
        String charsetName2 = detectCharsetFromBom(byteData, charsetName);
        if (charsetName2 == null) {
            docData = Charset.forName(defaultCharset).decode(byteData).toString();
            doc = parser.parseInput(docData, baseUri);
            Element meta = doc.select("meta[http-equiv=content-type], meta[charset]").first();
            String foundCharset = null;
            if (meta != null) {
                if (meta.hasAttr("http-equiv")) {
                    foundCharset = getCharsetFromContentType(meta.attr("content"));
                }
                if (foundCharset == null && meta.hasAttr("charset")) {
                    foundCharset = meta.attr("charset");
                }
            }
            if (foundCharset == null && (doc.childNode(0) instanceof XmlDeclaration)) {
                XmlDeclaration prolog = (XmlDeclaration) doc.childNode(0);
                if (prolog.name().equals("xml")) {
                    foundCharset = prolog.attr("encoding");
                }
            }
            String foundCharset2 = validateCharset(foundCharset);
            if (foundCharset2 != null && !foundCharset2.equals(defaultCharset)) {
                String foundCharset3 = foundCharset2.trim().replaceAll("[\"']", "");
                charsetName2 = foundCharset3;
                byteData.rewind();
                docData = Charset.forName(foundCharset3).decode(byteData).toString();
                doc = null;
            }
        } else {
            Validate.notEmpty(charsetName2, "Must set charset arg to character set of file to parse. Set to null to attempt to detect from HTML");
            docData = Charset.forName(charsetName2).decode(byteData).toString();
        }
        if (doc == null) {
            doc = parser.parseInput(docData, baseUri);
            doc.outputSettings().charset(charsetName2);
        }
        return doc;
    }

    static ByteBuffer readToByteBuffer(InputStream inStream, int maxSize) throws IOException {
        Validate.isTrue(maxSize >= 0, "maxSize must be 0 (unlimited) or larger");
        boolean capped = maxSize > 0;
        byte[] buffer = new byte[bufferSize];
        ByteArrayOutputStream outStream = new ByteArrayOutputStream(bufferSize);
        int remaining = maxSize;
        while (true) {
            int read = inStream.read(buffer);
            if (read == -1) {
                break;
            }
            if (capped) {
                if (read > remaining) {
                    outStream.write(buffer, 0, remaining);
                    break;
                }
                remaining -= read;
            }
            outStream.write(buffer, 0, read);
        }
        return ByteBuffer.wrap(outStream.toByteArray());
    }

    static ByteBuffer readToByteBuffer(InputStream inStream) throws IOException {
        return readToByteBuffer(inStream, 0);
    }

    static ByteBuffer readFileToByteBuffer(File file) throws IOException {
        RandomAccessFile randomAccessFile = null;
        try {
            randomAccessFile = new RandomAccessFile(file, "r");
            byte[] bytes = new byte[(int) randomAccessFile.length()];
            randomAccessFile.readFully(bytes);
            ByteBuffer wrap = ByteBuffer.wrap(bytes);
            if (randomAccessFile != null) {
                randomAccessFile.close();
            }
            return wrap;
        } catch (Throwable th) {
            if (randomAccessFile != null) {
                randomAccessFile.close();
            }
            throw th;
        }
    }

    static ByteBuffer emptyByteBuffer() {
        return ByteBuffer.allocate(0);
    }

    static String getCharsetFromContentType(String contentType) {
        if (contentType == null) {
            return null;
        }
        Matcher m = charsetPattern.matcher(contentType);
        if (m.find()) {
            String charset = m.group(1).trim();
            return validateCharset(charset.replace("charset=", ""));
        }
        return null;
    }

    private static String validateCharset(String cs) {
        if (cs == null || cs.length() == 0) {
            return null;
        }
        String cs2 = cs.trim().replaceAll("[\"']", "");
        try {
            if (Charset.isSupported(cs2)) {
                return cs2;
            }
            String cs3 = cs2.toUpperCase(Locale.ENGLISH);
            if (Charset.isSupported(cs3)) {
                return cs3;
            }
            return null;
        } catch (IllegalCharsetNameException e) {
            return null;
        }
    }

    static String mimeBoundary() {
        StringBuilder mime = new StringBuilder(boundaryLength);
        Random rand = new Random();
        for (int i = 0; i < boundaryLength; i++) {
            mime.append(mimeBoundaryChars[rand.nextInt(mimeBoundaryChars.length)]);
        }
        return mime.toString();
    }

    private static String detectCharsetFromBom(ByteBuffer byteData, String charsetName) {
        byteData.mark();
        byte[] bom = new byte[4];
        if (byteData.remaining() >= bom.length) {
            byteData.get(bom);
            byteData.rewind();
        }
        if ((bom[0] == 0 && bom[1] == 0 && bom[2] == -2 && bom[3] == -1) || (bom[0] == -1 && bom[1] == -2 && bom[2] == 0 && bom[3] == 0)) {
            charsetName = "UTF-32";
        } else if ((bom[0] == -2 && bom[1] == -1) || (bom[0] == -1 && bom[1] == -2)) {
            charsetName = "UTF-16";
        } else if (bom[0] == -17 && bom[1] == -69 && bom[2] == -65) {
            charsetName = defaultCharset;
            byteData.position(3);
        }
        return charsetName;
    }
}
