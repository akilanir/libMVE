package it.gmariotti.changelibs.library.parser;

import android.content.Context;
import android.util.Log;
import android.util.Xml;
import it.gmariotti.changelibs.library.Constants;
import it.gmariotti.changelibs.library.Util;
import it.gmariotti.changelibs.library.internal.ChangeLog;
import it.gmariotti.changelibs.library.internal.ChangeLogAdapter;
import it.gmariotti.changelibs.library.internal.ChangeLogException;
import it.gmariotti.changelibs.library.internal.ChangeLogRow;
import it.gmariotti.changelibs.library.internal.ChangeLogRowHeader;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/parser/XmlParser.class */
public class XmlParser extends BaseParser {
    private int mChangeLogFileResourceId;
    private String mChangeLogFileResourceUrl;
    protected ChangeLogAdapter mChangeLogAdapter;
    private static final String TAG_CHANGELOG = "changelog";
    private static final String TAG_CHANGELOGVERSION = "changelogversion";
    private static final String TAG_CHANGELOGTEXT = "changelogtext";
    private static final String TAG_CHANGELOGBUG = "changelogbug";
    private static final String TAG_CHANGELOGIMPROVEMENT = "changelogimprovement";
    private static final String ATTRIBUTE_BULLETEDLIST = "bulletedList";
    private static final String ATTRIBUTE_VERSIONNAME = "versionName";
    private static final String ATTRIBUTE_VERSIONCODE = "versionCode";
    private static final String ATTRIBUTE_CHANGEDATE = "changeDate";
    private static final String ATTRIBUTE_CHANGETEXTTITLE = "changeTextTitle";
    private static String TAG = "XmlParser";
    private static List<String> mChangeLogTags = new ArrayList<String>() { // from class: it.gmariotti.changelibs.library.parser.XmlParser.1
        {
            add(XmlParser.TAG_CHANGELOGBUG);
            add(XmlParser.TAG_CHANGELOGIMPROVEMENT);
            add(XmlParser.TAG_CHANGELOGTEXT);
        }
    };

    public XmlParser(Context context) {
        super(context);
        this.mChangeLogFileResourceId = Constants.mChangeLogFileResourceId;
        this.mChangeLogFileResourceUrl = null;
    }

    public XmlParser(Context context, int changeLogFileResourceId) {
        super(context);
        this.mChangeLogFileResourceId = Constants.mChangeLogFileResourceId;
        this.mChangeLogFileResourceUrl = null;
        this.mChangeLogFileResourceId = changeLogFileResourceId;
    }

    public XmlParser(Context context, String changeLogFileResourceUrl) {
        super(context);
        this.mChangeLogFileResourceId = Constants.mChangeLogFileResourceId;
        this.mChangeLogFileResourceUrl = null;
        this.mChangeLogFileResourceUrl = changeLogFileResourceUrl;
    }

    @Override // it.gmariotti.changelibs.library.parser.BaseParser
    public ChangeLog readChangeLogFile() throws Exception {
        try {
            InputStream is = null;
            if (this.mChangeLogFileResourceUrl != null) {
                if (Util.isConnected(this.mContext)) {
                    URL url = new URL(this.mChangeLogFileResourceUrl);
                    is = url.openStream();
                }
            } else {
                is = this.mContext.getResources().openRawResource(this.mChangeLogFileResourceId);
            }
            if (is != null) {
                XmlPullParser parser = Xml.newPullParser();
                parser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", false);
                parser.setInput(is, null);
                parser.nextTag();
                ChangeLog chg = new ChangeLog();
                readChangeLogNode(parser, chg);
                is.close();
                return chg;
            }
            Log.d(TAG, "Changelog.xml not found");
            throw new ChangeLogException("Changelog.xml not found");
        } catch (IOException ioe) {
            Log.d(TAG, "Error i/o with changelog.xml", ioe);
            throw ioe;
        } catch (XmlPullParserException xpe) {
            Log.d(TAG, "XmlPullParseException while parsing changelog file", xpe);
            throw xpe;
        }
    }

    protected void readChangeLogNode(XmlPullParser parser, ChangeLog changeLog) throws Exception {
        if (parser == null || changeLog == null) {
            return;
        }
        parser.require(2, null, TAG_CHANGELOG);
        String bulletedList = parser.getAttributeValue(null, ATTRIBUTE_BULLETEDLIST);
        if (bulletedList == null || bulletedList.equals("true")) {
            changeLog.setBulletedList(true);
            this.bulletedList = true;
        } else {
            changeLog.setBulletedList(false);
            this.bulletedList = false;
        }
        while (parser.next() != 3) {
            if (parser.getEventType() == 2) {
                String tag = parser.getName();
                if (tag.equals(TAG_CHANGELOGVERSION)) {
                    readChangeLogVersionNode(parser, changeLog);
                }
            }
        }
    }

    protected void readChangeLogVersionNode(XmlPullParser parser, ChangeLog changeLog) throws Exception {
        if (parser == null) {
            return;
        }
        parser.require(2, null, TAG_CHANGELOGVERSION);
        String versionName = parser.getAttributeValue(null, ATTRIBUTE_VERSIONNAME);
        String versionCodeStr = parser.getAttributeValue(null, ATTRIBUTE_VERSIONCODE);
        int versionCode = 0;
        if (versionCodeStr != null) {
            try {
                versionCode = Integer.parseInt(versionCodeStr);
            } catch (NumberFormatException e) {
                Log.w(TAG, "Error while parsing versionCode.It must be a numeric value. Check you file.");
            }
        }
        String changeDate = parser.getAttributeValue(null, ATTRIBUTE_CHANGEDATE);
        if (versionName == null) {
            throw new ChangeLogException("VersionName required in changeLogVersion node");
        }
        ChangeLogRowHeader row = new ChangeLogRowHeader();
        row.setVersionName(versionName);
        row.setChangeDate(changeDate);
        changeLog.addRow(row);
        while (parser.next() != 3) {
            if (parser.getEventType() == 2) {
                String tag = parser.getName();
                if (mChangeLogTags.contains(tag)) {
                    readChangeLogRowNode(parser, changeLog, versionName, versionCode);
                }
            }
        }
    }

    private void readChangeLogRowNode(XmlPullParser parser, ChangeLog changeLog, String versionName, int versionCode) throws Exception {
        if (parser == null) {
            return;
        }
        String tag = parser.getName();
        ChangeLogRow row = new ChangeLogRow();
        row.setVersionName(versionName);
        row.setVersionCode(versionCode);
        String changeLogTextTitle = parser.getAttributeValue(null, ATTRIBUTE_CHANGETEXTTITLE);
        if (changeLogTextTitle != null) {
            row.setChangeTextTitle(changeLogTextTitle);
        }
        String bulletedList = parser.getAttributeValue(null, ATTRIBUTE_BULLETEDLIST);
        if (bulletedList != null) {
            if (bulletedList.equals("true")) {
                row.setBulletedList(true);
            } else {
                row.setBulletedList(false);
            }
        } else {
            row.setBulletedList(this.bulletedList);
        }
        if (parser.next() == 4) {
            String changeLogText = parser.getText();
            if (changeLogText == null) {
                throw new ChangeLogException("ChangeLogText required in changeLogText node");
            }
            row.parseChangeText(changeLogText);
            row.setType(tag.equalsIgnoreCase(TAG_CHANGELOGBUG) ? 1 : tag.equalsIgnoreCase(TAG_CHANGELOGIMPROVEMENT) ? 2 : 0);
            parser.nextTag();
        }
        changeLog.addRow(row);
    }

    public void setChangeLogAdapter(ChangeLogAdapter changeLogAdapter) {
        this.mChangeLogAdapter = changeLogAdapter;
    }
}
