package org.ligi.axt.extensions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/FileAXT.class */
public class FileAXT {
    private final File file;

    public FileAXT(File file) {
        this.file = file;
    }

    public String readToString() throws IOException {
        return readToString(Charset.defaultCharset());
    }

    public String readToString(Charset charset) throws IOException {
        FileInputStream stream = new FileInputStream(this.file);
        try {
            String readToStringFromFileInputStream = readToStringFromFileInputStream(charset, stream);
            stream.close();
            return readToStringFromFileInputStream;
        } catch (Throwable th) {
            stream.close();
            throw th;
        }
    }

    private String readToStringFromFileInputStream(Charset charset, FileInputStream stream) throws IOException {
        FileChannel fc = stream.getChannel();
        try {
            MappedByteBuffer bb = fc.map(FileChannel.MapMode.READ_ONLY, 0L, fc.size());
            String charBuffer = charset.decode(bb).toString();
            fc.close();
            return charBuffer;
        } catch (Throwable th) {
            fc.close();
            throw th;
        }
    }

    public boolean writeString(String string) {
        try {
            writeStringToFile(string);
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    private void writeStringToFile(String string) throws IOException {
        FileWriter fileWriter = new FileWriter(this.file);
        try {
            fileWriter.write(string);
        } finally {
            fileWriter.close();
        }
    }

    public boolean deleteRecursive() {
        return deleteRecursive(this.file);
    }

    public boolean deleteRecursive(File file2delete) {
        if (!file2delete.isDirectory()) {
            return false;
        }
        for (String child : file2delete.list()) {
            File temp = new File(file2delete, child);
            if (temp.isDirectory()) {
                deleteRecursive(temp);
            } else {
                temp.delete();
            }
        }
        return file2delete.delete();
    }

    public <T extends Serializable> T loadToObject() throws IOException, ClassNotFoundException, ClassCastException {
        ObjectInputStream is = new ObjectInputStream(new FileInputStream(this.file));
        try {
            return (T) is.readObject();
        } finally {
            is.close();
        }
    }

    public <T extends Serializable> T loadToObjectOrNull() {
        try {
            return (T) loadToObject();
        } catch (IOException | ClassCastException | ClassNotFoundException e) {
            return null;
        }
    }

    public boolean writeObject(Serializable object) {
        try {
            writeObjectToFile(object);
            return true;
        } catch (FileNotFoundException | IOException e) {
            return false;
        }
    }

    private void writeObjectToFile(Serializable object) throws IOException {
        FileOutputStream fos = new FileOutputStream(this.file);
        try {
            writeObjectToFileOutputStream(object, fos);
        } finally {
            fos.close();
        }
    }

    private void writeObjectToFileOutputStream(Serializable object, FileOutputStream fos) throws IOException {
        ObjectOutputStream os = new ObjectOutputStream(fos);
        try {
            os.writeObject(object);
            os.close();
        } catch (Throwable th) {
            os.close();
            throw th;
        }
    }
}
