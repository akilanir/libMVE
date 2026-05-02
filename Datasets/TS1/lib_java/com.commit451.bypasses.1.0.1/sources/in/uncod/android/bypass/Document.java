package in.uncod.android.bypass;

/* loaded from: com.commit451.bypasses.1.0.1.jar:in/uncod/android/bypass/Document.class */
public class Document {
    Element[] elements;

    public Document(Element[] elements) {
        this.elements = elements;
    }

    public int getElementCount() {
        return this.elements.length;
    }

    public Element getElement(int pos) {
        return this.elements[pos];
    }
}
