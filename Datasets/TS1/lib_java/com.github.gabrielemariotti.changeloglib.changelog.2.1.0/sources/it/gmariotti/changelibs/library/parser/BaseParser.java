package it.gmariotti.changelibs.library.parser;

import android.content.Context;
import it.gmariotti.changelibs.library.internal.ChangeLog;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/parser/BaseParser.class */
public abstract class BaseParser {
    protected Context mContext;
    protected boolean bulletedList;

    public abstract ChangeLog readChangeLogFile() throws Exception;

    public BaseParser(Context context) {
        this.mContext = context;
    }
}
