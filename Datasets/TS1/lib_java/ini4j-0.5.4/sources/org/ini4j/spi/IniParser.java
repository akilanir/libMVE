package org.ini4j.spi;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.net.URL;
import java.util.Locale;
import org.ini4j.Config;
import org.ini4j.InvalidFileFormatException;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/IniParser.class */
public class IniParser extends AbstractParser {
    private static final String COMMENTS = ";#";
    private static final String OPERATORS = ":=";
    static final char SECTION_BEGIN = '[';
    static final char SECTION_END = ']';

    public IniParser() {
        super(OPERATORS, COMMENTS);
    }

    public static IniParser newInstance() {
        return (IniParser) ServiceFinder.findService(IniParser.class);
    }

    public static IniParser newInstance(Config config) {
        IniParser instance = newInstance();
        instance.setConfig(config);
        return instance;
    }

    public void parse(InputStream input, IniHandler handler) throws IOException, InvalidFileFormatException {
        parse(newIniSource(input, handler), handler);
    }

    public void parse(Reader input, IniHandler handler) throws IOException, InvalidFileFormatException {
        parse(newIniSource(input, handler), handler);
    }

    public void parse(URL input, IniHandler handler) throws IOException, InvalidFileFormatException {
        parse(newIniSource(input, handler), handler);
    }

    private void parse(IniSource source, IniHandler handler) throws IOException, InvalidFileFormatException {
        handler.startIni();
        String sectionName = null;
        String readLine = source.readLine();
        while (true) {
            String line = readLine;
            if (line == null) {
                break;
            }
            if (line.charAt(0) == SECTION_BEGIN) {
                if (sectionName != null) {
                    handler.endSection();
                }
                sectionName = parseSectionLine(line, source, handler);
            } else {
                if (sectionName == null) {
                    if (getConfig().isGlobalSection()) {
                        sectionName = getConfig().getGlobalSectionName();
                        handler.startSection(sectionName);
                    } else {
                        parseError(line, source.getLineNumber());
                    }
                }
                parseOptionLine(line, handler, source.getLineNumber());
            }
            readLine = source.readLine();
        }
        if (sectionName != null) {
            handler.endSection();
        }
        handler.endIni();
    }

    private String parseSectionLine(String line, IniSource source, IniHandler handler) throws InvalidFileFormatException {
        if (line.charAt(line.length() - 1) != SECTION_END) {
            parseError(line, source.getLineNumber());
        }
        String sectionName = unescapeKey(line.substring(1, line.length() - 1).trim());
        if (sectionName.length() == 0 && !getConfig().isUnnamedSection()) {
            parseError(line, source.getLineNumber());
        }
        if (getConfig().isLowerCaseSection()) {
            sectionName = sectionName.toLowerCase(Locale.getDefault());
        }
        handler.startSection(sectionName);
        return sectionName;
    }
}
