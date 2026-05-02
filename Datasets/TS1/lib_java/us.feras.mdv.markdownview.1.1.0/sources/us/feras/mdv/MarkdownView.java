package us.feras.mdv;

import android.content.Context;
import android.os.AsyncTask;
import android.util.AttributeSet;
import android.util.Log;
import android.webkit.URLUtil;
import android.webkit.WebView;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import org.markdownj.MarkdownProcessor;
import us.feras.mdv.util.HttpHelper;

/* loaded from: us.feras.mdv.markdownview.1.1.0.jar:us/feras/mdv/MarkdownView.class */
public class MarkdownView extends WebView {
    private static final String TAG = "MarkdownView";

    public MarkdownView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public MarkdownView(Context context) {
        super(context);
    }

    public void loadMarkdown(String txt, String cssFileUrl) {
        loadMarkdownToView(txt, cssFileUrl);
    }

    public void loadMarkdown(String txt) {
        loadMarkdown(txt, null);
    }

    public void loadMarkdownFile(String url, String cssFileUrl) {
        new LoadMarkdownUrlTask().execute(url, cssFileUrl);
    }

    public void loadMarkdownFile(String url) {
        loadMarkdownFile(url, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String readFileFromAsset(String fileName) {
        try {
            InputStream input = getContext().getAssets().open(fileName);
            try {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(input));
                StringBuilder content = new StringBuilder(input.available());
                while (true) {
                    String line = bufferedReader.readLine();
                    if (line != null) {
                        content.append(line);
                        content.append(System.getProperty("line.separator"));
                    } else {
                        String sb = content.toString();
                        input.close();
                        return sb;
                    }
                }
            } catch (Throwable th) {
                input.close();
                throw th;
            }
        } catch (Exception ex) {
            Log.d(TAG, "Error while reading file from assets", ex);
            return null;
        }
    }

    /* loaded from: us.feras.mdv.markdownview.1.1.0.jar:us/feras/mdv/MarkdownView$LoadMarkdownUrlTask.class */
    private class LoadMarkdownUrlTask extends AsyncTask<String, Integer, String> {
        private String cssFileUrl;

        private LoadMarkdownUrlTask() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public String doInBackground(String... params) {
            String markdown;
            try {
                String url = params[0];
                this.cssFileUrl = params[1];
                if (URLUtil.isNetworkUrl(url)) {
                    markdown = HttpHelper.get(url).getResponseMessage();
                } else if (URLUtil.isAssetUrl(url)) {
                    markdown = MarkdownView.this.readFileFromAsset(url.substring("file:///android_asset/".length(), url.length()));
                } else {
                    throw new IllegalArgumentException("The URL string provided is not a network URL or Asset URL.");
                }
                return markdown;
            } catch (Exception ex) {
                Log.d(MarkdownView.TAG, "Error Loading Markdown File.", ex);
                return null;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onProgressUpdate(Integer... progress) {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(String result) {
            if (result != null) {
                MarkdownView.this.loadMarkdownToView(result, this.cssFileUrl);
            } else {
                MarkdownView.this.loadUrl("about:blank");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadMarkdownToView(String txt, String cssFileUrl) {
        MarkdownProcessor m = new MarkdownProcessor();
        String html = m.markdown(txt);
        if (cssFileUrl != null) {
            html = "<link rel='stylesheet' type='text/css' href='" + cssFileUrl + "' />" + html;
        }
        loadDataWithBaseURL("fake://", html, "text/html", "UTF-8", null);
    }
}
