package org.ini4j.spi;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.net.URL;
import org.ini4j.Config;
import org.ini4j.InvalidFileFormatException;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/OptionsParser.class */
public class OptionsParser extends AbstractParser {
    private static final String COMMENTS = "!#";
    private static final String OPERATORS = ":=";

    public OptionsParser() {
        super(OPERATORS, COMMENTS);
    }

    public static OptionsParser newInstance() {
        return (OptionsParser) ServiceFinder.findService(OptionsParser.class);
    }

    public static OptionsParser newInstance(Config config) {
        OptionsParser instance = newInstance();
        instance.setConfig(config);
        return instance;
    }

    public void parse(InputStream input, OptionsHandler handler) throws IOException, InvalidFileFormatException {
        parse(newIniSource(input, handler), handler);
    }

    public void parse(Reader input, OptionsHandler handler) throws IOException, InvalidFileFormatException {
        parse(newIniSource(input, handler), handler);
    }

    public void parse(URL input, OptionsHandler handler) throws IOException, InvalidFileFormatException {
        parse(newIniSource(input, handler), handler);
    }

    private void parse(IniSource source, OptionsHandler handler) throws IOException, InvalidFileFormatException {
        handler.startOptions();
        String readLine = source.readLine();
        while (true) {
            String line = readLine;
            if (line != null) {
                parseOptionLine(line, handler, source.getLineNumber());
                readLine = source.readLine();
            } else {
                handler.endOptions();
                return;
            }
        }
    }
}
