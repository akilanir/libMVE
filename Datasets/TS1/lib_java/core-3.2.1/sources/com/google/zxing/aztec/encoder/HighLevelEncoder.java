package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* loaded from: core-3.2.1.jar:com/google/zxing/aztec/encoder/HighLevelEncoder.class */
public final class HighLevelEncoder {
    static final int MODE_UPPER = 0;
    static final int MODE_LOWER = 1;
    static final int MODE_DIGIT = 2;
    static final int MODE_MIXED = 3;
    static final int MODE_PUNCT = 4;
    static final int[][] SHIFT_TABLE;
    private final byte[] text;
    static final String[] MODE_NAMES = {"UPPER", "LOWER", "DIGIT", "MIXED", "PUNCT"};
    static final int[][] LATCH_TABLE = {new int[]{0, 327708, 327710, 327709, 656318}, new int[]{590318, 0, 327710, 327709, 656318}, new int[]{262158, 590300, 0, 590301, 932798}, new int[]{327709, 327708, 656318, 0, 327710}, new int[]{327711, 656380, 656382, 656381, 0}};
    private static final int[][] CHAR_MAP = new int[5][256];

    /* JADX WARN: Type inference failed for: r0v3, types: [int[], int[][]] */
    static {
        CHAR_MAP[0][32] = MODE_LOWER;
        for (int c = 65; c <= 90; c += MODE_LOWER) {
            CHAR_MAP[0][c] = (c - 65) + MODE_DIGIT;
        }
        CHAR_MAP[MODE_LOWER][32] = MODE_LOWER;
        for (int c2 = 97; c2 <= 122; c2 += MODE_LOWER) {
            CHAR_MAP[MODE_LOWER][c2] = (c2 - 97) + MODE_DIGIT;
        }
        CHAR_MAP[MODE_DIGIT][32] = MODE_LOWER;
        for (int c3 = 48; c3 <= 57; c3 += MODE_LOWER) {
            CHAR_MAP[MODE_DIGIT][c3] = (c3 - 48) + MODE_DIGIT;
        }
        CHAR_MAP[MODE_DIGIT][44] = 12;
        CHAR_MAP[MODE_DIGIT][46] = 13;
        int[] mixedTable = {0, 32, MODE_LOWER, MODE_DIGIT, 3, MODE_PUNCT, 5, 6, 7, 8, 9, 10, 11, 12, 13, 27, 28, 29, 30, 31, 64, 92, 94, 95, 96, 124, 126, 127};
        for (int i = 0; i < mixedTable.length; i += MODE_LOWER) {
            CHAR_MAP[3][mixedTable[i]] = i;
        }
        int[] punctTable = {0, 13, 0, 0, 0, 0, 33, 39, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 58, 59, 60, 61, 62, 63, 91, 93, 123, 125};
        for (int i2 = 0; i2 < punctTable.length; i2 += MODE_LOWER) {
            if (punctTable[i2] > 0) {
                CHAR_MAP[MODE_PUNCT][punctTable[i2]] = i2;
            }
        }
        SHIFT_TABLE = new int[6][6];
        int[][] iArr = SHIFT_TABLE;
        int length = iArr.length;
        for (int i3 = 0; i3 < length; i3 += MODE_LOWER) {
            int[] table = iArr[i3];
            Arrays.fill(table, -1);
        }
        SHIFT_TABLE[0][MODE_PUNCT] = 0;
        SHIFT_TABLE[MODE_LOWER][MODE_PUNCT] = 0;
        SHIFT_TABLE[MODE_LOWER][0] = 28;
        SHIFT_TABLE[3][MODE_PUNCT] = 0;
        SHIFT_TABLE[MODE_DIGIT][MODE_PUNCT] = 0;
        SHIFT_TABLE[MODE_DIGIT][0] = 15;
    }

    public HighLevelEncoder(byte[] text) {
        this.text = text;
    }

    public BitArray encode() {
        int pairCode;
        Collection<State> states = Collections.singletonList(State.INITIAL_STATE);
        int index = 0;
        while (index < this.text.length) {
            int nextChar = index + MODE_LOWER < this.text.length ? this.text[index + MODE_LOWER] : (byte) 0;
            switch (this.text[index]) {
                case 13:
                    pairCode = nextChar == 10 ? MODE_DIGIT : 0;
                    break;
                case 44:
                    pairCode = nextChar == 32 ? MODE_PUNCT : 0;
                    break;
                case 46:
                    pairCode = nextChar == 32 ? 3 : 0;
                    break;
                case 58:
                    pairCode = nextChar == 32 ? 5 : 0;
                    break;
                default:
                    pairCode = 0;
                    break;
            }
            if (pairCode > 0) {
                states = updateStateListForPair(states, index, pairCode);
                index += MODE_LOWER;
            } else {
                states = updateStateListForChar(states, index);
            }
            index += MODE_LOWER;
        }
        State minState = (State) Collections.min(states, new Comparator<State>() { // from class: com.google.zxing.aztec.encoder.HighLevelEncoder.1
            @Override // java.util.Comparator
            public int compare(State a, State b) {
                return a.getBitCount() - b.getBitCount();
            }
        });
        return minState.toBitArray(this.text);
    }

    private Collection<State> updateStateListForChar(Iterable<State> states, int index) {
        Collection<State> result = new LinkedList<>();
        for (State state : states) {
            updateStateForChar(state, index, result);
        }
        return simplifyStates(result);
    }

    private void updateStateForChar(State state, int index, Collection<State> result) {
        char ch = (char) (this.text[index] & 255);
        boolean charInCurrentTable = CHAR_MAP[state.getMode()][ch] > 0;
        State stateNoBinary = null;
        for (int mode = 0; mode <= MODE_PUNCT; mode += MODE_LOWER) {
            int charInMode = CHAR_MAP[mode][ch];
            if (charInMode > 0) {
                if (stateNoBinary == null) {
                    stateNoBinary = state.endBinaryShift(index);
                }
                if (!charInCurrentTable || mode == state.getMode() || mode == MODE_DIGIT) {
                    State latchState = stateNoBinary.latchAndAppend(mode, charInMode);
                    result.add(latchState);
                }
                if (!charInCurrentTable && SHIFT_TABLE[state.getMode()][mode] >= 0) {
                    State shiftState = stateNoBinary.shiftAndAppend(mode, charInMode);
                    result.add(shiftState);
                }
            }
        }
        if (state.getBinaryShiftByteCount() > 0 || CHAR_MAP[state.getMode()][ch] == 0) {
            State binaryState = state.addBinaryShiftChar(index);
            result.add(binaryState);
        }
    }

    private static Collection<State> updateStateListForPair(Iterable<State> states, int index, int pairCode) {
        Collection<State> result = new LinkedList<>();
        for (State state : states) {
            updateStateForPair(state, index, pairCode, result);
        }
        return simplifyStates(result);
    }

    private static void updateStateForPair(State state, int index, int pairCode, Collection<State> result) {
        State stateNoBinary = state.endBinaryShift(index);
        result.add(stateNoBinary.latchAndAppend(MODE_PUNCT, pairCode));
        if (state.getMode() != MODE_PUNCT) {
            result.add(stateNoBinary.shiftAndAppend(MODE_PUNCT, pairCode));
        }
        if (pairCode == 3 || pairCode == MODE_PUNCT) {
            State digitState = stateNoBinary.latchAndAppend(MODE_DIGIT, 16 - pairCode).latchAndAppend(MODE_DIGIT, MODE_LOWER);
            result.add(digitState);
        }
        if (state.getBinaryShiftByteCount() > 0) {
            State binaryState = state.addBinaryShiftChar(index).addBinaryShiftChar(index + MODE_LOWER);
            result.add(binaryState);
        }
    }

    private static Collection<State> simplifyStates(Iterable<State> states) {
        List<State> result = new LinkedList<>();
        for (State newState : states) {
            boolean add = MODE_LOWER;
            Iterator<State> iterator = result.iterator();
            while (true) {
                if (!iterator.hasNext()) {
                    break;
                }
                State oldState = iterator.next();
                if (oldState.isBetterThanOrEqualTo(newState)) {
                    add = false;
                    break;
                }
                if (newState.isBetterThanOrEqualTo(oldState)) {
                    iterator.remove();
                }
            }
            if (add) {
                result.add(newState);
            }
        }
        return result;
    }
}
