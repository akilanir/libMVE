package org.ini4j;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.net.URL;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/Persistable.class */
public interface Persistable {
    File getFile();

    void setFile(File file);

    void load() throws IOException, InvalidFileFormatException;

    void load(InputStream inputStream) throws IOException, InvalidFileFormatException;

    void load(Reader reader) throws IOException, InvalidFileFormatException;

    void load(File file) throws IOException, InvalidFileFormatException;

    void load(URL url) throws IOException, InvalidFileFormatException;

    void store() throws IOException;

    void store(OutputStream outputStream) throws IOException;

    void store(Writer writer) throws IOException;

    void store(File file) throws IOException;
}
