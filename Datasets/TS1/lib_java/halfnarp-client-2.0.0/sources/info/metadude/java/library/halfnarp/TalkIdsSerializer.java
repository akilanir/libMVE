package info.metadude.java.library.halfnarp;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import info.metadude.java.library.halfnarp.model.TalkIds;
import java.io.IOException;

/* loaded from: halfnarp-client-2.0.0.jar:info/metadude/java/library/halfnarp/TalkIdsSerializer.class */
public class TalkIdsSerializer extends JsonSerializer<TalkIds> {
    public void serialize(TalkIds talkIds, JsonGenerator jsonGenerator, SerializerProvider provider) throws IOException {
        jsonGenerator.writeStartObject();
        jsonGenerator.writeArrayFieldStart(TalkIds.API_DICTIONARY_KEY);
        for (Integer talkId : talkIds.getTalkIds()) {
            jsonGenerator.writeNumber(talkId.intValue());
        }
        jsonGenerator.writeEndArray();
        jsonGenerator.writeEndObject();
    }
}
