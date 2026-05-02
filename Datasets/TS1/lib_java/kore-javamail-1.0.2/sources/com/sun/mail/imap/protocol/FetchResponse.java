package com.sun.mail.imap.protocol;

import com.sun.mail.iap.ParsingException;
import com.sun.mail.iap.Protocol;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/FetchResponse.class */
public class FetchResponse extends IMAPResponse {
    private Item[] items;
    private Map extensionItems;
    private final FetchItem[] fitems;
    private static final char[] HEADER = {'.', 'H', 'E', 'A', 'D', 'E', 'R'};
    private static final char[] TEXT = {'.', 'T', 'E', 'X', 'T'};

    public FetchResponse(Protocol p) throws IOException, ProtocolException {
        super(p);
        this.fitems = null;
        parse();
    }

    public FetchResponse(IMAPResponse r) throws IOException, ProtocolException {
        this(r, null);
    }

    public FetchResponse(IMAPResponse r, FetchItem[] fitems) throws IOException, ProtocolException {
        super(r);
        this.fitems = fitems;
        parse();
    }

    public int getItemCount() {
        return this.items.length;
    }

    public Item getItem(int index) {
        return this.items[index];
    }

    public <T extends Item> T getItem(Class<T> c) {
        for (int i = 0; i < this.items.length; i++) {
            if (c.isInstance(this.items[i])) {
                return c.cast(this.items[i]);
            }
        }
        return null;
    }

    public static <T extends Item> T getItem(Response[] r, int msgno, Class<T> c) {
        if (r == null) {
            return null;
        }
        for (int i = 0; i < r.length; i++) {
            if (r[i] != null && (r[i] instanceof FetchResponse) && ((FetchResponse) r[i]).getNumber() == msgno) {
                FetchResponse f = (FetchResponse) r[i];
                for (int j = 0; j < f.items.length; j++) {
                    if (c.isInstance(f.items[j])) {
                        return c.cast(f.items[j]);
                    }
                }
            }
        }
        return null;
    }

    public static <T extends Item> List<T> getItems(Response[] r, int msgno, Class<T> c) {
        List<T> items = new ArrayList<>();
        if (r == null) {
            return items;
        }
        for (int i = 0; i < r.length; i++) {
            if (r[i] != null && (r[i] instanceof FetchResponse) && ((FetchResponse) r[i]).getNumber() == msgno) {
                FetchResponse f = (FetchResponse) r[i];
                for (int j = 0; j < f.items.length; j++) {
                    if (c.isInstance(f.items[j])) {
                        items.add(c.cast(f.items[j]));
                    }
                }
            }
        }
        return items;
    }

    public Map getExtensionItems() {
        if (this.extensionItems == null) {
            this.extensionItems = new HashMap();
        }
        return this.extensionItems;
    }

    private void parse() throws ParsingException {
        skipSpaces();
        if (this.buffer[this.index] != 40) {
            throw new ParsingException("error in FETCH parsing, missing '(' at index " + this.index);
        }
        List<Item> v = new ArrayList<>();
        do {
            this.index++;
            if (this.index >= this.size) {
                throw new ParsingException("error in FETCH parsing, ran off end of buffer, size " + this.size);
            }
            Item i = parseItem();
            if (i != null) {
                v.add(i);
            } else if (!parseExtensionItem()) {
                throw new ParsingException("error in FETCH parsing, unrecognized item at index " + this.index);
            }
        } while (this.buffer[this.index] != 41);
        this.index++;
        this.items = (Item[]) v.toArray(new Item[v.size()]);
    }

    private Item parseItem() throws ParsingException {
        switch (this.buffer[this.index]) {
            case 66:
            case 98:
                if (match(BODYSTRUCTURE.name)) {
                    return new BODYSTRUCTURE(this);
                }
                if (match(BODY.name)) {
                    if (this.buffer[this.index] == 91) {
                        return new BODY(this);
                    }
                    return new BODYSTRUCTURE(this);
                }
                return null;
            case 67:
            case 68:
            case 71:
            case 72:
            case 74:
            case 75:
            case 76:
            case 78:
            case 79:
            case 80:
            case 81:
            case 83:
            case 84:
            case 86:
            case 87:
            case 88:
            case 89:
            case 90:
            case 91:
            case 92:
            case 93:
            case 94:
            case 95:
            case 96:
            case 97:
            case 99:
            case 100:
            case 103:
            case 104:
            case 106:
            case 107:
            case 108:
            case 110:
            case 111:
            case 112:
            case 113:
            case 115:
            case 116:
            default:
                return null;
            case 69:
            case 101:
                if (match(ENVELOPE.name)) {
                    return new ENVELOPE(this);
                }
                return null;
            case 70:
            case 102:
                if (match(FLAGS.name)) {
                    return new FLAGS(this);
                }
                return null;
            case 73:
            case 105:
                if (match(INTERNALDATE.name)) {
                    return new INTERNALDATE(this);
                }
                return null;
            case 77:
            case 109:
                if (match(MODSEQ.name)) {
                    return new MODSEQ(this);
                }
                return null;
            case 82:
            case 114:
                if (match(RFC822SIZE.name)) {
                    return new RFC822SIZE(this);
                }
                if (match(RFC822DATA.name)) {
                    boolean isHeader = false;
                    if (match(HEADER)) {
                        isHeader = true;
                    } else if (match(TEXT)) {
                    }
                    return new RFC822DATA(this, isHeader);
                }
                return null;
            case 85:
            case 117:
                if (match(UID.name)) {
                    return new UID(this);
                }
                return null;
        }
    }

    private boolean parseExtensionItem() throws ParsingException {
        if (this.fitems == null) {
            return false;
        }
        for (int i = 0; i < this.fitems.length; i++) {
            if (match(this.fitems[i].getName())) {
                getExtensionItems().put(this.fitems[i].getName(), this.fitems[i].parseItem(this));
                return true;
            }
        }
        return false;
    }

    private boolean match(char[] itemName) {
        int len = itemName.length;
        int i = 0;
        int j = this.index;
        while (i < len) {
            int i2 = j;
            j++;
            int i3 = i;
            i++;
            if (Character.toUpperCase((char) this.buffer[i2]) != itemName[i3]) {
                return false;
            }
        }
        this.index += len;
        return true;
    }

    private boolean match(String itemName) {
        int len = itemName.length();
        int i = 0;
        int j = this.index;
        while (i < len) {
            int i2 = j;
            j++;
            int i3 = i;
            i++;
            if (Character.toUpperCase((char) this.buffer[i2]) != itemName.charAt(i3)) {
                return false;
            }
        }
        this.index += len;
        return true;
    }
}
