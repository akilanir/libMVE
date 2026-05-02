package org.ligi.axt.extensions;

import android.widget.EditText;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/extensions/EditTextAXT.class */
public class EditTextAXT extends ViewAXT {
    private final EditText mEditText;

    public EditTextAXT(EditText editText) {
        super(editText);
        this.mEditText = editText;
    }

    public void changeTextIfNeeded(String text) {
        if (this.mEditText.getText().toString().equals(text)) {
            return;
        }
        this.mEditText.setText(text);
    }
}
