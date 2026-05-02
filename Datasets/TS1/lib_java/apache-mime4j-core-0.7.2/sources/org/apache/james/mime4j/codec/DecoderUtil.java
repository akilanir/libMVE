package org.apache.james.mime4j.codec;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.james.mime4j.util.CharsetUtil;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/codec/DecoderUtil.class */
public class DecoderUtil {
    private static final Pattern PATTERN_ENCODED_WORD = Pattern.compile("(.*?)=\\?(.+?)\\?(\\w)\\?(.+?)\\?=", 32);

    private static byte[] decodeQuotedPrintable(String s, DecodeMonitor monitor) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            byte[] bytes = s.getBytes("US-ASCII");
            QuotedPrintableInputStream is = new QuotedPrintableInputStream(new ByteArrayInputStream(bytes), monitor);
            while (true) {
                int b = is.read();
                if (b != -1) {
                    baos.write(b);
                } else {
                    return baos.toByteArray();
                }
            }
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    private static byte[] decodeBase64(String s, DecodeMonitor monitor) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            byte[] bytes = s.getBytes("US-ASCII");
            Base64InputStream is = new Base64InputStream(new ByteArrayInputStream(bytes), monitor);
            while (true) {
                int b = is.read();
                if (b != -1) {
                    baos.write(b);
                } else {
                    return baos.toByteArray();
                }
            }
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    static String decodeB(String encodedText, String charset, DecodeMonitor monitor) throws UnsupportedEncodingException {
        byte[] decodedBytes = decodeBase64(encodedText, monitor);
        return new String(decodedBytes, charset);
    }

    static String decodeQ(String encodedText, String charset, DecodeMonitor monitor) throws UnsupportedEncodingException {
        byte[] decodedBytes = decodeQuotedPrintable(replaceUnderscores(encodedText), monitor);
        return new String(decodedBytes, charset);
    }

    static String decodeEncodedWords(String body) {
        return decodeEncodedWords(body, DecodeMonitor.SILENT);
    }

    public static String decodeEncodedWords(String body, DecodeMonitor monitor) throws IllegalArgumentException {
        int tailIndex = 0;
        boolean lastMatchValid = false;
        StringBuilder sb = new StringBuilder();
        Matcher matcher = PATTERN_ENCODED_WORD.matcher(body);
        while (matcher.find()) {
            String separator = matcher.group(1);
            String mimeCharset = matcher.group(2);
            String encoding = matcher.group(3);
            String encodedText = matcher.group(4);
            String decoded = tryDecodeEncodedWord(mimeCharset, encoding, encodedText, monitor);
            if (decoded == null) {
                sb.append(matcher.group(0));
            } else {
                if (!lastMatchValid || !CharsetUtil.isWhitespace(separator)) {
                    sb.append(separator);
                }
                sb.append(decoded);
            }
            tailIndex = matcher.end();
            lastMatchValid = decoded != null;
        }
        if (tailIndex == 0) {
            return body;
        }
        sb.append(body.substring(tailIndex));
        return sb.toString();
    }

    private static String tryDecodeEncodedWord(String mimeCharset, String encoding, String encodedText, DecodeMonitor monitor) {
        Charset charset = CharsetUtil.lookup(mimeCharset);
        if (charset == null) {
            monitor(monitor, mimeCharset, encoding, encodedText, "leaving word encoded", "Mime charser '", mimeCharset, "' doesn't have a corresponding Java charset");
            return null;
        }
        if (encodedText.length() == 0) {
            monitor(monitor, mimeCharset, encoding, encodedText, "leaving word encoded", "Missing encoded text in encoded word");
            return null;
        }
        try {
            if (encoding.equalsIgnoreCase("Q")) {
                return decodeQ(encodedText, charset.name(), monitor);
            }
            if (encoding.equalsIgnoreCase("B")) {
                return decodeB(encodedText, charset.name(), monitor);
            }
            monitor(monitor, mimeCharset, encoding, encodedText, "leaving word encoded", "Warning: Unknown encoding in encoded word");
            return null;
        } catch (UnsupportedEncodingException e) {
            monitor(monitor, mimeCharset, encoding, encodedText, "leaving word encoded", "Unsupported encoding (", e.getMessage(), ") in encoded word");
            return null;
        } catch (RuntimeException e2) {
            monitor(monitor, mimeCharset, encoding, encodedText, "leaving word encoded", "Could not decode (", e2.getMessage(), ") encoded word");
            return null;
        }
    }

    private static void monitor(DecodeMonitor monitor, String mimeCharset, String encoding, String encodedText, String dropDesc, String... strings) throws IllegalArgumentException {
        if (monitor.isListening()) {
            String encodedWord = recombine(mimeCharset, encoding, encodedText);
            StringBuilder text = new StringBuilder();
            for (String str : strings) {
                text.append(str);
            }
            text.append(" (");
            text.append(encodedWord);
            text.append(")");
            String exceptionDesc = text.toString();
            if (monitor.warn(exceptionDesc, dropDesc)) {
                throw new IllegalArgumentException(text.toString());
            }
        }
    }

    private static String recombine(String mimeCharset, String encoding, String encodedText) {
        return "=?" + mimeCharset + "?" + encoding + "?" + encodedText + "?=";
    }

    private static String replaceUnderscores(String str) {
        StringBuilder sb = new StringBuilder(128);
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (c == '_') {
                sb.append("=20");
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }
}
