package org.ligi.axt.simplifications;

import android.text.Editable;
import android.text.TextWatcher;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/simplifications/SimpleTextWatcher.class */
public abstract class SimpleTextWatcher implements TextWatcher {
    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence s, int start, int before, int count) {
    }

    @Override // android.text.TextWatcher
    public void afterTextChanged(Editable s) {
    }
}
