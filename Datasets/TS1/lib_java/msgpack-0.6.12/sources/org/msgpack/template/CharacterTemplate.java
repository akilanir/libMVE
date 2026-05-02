package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/CharacterTemplate.class */
public class CharacterTemplate extends AbstractTemplate<Character> {
    static final CharacterTemplate instance = new CharacterTemplate();

    private CharacterTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Character target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write((int) target.charValue());
    }

    @Override // org.msgpack.template.Template
    public Character read(Unpacker u, Character to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return Character.valueOf((char) u.readInt());
    }

    public static CharacterTemplate getInstance() {
        return instance;
    }
}
