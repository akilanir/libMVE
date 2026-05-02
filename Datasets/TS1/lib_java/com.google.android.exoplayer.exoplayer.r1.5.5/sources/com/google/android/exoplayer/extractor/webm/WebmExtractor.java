package com.google.android.exoplayer.extractor.webm;

import android.util.Pair;
import android.util.SparseArray;
import com.google.android.exoplayer.C;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.extractor.ChunkIndex;
import com.google.android.exoplayer.extractor.Extractor;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.ExtractorOutput;
import com.google.android.exoplayer.extractor.PositionHolder;
import com.google.android.exoplayer.extractor.SeekMap;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.util.LongArray;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.NalUnitUtil;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/webm/WebmExtractor.class */
public final class WebmExtractor implements Extractor {
    private static final int BLOCK_STATE_START = 0;
    private static final int BLOCK_STATE_HEADER = 1;
    private static final int BLOCK_STATE_DATA = 2;
    private static final String DOC_TYPE_WEBM = "webm";
    private static final String DOC_TYPE_MATROSKA = "matroska";
    private static final String CODEC_ID_VP8 = "V_VP8";
    private static final String CODEC_ID_VP9 = "V_VP9";
    private static final String CODEC_ID_MPEG2 = "V_MPEG2";
    private static final String CODEC_ID_MPEG4_SP = "V_MPEG4/ISO/SP";
    private static final String CODEC_ID_MPEG4_ASP = "V_MPEG4/ISO/ASP";
    private static final String CODEC_ID_MPEG4_AP = "V_MPEG4/ISO/AP";
    private static final String CODEC_ID_H264 = "V_MPEG4/ISO/AVC";
    private static final String CODEC_ID_H265 = "V_MPEGH/ISO/HEVC";
    private static final String CODEC_ID_VORBIS = "A_VORBIS";
    private static final String CODEC_ID_OPUS = "A_OPUS";
    private static final String CODEC_ID_AAC = "A_AAC";
    private static final String CODEC_ID_MP3 = "A_MPEG/L3";
    private static final String CODEC_ID_AC3 = "A_AC3";
    private static final String CODEC_ID_E_AC3 = "A_EAC3";
    private static final String CODEC_ID_TRUEHD = "A_TRUEHD";
    private static final String CODEC_ID_DTS = "A_DTS";
    private static final String CODEC_ID_DTS_EXPRESS = "A_DTS/EXPRESS";
    private static final String CODEC_ID_DTS_LOSSLESS = "A_DTS/LOSSLESS";
    private static final String CODEC_ID_SUBRIP = "S_TEXT/UTF8";
    private static final int VORBIS_MAX_INPUT_SIZE = 8192;
    private static final int OPUS_MAX_INPUT_SIZE = 5760;
    private static final int MP3_MAX_INPUT_SIZE = 4096;
    private static final int ENCRYPTION_IV_SIZE = 8;
    private static final int TRACK_TYPE_AUDIO = 2;
    private static final int UNKNOWN = -1;
    private static final int ID_EBML = 440786851;
    private static final int ID_EBML_READ_VERSION = 17143;
    private static final int ID_DOC_TYPE = 17026;
    private static final int ID_DOC_TYPE_READ_VERSION = 17029;
    private static final int ID_SEGMENT = 408125543;
    private static final int ID_SEGMENT_INFO = 357149030;
    private static final int ID_SEEK_HEAD = 290298740;
    private static final int ID_SEEK = 19899;
    private static final int ID_SEEK_ID = 21419;
    private static final int ID_SEEK_POSITION = 21420;
    private static final int ID_INFO = 357149030;
    private static final int ID_TIMECODE_SCALE = 2807729;
    private static final int ID_DURATION = 17545;
    private static final int ID_CLUSTER = 524531317;
    private static final int ID_TIME_CODE = 231;
    private static final int ID_SIMPLE_BLOCK = 163;
    private static final int ID_BLOCK_GROUP = 160;
    private static final int ID_BLOCK = 161;
    private static final int ID_BLOCK_DURATION = 155;
    private static final int ID_REFERENCE_BLOCK = 251;
    private static final int ID_TRACKS = 374648427;
    private static final int ID_TRACK_ENTRY = 174;
    private static final int ID_TRACK_NUMBER = 215;
    private static final int ID_TRACK_TYPE = 131;
    private static final int ID_DEFAULT_DURATION = 2352003;
    private static final int ID_CODEC_ID = 134;
    private static final int ID_CODEC_PRIVATE = 25506;
    private static final int ID_CODEC_DELAY = 22186;
    private static final int ID_SEEK_PRE_ROLL = 22203;
    private static final int ID_VIDEO = 224;
    private static final int ID_PIXEL_WIDTH = 176;
    private static final int ID_PIXEL_HEIGHT = 186;
    private static final int ID_AUDIO = 225;
    private static final int ID_CHANNELS = 159;
    private static final int ID_SAMPLING_FREQUENCY = 181;
    private static final int ID_CONTENT_ENCODINGS = 28032;
    private static final int ID_CONTENT_ENCODING = 25152;
    private static final int ID_CONTENT_ENCODING_ORDER = 20529;
    private static final int ID_CONTENT_ENCODING_SCOPE = 20530;
    private static final int ID_CONTENT_COMPRESSION = 20532;
    private static final int ID_CONTENT_COMPRESSION_ALGORITHM = 16980;
    private static final int ID_CONTENT_COMPRESSION_SETTINGS = 16981;
    private static final int ID_CONTENT_ENCRYPTION = 20533;
    private static final int ID_CONTENT_ENCRYPTION_ALGORITHM = 18401;
    private static final int ID_CONTENT_ENCRYPTION_KEY_ID = 18402;
    private static final int ID_CONTENT_ENCRYPTION_AES_SETTINGS = 18407;
    private static final int ID_CONTENT_ENCRYPTION_AES_SETTINGS_CIPHER_MODE = 18408;
    private static final int ID_CUES = 475249515;
    private static final int ID_CUE_POINT = 187;
    private static final int ID_CUE_TIME = 179;
    private static final int ID_CUE_TRACK_POSITIONS = 183;
    private static final int ID_CUE_CLUSTER_POSITION = 241;
    private static final int ID_LANGUAGE = 2274716;
    private static final int LACING_NONE = 0;
    private static final int LACING_XIPH = 1;
    private static final int LACING_FIXED_SIZE = 2;
    private static final int LACING_EBML = 3;
    private static final byte[] SUBRIP_PREFIX = {49, 10, 48, 48, 58, 48, 48, 58, 48, 48, 44, 48, 48, 48, 32, 45, 45, 62, 32, 48, 48, 58, 48, 48, 58, 48, 48, 44, 48, 48, 48, 10};
    private static final byte[] SUBRIP_TIMECODE_EMPTY = {32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32};
    private static final int SUBRIP_PREFIX_END_TIMECODE_OFFSET = 19;
    private static final int SUBRIP_TIMECODE_LENGTH = 12;
    private final EbmlReader reader;
    private final VarintReader varintReader;
    private final SparseArray<Track> tracks;
    private final ParsableByteArray nalStartCode;
    private final ParsableByteArray nalLength;
    private final ParsableByteArray scratch;
    private final ParsableByteArray vorbisNumPageSamples;
    private final ParsableByteArray seekEntryIdBytes;
    private final ParsableByteArray sampleStrippedBytes;
    private final ParsableByteArray subripSample;
    private long segmentContentPosition;
    private long segmentContentSize;
    private long timecodeScale;
    private long durationTimecode;
    private long durationUs;
    private Track currentTrack;
    private boolean sentDrmInitData;
    private boolean sentSeekMap;
    private int seekEntryId;
    private long seekEntryPosition;
    private boolean seekForCues;
    private long cuesContentPosition;
    private long seekPositionAfterBuildingCues;
    private long clusterTimecodeUs;
    private LongArray cueTimesUs;
    private LongArray cueClusterPositions;
    private boolean seenClusterPositionForCurrentCuePoint;
    private int blockState;
    private long blockTimeUs;
    private long blockDurationUs;
    private int blockLacingSampleIndex;
    private int blockLacingSampleCount;
    private int[] blockLacingSampleSizes;
    private int blockTrackNumber;
    private int blockTrackNumberLength;
    private int blockFlags;
    private int sampleBytesRead;
    private boolean sampleEncodingHandled;
    private int sampleCurrentNalBytesRemaining;
    private int sampleBytesWritten;
    private boolean sampleRead;
    private boolean sampleSeenReferenceBlock;
    private ExtractorOutput extractorOutput;

    public WebmExtractor() {
        this(new DefaultEbmlReader());
    }

    WebmExtractor(EbmlReader reader) {
        this.segmentContentPosition = -1L;
        this.segmentContentSize = -1L;
        this.timecodeScale = -1L;
        this.durationTimecode = -1L;
        this.durationUs = -1L;
        this.cuesContentPosition = -1L;
        this.seekPositionAfterBuildingCues = -1L;
        this.clusterTimecodeUs = -1L;
        this.reader = reader;
        this.reader.init(new InnerEbmlReaderOutput());
        this.varintReader = new VarintReader();
        this.tracks = new SparseArray<>();
        this.scratch = new ParsableByteArray(4);
        this.vorbisNumPageSamples = new ParsableByteArray(ByteBuffer.allocate(4).putInt(-1).array());
        this.seekEntryIdBytes = new ParsableByteArray(4);
        this.nalStartCode = new ParsableByteArray(NalUnitUtil.NAL_START_CODE);
        this.nalLength = new ParsableByteArray(4);
        this.sampleStrippedBytes = new ParsableByteArray();
        this.subripSample = new ParsableByteArray();
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public boolean sniff(ExtractorInput input) throws IOException, InterruptedException {
        return new Sniffer().sniff(input);
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void init(ExtractorOutput output) {
        this.extractorOutput = output;
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void seek() {
        this.clusterTimecodeUs = -1L;
        this.blockState = 0;
        this.reader.reset();
        this.varintReader.reset();
        resetSample();
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public int read(ExtractorInput input, PositionHolder seekPosition) throws IOException, InterruptedException {
        this.sampleRead = false;
        boolean continueReading = true;
        while (continueReading && !this.sampleRead) {
            continueReading = this.reader.read(input);
            if (continueReading && maybeSeekForCues(seekPosition, input.getPosition())) {
                return 1;
            }
        }
        return continueReading ? 0 : -1;
    }

    int getElementType(int id) {
        switch (id) {
            case ID_TRACK_TYPE /* 131 */:
            case ID_BLOCK_DURATION /* 155 */:
            case ID_CHANNELS /* 159 */:
            case ID_PIXEL_WIDTH /* 176 */:
            case ID_CUE_TIME /* 179 */:
            case ID_PIXEL_HEIGHT /* 186 */:
            case ID_TRACK_NUMBER /* 215 */:
            case ID_TIME_CODE /* 231 */:
            case ID_CUE_CLUSTER_POSITION /* 241 */:
            case ID_REFERENCE_BLOCK /* 251 */:
            case ID_CONTENT_COMPRESSION_ALGORITHM /* 16980 */:
            case ID_DOC_TYPE_READ_VERSION /* 17029 */:
            case ID_EBML_READ_VERSION /* 17143 */:
            case ID_CONTENT_ENCRYPTION_ALGORITHM /* 18401 */:
            case ID_CONTENT_ENCRYPTION_AES_SETTINGS_CIPHER_MODE /* 18408 */:
            case ID_CONTENT_ENCODING_ORDER /* 20529 */:
            case ID_CONTENT_ENCODING_SCOPE /* 20530 */:
            case ID_SEEK_POSITION /* 21420 */:
            case ID_CODEC_DELAY /* 22186 */:
            case ID_SEEK_PRE_ROLL /* 22203 */:
            case ID_DEFAULT_DURATION /* 2352003 */:
            case ID_TIMECODE_SCALE /* 2807729 */:
                return 2;
            case ID_CODEC_ID /* 134 */:
            case ID_DOC_TYPE /* 17026 */:
            case ID_LANGUAGE /* 2274716 */:
                return 3;
            case ID_BLOCK_GROUP /* 160 */:
            case ID_TRACK_ENTRY /* 174 */:
            case ID_CUE_TRACK_POSITIONS /* 183 */:
            case ID_CUE_POINT /* 187 */:
            case ID_VIDEO /* 224 */:
            case ID_AUDIO /* 225 */:
            case ID_CONTENT_ENCRYPTION_AES_SETTINGS /* 18407 */:
            case ID_SEEK /* 19899 */:
            case ID_CONTENT_COMPRESSION /* 20532 */:
            case ID_CONTENT_ENCRYPTION /* 20533 */:
            case ID_CONTENT_ENCODING /* 25152 */:
            case ID_CONTENT_ENCODINGS /* 28032 */:
            case ID_SEEK_HEAD /* 290298740 */:
            case 357149030:
            case ID_TRACKS /* 374648427 */:
            case ID_SEGMENT /* 408125543 */:
            case ID_EBML /* 440786851 */:
            case ID_CUES /* 475249515 */:
            case ID_CLUSTER /* 524531317 */:
                return 1;
            case ID_BLOCK /* 161 */:
            case ID_SIMPLE_BLOCK /* 163 */:
            case ID_CONTENT_COMPRESSION_SETTINGS /* 16981 */:
            case ID_CONTENT_ENCRYPTION_KEY_ID /* 18402 */:
            case ID_SEEK_ID /* 21419 */:
            case ID_CODEC_PRIVATE /* 25506 */:
                return 4;
            case ID_SAMPLING_FREQUENCY /* 181 */:
            case ID_DURATION /* 17545 */:
                return 5;
            default:
                return 0;
        }
    }

    boolean isLevel1Element(int id) {
        return id == 357149030 || id == ID_CLUSTER || id == ID_CUES || id == ID_TRACKS;
    }

    void startMasterElement(int id, long contentPosition, long contentSize) throws ParserException {
        switch (id) {
            case ID_BLOCK_GROUP /* 160 */:
                this.sampleSeenReferenceBlock = false;
                return;
            case ID_TRACK_ENTRY /* 174 */:
                this.currentTrack = new Track();
                return;
            case ID_CUE_POINT /* 187 */:
                this.seenClusterPositionForCurrentCuePoint = false;
                return;
            case ID_SEEK /* 19899 */:
                this.seekEntryId = -1;
                this.seekEntryPosition = -1L;
                return;
            case ID_CONTENT_ENCRYPTION /* 20533 */:
                this.currentTrack.hasContentEncryption = true;
                return;
            case ID_CONTENT_ENCODING /* 25152 */:
                return;
            case ID_SEGMENT /* 408125543 */:
                if (this.segmentContentPosition != -1 && this.segmentContentPosition != contentPosition) {
                    throw new ParserException("Multiple Segment elements not supported");
                }
                this.segmentContentPosition = contentPosition;
                this.segmentContentSize = contentSize;
                return;
            case ID_CUES /* 475249515 */:
                this.cueTimesUs = new LongArray();
                this.cueClusterPositions = new LongArray();
                return;
            case ID_CLUSTER /* 524531317 */:
                if (this.sentSeekMap) {
                    return;
                }
                if (this.cuesContentPosition != -1) {
                    this.seekForCues = true;
                    return;
                } else {
                    this.extractorOutput.seekMap(SeekMap.UNSEEKABLE);
                    this.sentSeekMap = true;
                    return;
                }
            default:
                return;
        }
    }

    void endMasterElement(int id) throws ParserException {
        switch (id) {
            case ID_BLOCK_GROUP /* 160 */:
                if (this.blockState != 2) {
                    return;
                }
                if (!this.sampleSeenReferenceBlock) {
                    this.blockFlags |= 1;
                }
                commitSampleToOutput(this.tracks.get(this.blockTrackNumber), this.blockTimeUs);
                this.blockState = 0;
                return;
            case ID_TRACK_ENTRY /* 174 */:
                if (this.tracks.get(this.currentTrack.number) == null && isCodecSupported(this.currentTrack.codecId)) {
                    this.currentTrack.initializeOutput(this.extractorOutput, this.currentTrack.number, this.durationUs);
                    this.tracks.put(this.currentTrack.number, this.currentTrack);
                }
                this.currentTrack = null;
                return;
            case ID_SEEK /* 19899 */:
                if (this.seekEntryId == -1 || this.seekEntryPosition == -1) {
                    throw new ParserException("Mandatory element SeekID or SeekPosition not found");
                }
                if (this.seekEntryId == ID_CUES) {
                    this.cuesContentPosition = this.seekEntryPosition;
                    return;
                }
                return;
            case ID_CONTENT_ENCODING /* 25152 */:
                if (this.currentTrack.hasContentEncryption) {
                    if (this.currentTrack.encryptionKeyId == null) {
                        throw new ParserException("Encrypted Track found but ContentEncKeyID was not found");
                    }
                    if (!this.sentDrmInitData) {
                        this.extractorOutput.drmInitData(new DrmInitData.Universal(new DrmInitData.SchemeInitData(MimeTypes.VIDEO_WEBM, this.currentTrack.encryptionKeyId)));
                        this.sentDrmInitData = true;
                        return;
                    }
                    return;
                }
                return;
            case ID_CONTENT_ENCODINGS /* 28032 */:
                if (this.currentTrack.hasContentEncryption && this.currentTrack.sampleStrippedBytes != null) {
                    throw new ParserException("Combining encryption and compression is not supported");
                }
                return;
            case 357149030:
                if (this.timecodeScale == -1) {
                    this.timecodeScale = C.MICROS_PER_SECOND;
                }
                if (this.durationTimecode != -1) {
                    this.durationUs = scaleTimecodeToUs(this.durationTimecode);
                    return;
                }
                return;
            case ID_TRACKS /* 374648427 */:
                if (this.tracks.size() == 0) {
                    throw new ParserException("No valid tracks were found");
                }
                this.extractorOutput.endTracks();
                return;
            case ID_CUES /* 475249515 */:
                if (!this.sentSeekMap) {
                    this.extractorOutput.seekMap(buildSeekMap());
                    this.sentSeekMap = true;
                    return;
                }
                return;
            default:
                return;
        }
    }

    void integerElement(int id, long value) throws ParserException {
        switch (id) {
            case ID_TRACK_TYPE /* 131 */:
                this.currentTrack.type = (int) value;
                return;
            case ID_BLOCK_DURATION /* 155 */:
                this.blockDurationUs = scaleTimecodeToUs(value);
                return;
            case ID_CHANNELS /* 159 */:
                this.currentTrack.channelCount = (int) value;
                return;
            case ID_PIXEL_WIDTH /* 176 */:
                this.currentTrack.width = (int) value;
                return;
            case ID_CUE_TIME /* 179 */:
                this.cueTimesUs.add(scaleTimecodeToUs(value));
                return;
            case ID_PIXEL_HEIGHT /* 186 */:
                this.currentTrack.height = (int) value;
                return;
            case ID_TRACK_NUMBER /* 215 */:
                this.currentTrack.number = (int) value;
                return;
            case ID_TIME_CODE /* 231 */:
                this.clusterTimecodeUs = scaleTimecodeToUs(value);
                return;
            case ID_CUE_CLUSTER_POSITION /* 241 */:
                if (!this.seenClusterPositionForCurrentCuePoint) {
                    this.cueClusterPositions.add(value);
                    this.seenClusterPositionForCurrentCuePoint = true;
                    return;
                }
                return;
            case ID_REFERENCE_BLOCK /* 251 */:
                this.sampleSeenReferenceBlock = true;
                return;
            case ID_CONTENT_COMPRESSION_ALGORITHM /* 16980 */:
                if (value != 3) {
                    throw new ParserException("ContentCompAlgo " + value + " not supported");
                }
                return;
            case ID_DOC_TYPE_READ_VERSION /* 17029 */:
                if (value < 1 || value > 2) {
                    throw new ParserException("DocTypeReadVersion " + value + " not supported");
                }
                return;
            case ID_EBML_READ_VERSION /* 17143 */:
                if (value != 1) {
                    throw new ParserException("EBMLReadVersion " + value + " not supported");
                }
                return;
            case ID_CONTENT_ENCRYPTION_ALGORITHM /* 18401 */:
                if (value != 5) {
                    throw new ParserException("ContentEncAlgo " + value + " not supported");
                }
                return;
            case ID_CONTENT_ENCRYPTION_AES_SETTINGS_CIPHER_MODE /* 18408 */:
                if (value != 1) {
                    throw new ParserException("AESSettingsCipherMode " + value + " not supported");
                }
                return;
            case ID_CONTENT_ENCODING_ORDER /* 20529 */:
                if (value != 0) {
                    throw new ParserException("ContentEncodingOrder " + value + " not supported");
                }
                return;
            case ID_CONTENT_ENCODING_SCOPE /* 20530 */:
                if (value != 1) {
                    throw new ParserException("ContentEncodingScope " + value + " not supported");
                }
                return;
            case ID_SEEK_POSITION /* 21420 */:
                this.seekEntryPosition = value + this.segmentContentPosition;
                return;
            case ID_CODEC_DELAY /* 22186 */:
                this.currentTrack.codecDelayNs = value;
                return;
            case ID_SEEK_PRE_ROLL /* 22203 */:
                this.currentTrack.seekPreRollNs = value;
                return;
            case ID_DEFAULT_DURATION /* 2352003 */:
                this.currentTrack.defaultSampleDurationNs = (int) value;
                return;
            case ID_TIMECODE_SCALE /* 2807729 */:
                this.timecodeScale = value;
                return;
            default:
                return;
        }
    }

    void floatElement(int id, double value) {
        switch (id) {
            case ID_SAMPLING_FREQUENCY /* 181 */:
                this.currentTrack.sampleRate = (int) value;
                break;
            case ID_DURATION /* 17545 */:
                this.durationTimecode = (long) value;
                break;
        }
    }

    void stringElement(int id, String value) throws ParserException {
        switch (id) {
            case ID_CODEC_ID /* 134 */:
                this.currentTrack.codecId = value;
                return;
            case ID_DOC_TYPE /* 17026 */:
                if (!DOC_TYPE_WEBM.equals(value) && !DOC_TYPE_MATROSKA.equals(value)) {
                    throw new ParserException("DocType " + value + " not supported");
                }
                return;
            case ID_LANGUAGE /* 2274716 */:
                this.currentTrack.language = value;
                return;
            default:
                return;
        }
    }

    void binaryElement(int id, int contentSize, ExtractorInput input) throws IOException, InterruptedException {
        int byteValue;
        switch (id) {
            case ID_BLOCK /* 161 */:
            case ID_SIMPLE_BLOCK /* 163 */:
                if (this.blockState == 0) {
                    this.blockTrackNumber = (int) this.varintReader.readUnsignedVarint(input, false, true, 8);
                    this.blockTrackNumberLength = this.varintReader.getLastLength();
                    this.blockDurationUs = -1L;
                    this.blockState = 1;
                    this.scratch.reset();
                }
                Track track = this.tracks.get(this.blockTrackNumber);
                if (track == null) {
                    input.skipFully(contentSize - this.blockTrackNumberLength);
                    this.blockState = 0;
                    return;
                }
                if (this.blockState == 1) {
                    readScratch(input, 3);
                    int lacing = (this.scratch.data[2] & 6) >> 1;
                    if (lacing == 0) {
                        this.blockLacingSampleCount = 1;
                        this.blockLacingSampleSizes = ensureArrayCapacity(this.blockLacingSampleSizes, 1);
                        this.blockLacingSampleSizes[0] = (contentSize - this.blockTrackNumberLength) - 3;
                    } else {
                        if (id != ID_SIMPLE_BLOCK) {
                            throw new ParserException("Lacing only supported in SimpleBlocks.");
                        }
                        readScratch(input, 4);
                        this.blockLacingSampleCount = (this.scratch.data[3] & 255) + 1;
                        this.blockLacingSampleSizes = ensureArrayCapacity(this.blockLacingSampleSizes, this.blockLacingSampleCount);
                        if (lacing == 2) {
                            int blockLacingSampleSize = ((contentSize - this.blockTrackNumberLength) - 4) / this.blockLacingSampleCount;
                            Arrays.fill(this.blockLacingSampleSizes, 0, this.blockLacingSampleCount, blockLacingSampleSize);
                        } else if (lacing == 1) {
                            int totalSamplesSize = 0;
                            int headerSize = 4;
                            for (int sampleIndex = 0; sampleIndex < this.blockLacingSampleCount - 1; sampleIndex++) {
                                this.blockLacingSampleSizes[sampleIndex] = 0;
                                do {
                                    headerSize++;
                                    readScratch(input, headerSize);
                                    byteValue = this.scratch.data[headerSize - 1] & 255;
                                    int[] iArr = this.blockLacingSampleSizes;
                                    int i = sampleIndex;
                                    iArr[i] = iArr[i] + byteValue;
                                } while (byteValue == 255);
                                totalSamplesSize += this.blockLacingSampleSizes[sampleIndex];
                            }
                            this.blockLacingSampleSizes[this.blockLacingSampleCount - 1] = ((contentSize - this.blockTrackNumberLength) - headerSize) - totalSamplesSize;
                        } else if (lacing == 3) {
                            int totalSamplesSize2 = 0;
                            int headerSize2 = 4;
                            int sampleIndex2 = 0;
                            while (sampleIndex2 < this.blockLacingSampleCount - 1) {
                                this.blockLacingSampleSizes[sampleIndex2] = 0;
                                headerSize2++;
                                readScratch(input, headerSize2);
                                if (this.scratch.data[headerSize2 - 1] == 0) {
                                    throw new ParserException("No valid varint length mask found");
                                }
                                long readValue = 0;
                                int i2 = 0;
                                while (true) {
                                    if (i2 < 8) {
                                        int lengthMask = 1 << (7 - i2);
                                        if ((this.scratch.data[headerSize2 - 1] & lengthMask) == 0) {
                                            i2++;
                                        } else {
                                            int readPosition = headerSize2 - 1;
                                            headerSize2 += i2;
                                            readScratch(input, headerSize2);
                                            int readPosition2 = readPosition + 1;
                                            long j = this.scratch.data[readPosition] & 255 & (lengthMask ^ (-1));
                                            while (true) {
                                                readValue = j;
                                                if (readPosition2 < headerSize2) {
                                                    int i3 = readPosition2;
                                                    readPosition2++;
                                                    j = (readValue << 8) | (this.scratch.data[i3] & 255);
                                                } else if (sampleIndex2 > 0) {
                                                    readValue -= (1 << (6 + (i2 * 7))) - 1;
                                                }
                                            }
                                        }
                                    }
                                }
                                if (readValue < -2147483648L || readValue > 2147483647L) {
                                    throw new ParserException("EBML lacing sample size out of range.");
                                }
                                int intReadValue = (int) readValue;
                                this.blockLacingSampleSizes[sampleIndex2] = sampleIndex2 == 0 ? intReadValue : this.blockLacingSampleSizes[sampleIndex2 - 1] + intReadValue;
                                totalSamplesSize2 += this.blockLacingSampleSizes[sampleIndex2];
                                sampleIndex2++;
                            }
                            this.blockLacingSampleSizes[this.blockLacingSampleCount - 1] = ((contentSize - this.blockTrackNumberLength) - headerSize2) - totalSamplesSize2;
                        } else {
                            throw new ParserException("Unexpected lacing value: " + lacing);
                        }
                    }
                    int timecode = (this.scratch.data[0] << 8) | (this.scratch.data[1] & 255);
                    this.blockTimeUs = this.clusterTimecodeUs + scaleTimecodeToUs(timecode);
                    boolean isInvisible = (this.scratch.data[2] & 8) == 8;
                    boolean isKeyframe = track.type == 2 || (id == ID_SIMPLE_BLOCK && (this.scratch.data[2] & 128) == 128);
                    this.blockFlags = (isKeyframe ? 1 : 0) | (isInvisible ? C.SAMPLE_FLAG_DECODE_ONLY : 0);
                    this.blockState = 2;
                    this.blockLacingSampleIndex = 0;
                }
                if (id == ID_SIMPLE_BLOCK) {
                    while (this.blockLacingSampleIndex < this.blockLacingSampleCount) {
                        writeSampleData(input, track, this.blockLacingSampleSizes[this.blockLacingSampleIndex]);
                        long sampleTimeUs = this.blockTimeUs + ((this.blockLacingSampleIndex * track.defaultSampleDurationNs) / 1000);
                        commitSampleToOutput(track, sampleTimeUs);
                        this.blockLacingSampleIndex++;
                    }
                    this.blockState = 0;
                    return;
                }
                writeSampleData(input, track, this.blockLacingSampleSizes[0]);
                return;
            case ID_CONTENT_COMPRESSION_SETTINGS /* 16981 */:
                this.currentTrack.sampleStrippedBytes = new byte[contentSize];
                input.readFully(this.currentTrack.sampleStrippedBytes, 0, contentSize);
                return;
            case ID_CONTENT_ENCRYPTION_KEY_ID /* 18402 */:
                this.currentTrack.encryptionKeyId = new byte[contentSize];
                input.readFully(this.currentTrack.encryptionKeyId, 0, contentSize);
                return;
            case ID_SEEK_ID /* 21419 */:
                Arrays.fill(this.seekEntryIdBytes.data, (byte) 0);
                input.readFully(this.seekEntryIdBytes.data, 4 - contentSize, contentSize);
                this.seekEntryIdBytes.setPosition(0);
                this.seekEntryId = (int) this.seekEntryIdBytes.readUnsignedInt();
                return;
            case ID_CODEC_PRIVATE /* 25506 */:
                this.currentTrack.codecPrivate = new byte[contentSize];
                input.readFully(this.currentTrack.codecPrivate, 0, contentSize);
                return;
            default:
                throw new ParserException("Unexpected id: " + id);
        }
    }

    private void commitSampleToOutput(Track track, long timeUs) {
        if (CODEC_ID_SUBRIP.equals(track.codecId)) {
            writeSubripSample(track);
        }
        track.output.sampleMetadata(timeUs, this.blockFlags, this.sampleBytesWritten, 0, track.encryptionKeyId);
        this.sampleRead = true;
        resetSample();
    }

    private void resetSample() {
        this.sampleBytesRead = 0;
        this.sampleBytesWritten = 0;
        this.sampleCurrentNalBytesRemaining = 0;
        this.sampleEncodingHandled = false;
        this.sampleStrippedBytes.reset();
    }

    private void readScratch(ExtractorInput input, int requiredLength) throws IOException, InterruptedException {
        if (this.scratch.limit() >= requiredLength) {
            return;
        }
        if (this.scratch.capacity() < requiredLength) {
            this.scratch.reset(Arrays.copyOf(this.scratch.data, Math.max(this.scratch.data.length * 2, requiredLength)), this.scratch.limit());
        }
        input.readFully(this.scratch.data, this.scratch.limit(), requiredLength - this.scratch.limit());
        this.scratch.setLimit(requiredLength);
    }

    private void writeSampleData(ExtractorInput input, Track track, int size) throws IOException, InterruptedException {
        if (CODEC_ID_SUBRIP.equals(track.codecId)) {
            int sizeWithPrefix = SUBRIP_PREFIX.length + size;
            if (this.subripSample.capacity() < sizeWithPrefix) {
                this.subripSample.data = Arrays.copyOf(SUBRIP_PREFIX, sizeWithPrefix + size);
            }
            input.readFully(this.subripSample.data, SUBRIP_PREFIX.length, size);
            this.subripSample.setPosition(0);
            this.subripSample.setLimit(sizeWithPrefix);
            return;
        }
        TrackOutput output = track.output;
        if (!this.sampleEncodingHandled) {
            if (track.hasContentEncryption) {
                this.blockFlags &= -3;
                input.readFully(this.scratch.data, 0, 1);
                this.sampleBytesRead++;
                if ((this.scratch.data[0] & 128) == 128) {
                    throw new ParserException("Extension bit is set in signal byte");
                }
                if ((this.scratch.data[0] & 1) == 1) {
                    this.scratch.data[0] = 8;
                    this.scratch.setPosition(0);
                    output.sampleData(this.scratch, 1);
                    this.sampleBytesWritten++;
                    this.blockFlags |= 2;
                }
            } else if (track.sampleStrippedBytes != null) {
                this.sampleStrippedBytes.reset(track.sampleStrippedBytes, track.sampleStrippedBytes.length);
            }
            this.sampleEncodingHandled = true;
        }
        int size2 = size + this.sampleStrippedBytes.limit();
        if (CODEC_ID_H264.equals(track.codecId) || CODEC_ID_H265.equals(track.codecId)) {
            byte[] nalLengthData = this.nalLength.data;
            nalLengthData[0] = 0;
            nalLengthData[1] = 0;
            nalLengthData[2] = 0;
            int nalUnitLengthFieldLength = track.nalUnitLengthFieldLength;
            int nalUnitLengthFieldLengthDiff = 4 - track.nalUnitLengthFieldLength;
            while (this.sampleBytesRead < size2) {
                if (this.sampleCurrentNalBytesRemaining == 0) {
                    readToTarget(input, nalLengthData, nalUnitLengthFieldLengthDiff, nalUnitLengthFieldLength);
                    this.nalLength.setPosition(0);
                    this.sampleCurrentNalBytesRemaining = this.nalLength.readUnsignedIntToInt();
                    this.nalStartCode.setPosition(0);
                    output.sampleData(this.nalStartCode, 4);
                    this.sampleBytesWritten += 4;
                } else {
                    this.sampleCurrentNalBytesRemaining -= readToOutput(input, output, this.sampleCurrentNalBytesRemaining);
                }
            }
        } else {
            while (this.sampleBytesRead < size2) {
                readToOutput(input, output, size2 - this.sampleBytesRead);
            }
        }
        if (CODEC_ID_VORBIS.equals(track.codecId)) {
            this.vorbisNumPageSamples.setPosition(0);
            output.sampleData(this.vorbisNumPageSamples, 4);
            this.sampleBytesWritten += 4;
        }
    }

    private void writeSubripSample(Track track) {
        setSubripSampleEndTimecode(this.subripSample.data, this.blockDurationUs);
        track.output.sampleData(this.subripSample, this.subripSample.limit());
        this.sampleBytesWritten += this.subripSample.limit();
    }

    private static void setSubripSampleEndTimecode(byte[] subripSampleData, long timeUs) {
        byte[] timeCodeData;
        if (timeUs == -1) {
            timeCodeData = SUBRIP_TIMECODE_EMPTY;
        } else {
            int hours = (int) (timeUs / 3600000000L);
            long timeUs2 = timeUs - (hours * 3600000000L);
            int minutes = (int) (timeUs2 / 60000000);
            long timeUs3 = timeUs2 - (minutes * 60000000);
            int seconds = (int) (timeUs3 / C.MICROS_PER_SECOND);
            int milliseconds = (int) ((timeUs3 - (seconds * 1000000)) / 1000);
            timeCodeData = String.format(Locale.US, "%02d:%02d:%02d,%03d", Integer.valueOf(hours), Integer.valueOf(minutes), Integer.valueOf(seconds), Integer.valueOf(milliseconds)).getBytes();
        }
        System.arraycopy(timeCodeData, 0, subripSampleData, SUBRIP_PREFIX_END_TIMECODE_OFFSET, 12);
    }

    private void readToTarget(ExtractorInput input, byte[] target, int offset, int length) throws IOException, InterruptedException {
        int pendingStrippedBytes = Math.min(length, this.sampleStrippedBytes.bytesLeft());
        input.readFully(target, offset + pendingStrippedBytes, length - pendingStrippedBytes);
        if (pendingStrippedBytes > 0) {
            this.sampleStrippedBytes.readBytes(target, offset, pendingStrippedBytes);
        }
        this.sampleBytesRead += length;
    }

    private int readToOutput(ExtractorInput input, TrackOutput output, int length) throws IOException, InterruptedException {
        int bytesRead;
        int strippedBytesLeft = this.sampleStrippedBytes.bytesLeft();
        if (strippedBytesLeft > 0) {
            bytesRead = Math.min(length, strippedBytesLeft);
            output.sampleData(this.sampleStrippedBytes, bytesRead);
        } else {
            bytesRead = output.sampleData(input, length, false);
        }
        this.sampleBytesRead += bytesRead;
        this.sampleBytesWritten += bytesRead;
        return bytesRead;
    }

    private SeekMap buildSeekMap() {
        if (this.segmentContentPosition == -1 || this.durationUs == -1 || this.cueTimesUs == null || this.cueTimesUs.size() == 0 || this.cueClusterPositions == null || this.cueClusterPositions.size() != this.cueTimesUs.size()) {
            this.cueTimesUs = null;
            this.cueClusterPositions = null;
            return SeekMap.UNSEEKABLE;
        }
        int cuePointsSize = this.cueTimesUs.size();
        int[] sizes = new int[cuePointsSize];
        long[] offsets = new long[cuePointsSize];
        long[] durationsUs = new long[cuePointsSize];
        long[] timesUs = new long[cuePointsSize];
        for (int i = 0; i < cuePointsSize; i++) {
            timesUs[i] = this.cueTimesUs.get(i);
            offsets[i] = this.segmentContentPosition + this.cueClusterPositions.get(i);
        }
        for (int i2 = 0; i2 < cuePointsSize - 1; i2++) {
            sizes[i2] = (int) (offsets[i2 + 1] - offsets[i2]);
            durationsUs[i2] = timesUs[i2 + 1] - timesUs[i2];
        }
        sizes[cuePointsSize - 1] = (int) ((this.segmentContentPosition + this.segmentContentSize) - offsets[cuePointsSize - 1]);
        durationsUs[cuePointsSize - 1] = this.durationUs - timesUs[cuePointsSize - 1];
        this.cueTimesUs = null;
        this.cueClusterPositions = null;
        return new ChunkIndex(sizes, offsets, durationsUs, timesUs);
    }

    private boolean maybeSeekForCues(PositionHolder seekPosition, long currentPosition) {
        if (this.seekForCues) {
            this.seekPositionAfterBuildingCues = currentPosition;
            seekPosition.position = this.cuesContentPosition;
            this.seekForCues = false;
            return true;
        }
        if (this.sentSeekMap && this.seekPositionAfterBuildingCues != -1) {
            seekPosition.position = this.seekPositionAfterBuildingCues;
            this.seekPositionAfterBuildingCues = -1L;
            return true;
        }
        return false;
    }

    private long scaleTimecodeToUs(long unscaledTimecode) throws ParserException {
        if (this.timecodeScale == -1) {
            throw new ParserException("Can't scale timecode prior to timecodeScale being set.");
        }
        return Util.scaleLargeTimestamp(unscaledTimecode, this.timecodeScale, 1000L);
    }

    private static boolean isCodecSupported(String codecId) {
        return CODEC_ID_VP8.equals(codecId) || CODEC_ID_VP9.equals(codecId) || CODEC_ID_MPEG2.equals(codecId) || CODEC_ID_MPEG4_SP.equals(codecId) || CODEC_ID_MPEG4_ASP.equals(codecId) || CODEC_ID_MPEG4_AP.equals(codecId) || CODEC_ID_H264.equals(codecId) || CODEC_ID_H265.equals(codecId) || CODEC_ID_OPUS.equals(codecId) || CODEC_ID_VORBIS.equals(codecId) || CODEC_ID_AAC.equals(codecId) || CODEC_ID_MP3.equals(codecId) || CODEC_ID_AC3.equals(codecId) || CODEC_ID_E_AC3.equals(codecId) || CODEC_ID_TRUEHD.equals(codecId) || CODEC_ID_DTS.equals(codecId) || CODEC_ID_DTS_EXPRESS.equals(codecId) || CODEC_ID_DTS_LOSSLESS.equals(codecId) || CODEC_ID_SUBRIP.equals(codecId);
    }

    private static int[] ensureArrayCapacity(int[] array, int length) {
        if (array == null) {
            return new int[length];
        }
        if (array.length >= length) {
            return array;
        }
        return new int[Math.max(array.length * 2, length)];
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/webm/WebmExtractor$InnerEbmlReaderOutput.class */
    private final class InnerEbmlReaderOutput implements EbmlReaderOutput {
        private InnerEbmlReaderOutput() {
        }

        @Override // com.google.android.exoplayer.extractor.webm.EbmlReaderOutput
        public int getElementType(int id) {
            return WebmExtractor.this.getElementType(id);
        }

        @Override // com.google.android.exoplayer.extractor.webm.EbmlReaderOutput
        public boolean isLevel1Element(int id) {
            return WebmExtractor.this.isLevel1Element(id);
        }

        @Override // com.google.android.exoplayer.extractor.webm.EbmlReaderOutput
        public void startMasterElement(int id, long contentPosition, long contentSize) throws ParserException {
            WebmExtractor.this.startMasterElement(id, contentPosition, contentSize);
        }

        @Override // com.google.android.exoplayer.extractor.webm.EbmlReaderOutput
        public void endMasterElement(int id) throws ParserException {
            WebmExtractor.this.endMasterElement(id);
        }

        @Override // com.google.android.exoplayer.extractor.webm.EbmlReaderOutput
        public void integerElement(int id, long value) throws ParserException {
            WebmExtractor.this.integerElement(id, value);
        }

        @Override // com.google.android.exoplayer.extractor.webm.EbmlReaderOutput
        public void floatElement(int id, double value) throws ParserException {
            WebmExtractor.this.floatElement(id, value);
        }

        @Override // com.google.android.exoplayer.extractor.webm.EbmlReaderOutput
        public void stringElement(int id, String value) throws ParserException {
            WebmExtractor.this.stringElement(id, value);
        }

        @Override // com.google.android.exoplayer.extractor.webm.EbmlReaderOutput
        public void binaryElement(int id, int contentsSize, ExtractorInput input) throws IOException, InterruptedException {
            WebmExtractor.this.binaryElement(id, contentsSize, input);
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/webm/WebmExtractor$Track.class */
    private static final class Track {
        public String codecId;
        public int number;
        public int type;
        public int defaultSampleDurationNs;
        public boolean hasContentEncryption;
        public byte[] sampleStrippedBytes;
        public byte[] encryptionKeyId;
        public byte[] codecPrivate;
        public int width;
        public int height;
        public int channelCount;
        public int sampleRate;
        public long codecDelayNs;
        public long seekPreRollNs;
        private String language;
        public TrackOutput output;
        public int nalUnitLengthFieldLength;

        private Track() {
            this.width = -1;
            this.height = -1;
            this.channelCount = 1;
            this.sampleRate = 8000;
            this.codecDelayNs = 0L;
            this.seekPreRollNs = 0L;
            this.language = "eng";
        }

        public void initializeOutput(ExtractorOutput output, int trackId, long durationUs) throws ParserException {
            int maxInputSize;
            List<byte[]> initializationData;
            String mimeType;
            MediaFormat format;
            maxInputSize = -1;
            initializationData = null;
            switch (this.codecId) {
                case "V_VP8":
                    mimeType = MimeTypes.VIDEO_VP8;
                    break;
                case "V_VP9":
                    mimeType = MimeTypes.VIDEO_VP9;
                    break;
                case "V_MPEG2":
                    mimeType = MimeTypes.VIDEO_MPEG2;
                    break;
                case "V_MPEG4/ISO/SP":
                case "V_MPEG4/ISO/ASP":
                case "V_MPEG4/ISO/AP":
                    mimeType = MimeTypes.VIDEO_MP4V;
                    initializationData = this.codecPrivate == null ? null : Collections.singletonList(this.codecPrivate);
                    break;
                case "V_MPEG4/ISO/AVC":
                    mimeType = MimeTypes.VIDEO_H264;
                    Pair<List<byte[]>, Integer> h264Data = parseAvcCodecPrivate(new ParsableByteArray(this.codecPrivate));
                    initializationData = (List) h264Data.first;
                    this.nalUnitLengthFieldLength = ((Integer) h264Data.second).intValue();
                    break;
                case "V_MPEGH/ISO/HEVC":
                    mimeType = MimeTypes.VIDEO_H265;
                    Pair<List<byte[]>, Integer> hevcData = parseHevcCodecPrivate(new ParsableByteArray(this.codecPrivate));
                    initializationData = (List) hevcData.first;
                    this.nalUnitLengthFieldLength = ((Integer) hevcData.second).intValue();
                    break;
                case "A_VORBIS":
                    mimeType = MimeTypes.AUDIO_VORBIS;
                    maxInputSize = WebmExtractor.VORBIS_MAX_INPUT_SIZE;
                    initializationData = parseVorbisCodecPrivate(this.codecPrivate);
                    break;
                case "A_OPUS":
                    mimeType = MimeTypes.AUDIO_OPUS;
                    maxInputSize = WebmExtractor.OPUS_MAX_INPUT_SIZE;
                    initializationData = new ArrayList(3);
                    initializationData.add(this.codecPrivate);
                    initializationData.add(ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putLong(this.codecDelayNs).array());
                    initializationData.add(ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putLong(this.seekPreRollNs).array());
                    break;
                case "A_AAC":
                    mimeType = MimeTypes.AUDIO_AAC;
                    initializationData = Collections.singletonList(this.codecPrivate);
                    break;
                case "A_MPEG/L3":
                    mimeType = MimeTypes.AUDIO_MPEG;
                    maxInputSize = 4096;
                    break;
                case "A_AC3":
                    mimeType = MimeTypes.AUDIO_AC3;
                    break;
                case "A_EAC3":
                    mimeType = MimeTypes.AUDIO_E_AC3;
                    break;
                case "A_TRUEHD":
                    mimeType = MimeTypes.AUDIO_TRUEHD;
                    break;
                case "A_DTS":
                case "A_DTS/EXPRESS":
                    mimeType = MimeTypes.AUDIO_DTS;
                    break;
                case "A_DTS/LOSSLESS":
                    mimeType = MimeTypes.AUDIO_DTS_HD;
                    break;
                case "S_TEXT/UTF8":
                    mimeType = MimeTypes.APPLICATION_SUBRIP;
                    break;
                default:
                    throw new ParserException("Unrecognized codec identifier.");
            }
            if (MimeTypes.isAudio(mimeType)) {
                format = MediaFormat.createAudioFormat(Integer.toString(trackId), mimeType, -1, maxInputSize, durationUs, this.channelCount, this.sampleRate, initializationData, this.language);
            } else if (MimeTypes.isVideo(mimeType)) {
                format = MediaFormat.createVideoFormat(Integer.toString(trackId), mimeType, -1, maxInputSize, durationUs, this.width, this.height, initializationData);
            } else if (MimeTypes.APPLICATION_SUBRIP.equals(mimeType)) {
                format = MediaFormat.createTextFormat(Integer.toString(trackId), mimeType, -1, durationUs, this.language);
            } else {
                throw new ParserException("Unexpected MIME type.");
            }
            this.output = output.track(this.number);
            this.output.format(format);
        }

        private static Pair<List<byte[]>, Integer> parseAvcCodecPrivate(ParsableByteArray buffer) throws ParserException {
            try {
                buffer.setPosition(4);
                int nalUnitLengthFieldLength = (buffer.readUnsignedByte() & 3) + 1;
                if (nalUnitLengthFieldLength == 3) {
                    throw new ParserException();
                }
                List<byte[]> initializationData = new ArrayList<>();
                int numSequenceParameterSets = buffer.readUnsignedByte() & 31;
                for (int i = 0; i < numSequenceParameterSets; i++) {
                    initializationData.add(NalUnitUtil.parseChildNalUnit(buffer));
                }
                int numPictureParameterSets = buffer.readUnsignedByte();
                for (int j = 0; j < numPictureParameterSets; j++) {
                    initializationData.add(NalUnitUtil.parseChildNalUnit(buffer));
                }
                return Pair.create(initializationData, Integer.valueOf(nalUnitLengthFieldLength));
            } catch (ArrayIndexOutOfBoundsException e) {
                throw new ParserException("Error parsing AVC codec private");
            }
        }

        private static Pair<List<byte[]>, Integer> parseHevcCodecPrivate(ParsableByteArray parent) throws ParserException {
            try {
                parent.setPosition(21);
                int lengthSizeMinusOne = parent.readUnsignedByte() & 3;
                int numberOfArrays = parent.readUnsignedByte();
                int csdLength = 0;
                int csdStartPosition = parent.getPosition();
                for (int i = 0; i < numberOfArrays; i++) {
                    parent.skipBytes(1);
                    int numberOfNalUnits = parent.readUnsignedShort();
                    for (int j = 0; j < numberOfNalUnits; j++) {
                        int nalUnitLength = parent.readUnsignedShort();
                        csdLength += 4 + nalUnitLength;
                        parent.skipBytes(nalUnitLength);
                    }
                }
                parent.setPosition(csdStartPosition);
                byte[] buffer = new byte[csdLength];
                int bufferPosition = 0;
                for (int i2 = 0; i2 < numberOfArrays; i2++) {
                    parent.skipBytes(1);
                    int numberOfNalUnits2 = parent.readUnsignedShort();
                    for (int j2 = 0; j2 < numberOfNalUnits2; j2++) {
                        int nalUnitLength2 = parent.readUnsignedShort();
                        System.arraycopy(NalUnitUtil.NAL_START_CODE, 0, buffer, bufferPosition, NalUnitUtil.NAL_START_CODE.length);
                        int bufferPosition2 = bufferPosition + NalUnitUtil.NAL_START_CODE.length;
                        System.arraycopy(parent.data, parent.getPosition(), buffer, bufferPosition2, nalUnitLength2);
                        bufferPosition = bufferPosition2 + nalUnitLength2;
                        parent.skipBytes(nalUnitLength2);
                    }
                }
                List<byte[]> initializationData = csdLength == 0 ? null : Collections.singletonList(buffer);
                return Pair.create(initializationData, Integer.valueOf(lengthSizeMinusOne + 1));
            } catch (ArrayIndexOutOfBoundsException e) {
                throw new ParserException("Error parsing HEVC codec private");
            }
        }

        private static List<byte[]> parseVorbisCodecPrivate(byte[] codecPrivate) throws ParserException {
            try {
                if (codecPrivate[0] != 2) {
                    throw new ParserException("Error parsing vorbis codec private");
                }
                int offset = 1;
                int vorbisInfoLength = 0;
                while (codecPrivate[offset] == -1) {
                    vorbisInfoLength += NalUnitUtil.EXTENDED_SAR;
                    offset++;
                }
                int i = offset;
                int offset2 = offset + 1;
                int vorbisInfoLength2 = vorbisInfoLength + codecPrivate[i];
                int vorbisSkipLength = 0;
                while (codecPrivate[offset2] == -1) {
                    vorbisSkipLength += NalUnitUtil.EXTENDED_SAR;
                    offset2++;
                }
                int i2 = offset2;
                int offset3 = offset2 + 1;
                int vorbisSkipLength2 = vorbisSkipLength + codecPrivate[i2];
                if (codecPrivate[offset3] != 1) {
                    throw new ParserException("Error parsing vorbis codec private");
                }
                byte[] vorbisInfo = new byte[vorbisInfoLength2];
                System.arraycopy(codecPrivate, offset3, vorbisInfo, 0, vorbisInfoLength2);
                int offset4 = offset3 + vorbisInfoLength2;
                if (codecPrivate[offset4] != 3) {
                    throw new ParserException("Error parsing vorbis codec private");
                }
                int offset5 = offset4 + vorbisSkipLength2;
                if (codecPrivate[offset5] != 5) {
                    throw new ParserException("Error parsing vorbis codec private");
                }
                byte[] vorbisBooks = new byte[codecPrivate.length - offset5];
                System.arraycopy(codecPrivate, offset5, vorbisBooks, 0, codecPrivate.length - offset5);
                List<byte[]> initializationData = new ArrayList<>(2);
                initializationData.add(vorbisInfo);
                initializationData.add(vorbisBooks);
                return initializationData;
            } catch (ArrayIndexOutOfBoundsException e) {
                throw new ParserException("Error parsing vorbis codec private");
            }
        }
    }
}
