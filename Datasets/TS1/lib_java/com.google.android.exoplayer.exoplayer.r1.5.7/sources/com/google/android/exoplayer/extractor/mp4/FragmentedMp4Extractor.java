package com.google.android.exoplayer.extractor.mp4;

import android.util.Log;
import android.util.Pair;
import android.util.SparseArray;
import com.google.android.exoplayer.C;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.extractor.ChunkIndex;
import com.google.android.exoplayer.extractor.Extractor;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.ExtractorOutput;
import com.google.android.exoplayer.extractor.PositionHolder;
import com.google.android.exoplayer.extractor.SeekMap;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.extractor.mp4.Atom;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.NalUnitUtil;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Stack;
import java.util.UUID;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor.class */
public final class FragmentedMp4Extractor implements Extractor {
    private static final String TAG = "FragmentedMp4Extractor";
    public static final int FLAG_WORKAROUND_EVERY_VIDEO_FRAME_IS_SYNC_FRAME = 1;
    public static final int FLAG_WORKAROUND_IGNORE_TFDT_BOX = 2;
    private static final int FLAG_SIDELOADED = 4;
    private static final byte[] PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE = {-94, 57, 79, 82, 90, -101, 79, 20, -94, 68, 108, 66, 124, 100, -115, -12};
    private static final int STATE_READING_ATOM_HEADER = 0;
    private static final int STATE_READING_ATOM_PAYLOAD = 1;
    private static final int STATE_READING_ENCRYPTION_DATA = 2;
    private static final int STATE_READING_SAMPLE_START = 3;
    private static final int STATE_READING_SAMPLE_CONTINUE = 4;
    private final int flags;
    private final Track sideloadedTrack;
    private final SparseArray<TrackBundle> trackBundles;
    private final ParsableByteArray nalStartCode;
    private final ParsableByteArray nalLength;
    private final ParsableByteArray encryptionSignalByte;
    private final ParsableByteArray atomHeader;
    private final byte[] extendedTypeScratch;
    private final Stack<Atom.ContainerAtom> containerAtoms;
    private int parserState;
    private int atomType;
    private long atomSize;
    private int atomHeaderBytesRead;
    private ParsableByteArray atomData;
    private long endOfMdatPosition;
    private TrackBundle currentTrackBundle;
    private int sampleSize;
    private int sampleBytesWritten;
    private int sampleCurrentNalBytesRemaining;
    private ExtractorOutput extractorOutput;
    private boolean haveOutputSeekMap;

    public FragmentedMp4Extractor() {
        this(0);
    }

    public FragmentedMp4Extractor(int flags) {
        this(flags, null);
    }

    public FragmentedMp4Extractor(int flags, Track sideloadedTrack) {
        this.sideloadedTrack = sideloadedTrack;
        this.flags = flags | (sideloadedTrack != null ? 4 : 0);
        this.atomHeader = new ParsableByteArray(16);
        this.nalStartCode = new ParsableByteArray(NalUnitUtil.NAL_START_CODE);
        this.nalLength = new ParsableByteArray(4);
        this.encryptionSignalByte = new ParsableByteArray(1);
        this.extendedTypeScratch = new byte[16];
        this.containerAtoms = new Stack<>();
        this.trackBundles = new SparseArray<>();
        enterReadingAtomHeaderState();
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public boolean sniff(ExtractorInput input) throws IOException, InterruptedException {
        return Sniffer.sniffFragmented(input);
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void init(ExtractorOutput output) {
        this.extractorOutput = output;
        if (this.sideloadedTrack != null) {
            TrackBundle bundle = new TrackBundle(output.track(0));
            bundle.init(this.sideloadedTrack, new DefaultSampleValues(0, 0, 0, 0));
            this.trackBundles.put(0, bundle);
            this.extractorOutput.endTracks();
        }
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void seek() {
        this.containerAtoms.clear();
        enterReadingAtomHeaderState();
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void release() {
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public int read(ExtractorInput input, PositionHolder seekPosition) throws IOException, InterruptedException {
        while (true) {
            switch (this.parserState) {
                case 0:
                    if (!readAtomHeader(input)) {
                        return -1;
                    }
                    break;
                case 1:
                    readAtomPayload(input);
                    break;
                case 2:
                    readEncryptionData(input);
                    break;
                default:
                    if (!readSample(input)) {
                        break;
                    } else {
                        return 0;
                    }
            }
        }
    }

    private void enterReadingAtomHeaderState() {
        this.parserState = 0;
        this.atomHeaderBytesRead = 0;
    }

    private boolean readAtomHeader(ExtractorInput input) throws IOException, InterruptedException {
        if (this.atomHeaderBytesRead == 0) {
            if (!input.readFully(this.atomHeader.data, 0, 8, true)) {
                return false;
            }
            this.atomHeaderBytesRead = 8;
            this.atomHeader.setPosition(0);
            this.atomSize = this.atomHeader.readUnsignedInt();
            this.atomType = this.atomHeader.readInt();
        }
        if (this.atomSize == 1) {
            input.readFully(this.atomHeader.data, 8, 8);
            this.atomHeaderBytesRead += 8;
            this.atomSize = this.atomHeader.readUnsignedLongToLong();
        }
        long atomPosition = input.getPosition() - this.atomHeaderBytesRead;
        if (this.atomType == Atom.TYPE_moof) {
            int trackCount = this.trackBundles.size();
            for (int i = 0; i < trackCount; i++) {
                TrackFragment fragment = this.trackBundles.valueAt(i).fragment;
                fragment.auxiliaryDataPosition = atomPosition;
                fragment.dataPosition = atomPosition;
            }
        }
        if (this.atomType == Atom.TYPE_mdat) {
            this.currentTrackBundle = null;
            this.endOfMdatPosition = atomPosition + this.atomSize;
            if (!this.haveOutputSeekMap) {
                this.extractorOutput.seekMap(SeekMap.UNSEEKABLE);
                this.haveOutputSeekMap = true;
            }
            this.parserState = 2;
            return true;
        }
        if (shouldParseContainerAtom(this.atomType)) {
            long endPosition = (input.getPosition() + this.atomSize) - 8;
            this.containerAtoms.add(new Atom.ContainerAtom(this.atomType, endPosition));
            if (this.atomSize == this.atomHeaderBytesRead) {
                processAtomEnded(endPosition);
                return true;
            }
            enterReadingAtomHeaderState();
            return true;
        }
        if (!shouldParseLeafAtom(this.atomType)) {
            if (this.atomSize > 2147483647L) {
                throw new ParserException("Skipping atom with length > 2147483647 (unsupported).");
            }
            this.atomData = null;
            this.parserState = 1;
            return true;
        }
        if (this.atomHeaderBytesRead != 8) {
            throw new ParserException("Leaf atom defines extended atom size (unsupported).");
        }
        if (this.atomSize > 2147483647L) {
            throw new ParserException("Leaf atom with length > 2147483647 (unsupported).");
        }
        this.atomData = new ParsableByteArray((int) this.atomSize);
        System.arraycopy(this.atomHeader.data, 0, this.atomData.data, 0, 8);
        this.parserState = 1;
        return true;
    }

    private void readAtomPayload(ExtractorInput input) throws IOException, InterruptedException {
        int atomPayloadSize = ((int) this.atomSize) - this.atomHeaderBytesRead;
        if (this.atomData != null) {
            input.readFully(this.atomData.data, 8, atomPayloadSize);
            onLeafAtomRead(new Atom.LeafAtom(this.atomType, this.atomData), input.getPosition());
        } else {
            input.skipFully(atomPayloadSize);
        }
        processAtomEnded(input.getPosition());
    }

    private void processAtomEnded(long atomEndPosition) throws ParserException {
        while (!this.containerAtoms.isEmpty() && this.containerAtoms.peek().endPosition == atomEndPosition) {
            onContainerAtomRead(this.containerAtoms.pop());
        }
        enterReadingAtomHeaderState();
    }

    private void onLeafAtomRead(Atom.LeafAtom leaf, long inputPosition) throws ParserException {
        if (!this.containerAtoms.isEmpty()) {
            this.containerAtoms.peek().add(leaf);
        } else if (leaf.type == Atom.TYPE_sidx) {
            ChunkIndex segmentIndex = parseSidx(leaf.data, inputPosition);
            this.extractorOutput.seekMap(segmentIndex);
            this.haveOutputSeekMap = true;
        }
    }

    private void onContainerAtomRead(Atom.ContainerAtom container) throws ParserException {
        if (container.type == Atom.TYPE_moov) {
            onMoovContainerAtomRead(container);
        } else if (container.type == Atom.TYPE_moof) {
            onMoofContainerAtomRead(container);
        } else if (!this.containerAtoms.isEmpty()) {
            this.containerAtoms.peek().add(container);
        }
    }

    private void onMoovContainerAtomRead(Atom.ContainerAtom moov) {
        Track track;
        Assertions.checkState(this.sideloadedTrack == null, "Unexpected moov box.");
        List<Atom.LeafAtom> moovLeafChildren = moov.leafChildren;
        int moovLeafChildrenSize = moovLeafChildren.size();
        DrmInitData.Mapped drmInitData = null;
        for (int i = 0; i < moovLeafChildrenSize; i++) {
            Atom.LeafAtom child = moovLeafChildren.get(i);
            if (child.type == Atom.TYPE_pssh) {
                if (drmInitData == null) {
                    drmInitData = new DrmInitData.Mapped();
                }
                byte[] psshData = child.data.data;
                UUID uuid = PsshAtomUtil.parseUuid(psshData);
                if (uuid == null) {
                    Log.w(TAG, "Skipped pssh atom (failed to extract uuid)");
                } else {
                    drmInitData.put(PsshAtomUtil.parseUuid(psshData), new DrmInitData.SchemeInitData(MimeTypes.VIDEO_MP4, psshData));
                }
            }
        }
        if (drmInitData != null) {
            this.extractorOutput.drmInitData(drmInitData);
        }
        Atom.ContainerAtom mvex = moov.getContainerAtomOfType(Atom.TYPE_mvex);
        SparseArray sparseArray = new SparseArray();
        int mvexChildrenSize = mvex.leafChildren.size();
        for (int i2 = 0; i2 < mvexChildrenSize; i2++) {
            Atom.LeafAtom atom = mvex.leafChildren.get(i2);
            if (atom.type == Atom.TYPE_trex) {
                Pair<Integer, DefaultSampleValues> trexData = parseTrex(atom.data);
                sparseArray.put(((Integer) trexData.first).intValue(), trexData.second);
            }
        }
        SparseArray<Track> tracks = new SparseArray<>();
        int moovContainerChildrenSize = moov.containerChildren.size();
        for (int i3 = 0; i3 < moovContainerChildrenSize; i3++) {
            Atom.ContainerAtom atom2 = moov.containerChildren.get(i3);
            if (atom2.type == Atom.TYPE_trak && (track = AtomParsers.parseTrak(atom2, moov.getLeafAtomOfType(Atom.TYPE_mvhd), false)) != null) {
                tracks.put(track.id, track);
            }
        }
        int trackCount = tracks.size();
        if (this.trackBundles.size() == 0) {
            for (int i4 = 0; i4 < trackCount; i4++) {
                this.trackBundles.put(tracks.valueAt(i4).id, new TrackBundle(this.extractorOutput.track(i4)));
            }
            this.extractorOutput.endTracks();
        } else {
            Assertions.checkState(this.trackBundles.size() == trackCount);
        }
        for (int i5 = 0; i5 < trackCount; i5++) {
            Track track2 = tracks.valueAt(i5);
            this.trackBundles.get(track2.id).init(track2, (DefaultSampleValues) sparseArray.get(track2.id));
        }
    }

    private void onMoofContainerAtomRead(Atom.ContainerAtom moof) throws ParserException {
        parseMoof(moof, this.trackBundles, this.flags, this.extendedTypeScratch);
    }

    private static Pair<Integer, DefaultSampleValues> parseTrex(ParsableByteArray trex) {
        trex.setPosition(12);
        int trackId = trex.readInt();
        int defaultSampleDescriptionIndex = trex.readUnsignedIntToInt() - 1;
        int defaultSampleDuration = trex.readUnsignedIntToInt();
        int defaultSampleSize = trex.readUnsignedIntToInt();
        int defaultSampleFlags = trex.readInt();
        return Pair.create(Integer.valueOf(trackId), new DefaultSampleValues(defaultSampleDescriptionIndex, defaultSampleDuration, defaultSampleSize, defaultSampleFlags));
    }

    private static void parseMoof(Atom.ContainerAtom moof, SparseArray<TrackBundle> trackBundleArray, int flags, byte[] extendedTypeScratch) throws ParserException {
        int moofContainerChildrenSize = moof.containerChildren.size();
        for (int i = 0; i < moofContainerChildrenSize; i++) {
            Atom.ContainerAtom child = moof.containerChildren.get(i);
            if (child.type == Atom.TYPE_traf) {
                parseTraf(child, trackBundleArray, flags, extendedTypeScratch);
            }
        }
    }

    private static void parseTraf(Atom.ContainerAtom traf, SparseArray<TrackBundle> trackBundleArray, int flags, byte[] extendedTypeScratch) throws ParserException {
        long decodeTime;
        if (traf.getChildAtomOfTypeCount(Atom.TYPE_trun) != 1) {
            throw new ParserException("Trun count in traf != 1 (unsupported).");
        }
        Atom.LeafAtom tfhd = traf.getLeafAtomOfType(Atom.TYPE_tfhd);
        TrackBundle trackBundle = parseTfhd(tfhd.data, trackBundleArray, flags);
        if (trackBundle == null) {
            return;
        }
        TrackFragment fragment = trackBundle.fragment;
        trackBundle.currentSampleIndex = 0;
        fragment.reset();
        Atom.LeafAtom tfdtAtom = traf.getLeafAtomOfType(Atom.TYPE_tfdt);
        if (tfdtAtom == null || (flags & 2) != 0) {
            decodeTime = 0;
        } else {
            decodeTime = parseTfdt(traf.getLeafAtomOfType(Atom.TYPE_tfdt).data);
        }
        Atom.LeafAtom trun = traf.getLeafAtomOfType(Atom.TYPE_trun);
        parseTrun(trackBundle, decodeTime, flags, trun.data);
        Atom.LeafAtom saiz = traf.getLeafAtomOfType(Atom.TYPE_saiz);
        if (saiz != null) {
            TrackEncryptionBox trackEncryptionBox = trackBundle.track.sampleDescriptionEncryptionBoxes[fragment.header.sampleDescriptionIndex];
            parseSaiz(trackEncryptionBox, saiz.data, fragment);
        }
        Atom.LeafAtom saio = traf.getLeafAtomOfType(Atom.TYPE_saio);
        if (saio != null) {
            parseSaio(saio.data, fragment);
        }
        Atom.LeafAtom senc = traf.getLeafAtomOfType(Atom.TYPE_senc);
        if (senc != null) {
            parseSenc(senc.data, fragment);
        }
        int childrenSize = traf.leafChildren.size();
        for (int i = 0; i < childrenSize; i++) {
            Atom.LeafAtom atom = traf.leafChildren.get(i);
            if (atom.type == Atom.TYPE_uuid) {
                parseUuid(atom.data, fragment, extendedTypeScratch);
            }
        }
    }

    private static void parseSaiz(TrackEncryptionBox encryptionBox, ParsableByteArray saiz, TrackFragment out) throws ParserException {
        int vectorSize = encryptionBox.initializationVectorSize;
        saiz.setPosition(8);
        int fullAtom = saiz.readInt();
        int flags = Atom.parseFullAtomFlags(fullAtom);
        if ((flags & 1) == 1) {
            saiz.skipBytes(8);
        }
        int defaultSampleInfoSize = saiz.readUnsignedByte();
        int sampleCount = saiz.readUnsignedIntToInt();
        if (sampleCount != out.length) {
            throw new ParserException("Length mismatch: " + sampleCount + ", " + out.length);
        }
        int totalSize = 0;
        if (defaultSampleInfoSize == 0) {
            boolean[] sampleHasSubsampleEncryptionTable = out.sampleHasSubsampleEncryptionTable;
            for (int i = 0; i < sampleCount; i++) {
                int sampleInfoSize = saiz.readUnsignedByte();
                totalSize += sampleInfoSize;
                sampleHasSubsampleEncryptionTable[i] = sampleInfoSize > vectorSize;
            }
        } else {
            boolean subsampleEncryption = defaultSampleInfoSize > vectorSize;
            totalSize = 0 + (defaultSampleInfoSize * sampleCount);
            Arrays.fill(out.sampleHasSubsampleEncryptionTable, 0, sampleCount, subsampleEncryption);
        }
        out.initEncryptionData(totalSize);
    }

    private static void parseSaio(ParsableByteArray saio, TrackFragment out) throws ParserException {
        saio.setPosition(8);
        int fullAtom = saio.readInt();
        int flags = Atom.parseFullAtomFlags(fullAtom);
        if ((flags & 1) == 1) {
            saio.skipBytes(8);
        }
        int entryCount = saio.readUnsignedIntToInt();
        if (entryCount != 1) {
            throw new ParserException("Unexpected saio entry count: " + entryCount);
        }
        int version = Atom.parseFullAtomVersion(fullAtom);
        out.auxiliaryDataPosition += version == 0 ? saio.readUnsignedInt() : saio.readUnsignedLongToLong();
    }

    private static TrackBundle parseTfhd(ParsableByteArray tfhd, SparseArray<TrackBundle> trackBundles, int flags) {
        tfhd.setPosition(8);
        int fullAtom = tfhd.readInt();
        int atomFlags = Atom.parseFullAtomFlags(fullAtom);
        int trackId = tfhd.readInt();
        TrackBundle trackBundle = trackBundles.get((flags & 4) == 0 ? trackId : 0);
        if (trackBundle == null) {
            return null;
        }
        if ((atomFlags & 1) != 0) {
            long baseDataPosition = tfhd.readUnsignedLongToLong();
            trackBundle.fragment.dataPosition = baseDataPosition;
            trackBundle.fragment.auxiliaryDataPosition = baseDataPosition;
        }
        DefaultSampleValues defaultSampleValues = trackBundle.defaultSampleValues;
        int defaultSampleDescriptionIndex = (atomFlags & 2) != 0 ? tfhd.readUnsignedIntToInt() - 1 : defaultSampleValues.sampleDescriptionIndex;
        int defaultSampleDuration = (atomFlags & 8) != 0 ? tfhd.readUnsignedIntToInt() : defaultSampleValues.duration;
        int defaultSampleSize = (atomFlags & 16) != 0 ? tfhd.readUnsignedIntToInt() : defaultSampleValues.size;
        int defaultSampleFlags = (atomFlags & 32) != 0 ? tfhd.readUnsignedIntToInt() : defaultSampleValues.flags;
        trackBundle.fragment.header = new DefaultSampleValues(defaultSampleDescriptionIndex, defaultSampleDuration, defaultSampleSize, defaultSampleFlags);
        return trackBundle;
    }

    private static long parseTfdt(ParsableByteArray tfdt) {
        tfdt.setPosition(8);
        int fullAtom = tfdt.readInt();
        int version = Atom.parseFullAtomVersion(fullAtom);
        return version == 1 ? tfdt.readUnsignedLongToLong() : tfdt.readUnsignedInt();
    }

    private static void parseTrun(TrackBundle trackBundle, long decodeTime, int flags, ParsableByteArray trun) {
        trun.setPosition(8);
        int fullAtom = trun.readInt();
        int atomFlags = Atom.parseFullAtomFlags(fullAtom);
        Track track = trackBundle.track;
        TrackFragment fragment = trackBundle.fragment;
        DefaultSampleValues defaultSampleValues = fragment.header;
        int sampleCount = trun.readUnsignedIntToInt();
        if ((atomFlags & 1) != 0) {
            fragment.dataPosition += trun.readInt();
        }
        boolean firstSampleFlagsPresent = (atomFlags & 4) != 0;
        int firstSampleFlags = defaultSampleValues.flags;
        if (firstSampleFlagsPresent) {
            firstSampleFlags = trun.readUnsignedIntToInt();
        }
        boolean sampleDurationsPresent = (atomFlags & 256) != 0;
        boolean sampleSizesPresent = (atomFlags & 512) != 0;
        boolean sampleFlagsPresent = (atomFlags & 1024) != 0;
        boolean sampleCompositionTimeOffsetsPresent = (atomFlags & 2048) != 0;
        long edtsOffset = 0;
        if (track.editListDurations != null && track.editListDurations.length == 1 && track.editListDurations[0] == 0) {
            edtsOffset = Util.scaleLargeTimestamp(track.editListMediaTimes[0], 1000L, track.timescale);
        }
        fragment.initTables(sampleCount);
        int[] sampleSizeTable = fragment.sampleSizeTable;
        int[] sampleCompositionTimeOffsetTable = fragment.sampleCompositionTimeOffsetTable;
        long[] sampleDecodingTimeTable = fragment.sampleDecodingTimeTable;
        boolean[] sampleIsSyncFrameTable = fragment.sampleIsSyncFrameTable;
        long timescale = track.timescale;
        long cumulativeTime = decodeTime;
        boolean workaroundEveryVideoFrameIsSyncFrame = track.type == Track.TYPE_vide && (flags & 1) != 0;
        int i = 0;
        while (i < sampleCount) {
            int sampleDuration = sampleDurationsPresent ? trun.readUnsignedIntToInt() : defaultSampleValues.duration;
            int sampleSize = sampleSizesPresent ? trun.readUnsignedIntToInt() : defaultSampleValues.size;
            int sampleFlags = (i == 0 && firstSampleFlagsPresent) ? firstSampleFlags : sampleFlagsPresent ? trun.readInt() : defaultSampleValues.flags;
            if (sampleCompositionTimeOffsetsPresent) {
                int sampleOffset = trun.readInt();
                sampleCompositionTimeOffsetTable[i] = (int) ((sampleOffset * 1000) / timescale);
            } else {
                sampleCompositionTimeOffsetTable[i] = 0;
            }
            sampleDecodingTimeTable[i] = Util.scaleLargeTimestamp(cumulativeTime, 1000L, timescale) - edtsOffset;
            sampleSizeTable[i] = sampleSize;
            sampleIsSyncFrameTable[i] = ((sampleFlags >> 16) & 1) == 0 && (!workaroundEveryVideoFrameIsSyncFrame || i == 0);
            cumulativeTime += sampleDuration;
            i++;
        }
    }

    private static void parseUuid(ParsableByteArray uuid, TrackFragment out, byte[] extendedTypeScratch) throws ParserException {
        uuid.setPosition(8);
        uuid.readBytes(extendedTypeScratch, 0, 16);
        if (!Arrays.equals(extendedTypeScratch, PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE)) {
            return;
        }
        parseSenc(uuid, 16, out);
    }

    private static void parseSenc(ParsableByteArray senc, TrackFragment out) throws ParserException {
        parseSenc(senc, 0, out);
    }

    private static void parseSenc(ParsableByteArray senc, int offset, TrackFragment out) throws ParserException {
        senc.setPosition(8 + offset);
        int fullAtom = senc.readInt();
        int flags = Atom.parseFullAtomFlags(fullAtom);
        if ((flags & 1) != 0) {
            throw new ParserException("Overriding TrackEncryptionBox parameters is unsupported.");
        }
        boolean subsampleEncryption = (flags & 2) != 0;
        int sampleCount = senc.readUnsignedIntToInt();
        if (sampleCount != out.length) {
            throw new ParserException("Length mismatch: " + sampleCount + ", " + out.length);
        }
        Arrays.fill(out.sampleHasSubsampleEncryptionTable, 0, sampleCount, subsampleEncryption);
        out.initEncryptionData(senc.bytesLeft());
        out.fillEncryptionData(senc);
    }

    private static ChunkIndex parseSidx(ParsableByteArray atom, long inputPosition) throws ParserException {
        long earliestPresentationTime;
        long offset;
        atom.setPosition(8);
        int fullAtom = atom.readInt();
        int version = Atom.parseFullAtomVersion(fullAtom);
        atom.skipBytes(4);
        long timescale = atom.readUnsignedInt();
        if (version == 0) {
            earliestPresentationTime = atom.readUnsignedInt();
            offset = inputPosition + atom.readUnsignedInt();
        } else {
            earliestPresentationTime = atom.readUnsignedLongToLong();
            offset = inputPosition + atom.readUnsignedLongToLong();
        }
        atom.skipBytes(2);
        int referenceCount = atom.readUnsignedShort();
        int[] sizes = new int[referenceCount];
        long[] offsets = new long[referenceCount];
        long[] durationsUs = new long[referenceCount];
        long[] timesUs = new long[referenceCount];
        long time = earliestPresentationTime;
        long timeUs = Util.scaleLargeTimestamp(time, C.MICROS_PER_SECOND, timescale);
        for (int i = 0; i < referenceCount; i++) {
            int firstInt = atom.readInt();
            int type = Integer.MIN_VALUE & firstInt;
            if (type != 0) {
                throw new ParserException("Unhandled indirect reference");
            }
            long referenceDuration = atom.readUnsignedInt();
            sizes[i] = Integer.MAX_VALUE & firstInt;
            offsets[i] = offset;
            timesUs[i] = timeUs;
            time += referenceDuration;
            timeUs = Util.scaleLargeTimestamp(time, C.MICROS_PER_SECOND, timescale);
            durationsUs[i] = timeUs - timesUs[i];
            atom.skipBytes(4);
            offset += sizes[i];
        }
        return new ChunkIndex(sizes, offsets, durationsUs, timesUs);
    }

    private void readEncryptionData(ExtractorInput input) throws IOException, InterruptedException {
        TrackBundle nextTrackBundle = null;
        long nextDataOffset = Long.MAX_VALUE;
        int trackBundlesSize = this.trackBundles.size();
        for (int i = 0; i < trackBundlesSize; i++) {
            TrackFragment trackFragment = this.trackBundles.valueAt(i).fragment;
            if (trackFragment.sampleEncryptionDataNeedsFill && trackFragment.auxiliaryDataPosition < nextDataOffset) {
                nextDataOffset = trackFragment.auxiliaryDataPosition;
                nextTrackBundle = this.trackBundles.valueAt(i);
            }
        }
        if (nextTrackBundle == null) {
            this.parserState = 3;
            return;
        }
        int bytesToSkip = (int) (nextDataOffset - input.getPosition());
        if (bytesToSkip < 0) {
            throw new ParserException("Offset to encryption data was negative.");
        }
        input.skipFully(bytesToSkip);
        nextTrackBundle.fragment.fillEncryptionData(input);
    }

    private boolean readSample(ExtractorInput input) throws IOException, InterruptedException {
        if (this.parserState == 3) {
            if (this.currentTrackBundle == null) {
                this.currentTrackBundle = getNextFragmentRun(this.trackBundles);
                if (this.currentTrackBundle == null) {
                    int bytesToSkip = (int) (this.endOfMdatPosition - input.getPosition());
                    if (bytesToSkip < 0) {
                        throw new ParserException("Offset to end of mdat was negative.");
                    }
                    input.skipFully(bytesToSkip);
                    enterReadingAtomHeaderState();
                    return false;
                }
                long nextDataPosition = this.currentTrackBundle.fragment.dataPosition;
                int bytesToSkip2 = (int) (nextDataPosition - input.getPosition());
                if (bytesToSkip2 < 0) {
                    throw new ParserException("Offset to sample data was negative.");
                }
                input.skipFully(bytesToSkip2);
            }
            this.sampleSize = this.currentTrackBundle.fragment.sampleSizeTable[this.currentTrackBundle.currentSampleIndex];
            if (this.currentTrackBundle.fragment.definesEncryptionData) {
                this.sampleBytesWritten = appendSampleEncryptionData(this.currentTrackBundle);
                this.sampleSize += this.sampleBytesWritten;
            } else {
                this.sampleBytesWritten = 0;
            }
            this.parserState = 4;
            this.sampleCurrentNalBytesRemaining = 0;
        }
        TrackFragment fragment = this.currentTrackBundle.fragment;
        Track track = this.currentTrackBundle.track;
        TrackOutput output = this.currentTrackBundle.output;
        int sampleIndex = this.currentTrackBundle.currentSampleIndex;
        if (track.nalUnitLengthFieldLength != -1) {
            byte[] nalLengthData = this.nalLength.data;
            nalLengthData[0] = 0;
            nalLengthData[1] = 0;
            nalLengthData[2] = 0;
            int nalUnitLengthFieldLength = track.nalUnitLengthFieldLength;
            int nalUnitLengthFieldLengthDiff = 4 - track.nalUnitLengthFieldLength;
            while (this.sampleBytesWritten < this.sampleSize) {
                if (this.sampleCurrentNalBytesRemaining == 0) {
                    input.readFully(this.nalLength.data, nalUnitLengthFieldLengthDiff, nalUnitLengthFieldLength);
                    this.nalLength.setPosition(0);
                    this.sampleCurrentNalBytesRemaining = this.nalLength.readUnsignedIntToInt();
                    this.nalStartCode.setPosition(0);
                    output.sampleData(this.nalStartCode, 4);
                    this.sampleBytesWritten += 4;
                    this.sampleSize += nalUnitLengthFieldLengthDiff;
                } else {
                    int writtenBytes = output.sampleData(input, this.sampleCurrentNalBytesRemaining, false);
                    this.sampleBytesWritten += writtenBytes;
                    this.sampleCurrentNalBytesRemaining -= writtenBytes;
                }
            }
        } else {
            while (this.sampleBytesWritten < this.sampleSize) {
                this.sampleBytesWritten += output.sampleData(input, this.sampleSize - this.sampleBytesWritten, false);
            }
        }
        long sampleTimeUs = fragment.getSamplePresentationTime(sampleIndex) * 1000;
        int sampleFlags = (fragment.definesEncryptionData ? 2 : 0) | (fragment.sampleIsSyncFrameTable[sampleIndex] ? 1 : 0);
        int sampleDescriptionIndex = fragment.header.sampleDescriptionIndex;
        byte[] encryptionKey = fragment.definesEncryptionData ? track.sampleDescriptionEncryptionBoxes[sampleDescriptionIndex].keyId : null;
        output.sampleMetadata(sampleTimeUs, sampleFlags, this.sampleSize, 0, encryptionKey);
        this.currentTrackBundle.currentSampleIndex++;
        if (this.currentTrackBundle.currentSampleIndex == fragment.length) {
            this.currentTrackBundle = null;
        }
        this.parserState = 3;
        return true;
    }

    private static TrackBundle getNextFragmentRun(SparseArray<TrackBundle> trackBundles) {
        TrackBundle nextTrackBundle = null;
        long nextTrackRunOffset = Long.MAX_VALUE;
        int trackBundlesSize = trackBundles.size();
        for (int i = 0; i < trackBundlesSize; i++) {
            TrackBundle trackBundle = trackBundles.valueAt(i);
            if (trackBundle.currentSampleIndex != trackBundle.fragment.length) {
                long trunOffset = trackBundle.fragment.dataPosition;
                if (trunOffset < nextTrackRunOffset) {
                    nextTrackBundle = trackBundle;
                    nextTrackRunOffset = trunOffset;
                }
            }
        }
        return nextTrackBundle;
    }

    private int appendSampleEncryptionData(TrackBundle trackBundle) {
        TrackFragment trackFragment = trackBundle.fragment;
        ParsableByteArray sampleEncryptionData = trackFragment.sampleEncryptionData;
        int sampleDescriptionIndex = trackFragment.header.sampleDescriptionIndex;
        TrackEncryptionBox encryptionBox = trackBundle.track.sampleDescriptionEncryptionBoxes[sampleDescriptionIndex];
        int vectorSize = encryptionBox.initializationVectorSize;
        boolean subsampleEncryption = trackFragment.sampleHasSubsampleEncryptionTable[trackBundle.currentSampleIndex];
        this.encryptionSignalByte.data[0] = (byte) (vectorSize | (subsampleEncryption ? 128 : 0));
        this.encryptionSignalByte.setPosition(0);
        TrackOutput output = trackBundle.output;
        output.sampleData(this.encryptionSignalByte, 1);
        output.sampleData(sampleEncryptionData, vectorSize);
        if (!subsampleEncryption) {
            return 1 + vectorSize;
        }
        int subsampleCount = sampleEncryptionData.readUnsignedShort();
        sampleEncryptionData.skipBytes(-2);
        int subsampleDataLength = 2 + (6 * subsampleCount);
        output.sampleData(sampleEncryptionData, subsampleDataLength);
        return 1 + vectorSize + subsampleDataLength;
    }

    private static boolean shouldParseLeafAtom(int atom) {
        return atom == Atom.TYPE_hdlr || atom == Atom.TYPE_mdhd || atom == Atom.TYPE_mvhd || atom == Atom.TYPE_sidx || atom == Atom.TYPE_stsd || atom == Atom.TYPE_tfdt || atom == Atom.TYPE_tfhd || atom == Atom.TYPE_tkhd || atom == Atom.TYPE_trex || atom == Atom.TYPE_trun || atom == Atom.TYPE_pssh || atom == Atom.TYPE_saiz || atom == Atom.TYPE_saio || atom == Atom.TYPE_senc || atom == Atom.TYPE_uuid || atom == Atom.TYPE_elst;
    }

    private static boolean shouldParseContainerAtom(int atom) {
        return atom == Atom.TYPE_moov || atom == Atom.TYPE_trak || atom == Atom.TYPE_mdia || atom == Atom.TYPE_minf || atom == Atom.TYPE_stbl || atom == Atom.TYPE_moof || atom == Atom.TYPE_traf || atom == Atom.TYPE_mvex || atom == Atom.TYPE_edts;
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle.class */
    private static final class TrackBundle {
        public final TrackFragment fragment = new TrackFragment();
        public final TrackOutput output;
        public Track track;
        public DefaultSampleValues defaultSampleValues;
        public int currentSampleIndex;

        public TrackBundle(TrackOutput output) {
            this.output = output;
        }

        public void init(Track track, DefaultSampleValues defaultSampleValues) {
            this.track = (Track) Assertions.checkNotNull(track);
            this.defaultSampleValues = (DefaultSampleValues) Assertions.checkNotNull(defaultSampleValues);
            this.output.format(track.mediaFormat);
            this.fragment.reset();
            this.currentSampleIndex = 0;
        }
    }
}
