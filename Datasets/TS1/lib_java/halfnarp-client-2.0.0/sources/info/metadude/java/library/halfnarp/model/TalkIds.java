package info.metadude.java.library.halfnarp.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import info.metadude.java.library.halfnarp.TalkIdsSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@JsonSerialize(using = TalkIdsSerializer.class)
/* loaded from: halfnarp-client-2.0.0.jar:info/metadude/java/library/halfnarp/model/TalkIds.class */
public class TalkIds {
    public static final String API_DICTIONARY_KEY = "talk_ids";
    protected Set<Integer> mTalkIds = new HashSet();

    public void add(int talkId) {
        this.mTalkIds.add(Integer.valueOf(talkId));
    }

    public void add(Collection<Integer> talkIds) {
        this.mTalkIds.addAll(talkIds);
    }

    public void clear() {
        this.mTalkIds.clear();
    }

    public int size() {
        return this.mTalkIds.size();
    }

    public Collection<Integer> getTalkIds() {
        return new ArrayList(this.mTalkIds);
    }
}
