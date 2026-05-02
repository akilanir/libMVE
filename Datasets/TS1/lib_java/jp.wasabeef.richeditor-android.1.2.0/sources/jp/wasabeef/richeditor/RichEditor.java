package jp.wasabeef.richeditor;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/* loaded from: jp.wasabeef.richeditor-android.1.2.0.jar:jp/wasabeef/richeditor/RichEditor.class */
public class RichEditor extends WebView {
    private static final String SETUP_HTML = "file:///android_asset/editor.html";
    private static final String CALLBACK_SCHEME = "re-callback://";
    private static final String STATE_SCHEME = "re-state://";
    private boolean isReady;
    private String mContents;
    private OnTextChangeListener mTextChangeListener;
    private OnDecorationStateListener mDecorationStateListener;
    private AfterInitialLoadListener mLoadListener;

    /* loaded from: jp.wasabeef.richeditor-android.1.2.0.jar:jp/wasabeef/richeditor/RichEditor$AfterInitialLoadListener.class */
    public interface AfterInitialLoadListener {
        void onAfterInitialLoad(boolean z);
    }

    /* loaded from: jp.wasabeef.richeditor-android.1.2.0.jar:jp/wasabeef/richeditor/RichEditor$OnDecorationStateListener.class */
    public interface OnDecorationStateListener {
        void onStateChangeListener(String str, List<Type> list);
    }

    /* loaded from: jp.wasabeef.richeditor-android.1.2.0.jar:jp/wasabeef/richeditor/RichEditor$OnTextChangeListener.class */
    public interface OnTextChangeListener {
        void onTextChange(String str);
    }

    /* loaded from: jp.wasabeef.richeditor-android.1.2.0.jar:jp/wasabeef/richeditor/RichEditor$Type.class */
    public enum Type {
        BOLD,
        ITALIC,
        SUBSCRIPT,
        SUPERSCRIPT,
        STRIKETHROUGH,
        UNDERLINE,
        H1,
        H2,
        H3,
        H4,
        H5,
        H6
    }

    public RichEditor(Context context) {
        this(context, null);
    }

    public RichEditor(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.webViewStyle);
    }

    @SuppressLint({"SetJavaScriptEnabled"})
    public RichEditor(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.isReady = false;
        setVerticalScrollBarEnabled(false);
        setHorizontalScrollBarEnabled(false);
        getSettings().setJavaScriptEnabled(true);
        setWebChromeClient(new WebChromeClient());
        setWebViewClient(createWebviewClient());
        loadUrl(SETUP_HTML);
        applyAttributes(context, attrs);
    }

    protected EditorWebViewClient createWebviewClient() {
        return new EditorWebViewClient();
    }

    public void setOnTextChangeListener(OnTextChangeListener listener) {
        this.mTextChangeListener = listener;
    }

    public void setOnDecorationChangeListener(OnDecorationStateListener listener) {
        this.mDecorationStateListener = listener;
    }

    public void setOnInitialLoadListener(AfterInitialLoadListener listener) {
        this.mLoadListener = listener;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void callback(String text) {
        this.mContents = text.replaceFirst(CALLBACK_SCHEME, BuildConfig.FLAVOR);
        if (this.mTextChangeListener != null) {
            this.mTextChangeListener.onTextChange(this.mContents);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stateCheck(String text) {
        String state = text.replaceFirst(STATE_SCHEME, BuildConfig.FLAVOR).toUpperCase(Locale.ENGLISH);
        List<Type> types = new ArrayList<>();
        for (Type type : Type.values()) {
            if (TextUtils.indexOf(state, type.name()) != -1) {
                types.add(type);
            }
        }
        if (this.mDecorationStateListener != null) {
            this.mDecorationStateListener.onStateChangeListener(state, types);
        }
    }

    private void applyAttributes(Context context, AttributeSet attrs) {
        int[] attrsArray = {R.attr.gravity};
        TypedArray ta = context.obtainStyledAttributes(attrs, attrsArray);
        int gravity = ta.getInt(0, -1);
        switch (gravity) {
            case 1:
                exec("javascript:RE.setTextAlign(\"center\")");
                break;
            case 3:
                exec("javascript:RE.setTextAlign(\"left\")");
                break;
            case 5:
                exec("javascript:RE.setTextAlign(\"right\")");
                break;
            case 16:
                exec("javascript:RE.setVerticalAlign(\"middle\")");
                break;
            case 17:
                exec("javascript:RE.setVerticalAlign(\"middle\")");
                exec("javascript:RE.setTextAlign(\"center\")");
                break;
            case 48:
                exec("javascript:RE.setVerticalAlign(\"top\")");
                break;
            case 80:
                exec("javascript:RE.setVerticalAlign(\"bottom\")");
                break;
        }
        ta.recycle();
    }

    public void setHtml(String contents) {
        if (contents == null) {
            contents = BuildConfig.FLAVOR;
        }
        try {
            exec("javascript:RE.setHtml('" + URLEncoder.encode(contents, "UTF-8") + "');");
        } catch (UnsupportedEncodingException e) {
        }
        this.mContents = contents;
    }

    public String getHtml() {
        return this.mContents;
    }

    public void setEditorFontColor(int color) {
        String hex = convertHexColorString(color);
        exec("javascript:RE.setBaseTextColor('" + hex + "');");
    }

    public void setEditorFontSize(int px) {
        exec("javascript:RE.setBaseFontSize('" + px + "px');");
    }

    @Override // android.view.View
    public void setPadding(int left, int top, int right, int bottom) {
        super.setPadding(left, top, right, bottom);
        exec("javascript:RE.setPadding('" + left + "px', '" + top + "px', '" + right + "px', '" + bottom + "px');");
    }

    @Override // android.view.View
    public void setPaddingRelative(int start, int top, int end, int bottom) {
        setPadding(start, top, end, bottom);
    }

    public void setEditorBackgroundColor(int color) {
        setBackgroundColor(color);
    }

    @Override // android.webkit.WebView, android.view.View
    public void setBackgroundColor(int color) {
        super.setBackgroundColor(color);
    }

    @Override // android.view.View
    public void setBackgroundResource(int resid) {
        Bitmap bitmap = Utils.decodeResource(getContext(), resid);
        String base64 = Utils.toBase64(bitmap);
        bitmap.recycle();
        exec("javascript:RE.setBackgroundImage('url(data:image/png;base64," + base64 + ")');");
    }

    @Override // android.view.View
    public void setBackground(Drawable background) {
        Bitmap bitmap = Utils.toBitmap(background);
        String base64 = Utils.toBase64(bitmap);
        bitmap.recycle();
        exec("javascript:RE.setBackgroundImage('url(data:image/png;base64," + base64 + ")');");
    }

    public void setBackground(String url) {
        exec("javascript:RE.setBackgroundImage('url(" + url + ")');");
    }

    public void setEditorWidth(int px) {
        exec("javascript:RE.setWidth('" + px + "px');");
    }

    public void setEditorHeight(int px) {
        exec("javascript:RE.setHeight('" + px + "px');");
    }

    public void setPlaceholder(String placeholder) {
        exec("javascript:RE.setPlaceholder('" + placeholder + "');");
    }

    public void loadCSS(String cssFile) {
        String jsCSSImport = "(function() {    var head  = document.getElementsByTagName(\"head\")[0];    var link  = document.createElement(\"link\");    link.rel  = \"stylesheet\";    link.type = \"text/css\";    link.href = \"" + cssFile + "\";    link.media = \"all\";    head.appendChild(link);}) ();";
        exec("javascript:" + jsCSSImport + BuildConfig.FLAVOR);
    }

    public void undo() {
        exec("javascript:RE.undo();");
    }

    public void redo() {
        exec("javascript:RE.redo();");
    }

    public void setBold() {
        exec("javascript:RE.setBold();");
    }

    public void setItalic() {
        exec("javascript:RE.setItalic();");
    }

    public void setSubscript() {
        exec("javascript:RE.setSubscript();");
    }

    public void setSuperscript() {
        exec("javascript:RE.setSuperscript();");
    }

    public void setStrikeThrough() {
        exec("javascript:RE.setStrikeThrough();");
    }

    public void setUnderline() {
        exec("javascript:RE.setUnderline();");
    }

    public void setTextColor(int color) {
        exec("javascript:RE.prepareInsert();");
        String hex = convertHexColorString(color);
        exec("javascript:RE.setTextColor('" + hex + "');");
    }

    public void setTextBackgroundColor(int color) {
        exec("javascript:RE.prepareInsert();");
        String hex = convertHexColorString(color);
        exec("javascript:RE.setTextBackgroundColor('" + hex + "');");
    }

    public void setFontSize(int fontSize) {
        if (fontSize > 7 || fontSize < 1) {
            Log.e("RichEditor", "Font size should have a value between 1-7");
        }
        exec("javascript:RE.setFontSize('" + fontSize + "');");
    }

    public void removeFormat() {
        exec("javascript:RE.removeFormat();");
    }

    public void setHeading(int heading) {
        exec("javascript:RE.setHeading('" + heading + "');");
    }

    public void setIndent() {
        exec("javascript:RE.setIndent();");
    }

    public void setOutdent() {
        exec("javascript:RE.setOutdent();");
    }

    public void setAlignLeft() {
        exec("javascript:RE.setJustifyLeft();");
    }

    public void setAlignCenter() {
        exec("javascript:RE.setJustifyCenter();");
    }

    public void setAlignRight() {
        exec("javascript:RE.setJustifyRight();");
    }

    public void setBlockquote() {
        exec("javascript:RE.setBlockquote();");
    }

    public void setBullets() {
        exec("javascript:RE.setBullets();");
    }

    public void setNumbers() {
        exec("javascript:RE.setNumbers();");
    }

    public void insertImage(String url, String alt) {
        exec("javascript:RE.prepareInsert();");
        exec("javascript:RE.insertImage('" + url + "', '" + alt + "');");
    }

    public void insertLink(String href, String title) {
        exec("javascript:RE.prepareInsert();");
        exec("javascript:RE.insertLink('" + href + "', '" + title + "');");
    }

    public void insertTodo() {
        exec("javascript:RE.prepareInsert();");
        exec("javascript:RE.setTodo('" + Utils.getCurrentTime() + "');");
    }

    public void focusEditor() {
        requestFocus();
        exec("javascript:RE.focus();");
    }

    public void clearFocusEditor() {
        exec("javascript:RE.blurFocus();");
    }

    private String convertHexColorString(int color) {
        return String.format("#%06X", Integer.valueOf(16777215 & color));
    }

    protected void exec(final String trigger) {
        if (this.isReady) {
            load(trigger);
        } else {
            postDelayed(new Runnable() { // from class: jp.wasabeef.richeditor.RichEditor.1
                @Override // java.lang.Runnable
                public void run() {
                    RichEditor.this.exec(trigger);
                }
            }, 100L);
        }
    }

    private void load(String trigger) {
        if (Build.VERSION.SDK_INT >= 19) {
            evaluateJavascript(trigger, null);
        } else {
            loadUrl(trigger);
        }
    }

    /* loaded from: jp.wasabeef.richeditor-android.1.2.0.jar:jp/wasabeef/richeditor/RichEditor$EditorWebViewClient.class */
    protected class EditorWebViewClient extends WebViewClient {
        protected EditorWebViewClient() {
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            RichEditor.this.isReady = url.equalsIgnoreCase(RichEditor.SETUP_HTML);
            if (RichEditor.this.mLoadListener != null) {
                RichEditor.this.mLoadListener.onAfterInitialLoad(RichEditor.this.isReady);
            }
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            try {
                String decode = URLDecoder.decode(url, "UTF-8");
                if (TextUtils.indexOf(url, RichEditor.CALLBACK_SCHEME) == 0) {
                    RichEditor.this.callback(decode);
                    return true;
                }
                if (TextUtils.indexOf(url, RichEditor.STATE_SCHEME) == 0) {
                    RichEditor.this.stateCheck(decode);
                    return true;
                }
                return super.shouldOverrideUrlLoading(view, url);
            } catch (UnsupportedEncodingException e) {
                return false;
            }
        }
    }
}
