package org.spongycastle.crypto.digests;

import org.spongycastle.asn1.x509.DisplayText;
import org.spongycastle.crypto.ExtendedDigest;
import org.spongycastle.crypto.tls.AlertDescription;
import org.spongycastle.util.Arrays;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/digests/KeccakDigest.class */
public class KeccakDigest implements ExtendedDigest {
    private static long[] KeccakRoundConstants = keccakInitializeRoundConstants();
    private static int[] KeccakRhoOffsets = keccakInitializeRhoOffsets();
    protected byte[] state;
    protected byte[] dataQueue;
    protected int rate;
    protected int bitsInQueue;
    protected int fixedOutputLength;
    protected boolean squeezing;
    protected int bitsAvailableForSqueezing;
    protected byte[] chunk;
    protected byte[] oneByte;
    long[] C;
    long[] tempA;
    long[] chiC;

    private static long[] keccakInitializeRoundConstants() {
        long[] keccakRoundConstants = new long[24];
        byte[] LFSRstate = {1};
        for (int i = 0; i < 24; i++) {
            keccakRoundConstants[i] = 0;
            for (int j = 0; j < 7; j++) {
                int bitPosition = (1 << j) - 1;
                if (LFSR86540(LFSRstate)) {
                    int i2 = i;
                    keccakRoundConstants[i2] = keccakRoundConstants[i2] ^ (1 << bitPosition);
                }
            }
        }
        return keccakRoundConstants;
    }

    private static boolean LFSR86540(byte[] LFSR) {
        boolean result = (LFSR[0] & 1) != 0;
        if ((LFSR[0] & 128) != 0) {
            LFSR[0] = (byte) ((LFSR[0] << 1) ^ AlertDescription.bad_certificate_status_response);
        } else {
            LFSR[0] = (byte) (LFSR[0] << 1);
        }
        return result;
    }

    private static int[] keccakInitializeRhoOffsets() {
        int[] keccakRhoOffsets = new int[25];
        keccakRhoOffsets[0] = 0;
        int x = 1;
        int y = 0;
        for (int t = 0; t < 24; t++) {
            keccakRhoOffsets[(x % 5) + (5 * (y % 5))] = (((t + 1) * (t + 2)) / 2) % 64;
            int newX = ((0 * x) + (1 * y)) % 5;
            int newY = ((2 * x) + (3 * y)) % 5;
            x = newX;
            y = newY;
        }
        return keccakRhoOffsets;
    }

    private void clearDataQueueSection(int off, int len) {
        for (int i = off; i != off + len; i++) {
            this.dataQueue[i] = 0;
        }
    }

    public KeccakDigest() {
        this(288);
    }

    public KeccakDigest(int bitLength) {
        this.state = new byte[DisplayText.DISPLAY_TEXT_MAXIMUM_SIZE];
        this.dataQueue = new byte[192];
        this.C = new long[5];
        this.tempA = new long[25];
        this.chiC = new long[5];
        init(bitLength);
    }

    public KeccakDigest(KeccakDigest source) {
        this.state = new byte[DisplayText.DISPLAY_TEXT_MAXIMUM_SIZE];
        this.dataQueue = new byte[192];
        this.C = new long[5];
        this.tempA = new long[25];
        this.chiC = new long[5];
        System.arraycopy(source.state, 0, this.state, 0, source.state.length);
        System.arraycopy(source.dataQueue, 0, this.dataQueue, 0, source.dataQueue.length);
        this.rate = source.rate;
        this.bitsInQueue = source.bitsInQueue;
        this.fixedOutputLength = source.fixedOutputLength;
        this.squeezing = source.squeezing;
        this.bitsAvailableForSqueezing = source.bitsAvailableForSqueezing;
        this.chunk = Arrays.clone(source.chunk);
        this.oneByte = Arrays.clone(source.oneByte);
    }

    @Override // org.spongycastle.crypto.Digest
    public String getAlgorithmName() {
        return "Keccak-" + this.fixedOutputLength;
    }

    @Override // org.spongycastle.crypto.Digest
    public int getDigestSize() {
        return this.fixedOutputLength / 8;
    }

    @Override // org.spongycastle.crypto.Digest
    public void update(byte in) {
        this.oneByte[0] = in;
        absorb(this.oneByte, 0, 8L);
    }

    @Override // org.spongycastle.crypto.Digest
    public void update(byte[] in, int inOff, int len) {
        absorb(in, inOff, len * 8);
    }

    @Override // org.spongycastle.crypto.Digest
    public int doFinal(byte[] out, int outOff) {
        squeeze(out, outOff, this.fixedOutputLength);
        reset();
        return getDigestSize();
    }

    protected int doFinal(byte[] out, int outOff, byte partialByte, int partialBits) {
        if (partialBits > 0) {
            this.oneByte[0] = partialByte;
            absorb(this.oneByte, 0, partialBits);
        }
        squeeze(out, outOff, this.fixedOutputLength);
        reset();
        return getDigestSize();
    }

    @Override // org.spongycastle.crypto.Digest
    public void reset() {
        init(this.fixedOutputLength);
    }

    @Override // org.spongycastle.crypto.ExtendedDigest
    public int getByteLength() {
        return this.rate / 8;
    }

    private void init(int bitLength) {
        switch (bitLength) {
            case 128:
                initSponge(1344, 256);
                return;
            case 224:
                initSponge(1152, 448);
                return;
            case 256:
                initSponge(1088, 512);
                return;
            case 288:
                initSponge(1024, 576);
                return;
            case 384:
                initSponge(832, 768);
                return;
            case 512:
                initSponge(576, 1024);
                return;
            default:
                throw new IllegalArgumentException("bitLength must be one of 128, 224, 256, 288, 384, or 512.");
        }
    }

    private void initSponge(int rate, int capacity) {
        if (rate + capacity != 1600) {
            throw new IllegalStateException("rate + capacity != 1600");
        }
        if (rate <= 0 || rate >= 1600 || rate % 64 != 0) {
            throw new IllegalStateException("invalid rate value");
        }
        this.rate = rate;
        Arrays.fill(this.state, (byte) 0);
        Arrays.fill(this.dataQueue, (byte) 0);
        this.bitsInQueue = 0;
        this.squeezing = false;
        this.bitsAvailableForSqueezing = 0;
        this.fixedOutputLength = capacity / 2;
        this.chunk = new byte[rate / 8];
        this.oneByte = new byte[1];
    }

    private void absorbQueue() {
        KeccakAbsorb(this.state, this.dataQueue, this.rate / 8);
        this.bitsInQueue = 0;
    }

    protected void absorb(byte[] data, int off, long databitlen) {
        if (this.bitsInQueue % 8 != 0) {
            throw new IllegalStateException("attempt to absorb with odd length queue.");
        }
        if (this.squeezing) {
            throw new IllegalStateException("attempt to absorb while squeezing.");
        }
        long i = 0;
        while (i < databitlen) {
            if (this.bitsInQueue == 0 && databitlen >= this.rate && i <= databitlen - this.rate) {
                long wholeBlocks = (databitlen - i) / this.rate;
                long j = 0;
                while (true) {
                    long j2 = j;
                    if (j2 >= wholeBlocks) {
                        break;
                    }
                    System.arraycopy(data, (int) (off + (i / 8) + (j2 * this.chunk.length)), this.chunk, 0, this.chunk.length);
                    KeccakAbsorb(this.state, this.chunk, this.chunk.length);
                    j = j2 + 1;
                }
                i += wholeBlocks * this.rate;
            } else {
                int partialBlock = (int) (databitlen - i);
                if (partialBlock + this.bitsInQueue > this.rate) {
                    partialBlock = this.rate - this.bitsInQueue;
                }
                int partialByte = partialBlock % 8;
                int partialBlock2 = partialBlock - partialByte;
                System.arraycopy(data, off + ((int) (i / 8)), this.dataQueue, this.bitsInQueue / 8, partialBlock2 / 8);
                this.bitsInQueue += partialBlock2;
                i += partialBlock2;
                if (this.bitsInQueue == this.rate) {
                    absorbQueue();
                }
                if (partialByte > 0) {
                    int mask = (1 << partialByte) - 1;
                    this.dataQueue[this.bitsInQueue / 8] = (byte) (data[off + ((int) (i / 8))] & mask);
                    this.bitsInQueue += partialByte;
                    i += partialByte;
                }
            }
        }
    }

    private void padAndSwitchToSqueezingPhase() {
        if (this.bitsInQueue + 1 == this.rate) {
            byte[] bArr = this.dataQueue;
            int i = this.bitsInQueue / 8;
            bArr[i] = (byte) (bArr[i] | (1 << (this.bitsInQueue % 8)));
            absorbQueue();
            clearDataQueueSection(0, this.rate / 8);
        } else {
            clearDataQueueSection((this.bitsInQueue + 7) / 8, (this.rate / 8) - ((this.bitsInQueue + 7) / 8));
            byte[] bArr2 = this.dataQueue;
            int i2 = this.bitsInQueue / 8;
            bArr2[i2] = (byte) (bArr2[i2] | (1 << (this.bitsInQueue % 8)));
        }
        byte[] bArr3 = this.dataQueue;
        int i3 = (this.rate - 1) / 8;
        bArr3[i3] = (byte) (bArr3[i3] | (1 << ((this.rate - 1) % 8)));
        absorbQueue();
        if (this.rate == 1024) {
            KeccakExtract1024bits(this.state, this.dataQueue);
            this.bitsAvailableForSqueezing = 1024;
        } else {
            KeccakExtract(this.state, this.dataQueue, this.rate / 64);
            this.bitsAvailableForSqueezing = this.rate;
        }
        this.squeezing = true;
    }

    protected void squeeze(byte[] output, int offset, long outputLength) {
        if (!this.squeezing) {
            padAndSwitchToSqueezingPhase();
        }
        if (outputLength % 8 != 0) {
            throw new IllegalStateException("outputLength not a multiple of 8");
        }
        long j = 0;
        while (true) {
            long i = j;
            if (i < outputLength) {
                if (this.bitsAvailableForSqueezing == 0) {
                    keccakPermutation(this.state);
                    if (this.rate == 1024) {
                        KeccakExtract1024bits(this.state, this.dataQueue);
                        this.bitsAvailableForSqueezing = 1024;
                    } else {
                        KeccakExtract(this.state, this.dataQueue, this.rate / 64);
                        this.bitsAvailableForSqueezing = this.rate;
                    }
                }
                int partialBlock = this.bitsAvailableForSqueezing;
                if (partialBlock > outputLength - i) {
                    partialBlock = (int) (outputLength - i);
                }
                System.arraycopy(this.dataQueue, (this.rate - this.bitsAvailableForSqueezing) / 8, output, offset + ((int) (i / 8)), partialBlock / 8);
                this.bitsAvailableForSqueezing -= partialBlock;
                j = i + partialBlock;
            } else {
                return;
            }
        }
    }

    private void fromBytesToWords(long[] stateAsWords, byte[] state) {
        for (int i = 0; i < 25; i++) {
            stateAsWords[i] = 0;
            int index = i * 8;
            for (int j = 0; j < 8; j++) {
                int i2 = i;
                stateAsWords[i2] = stateAsWords[i2] | ((state[index + j] & 255) << (8 * j));
            }
        }
    }

    private void fromWordsToBytes(byte[] state, long[] stateAsWords) {
        for (int i = 0; i < 25; i++) {
            int index = i * 8;
            for (int j = 0; j < 8; j++) {
                state[index + j] = (byte) ((stateAsWords[i] >>> (8 * j)) & 255);
            }
        }
    }

    private void keccakPermutation(byte[] state) {
        long[] longState = new long[state.length / 8];
        fromBytesToWords(longState, state);
        keccakPermutationOnWords(longState);
        fromWordsToBytes(state, longState);
    }

    private void keccakPermutationAfterXor(byte[] state, byte[] data, int dataLengthInBytes) {
        for (int i = 0; i < dataLengthInBytes; i++) {
            int i2 = i;
            state[i2] = (byte) (state[i2] ^ data[i]);
        }
        keccakPermutation(state);
    }

    private void keccakPermutationOnWords(long[] state) {
        for (int i = 0; i < 24; i++) {
            theta(state);
            rho(state);
            pi(state);
            chi(state);
            iota(state, i);
        }
    }

    private void theta(long[] A) {
        for (int x = 0; x < 5; x++) {
            this.C[x] = 0;
            for (int y = 0; y < 5; y++) {
                long[] jArr = this.C;
                int i = x;
                jArr[i] = jArr[i] ^ A[x + (5 * y)];
            }
        }
        for (int x2 = 0; x2 < 5; x2++) {
            long dX = ((this.C[(x2 + 1) % 5] << 1) ^ (this.C[(x2 + 1) % 5] >>> 63)) ^ this.C[(x2 + 4) % 5];
            for (int y2 = 0; y2 < 5; y2++) {
                int i2 = x2 + (5 * y2);
                A[i2] = A[i2] ^ dX;
            }
        }
    }

    private void rho(long[] A) {
        for (int x = 0; x < 5; x++) {
            for (int y = 0; y < 5; y++) {
                int index = x + (5 * y);
                A[index] = KeccakRhoOffsets[index] != 0 ? (A[index] << KeccakRhoOffsets[index]) ^ (A[index] >>> (64 - KeccakRhoOffsets[index])) : A[index];
            }
        }
    }

    private void pi(long[] A) {
        System.arraycopy(A, 0, this.tempA, 0, this.tempA.length);
        for (int x = 0; x < 5; x++) {
            for (int y = 0; y < 5; y++) {
                A[y + (5 * (((2 * x) + (3 * y)) % 5))] = this.tempA[x + (5 * y)];
            }
        }
    }

    private void chi(long[] A) {
        for (int y = 0; y < 5; y++) {
            for (int x = 0; x < 5; x++) {
                this.chiC[x] = A[x + (5 * y)] ^ ((A[((x + 1) % 5) + (5 * y)] ^ (-1)) & A[((x + 2) % 5) + (5 * y)]);
            }
            for (int x2 = 0; x2 < 5; x2++) {
                A[x2 + (5 * y)] = this.chiC[x2];
            }
        }
    }

    private void iota(long[] A, int indexRound) {
        A[0] = A[0] ^ KeccakRoundConstants[indexRound];
    }

    private void KeccakAbsorb(byte[] byteState, byte[] data, int dataInBytes) {
        keccakPermutationAfterXor(byteState, data, dataInBytes);
    }

    private void KeccakExtract1024bits(byte[] byteState, byte[] data) {
        System.arraycopy(byteState, 0, data, 0, 128);
    }

    private void KeccakExtract(byte[] byteState, byte[] data, int laneCount) {
        System.arraycopy(byteState, 0, data, 0, laneCount * 8);
    }
}
