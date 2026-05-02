package org.msgpack.template;

import java.io.IOException;
import java.math.BigInteger;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/BigIntegerTemplate.class */
public class BigIntegerTemplate extends AbstractTemplate<BigInteger> {
    static final BigIntegerTemplate instance = new BigIntegerTemplate();

    private BigIntegerTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, BigInteger target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target);
    }

    @Override // org.msgpack.template.Template
    public BigInteger read(Unpacker u, BigInteger to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return u.readBigInteger();
    }

    public static BigIntegerTemplate getInstance() {
        return instance;
    }
}
