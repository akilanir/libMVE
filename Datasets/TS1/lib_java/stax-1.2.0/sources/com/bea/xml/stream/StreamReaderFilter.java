package com.bea.xml.stream;

import com.bea.xml.stream.filters.NameFilter;
import com.bea.xml.stream.filters.TypeFilter;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStreamWriter;
import javax.xml.namespace.QName;
import javax.xml.stream.StreamFilter;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/StreamReaderFilter.class */
public class StreamReaderFilter extends ReaderDelegate {
    private StreamFilter filter;

    public StreamReaderFilter(XMLStreamReader reader) {
        super(reader);
    }

    public StreamReaderFilter(XMLStreamReader reader, StreamFilter filter) {
        super(reader);
        setFilter(filter);
    }

    public void setFilter(StreamFilter filter) {
        this.filter = filter;
    }

    @Override // com.bea.xml.stream.ReaderDelegate
    public int next() throws XMLStreamException {
        if (hasNext()) {
            return super.next();
        }
        throw new IllegalStateException("next() may not be called  when there are no more  items to return");
    }

    @Override // com.bea.xml.stream.ReaderDelegate
    public boolean hasNext() throws XMLStreamException {
        while (super.hasNext()) {
            if (this.filter.accept(getDelegate())) {
                return true;
            }
            super.next();
        }
        return false;
    }

    public static void main(String[] args) throws Exception {
        System.setProperty("javax.xml.stream.XMLInputFactory", "com.bea.xml.stream.MXParserFactory");
        XMLInputFactory factory = XMLInputFactory.newInstance();
        TypeFilter f = new TypeFilter();
        f.addType(1);
        f.addType(2);
        XMLStreamReader reader = factory.createFilteredReader(factory.createXMLStreamReader(new FileReader(args[0])), f);
        while (reader.hasNext()) {
            System.out.println(reader.getLocalName());
            reader.next();
        }
        NameFilter nf = new NameFilter(new QName("banana", "B"));
        XMLStreamReader reader2 = factory.createFilteredReader(factory.createXMLStreamReader(new FileReader(args[0])), nf);
        XMLStreamRecorder r = new XMLStreamRecorder(new OutputStreamWriter(new FileOutputStream("out.stream")));
        while (reader2.hasNext()) {
            r.write(reader2);
            reader2.next();
        }
        r.flush();
    }
}
