package org.simpleframework.xml.transform;

import java.io.File;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/FileTransform.class */
class FileTransform implements Transform<File> {
    FileTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public File read(String path) {
        return new File(path);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(File path) {
        return path.getPath();
    }
}
