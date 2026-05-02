package org.msgpack.template;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/MapTemplate.class */
public class MapTemplate<K, V> extends AbstractTemplate<Map<K, V>> {
    private Template<K> keyTemplate;
    private Template<V> valueTemplate;

    public MapTemplate(Template<K> keyTemplate, Template<V> valueTemplate) {
        this.keyTemplate = keyTemplate;
        this.valueTemplate = valueTemplate;
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Map<K, V> target, boolean required) throws IOException {
        if (!(target instanceof Map)) {
            if (target == null) {
                if (required) {
                    throw new MessageTypeException("Attempted to write null");
                }
                pk.writeNil();
                return;
            }
            throw new MessageTypeException("Target is not a Map but " + target.getClass());
        }
        pk.writeMapBegin(target.size());
        for (Map.Entry<K, V> pair : target.entrySet()) {
            this.keyTemplate.write(pk, pair.getKey());
            this.valueTemplate.write(pk, pair.getValue());
        }
        pk.writeMapEnd();
    }

    @Override // org.msgpack.template.Template
    public Map<K, V> read(Unpacker u, Map<K, V> to, boolean required) throws IOException {
        Map<K, V> map;
        if (!required && u.trySkipNil()) {
            return null;
        }
        int n = u.readMapBegin();
        if (to != null) {
            map = to;
            map.clear();
        } else {
            map = new HashMap(n);
        }
        for (int i = 0; i < n; i++) {
            K key = this.keyTemplate.read(u, null);
            V value = this.valueTemplate.read(u, null);
            map.put(key, value);
        }
        u.readMapEnd();
        return map;
    }
}
