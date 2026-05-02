package com.bea.xml.stream.events;

import javax.xml.stream.events.Characters;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/CharactersEvent.class */
public class CharactersEvent extends BaseEvent implements Characters {
    private String data;
    private boolean isCData;
    private boolean isSpace;
    private boolean isIgnorable;

    public CharactersEvent() {
        this.isCData = false;
        this.isSpace = false;
        this.isIgnorable = false;
        init();
    }

    public CharactersEvent(String data) {
        this.isCData = false;
        this.isSpace = false;
        this.isIgnorable = false;
        init();
        setData(data);
    }

    public CharactersEvent(String data, boolean isCData) {
        this.isCData = false;
        this.isSpace = false;
        this.isIgnorable = false;
        init();
        setData(data);
        this.isCData = isCData;
    }

    public void setSpace(boolean space) {
        this.isSpace = space;
    }

    public boolean isWhiteSpace() {
        return this.isSpace;
    }

    public boolean isIgnorableWhiteSpace() {
        return this.isIgnorable;
    }

    public void setIgnorable(boolean ignorable) {
        this.isIgnorable = ignorable;
    }

    protected void init() {
        setEventType(4);
    }

    public String getData() {
        return this.data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public boolean hasData() {
        return this.data != null;
    }

    public boolean isCData() {
        return this.isCData;
    }

    public char[] getDataAsArray() {
        return this.data.toCharArray();
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0073  */
    @Override // com.bea.xml.stream.events.BaseEvent
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void doWriteAsEncodedUnicode(java.io.Writer r6) throws java.io.IOException {
        /*
            r5 = this;
            r0 = r5
            boolean r0 = r0.isCData
            if (r0 == 0) goto L1e
            r0 = r6
            java.lang.String r1 = "<![CDATA["
            r0.write(r1)
            r0 = r6
            r1 = r5
            java.lang.String r1 = r1.getData()
            r0.write(r1)
            r0 = r6
            java.lang.String r1 = "]]>"
            r0.write(r1)
            goto Ldb
        L1e:
            r0 = r5
            java.lang.String r0 = r0.getData()
            r7 = r0
            r0 = r7
            int r0 = r0.length()
            r8 = r0
            r0 = r8
            if (r0 <= 0) goto Ldb
            r0 = 0
            r9 = r0
        L2f:
            r0 = r9
            r1 = r8
            if (r0 >= r1) goto L65
            r0 = r7
            r1 = r9
            char r0 = r0.charAt(r1)
            switch(r0) {
                case 38: goto L5c;
                case 60: goto L5c;
                case 62: goto L5c;
                default: goto L5f;
            }
        L5c:
            goto L65
        L5f:
            int r9 = r9 + 1
            goto L2f
        L65:
            r0 = r9
            r1 = r8
            if (r0 != r1) goto L73
            r0 = r6
            r1 = r7
            r0.write(r1)
            goto Ldb
        L73:
            r0 = r9
            if (r0 <= 0) goto L80
            r0 = r6
            r1 = r7
            r2 = 0
            r3 = r9
            r0.write(r1, r2, r3)
        L80:
            r0 = r9
            r1 = r8
            if (r0 >= r1) goto Ldb
            r0 = r7
            r1 = r9
            char r0 = r0.charAt(r1)
            r10 = r0
            r0 = r10
            switch(r0) {
                case 38: goto Lb4;
                case 60: goto Lbd;
                case 62: goto Lc6;
                default: goto Lcf;
            }
        Lb4:
            r0 = r6
            java.lang.String r1 = "&amp;"
            r0.write(r1)
            goto Ld5
        Lbd:
            r0 = r6
            java.lang.String r1 = "&lt;"
            r0.write(r1)
            goto Ld5
        Lc6:
            r0 = r6
            java.lang.String r1 = "&gt;"
            r0.write(r1)
            goto Ld5
        Lcf:
            r0 = r6
            r1 = r10
            r0.write(r1)
        Ld5:
            int r9 = r9 + 1
            goto L80
        Ldb:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bea.xml.stream.events.CharactersEvent.doWriteAsEncodedUnicode(java.io.Writer):void");
    }
}
