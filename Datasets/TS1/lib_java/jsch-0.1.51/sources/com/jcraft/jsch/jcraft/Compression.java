package com.jcraft.jsch.jcraft;

import com.jcraft.jzlib.ZStream;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/jcraft/Compression.class */
public class Compression implements com.jcraft.jsch.Compression {
    private static final int BUF_SIZE = 4096;
    private int type;
    private byte[] inflated_buf;
    private final int buffer_margin = 52;
    private byte[] tmpbuf = new byte[BUF_SIZE];
    private ZStream stream = new ZStream();

    @Override // com.jcraft.jsch.Compression
    public void init(int type, int level) {
        if (type == 1) {
            this.stream.deflateInit(level);
            this.type = 1;
        } else if (type == 0) {
            this.stream.inflateInit();
            this.inflated_buf = new byte[BUF_SIZE];
            this.type = 0;
        }
    }

    @Override // com.jcraft.jsch.Compression
    public byte[] compress(byte[] buf, int start, int[] len) {
        this.stream.next_in = buf;
        this.stream.next_in_index = start;
        this.stream.avail_in = len[0] - start;
        int outputlen = start;
        byte[] outputbuf = buf;
        do {
            this.stream.next_out = this.tmpbuf;
            this.stream.next_out_index = 0;
            this.stream.avail_out = BUF_SIZE;
            int status = this.stream.deflate(1);
            switch (status) {
                case 0:
                    int tmp = BUF_SIZE - this.stream.avail_out;
                    if (outputbuf.length < outputlen + tmp + 52) {
                        byte[] foo = new byte[(outputlen + tmp + 52) * 2];
                        System.arraycopy(outputbuf, 0, foo, 0, outputbuf.length);
                        outputbuf = foo;
                    }
                    System.arraycopy(this.tmpbuf, 0, outputbuf, outputlen, tmp);
                    outputlen += tmp;
                    break;
                default:
                    System.err.println("compress: deflate returnd " + status);
                    break;
            }
        } while (this.stream.avail_out == 0);
        len[0] = outputlen;
        return outputbuf;
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    @Override // com.jcraft.jsch.Compression
    public byte[] uncompress(byte[] r8, int r9, int[] r10) {
        /*
            Method dump skipped, instructions count: 331
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jcraft.jsch.jcraft.Compression.uncompress(byte[], int, int[]):byte[]");
    }
}
