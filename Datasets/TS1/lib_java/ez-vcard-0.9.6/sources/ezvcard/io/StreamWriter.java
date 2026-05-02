package ezvcard.io;

import ezvcard.Ezvcard;
import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.io.scribe.ScribeIndex;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.parameter.AddressType;
import ezvcard.property.Address;
import ezvcard.property.Label;
import ezvcard.property.ProductId;
import ezvcard.property.RawProperty;
import ezvcard.property.VCardProperty;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/StreamWriter.class */
public abstract class StreamWriter implements Closeable {
    protected ScribeIndex index = new ScribeIndex();
    protected boolean addProdId = true;
    protected boolean versionStrict = true;

    protected abstract void _write(VCard vCard, List<VCardProperty> list) throws IOException;

    protected abstract VCardVersion getTargetVersion();

    public void write(VCard vcard) throws IOException {
        List<VCardProperty> properties = prepare(vcard);
        _write(vcard, properties);
    }

    public boolean isAddProdId() {
        return this.addProdId;
    }

    public void setAddProdId(boolean addProdId) {
        this.addProdId = addProdId;
    }

    public boolean isVersionStrict() {
        return this.versionStrict;
    }

    public void setVersionStrict(boolean versionStrict) {
        this.versionStrict = versionStrict;
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

    private List<VCardProperty> prepare(VCard vcard) {
        VCardProperty property;
        VCardVersion targetVersion = getTargetVersion();
        List<VCardProperty> propertiesToAdd = new ArrayList<>();
        HashSet hashSet = new HashSet();
        Iterator i$ = vcard.iterator();
        while (i$.hasNext()) {
            VCardProperty property2 = i$.next();
            if (!this.addProdId || !(property2 instanceof ProductId)) {
                if (!this.versionStrict || property2.getSupportedVersions().contains(targetVersion)) {
                    if (!this.index.hasPropertyScribe(property2)) {
                        hashSet.add(property2.getClass());
                    } else {
                        propertiesToAdd.add(property2);
                        if ((property2 instanceof Address) && (targetVersion == VCardVersion.V2_1 || targetVersion == VCardVersion.V3_0)) {
                            Address adr = (Address) property2;
                            String labelStr = adr.getLabel();
                            if (labelStr != null) {
                                Label label = new Label(labelStr);
                                for (AddressType adrType : adr.getTypes()) {
                                    label.addType(adrType);
                                }
                                propertiesToAdd.add(label);
                            }
                        }
                    }
                }
            }
        }
        if (!hashSet.isEmpty()) {
            throw new IllegalArgumentException("No scribes were found the following property classes: " + hashSet);
        }
        if (this.addProdId) {
            if (targetVersion == VCardVersion.V2_1) {
                property = new RawProperty("X-PRODID", "ez-vcard " + Ezvcard.VERSION);
            } else {
                property = new ProductId("ez-vcard " + Ezvcard.VERSION);
            }
            propertiesToAdd.add(property);
        }
        return propertiesToAdd;
    }
}
