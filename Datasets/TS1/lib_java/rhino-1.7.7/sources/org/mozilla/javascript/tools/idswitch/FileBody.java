package org.mozilla.javascript.tools.idswitch;

import java.io.IOException;
import java.io.Reader;
import java.io.Writer;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/idswitch/FileBody.class */
public class FileBody {
    private char[] buffer = new char[16384];
    private int bufferEnd;
    private int lineBegin;
    private int lineEnd;
    private int nextLineStart;
    private int lineNumber;
    ReplaceItem firstReplace;
    ReplaceItem lastReplace;

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem.class */
    private static class ReplaceItem {
        ReplaceItem next;
        int begin;
        int end;
        String replacement;

        ReplaceItem(int begin, int end, String text) {
            this.begin = begin;
            this.end = end;
            this.replacement = text;
        }
    }

    public char[] getBuffer() {
        return this.buffer;
    }

    public void readData(Reader r) throws IOException {
        int capacity = this.buffer.length;
        int offset = 0;
        while (true) {
            int n_read = r.read(this.buffer, offset, capacity - offset);
            if (n_read >= 0) {
                offset += n_read;
                if (capacity == offset) {
                    capacity *= 2;
                    char[] tmp = new char[capacity];
                    System.arraycopy(this.buffer, 0, tmp, 0, offset);
                    this.buffer = tmp;
                }
            } else {
                this.bufferEnd = offset;
                return;
            }
        }
    }

    public void writeInitialData(Writer w) throws IOException {
        w.write(this.buffer, 0, this.bufferEnd);
    }

    public void writeData(Writer w) throws IOException {
        int offset = 0;
        ReplaceItem replaceItem = this.firstReplace;
        while (true) {
            ReplaceItem x = replaceItem;
            if (x == null) {
                break;
            }
            int before_replace = x.begin - offset;
            if (before_replace > 0) {
                w.write(this.buffer, offset, before_replace);
            }
            w.write(x.replacement);
            offset = x.end;
            replaceItem = x.next;
        }
        int tail = this.bufferEnd - offset;
        if (tail != 0) {
            w.write(this.buffer, offset, tail);
        }
    }

    public boolean wasModified() {
        return this.firstReplace != null;
    }

    public boolean setReplacement(int begin, int end, String text) {
        ReplaceItem next;
        if (equals(text, this.buffer, begin, end)) {
            return false;
        }
        ReplaceItem item = new ReplaceItem(begin, end, text);
        if (this.firstReplace == null) {
            this.lastReplace = item;
            this.firstReplace = item;
            return true;
        }
        if (begin < this.firstReplace.begin) {
            item.next = this.firstReplace;
            this.firstReplace = item;
            return true;
        }
        ReplaceItem cursor = this.firstReplace;
        ReplaceItem replaceItem = cursor.next;
        while (true) {
            next = replaceItem;
            if (next == null) {
                break;
            }
            if (begin < next.begin) {
                item.next = next;
                cursor.next = item;
                break;
            }
            cursor = next;
            replaceItem = next.next;
        }
        if (next == null) {
            this.lastReplace.next = item;
            return true;
        }
        return true;
    }

    public int getLineNumber() {
        return this.lineNumber;
    }

    public int getLineBegin() {
        return this.lineBegin;
    }

    public int getLineEnd() {
        return this.lineEnd;
    }

    public void startLineLoop() {
        this.lineNumber = 0;
        this.nextLineStart = 0;
        this.lineEnd = 0;
        this.lineBegin = 0;
    }

    public boolean nextLine() {
        if (this.nextLineStart == this.bufferEnd) {
            this.lineNumber = 0;
            return false;
        }
        int c = 0;
        int i = this.nextLineStart;
        while (i != this.bufferEnd) {
            c = this.buffer[i];
            if (c == 10 || c == 13) {
                break;
            }
            i++;
        }
        this.lineBegin = this.nextLineStart;
        this.lineEnd = i;
        if (i == this.bufferEnd) {
            this.nextLineStart = i;
        } else if (c == 13 && i + 1 != this.bufferEnd && this.buffer[i + 1] == '\n') {
            this.nextLineStart = i + 2;
        } else {
            this.nextLineStart = i + 1;
        }
        this.lineNumber++;
        return true;
    }

    private static boolean equals(String str, char[] array, int begin, int end) {
        if (str.length() == end - begin) {
            int i = begin;
            int j = 0;
            while (i != end) {
                if (array[i] != str.charAt(j)) {
                    return false;
                }
                i++;
                j++;
            }
            return true;
        }
        return false;
    }
}
