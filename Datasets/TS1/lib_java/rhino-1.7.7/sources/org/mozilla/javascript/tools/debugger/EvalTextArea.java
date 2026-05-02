package org.mozilla.javascript.tools.debugger;

import java.awt.Font;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.swing.JTextArea;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import javax.swing.text.Segment;

/* compiled from: SwingGui.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/EvalTextArea.class */
class EvalTextArea extends JTextArea implements KeyListener, DocumentListener {
    private static final long serialVersionUID = -3918033649601064194L;
    private SwingGui debugGui;
    private int outputMark;
    private int historyIndex = -1;
    private List<String> history = Collections.synchronizedList(new ArrayList());

    public EvalTextArea(SwingGui debugGui) {
        this.debugGui = debugGui;
        Document doc = getDocument();
        doc.addDocumentListener(this);
        addKeyListener(this);
        setLineWrap(true);
        setFont(new Font("Monospaced", 0, 12));
        append("% ");
        this.outputMark = doc.getLength();
    }

    public void select(int start, int end) {
        super.select(start, end);
    }

    private synchronized void returnPressed() {
        Document doc = getDocument();
        int len = doc.getLength();
        Segment segment = new Segment();
        try {
            doc.getText(this.outputMark, len - this.outputMark, segment);
        } catch (BadLocationException ignored) {
            ignored.printStackTrace();
        }
        String text = segment.toString();
        if (this.debugGui.dim.stringIsCompilableUnit(text)) {
            if (text.trim().length() > 0) {
                this.history.add(text);
                this.historyIndex = this.history.size();
            }
            append("\n");
            String result = this.debugGui.dim.eval(text);
            if (result.length() > 0) {
                append(result);
                append("\n");
            }
            append("% ");
            this.outputMark = doc.getLength();
            return;
        }
        append("\n");
    }

    public synchronized void write(String str) {
        insert(str, this.outputMark);
        int len = str.length();
        this.outputMark += len;
        select(this.outputMark, this.outputMark);
    }

    public void keyPressed(KeyEvent e) {
        int code = e.getKeyCode();
        if (code == 8 || code == 37) {
            if (this.outputMark == getCaretPosition()) {
                e.consume();
                return;
            }
            return;
        }
        if (code == 36) {
            int caretPos = getCaretPosition();
            if (caretPos == this.outputMark) {
                e.consume();
                return;
            }
            if (caretPos > this.outputMark && !e.isControlDown()) {
                if (e.isShiftDown()) {
                    moveCaretPosition(this.outputMark);
                } else {
                    setCaretPosition(this.outputMark);
                }
                e.consume();
                return;
            }
            return;
        }
        if (code == 10) {
            returnPressed();
            e.consume();
            return;
        }
        if (code == 38) {
            this.historyIndex--;
            if (this.historyIndex >= 0) {
                if (this.historyIndex >= this.history.size()) {
                    this.historyIndex = this.history.size() - 1;
                }
                if (this.historyIndex >= 0) {
                    String str = this.history.get(this.historyIndex);
                    replaceRange(str, this.outputMark, getDocument().getLength());
                    int caretPos2 = this.outputMark + str.length();
                    select(caretPos2, caretPos2);
                } else {
                    this.historyIndex++;
                }
            } else {
                this.historyIndex++;
            }
            e.consume();
            return;
        }
        if (code == 40) {
            int caretPos3 = this.outputMark;
            if (this.history.size() > 0) {
                this.historyIndex++;
                if (this.historyIndex < 0) {
                    this.historyIndex = 0;
                }
                int len = getDocument().getLength();
                if (this.historyIndex < this.history.size()) {
                    String str2 = this.history.get(this.historyIndex);
                    replaceRange(str2, this.outputMark, len);
                    caretPos3 = this.outputMark + str2.length();
                } else {
                    this.historyIndex = this.history.size();
                    replaceRange("", this.outputMark, len);
                }
            }
            select(caretPos3, caretPos3);
            e.consume();
        }
    }

    public void keyTyped(KeyEvent e) {
        int keyChar = e.getKeyChar();
        if (keyChar == 8) {
            if (this.outputMark == getCaretPosition()) {
                e.consume();
            }
        } else if (getCaretPosition() < this.outputMark) {
            setCaretPosition(this.outputMark);
        }
    }

    public synchronized void keyReleased(KeyEvent e) {
    }

    public synchronized void insertUpdate(DocumentEvent e) {
        int len = e.getLength();
        int off = e.getOffset();
        if (this.outputMark > off) {
            this.outputMark += len;
        }
    }

    public synchronized void removeUpdate(DocumentEvent e) {
        int len = e.getLength();
        int off = e.getOffset();
        if (this.outputMark > off) {
            if (this.outputMark >= off + len) {
                this.outputMark -= len;
            } else {
                this.outputMark = off;
            }
        }
    }

    public synchronized void postUpdateUI() {
        setCaret(getCaret());
        select(this.outputMark, this.outputMark);
    }

    public synchronized void changedUpdate(DocumentEvent e) {
    }
}
