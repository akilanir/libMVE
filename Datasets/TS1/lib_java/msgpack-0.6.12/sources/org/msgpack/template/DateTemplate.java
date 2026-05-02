package org.msgpack.template;

import java.io.IOException;
import java.util.Date;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/DateTemplate.class */
public class DateTemplate extends AbstractTemplate<Date> {
    static final DateTemplate instance = new DateTemplate();

    private DateTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Date target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target.getTime());
    }

    @Override // org.msgpack.template.Template
    public Date read(Unpacker u, Date to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        long temp = u.readLong();
        return new Date(temp);
    }

    public static DateTemplate getInstance() {
        return instance;
    }
}
