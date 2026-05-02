package ezvcard.io;

import ezvcard.VCard;
import ezvcard.io.scribe.ScribeIndex;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.parameter.AddressType;
import ezvcard.property.Address;
import ezvcard.property.Label;
import ezvcard.property.VCardProperty;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/StreamReader.class */
public abstract class StreamReader implements Closeable {
    protected final ParseWarnings warnings = new ParseWarnings();
    protected ScribeIndex index = new ScribeIndex();

    protected abstract VCard _readNext() throws IOException;

    public List<VCard> readAll() throws IOException {
        List<VCard> vcards = new ArrayList<>();
        while (true) {
            VCard vcard = readNext();
            if (vcard != null) {
                vcards.add(vcard);
            } else {
                return vcards;
            }
        }
    }

    public VCard readNext() throws IOException {
        this.warnings.clear();
        return _readNext();
    }

    protected void assignLabels(VCard vcard, List<Label> labels) {
        List<Address> adrs = vcard.getAddresses();
        for (Label label : labels) {
            boolean orphaned = true;
            Set<AddressType> labelTypes = label.getTypes();
            Iterator i$ = adrs.iterator();
            while (true) {
                if (!i$.hasNext()) {
                    break;
                }
                Address adr = i$.next();
                if (adr.getLabel() == null && adr.getTypes().equals(labelTypes)) {
                    adr.setLabel(label.getValue());
                    orphaned = false;
                    break;
                }
            }
            if (orphaned) {
                vcard.addOrphanedLabel(label);
            }
        }
    }

    public void registerScribe(VCardPropertyScribe<? extends VCardProperty> scribe) {
        this.index.register(scribe);
    }

    public ScribeIndex getScribeIndex() {
        return this.index;
    }

    public void setScribeIndex(ScribeIndex index) {
        this.index = index;
    }

    public List<String> getWarnings() {
        return this.warnings.copy();
    }
}
